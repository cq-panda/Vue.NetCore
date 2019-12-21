let form = [
    {
        path: '/form1',
        name: 'form1',
        component: () => import('@/views/forms/form1.vue')
    },
    {
        path: '/form2',
        name: 'form2',
        component: () => import('@/views/forms/form2.vue')
    },
    {
        path: '/form3',
        name: 'form3',
        component: () => import('@/views/forms/form3.vue')
    },
    {
        path: '/form4',
        name: 'form4',
        component: () => import('@/views/forms/form4.vue')
    }, {
        path: '/form5',
        name: 'form5',
        component: () => import('@/views/forms/form5.vue')
    }, {
        path: '/form6',
        name: 'form6',
        component: () => import('@/views/forms/form6.vue')
    }, {
        path: '/form7',
        name: 'form7',
        component: () => import('@/views/forms/form7.vue')
    }, {
        path: '/table',
        name: 'table',
        component: () => import('@/views/forms/table.vue')
    }, {
        path: '/editTable',
        name: 'editTable',
        component: () => import('@/views/forms/editTable.vue')
    }, {
        path: '/volUploadExample',
        name: 'volUploadExample',
        component: () => import('@/views/upload/volUploadExample.vue')
    }, {
        path: '/formUpload',
        name: 'formUpload',
        component: () => import('@/views/upload/formUpload.vue')
    }, {
        path: '/kindEditor',
        name: 'kindEditor',
        component: () => import('@/views/kindEditor/kindEditor.vue')
    }, {
        path: '/htmlList',
        name: 'htmlList',
        component: () => import('@/views/kindEditor/htmlList.vue')
    }

]
export default form