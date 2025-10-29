
let tables = [
    {
        path: '/table1',
        name: 'table1',
        component: () => import('@/views/tables/table1.vue')
    },
    {
        path: '/table2',
        name: 'table2',
        component: () => import('@/views/tables/table2.vue')
    },
    {
        path: '/table3',
        name: 'table3',
        component: () => import('@/views/tables/table3.vue')
    },
    {
        path: '/tabsTable',//多页签
        name: 'tabsTable',
        component: () => import('@/views/tables/tabsTable.vue')
    }
]
export default tables;
