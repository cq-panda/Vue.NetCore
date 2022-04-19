
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
  },{
    path: '/form6',
    name: 'form6',
    component: () => import('@/views/forms/form6.vue')
  },
  {
    path: '/form7',
    name: 'form7',
    component: () => import('@/views/forms/form7.vue')
  },{
    path: '/kindEditor',
    name: 'kindEditor',
    component: () => import('@/views/html/Editor.vue'),
    meta: {
      keepAlive: false
    }
  }, {
    path: '/htmlList',
    name: 'htmlList',
    component: () => import('@/views/html/List.vue')
  },  {
    path: '/validator',
    name: 'validator',
    component: () => import('@/views/forms/objectValidator.vue')
  }, {
    path: '/volUploadExample',
    name: 'volUploadExample',
    component: () => import('@/views/upload/volUploadExample.vue')
  }, {
    path: '/formUpload',
    name: 'formUpload',
    component: () => import('@/views/upload/formUpload.vue')
  },  {
    path: '/treetable1',
    name: 'treetable1',
    component: () => import('@/views/treeTable/TreeTable1.vue')
  }, {
    path: '/treetable2',
    name: 'treetable2',
    component: () => import('@/views/treeTable/TreeTable2.vue')
  }
  , {
    path: '/treetable3',
    name: 'treetable3',
    component: () => import('@/views/treeTable/TreeTable3.vue')
  }
]
export default form
