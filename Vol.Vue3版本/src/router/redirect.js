
let redirect = [{
    path: '/404',
    name: '404',
    component: () => import('@/components/redirect/404'),
    meta:{
        anonymous:true
      }
}, {
    path: '/401',
    name: '401',
    component: () => import('@/components/redirect/401')
}, {
    path: '/coding',
    name: 'coding',
    component: () => import('@/components/redirect/coding')
}]
export default redirect;