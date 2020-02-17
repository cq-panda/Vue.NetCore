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
    }]
export default charts