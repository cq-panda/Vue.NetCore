let exampleRouter = [{
  path: '/store',
  name: 'store',
  component: () => import('@/views/example/store.vue')
}, {
  path: '/icons',
  name: 'icons',
  component: () => import('@/views/example/icons.vue')
}, {
  path: '/iview',
  name: 'iview',
  component: () => import('@/views/example/iview.vue')
}, {
  path: '/tree',
  name: 'tree',
  component: () => import('@/views/example/tree.vue')
}]
export default exampleRouter;