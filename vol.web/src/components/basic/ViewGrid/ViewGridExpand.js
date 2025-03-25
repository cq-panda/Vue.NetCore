import { h } from 'vue';

export default {
  name: "ViewGridExpand",
  functional: true,
  props: {
    render: Function,
    item: {}
  },
  render: ({ render, item }) => {
    return render(h, { item }); //h();
  }
};

