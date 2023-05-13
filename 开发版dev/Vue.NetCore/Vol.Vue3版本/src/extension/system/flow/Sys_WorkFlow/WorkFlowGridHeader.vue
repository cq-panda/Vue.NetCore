<template>
  <vol-box :lazy="false" v-model="model" :title="isAdd ? '新建流程' : '编辑流程'" :width="width" :padding="0">
    <div :style="{ height: height + 'px' }">
      <flow-panel ref="flow"></flow-panel>
    </div>
    <template #footer>
      <div style="text-align: center;">
        <el-button type="default" size="mini" @click="model = false">取消</el-button>
        <el-button type="primary" size="mini" @click="save">保存</el-button>
      </div>
    </template>
  </vol-box>
</template>

<script>
import FlowPanel from '@/components/ef/panel'
import VolBox from '@/components/basic/VolBox.vue';
export default {
  name: 'App',
  components: {
    FlowPanel,
    VolBox
  },
  data() {
    return {
      nodeList: [],
      lineList: [],
      model: false,
      height: 500,
      width: 1200,
      row: null,
      isAdd: false
    };
  },
  created() {
    this.height = document.body.clientHeight - 140;
    let width = document.body.clientWidth * 0.9;
    this.width = width > 1800 ? 1800 : width;
  },
  methods: {
    open(row) {
      this.row = row;
      this.model = true;
      this.isAdd = Object.keys(this.row).length == 0;

      if (row.NodeConfig) {
        this.nodeList = JSON.parse(row.NodeConfig);
      } else {
        this.nodeList = [
          // {
          //   id: '1659276275052',
          //   name: '流程C-节点A',
          //   type: 'task',
          //   left: '230px',
          //   top: '15px',
          //   ico: 'el-icon-user-solid'
          // },
          // {
          //   id: '1659276282115',
          //   name: '流程C-节点B',
          //   type: 'task',
          //   left: '225px',
          //   top: '165px',
          //   ico: 'el-icon-goods'
          // }
        ];
      }
      if (row.LineConfig) {
        this.lineList = JSON.parse(row.LineConfig);
      } else {
        this.lineList = [
          // {
          //   from: '1659276275052',
          //   to: '1659276282115'
          // }
        ];
      }

      this.$nextTick(() => {
        this.$refs.flow.dataReload({
          lineList: this.lineList,
          nodeList: this.nodeList
        }, this.isAdd);
        Object.assign(this.$refs.flow.formFields, row);
        if (this.isAdd) {
          this.$refs.flow.formFields.WorkName="";
          this.$refs.flow.formFields.WorkTable="";
          this.$refs.flow.formFields.WorkTableName="";
          this.$refs.flow.formFields.Remark="";
          this.$refs.flow.formFields.Weight=1;
        }
        if (this.$refs.flow) {
          this.$refs.flow.$refs.nodeForm.$refs.filter.getOptions(row.WorkTable);
        } else {
          this.$refs.flow.$refs.form.reset(
            Object.keys(row).length
              ? row
              : { WorkName: '', WorkTable: '', WorkTableName: '', Remark: '',Weight:1 }
          );
        }
      });
    },
    save() {
      let mainData = JSON.parse(JSON.stringify(this.$refs.flow.formFields));

      if (!mainData.WorkName) {
        this.$message.error('请填写左侧表单【流程名称】')
        return;
      }

      if (!mainData.WorkTable) {
        this.$message.error('请选择左侧表单【流程实例】')
        return;
      }

      let nodeList = this.$refs.flow.data.nodeList;

      let nodeListOptions = JSON.parse(JSON.stringify(nodeList));

      nodeListOptions.forEach(item => {
        if (item.filters && item.filters.data) {
          item.filters.data = undefined;
        }
      })
      mainData.NodeConfig = JSON.stringify(nodeListOptions)
      let lineList = this.$refs.flow.data.lineList;
      lineList = JSON.parse(JSON.stringify(lineList));
      lineList.forEach(item => {
        if (item.filters) {
          item.filters.forEach(x => {
            if (x.data) {
              x.data = [];
            }
          })
        }
      })
      mainData.LineConfig = JSON.stringify(lineList);


      let rootNode = nodeList.filter(c => { return c.type == 'start' }).
        map(c => {
          return {
            StepId: c.id,
            StepName: c.name,
            StepAttrType: c.type,
            StepAuditType: null,
            ParentId: [''],
            Filters: c.filters
          }
        });
      if (!rootNode.length) {
        return this.$message.error('请添加流程开始节点');
      }

      if (rootNode.length > 1) {
        return this.$message.error('只能选择一个流程开始节点');
      }
      let endNodeCount = nodeList.filter(c => { return c.type == 'end' }).length;
      if (!endNodeCount) {
        return this.$message.error('请选择左侧【流程结束】节点');
      }

      if (endNodeCount > 1) {
        return this.$message.error('只能选择一个【流程结束】节点');
      }

      if (lineList.some(c => { return c.to == rootNode[0].id })) {
        return this.$message.error('不开始结点回连');
      }

      for (let index = 0; index < rootNode.length; index++) {
        const node = rootNode[index];
        node.OrderId = index;
        //这里有一节点有多个上级节点的时候数据重复了，比如线束节点

        lineList.filter(c => { return c.from == node.StepId }).forEach(c => {
          let item = nodeList.find(x => { return x.id == c.to });
          let _obj = rootNode.find(x => { return x.StepId === item.id });
          if (_obj) {
            _obj.ParentId.push(node.StepId);
          } else {
            rootNode.push({
              ParentId: [node.StepId], //父级id
              StepId: item.id,
              StepName: item.name,
              StepAttrType: item.type, //节点类型.start开始，end结束 
              StepType: item.auditType,//审核类型,角色，用户，部门(这里后面考虑同时支持多个角色、用户、部门)
              //审核选择的值角色，用户，部门(这里后面考虑同时支持多个角色、用户、部门)
              StepValue: item.auditType == 1 ? item.userId : (item.auditType == 2 ? item.roleId : item.deptId),
              AuditRefuse: item.auditRefuse,//审核未通过(返回上一节点,流程重新开始,流程结束)
              AuditBack: item.auditBack, //驳回(返回上一节点,流程重新开始,流程结束)
              AuditMethod: item.auditMethod,//审批方式(启用会签)
              SendMail: 0, //审核后发送邮件通知：
              Filters: item.filters
            })
          }
        });
        // rootNode.push(...data);
      }

      rootNode.forEach(item => {
        item.ParentId = item.ParentId.filter(x => { return x }).join(',');
        if (item.Filters && item.Filters.length) {
          item.Filters = item.Filters.map(m => {
            return {
              "field": m.field,
              filterType: m.filterType,
              value: Array.isArray(m.value) ? m.value.join(',') : m.value
            }
          });
          item.Filters =JSON.stringify(item.Filters)
        } else {
          item.Filters = null;
        }

      })

      //       ALTER TABLE dbo.Sys_WorkFlowStep ALTER COLUMN StepValue VARCHAR(500)
      // ALTER TABLE Sys_WorkFlowStep ALTER COLUMN StepId VARCHAR(100)

      // ALTER TABLE Sys_WorkFlowStep add  NextStepIds VARCHAR(500)
      // ALTER TABLE dbo.Sys_WorkFlowStep ADD ParentId  VARCHAR(2000)
      // ALTER TABLE Sys_WorkFlowStep ADD  AuditRefuse INT 
      // ALTER TABLE Sys_WorkFlowStep ADD  AuditRefuse INT 
      // ALTER TABLE Sys_WorkFlowStep ADD  AuditBack INT 
      // ALTER TABLE Sys_WorkFlowStep ADD  AuditMethod INT 
      // ALTER TABLE Sys_WorkFlowStep ADD  SendMail INT 
      // ALTER TABLE Sys_WorkFlowStep ADD  StepAttrType VARCHAR(50) 

      // ALTER TABLE Sys_WorkFlowStep ADD  Filters NVARCHAR(4000) 
      //ALTER TABLE Sys_WorkFlow ADD AuditingEdit INT 
      //ALTER TABLE dbo.Sys_WorkFlowTableStep ALTER COLUMN StepValue VARCHAR(500)
      //ALTER TABLE dbo.Sys_WorkFlowTableStep ADD  StepAttrType VARCHAR(50) 
      // ALTER TABLE Sys_WorkFlowTable ADD CurrentStepId NVARCHAR(100)
      // ALTER TABLE Sys_WorkFlowTableStep ADD StepId  NVARCHAR(100)
      // ALTER TABLE Sys_WorkFlowTableStep ALTER COLUMN StepValue VARCHAR(500)
      // ALTER TABLE Sys_WorkFlowTableStep ADD  ParentId VARCHAR(2000)
      // ALTER TABLE Sys_WorkFlowTableStep ADD  NextStepId VARCHAR(100)
      //ALTER TABLE Sys_WorkFlow ADD Weight INT 

      // ALTER TABLE Sys_WorkFlowTableStep ADD Weight INT 

      // ALTER TABLE Sys_WorkFlowStep ADD Weight INT 
      //步骤名称
        // ALTER TABLE Sys_WorkFlowTable ADD  StepName NVARCHAR(500)

    //调整用户表(修改用户表在代码生成器需要点同步表结构、生成model、生成页面)
    //ALTER TABLE dbo.Sys_User ALTER COLUMN RoleName NVARCHAR(200)

    // ALTER TABLE dbo.Sys_User ALTER COLUMN HeadImageUrl NVARCHAR(500)

    // ALTER TABLE  Sys_User  ALTER COLUMN IsRegregisterPhone INT 

    // --增加部门字段
    // ALTER TABLE  Sys_User ADD DeptIds NVARCHAR(2000)
    
    //以上表结构修改后，代码生成器点同步表结构、生成model、生成页面

      
    //下面新增三个张需要生成完整代码

      //审核记录表（生成代码时选system类库、文件夹输入flow）
      // CREATE TABLE Sys_WorkFlowTableAuditLog
      // (
      //   Id UNIQUEIDENTIFIER PRIMARY KEY,
      //   WorkFlowTable_Id UNIQUEIDENTIFIER,
      //   WorkFlowTableStep_Id UNIQUEIDENTIFIER,
      //   StepId NVARCHAR(100),
      //   StepName NVARCHAR(200),
      //   AuditId INT,
      //   Auditor  NVARCHAR(100),
      //   AuditStatus  int,
      //   AuditResult  NVARCHAR(1000),
      //   AuditDate DATETIME ,
      //   Remark    NVARCHAR(1000),
      //   CreateDate datetime
      // )
     
      //下拉框绑定设置页面修改:【审核状态】数据源配置，参照演示环境配置


      //增加组织架构(部门表)、这两张表需要生成代码，（生成代码时选system类库、文件夹输入system）
      //CREATE TABLE [dbo].[Sys_Department](
      // 	[DepartmentId] [uniqueidentifier] NOT NULL PRIMARY KEY ,
      // 	[DepartmentName] [nvarchar](200) NOT NULL,
      // 	[DepartmentCode] [nvarchar](50) NULL,
      // 	[ParentId] [uniqueidentifier] NULL,
      // 	[DepartmentType] [nvarchar](50) NULL,
      // 	[Enable] [int] NULL,
      // 	[Remark] [nvarchar](500) NULL,
      // 	[CreateID] [int] NULL,
      // 	[Creator] [nvarchar](30) NULL,
      // 	[CreateDate] [datetime] NULL,
      // 	[ModifyID] [int] NULL,
      // 	[Modifier] [nvarchar](30) NULL,
      // 	[ModifyDate] [datetime] NULL
      // )    

    //增加用户所属部门表(一个用户可以有多个部门)（生成代码时选system类库、文件夹输入system）
    // CREATE TABLE [dbo].[Sys_UserDepartment](
    //   [Id] [uniqueidentifier] NOT NULL PRIMARY KEY ,
    //   [UserId] [int] NOT NULL,
    //   [DepartmentId] [uniqueidentifier] NOT NULL,
    //   [Enable] [int] NOT NULL,
    //   [CreateID] [int] NULL,
    //   [Creator] [nvarchar](255) NULL,
    //   [CreateDate] [datetime] NULL,
    //   [ModifyID] [int] NULL,
    //   [Modifier] [nvarchar](255) NULL,
    //   [ModifyDate] [datetime] NULL
    //   )  


    //更新后台文件
    //增加DepartmentContext.cs文件、更新UserContext.cs、UserInfo.cs、
    //Sys_WorkFlowController.cs、Sys_WorkFlowTableService.cs、ServiceBase、cs(或者整个vol.core类库)
    //Startup.cs中ConfigureContainer方法、vol.core类库下WorkFlow文件夹、Logger.cs

    //前端文件：components文件夹、main.js、package.json(需要重新执行npm installl),builderData.js

      for (let index = 0; index < rootNode.length; index++) {
        const step = rootNode[index];
        if (!step.StepName) {
          return this.$message.error(`请输入节点名称`);
        }
        if (step.StepAttrType == 'node' && !step.StepValue) {
          return this.$message.error(
            `请选择【${step.StepName}】的审批类型`
          );
        }
      }

      let params = {
        mainData: mainData,
        detailData: rootNode,
        delKeys: []
      };

      let url = 'api/Sys_WorkFlow/' + (!this.isAdd ? 'update' : 'add');
      this.http.post(url, params, true).then((result) => {
        if (!result.status) {
          return this.$message.error(result.message);
        }
        this.$message.success('保存成功');
        this.model = false;
        this.$emit('parentCall', ($parent) => {
          $parent.search();
        });
      });
    }
  },
}
</script>