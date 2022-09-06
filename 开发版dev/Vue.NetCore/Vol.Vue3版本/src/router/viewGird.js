
let viewgird = [
  {
    path: '/Sys_Log',
    name: 'sys_Log',
    component:  () => import('@/views/system/Sys_Log.vue' )
  },
  {
    path: '/Sys_User',
    name: 'Sys_User',
    component:  () => import('@/views/system/Sys_User.vue' )
  },
  {
    path: '/permission',
    name: 'permission',
    component:  () => import('@/views/system/Permission.vue' )
  },
  
  {
    path: '/Sys_Dictionary',
    name: 'Sys_Dictionary',
    component:  () => import('@/views/system/Sys_Dictionary.vue' )
  },
  {
    path: '/Sys_Role',
    name: 'Sys_Role',
    component:  () => import('@/views/system/Sys_Role.vue' )
  }, {
    path: '/Sys_Role1',
    name: 'Sys_Role1',
    component:  () => import('@/views/system/Sys_Role1.vue' )
  }
  , {
    path: '/Sys_DictionaryList',
    name: 'Sys_DictionaryList',
    component:  () => import('@/views/system/Sys_DictionaryList.vue' )
  }  ,{
        path: '/FormDesignOptions',
        name: 'FormDesignOptions',
        component: () => import('@/views/system/form/FormDesignOptions.vue')
    }    ,{
        path: '/FormCollectionObject',
        name: 'FormCollectionObject',
        component: () => import('@/views/system/form/FormCollectionObject.vue')
    }    ,{
        path: '/Sys_WorkFlow',
        name: 'Sys_WorkFlow',
        component: () => import('@/views/system/flow/Sys_WorkFlow.vue')
    }    ,{
        path: '/Sys_WorkFlowStep',
        name: 'Sys_WorkFlowStep',
        component: () => import('@/views/system/flow/Sys_WorkFlowStep.vue')
    }    ,{
        path: '/Sys_WorkFlowTable',
        name: 'Sys_WorkFlowTable',
        component: () => import('@/views/system/flow/Sys_WorkFlowTable.vue')
    }    ,{
        path: '/Sys_WorkFlowTableStep',
        name: 'Sys_WorkFlowTableStep',
        component: () => import('@/views/system/flow/Sys_WorkFlowTableStep.vue')
    }    ,{
        path: '/Sys_QuartzOptions',
        name: 'Sys_QuartzOptions',
        component: () => import('@/views/system/quartz/Sys_QuartzOptions.vue')
    }    ,{
        path: '/Sys_QuartzLog',
        name: 'Sys_QuartzLog',
        component: () => import('@/views/system/quartz/Sys_QuartzLog.vue')
    }]

export default viewgird
