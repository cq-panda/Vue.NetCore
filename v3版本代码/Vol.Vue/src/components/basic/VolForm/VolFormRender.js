export default {
  name: "FormExpand",
  functional: true,
  props: {
    render: Function,
  },
  render: (h, ctx) => {
    return ctx.props.render(h, { tt: 11 }); //h();
  }
};

