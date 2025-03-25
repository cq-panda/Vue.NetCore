let redirect = [{
    path: '/404',
    name: '404',
    component: () => import('@/views/redirect/404.vue'),
    meta:{
        anonymous:true
      }
}, {
    path: '/401',
    name: '401',
    component: () => import('@/views/redirect/401.vue')
}, {
    path: '/coding',
    name: 'coding',
    component: () => import('@/views/redirect/coding.vue')
}]
export default redirect;