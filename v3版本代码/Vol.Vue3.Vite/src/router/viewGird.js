
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
  }
  , {
    path: '/SellOrder',
    name: 'SellOrder',
    component:  () => import('@/views/order/SellOrder.vue' )
  }, {
    path: '/SellOrder2',
    name: 'SellOrder2',
    component:  () => import('@/views/order/SellOrder2.vue' )
  }, {
    path: '/SellOrder3',
    name: 'SellOrder3',
    component:  () => import('@/views/order/SellOrder3.vue' )
  }, {
    path: '/vSellOrderImg',
    name: 'vSellOrderImg',
    component:  () => import('@/views/order/vSellOrderImg.vue' )
  },
  {
    path: '/App_Appointment',
    name: 'App_Appointment',
    component:  () => import('@/views/order/App_Appointment.vue' )
  },
  {
    path: '/App_Appointment2', //二级表头
    name: 'App_Appointment2',
    component:  () => import('@/views/order/App_Appointment2.vue' )
  },
  {
    path: '/App_TransactionAvgPrice',
    name: 'App_TransactionAvgPrice',
    component:  () => import('@/views/appmanager/App_TransactionAvgPrice.vue' ),
    meta: {
      keepAlive: false
    }
  }
  , {
    path: '/App_Expert',
    name: 'App_Expert',
    component:  () => import('@/views/appmanager/App_Expert.vue' )
  }
  , {
    path: '/App_Expert2',
    name: 'App_Expert2',
    component:  () => import('@/views/appmanager/App_Expert2.vue' )
  }
  , {
    path: '/App_Transaction',
    name: 'App_Transaction',
    component:  () => import('@/views/appmanager/App_Transaction.vue' )
  }
  , {
    path: '/App_Transaction2',
    name: 'App_Transaction2',
    component:  () => import('@/views/appmanager/App_Transaction2.vue' )
  }, {
    path: '/App_ReportPrice',
    name: 'App_ReportPrice',
    component:  () => import('@/views/appmanager/App_ReportPrice.vue' )
  }, {
    path: '/App_News',
    name: 'App_News',
    component:  () => import('@/views/appmanager/App_News.vue' )
  }, {
    path: '/App_NewsEditor',
    name: 'App_NewsEditor',
    component:  () => import('@/views/appmanager/App_NewsEditor.vue' )
  }    ,{
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
        path: '/Sys_WorkFlowTable',
        name: 'Sys_WorkFlowTable',
        component: () => import('@/views/system/flow/Sys_WorkFlowTable.vue')
    }    ,{
        path: '/Sys_QuartzOptions',
        name: 'Sys_QuartzOptions',
        component: () => import('@/views/system/quartz/Sys_QuartzOptions.vue')
    }    ,{
        path: '/Sys_QuartzLog',
        name: 'Sys_QuartzLog',
        component: () => import('@/views/system/quartz/Sys_QuartzLog.vue')
    }    ,{
        path: '/Sys_Department',
        name: 'Sys_Department',
        component: () => import('@/views/system/system/Sys_Department.vue')
    }]

export default viewgird
