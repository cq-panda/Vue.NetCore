
<template>
  <div class="full-van-pull-refresh">
    <!-- :style="{height:(height+'px')}" style="overflow: auto;" -->
    <van-pull-refresh v-model="refreshing"
                      @refresh="refresh"
                      :style="{height:(height+'px')}"
                      style="overflow:scroll;">
      <van-list v-model="loading"
                :finished="finished"
                :immediate-check="immediateCheck"
                finished-text="数据已全部加载"
                :offset="30"
                @load="load">
        <slot :list="list"></slot>
      </van-list>
    </van-pull-refresh>
  </div>
</template>
<script>
import { List, PullRefresh } from "vant";
export default {
  components: {
    "van-list": List,
    "van-pull-refresh": PullRefresh,
  },
  props: {
    index: {
      //唯一序号，在使用tabs加载数据时，index相当于是第几个tab触发的事件
      type: String,
      defalut: () => {
        return 0;
      },
    },
    height: {
      //内容高度  document.documentElement.clientHeight -其他标签的高度
      type: Number,
      default: 500,
    },
    immediateCheck: {
      type: Boolean,
      default: false,
    },
    httpType: {
      type: String,
      default: 'get'
    },
    getUrl: {
      //调用url,返回空不返回执行
      type: Function,
      default: (index) => {
        return "";
      },
    },
    loadDataAfter: {
      //加载数据后
      type: Function,
      default: (data, index) => { },
    },
  },
  data () {
    return {
      refreshing: false,
      loading: false,
      finished: false,
      list: [],
      page: 0,
    };
  },
  created () {
    this.loading = this.immediateCheck;
    this.load(true);
  },
  methods: {

    refresh () {
      this.refreshing = false;
      this.finished = false;
      this.page = 0;
      //  this.loading = true;
      this.list.splice(0);
      this.load();
      return true;
    },
    load () {
      if (this.finished) {
        return;
      }
      let _options = this.getUrl(this.index);
      if (!_options.url) {
        return this.$toast("没有配置好url");
      };
      this.page++;
      this.loading = true;
      if (!_options.params) {
        _options.params = {};
      }
      _options.params.page = this.page;
      this.http[this.httpType](_options.url, _options.params, true).then((result) => {
        if (!result.rows || result.rows.length == 0) {
          this.finished = true;
        }
        this.loadDataAfter(result.rows, this.index);
        this.loading = false;
        this.list.push(...result.rows);
      });
    },
  },
};
</script>