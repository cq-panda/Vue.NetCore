//编辑弹出框组成部份
var $layElement = {
    // editState: false,
    editRow: null,
    window: null,//整个弹出框对象
    auditWindow: null,//审核弹出框
    uploadWindow: null,
    content: null,//弹出框主表的内容
    detailGrid: null,//弹出框明细grid
    detailHead: null,//弹出框明细头部
    height: null,//100px //设置弹出时的默认高度
    width: null //100px //设置弹出时的默认宽度
}

function openWindow(row, name, editView, index) {
    if (!row && typeof index == 'number') {
        row = $elementGrid.datagrid('getRows')[index];
    }
    $layElement.editRow = row || null;
    if ($layElement.window) {
        $layElement.window.jqWindow('open');
    } else {
        $.extend($layElement, $searchElement.layOut('createWindow', {
            editData: editData,
            editBtns: editBtns,
            gridParameters: gridParameters,
            gridDetailParameters: gridDetailParameters,
            //  hasDetail: !!gridDetailParameters,
            height: $layElement.height,
            width: $layElement.width
        }));
        if (!!gridDetailParameters) {
            $layElement.detailHead.layOut("initDetailHead", { title: gridDetailParameters.cnName, gridBtns: gridBtns });
            $layElement.detailGrid = $layElement.detailGrid.datagrid(gridDetailParameters);
        }
    }
    searchHelper.openWindowAfter(row);
    $layElement.content.layOut('reset', row);
    searchHelper.reset(row);
    //基础数据
    $layElement.content.find(" > .lay-heading").html('<span><i class=" icon-edit"></i>\
         ' + gridParameters.cnName + ($layElement.editRow ? "编辑" : "新建") + '</span>');

    if (!gridDetailParameters) {
        if (editView) {
            searchHelper.onEditBtn_After(row);
        }
        return;
    }
    //明细
    $layElement.detailGrid.datagrid('loadData', { total: 0, rows: [] });
    if ($layElement.editRow) {
        //   $layElement.content.editRow = row;
        if (!gridDetailParameters.url) {
            //var areaArr = gridDetailParameters.nameSpace.split('.');
            // $layElement.detailGrid.datagrid("options").url = '/' + areaArr[areaArr.length - 1] + '/' + gridDetailParameters.queryParams.TableName + '/GetSingleData';
            $layElement.detailGrid.datagrid("options").url = '/' + gridDetailParameters.queryParams.TableName + '/GetPageData';
        }
        var par = $.extend({}, $layElement.detailGrid.datagrid('options').queryParams,
            { Wheres: JSON.stringify([{ "Name": gridParameters.key, "Value": row[gridParameters.key], "DisplayType": "=" }]) });
        $layElement.detailGrid.datagrid("reload", par);
    } else {//新增时禁止刷新与下一页
        // $layElement.content.editRow = null;
        // $layElement.editRow = null;
        $layElement.detailGrid.datagrid("options").url = '';
    }
    if (!$layElement.detailGrid.isInit) {
        $layElement.detailGrid.initiEidt();
        $layElement.detailGrid.isInit = true;
    }
    if (editView) {
        searchHelper.onEditBtn_After(row);
    }
}
//查询面板对象
var $searchElement;

