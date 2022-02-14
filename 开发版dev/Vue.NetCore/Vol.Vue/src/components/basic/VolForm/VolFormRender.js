export default {
  name: "FormExpand",
  functional: true,
  props: {
    render: Function,
    fields: Object,
  },
  render: (h, ctx) => {
    return ctx.props.render(h, ctx.props.fields); //h();
  },
};

