let viewgird = [
   {
        path: '/Sys_Log',
        name: 'sys_Log',
        component: () => import('@/views/system/Sys_Log.vue')
    }
    ,{
        path: '/Sys_User',
        name: 'Sys_User',
        component: () => import('@/views/system/Sys_User.vue')
    }    ,{
        path: '/Sys_Dictionary',
        name: 'Sys_Dictionary',
        component: () => import('@/views/system/Sys_Dictionary.vue')
    }    ,{
        path: '/Sys_Role',
        name: 'Sys_Role',
        component: () => import('@/views/system/Sys_Role.vue')
    } 
    ,{
        path: '/Sys_DictionaryList',
        name: 'Sys_DictionaryList',
        component: () => import('@/views/system/Sys_DictionaryList.vue')
    } 
    ,{
        path: '/SellOrder',
        name: 'SellOrder',
        component: () => import('@/views/order/SellOrder.vue')
    }    ,{
        path: '/App_Appointment',
        name: 'App_Appointment',
        component: () => import('@/views/order/App_Appointment.vue')
    }    ,{
        path: '/App_TransactionAvgPrice',
        name: 'App_TransactionAvgPrice',
        component: () => import('@/views/appmanager/App_TransactionAvgPrice.vue')
    }    ,{
        path: '/App_Expert',
        name: 'App_Expert',
        component: () => import('@/views/appmanager/App_Expert.vue')
    }    ,{
        path: '/App_Transaction',
        name: 'App_Transaction',
        component: () => import('@/views/appmanager/App_Transaction.vue')
    }    ,{
        path: '/App_ReportPrice',
        name: 'App_ReportPrice',
        component: () => import('@/views/appmanager/App_ReportPrice.vue')
    }    ,{
        path: '/App_News',
        name: 'App_News',
        component: () => import('@/views/appmanager/App_News.vue')
    }]
export default viewgird