var searchHelper = {
    edit: false,
    tools: searchTools.btns,
    data: searchData || [],
    onSearchBtn_ClickBefore: function () {
        return true;
    },
    onSearchBtn_ClickAfter: function () {
    },
    getSearch_Parameters: function () {
        var pager = $elementGrid.datagrid('getPager');
        var opts = $elementGrid.datagrid('options');
        opts.pageNumber = 1;
        pager.pagination('refresh', {
            pageNumber: 1,
            pageSize: opts.pageSize
        });
        var queryObj = $searchElement.layOut('getQueryWheres', false);
        return $.extend({}, opts.queryParams, { Wheres: JSON.stringify(queryObj) });
    },
    onSearchBtn_Click: function () {
        if (!searchHelper.onSearchBtn_ClickBefore()) { return; }
        var parameters = searchHelper.getSearch_Parameters();
        $elementGrid.datagrid("reload", parameters);
        searchHelper.onSearchBtn_ClickAfter();
    },
    onAddBtn_Click: function () {
        if (!editData || editData.length == 0) {
            $.message("没有配置新建数据!");
            return;
        }
        openWindow();
        searchHelper.onAddBtn_After();
    },
    onAddBtn_After: function () {
    },
    onEditBtn_Click: function (row) {
        if (!row || row.length == 0) { $.message("请选择行!"); return; };
        if (!editData || editData.length == 0) {
            $.message("没有配置编辑数据!");
            return;
        }
        openWindow(row);
        searchHelper.onEditBtn_After(row);
    },
    onEditBtn_After: function (row) {
    },
    onDelBtn_ClickBefore: function () {
        return true;
    },
    onDelBtn_Click: function (rows) {
        if (!searchHelper.onDelBtn_ClickBefore()) {
            return;
        }
        $searchElement.layOut("del");
    },
    auditColumn: function () {
        return [
            [{
                displayType: "select",
                text: "审核状态",
                require: true,
                id: "AuditStatus",
                colSize: 12,
                columnType: "int",
                dataSource: {
                    all: false,
                    valueField: 'AuditStatus',
                    textField: 'AuditStatusV',
                    data: [{ AuditStatus: "1", AuditStatusV: "审核通过" }, { AuditStatus: "2", AuditStatusV: "审核未通过" }]
                }
            }],
            [{ columnType: "string", displayType: "textarea", text: "原因", id: "AuditReason", colSize: 12 }]
        ];
    },
    onAudit_Click: function (row) {
        if (!row) { $.message("请选择要审核的记录!", 'red'); return; };
        if (!row.hasOwnProperty('AuditStatus')) {//optionConfigaudit固定审核数据
            $.message("没有配置审核数据!", 'red'); return;
        }
        if (row['AuditStatus'] == 1) {
            $.message("已经审核过了!", 'red'); return;
        }
        if ($layElement.auditWindow) {
            $layElement.auditWindow.jqWindow('open');
        } else {
            $layElement.auditWindow = $("<div></div>").jqWindow({
                title: '审核',
                width: '760',
                height: '273',
                buttons: [{
                    text: '审核', icon: 'btn btn-danger  icon-pencil',
                    handler: function (_evenWin, winHtml) {
                        var auditData = $layElement.auditWindow.find('.content').layOut('getKeyValues');
                        if (!auditData) return;
                        auditData[gridParameters.key] = $elementGrid.datagrid('getSelected')[gridParameters.key];
                        helper.post('/' + gridParameters.queryParams.TableName + '/Audit', auditData, function (auditResult) {
                            $.message(auditResult.Desc);
                            if (auditResult.Status) {
                                _evenWin.hide();
                                $elementGrid.datagrid('reload');
                            }
                        });
                    }
                }]
            });
            $layElement.auditWindow.find('.content').layOut({ data: searchHelper.auditColumn(), showHead: false });
        }
        $layElement.auditWindow.find('.content').layOut('reset');
    },
    onRefresh_Click: function () {
        window.location.reload();
    },
    uploadClick: function () {
        $searchElement.layOut("upload");
    },
    onExportBtn_Click: function () {
        var parameters = searchHelper.getSearch_Parameters();
        helper.post("/" + parameters.TableName + '/Export', parameters, function (data) {
            var url = '/' + parameters.TableName + '/DownLoadFile?fileName=' + data;
            var $element_transfer = $("<a  href='" + url + "'><span id='transfer'>测试</span></a>");
            $('body').append($element_transfer);
            $("#transfer").click();
            $element_transfer.remove();
        })
    },
    onResetBtn_Click: function () {
        $searchElement.layOut('reset')
        event.preventDefault();
    },
    onInitBefore: function () {
    },
    onViewBtn_Click: function () {
        $searchElement.layOut('showView', gridParameters);
    },
    openWindowAfter: function (row) {

    },
    reset: function (row) {

    }
};


$(function () {
    if (gridDetailParameters) {
        gridDetailParameters.height = 250;
        gridDetailParameters.detail = true;
        gridDetailParameters.layElement = $layElement;
    }
    $.fn.layOut('formatTime', [gridParameters, gridDetailParameters]);
    searchHelper.onInitBefore();
    searchHelper.data = searchData;
    searchHelper.title = '<span class="icon-search"></span><span >' + gridParameters.cnName + '数据筛选</span>';
    $searchElement = $("#lay-search-panel").layOut(searchHelper);
    $(' > .panel-body', $searchElement).layOut('createBtns', searchTools);
})