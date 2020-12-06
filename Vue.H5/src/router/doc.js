const doc = [{
  path: '/doc_table',
  name: 'doc_table',
  component: () => import('@/views/doc/doc_table.vue'),
  meta: {
    anonymous: true
  }
},
{
  path: '/doc_form',
  name: 'doc_form',
  component: () => import('@/views/doc/doc_form.vue'),
  meta: {
    anonymous: true
  }
}];
export default doc