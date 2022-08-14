let dataDefault = {
  name: '流程A',
  nodeList: [
    {
      id: '1659276275052',
      name: '流程C-节点A',
      type: 'task',
      left: '230px',
      top: '15px',
      ico: 'el-icon-user-solid'
    },
    {
      id: '1659276282115',
      name: '流程C-节点B',
      type: 'task',
      left: '225px',
      top: '165px',
      ico: 'el-icon-goods'
    }
  ],
  lineList: [
    {
      from: '1659276275052',
      to: '1659276282115'
      //  connector: 'Straight',
      //   paintStyle: {strokeWidth: 1, stroke: '#827f7f'}
    }
  ]
};

export function getDataDefault() {
  return dataDefault;
}
