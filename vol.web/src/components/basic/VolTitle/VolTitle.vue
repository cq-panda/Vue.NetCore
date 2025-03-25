<template>
  <!-- <view class="vol-title" :class="{'vol-title-bottom':border}">
		<view class="vol-title-boder">

		</view>
		<view class="vol-title-text" :style="{'font-size':size}">{{$ts(title)}}</view>
		<view class="vol-title-content">
			<slot></slot>
		</view>
		<view></view>
	</view> -->
  <div class="vol-title-header">
    <el-icon v-if="icon" class="vol-title-icon">
      <component :is="icon"></component>
    </el-icon>
    <div class="vol-title-border" v-else :class="{ 'vol-title-bottom': border }"></div>
    <span class="vol-title-text" :style="{ 'font-size': size + 'px' }">{{ title }}</span>
    <div class="small-text"><slot></slot></div>
  </div>
</template>

<script setup>
const props = defineProps({
  title: {
    type: String,
    default: "",
  },
  size: {
    type: Number,
    default: 14,
  },
  border: {
    type: Boolean,
    default: false,
  },
  icon: "",
});
</script>

<style lang="less" scoped>
.vol-title-header {
  display: flex;
  align-items: center;
  .vol-title-icon {
    margin-right: 4px;
  }
  .vol-title-border {
    height: 15px;
    background: rgb(33, 150, 243);
    width: 5px;
    border-radius: 10px;
    position: relative;
    margin-right: 5px;
  }

  .vol-title-text {
    font-weight: bolder;
  }

  .vol-title-buttons {
    flex: 1;
    text-align: right;
  }

  .small-text {
    font-size: 12px;
    color: #2196f3;
    margin-left: 10px;
    position: relative;
    top: 2px;
  }
}
</style>
