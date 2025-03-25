export default {
  name: "TableExpand",
  functional: true,
  props: {
    render: Function,
    row: {},//当前行的数据
    column: {},//当前行的配置信息
    index: { type: Number, default: 0 }//当前所在行
  },
  render: (h, ctx) => {
    const params = {
      row: ctx.props.row, column: ctx.props.column, index: ctx.props.index
    }
    return ctx.props.render(h, params); //h();
  }
};
