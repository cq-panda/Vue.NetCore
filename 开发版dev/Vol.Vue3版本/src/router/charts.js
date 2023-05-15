let charts=[
    {
        path: '/chart',
        name: 'chart',
        component: () => import('@/views/charts/chart.vue')
    },
    {
        path: '/formChart',
        name: 'formChart',
        component: () => import('@/views/charts/formChart.vue')
    },
    {
        path: '/flex',
        name: 'flex',
        component: () => import('@/views/charts/flex.vue')
    }]
export default charts
