<template>
    <div class="theme-selector">
        <h4>{{ $ts('选择主题') }}</h4>
        <div style="display: inline-block;">
            <div @click="themeChange(item.name)" class="item" v-for="(item, index) in colors" :key="index"
                :style="{ background: item.color }">
                <div v-show="item.leftColor" :style="{ background: item.leftColor }" style="height: 100%; width: 15px"
                    class="t-left"></div>
                <div class="t-right"></div>
            </div>
        </div>

        <h4 class="layout-title">{{ $ts('菜单布局') }}</h4>
        <div>
            <el-radio-group @change="layoutChange" v-model="layoutValue">
                <el-radio value="classics">{{ $ts('经典导航') }}</el-radio>
                <el-radio value="top">{{ $ts('顶部导航') }}</el-radio>
            </el-radio-group>
        </div>
    </div>
</template>
<script>


import {
    defineComponent,
    reactive,
    ref,
    watch,
    onMounted,
    computed,
    getCurrentInstance
} from 'vue';
export default defineComponent({
    components: {},
    setup() {
        const colors = reactive([
            { name: 'dark', color: '#272929', dark: false },
            { name: 'blue', color: 'rgb(45, 140, 240)', dark: false },
            // { name: 'white', color: '#fff', dark: true },
            { name: 'red', color: 'rgb(237, 64, 20)' },
            { name: 'orange', color: '#ff9900' },
            { name: 'green', color: 'rgb(25, 190, 107)' },
        ]);
        const { proxy } = getCurrentInstance()
        const layoutValue = ref('top');
        layoutValue.value = localStorage.getItem('vol-layout') || 'top'
        let themeValue = 'blue';
        let _t=themeValue;
        const themeChange = (value) => {
            themeValue = value;
            _t=value;
            layoutChange(layoutValue.value);
        }
        const layoutChange = (value) => {
            cacheTheme();
            localStorage.setItem('vol-layout', layoutValue.value)
            proxy.$emit('layoutChange', value, themeValue);
            // window.location.href='/'
        }
        const cacheTheme = () => {
            //侧边双层导航
            if (layoutValue.value == 'left') {
                themeValue =_t+'-aside';
            }else{
                themeValue =_t;
            }
            localStorage.setItem('vol-theme', themeValue)
        }

        return {
            colors,
            themeChange,
            layoutValue,
            layoutChange
        }
    }
})

</script>
<style lang="less" scoped>
h4 {
    margin-bottom: 15px;
}

.layout-title {
    margin-top: 20px;
}

.theme-selector {
    height: 100%;
    padding-left: 16px;

    .item {
        cursor: pointer;
        width: 30px;
        height: 30px;
        border-radius: 30%;
        margin-bottom: 17px;
        border: 1px solid #d4d2d2;
        float: left;
        overflow: hidden;
        box-shadow: 2px 3px 9px #80c1f7;
        margin-right: 13px;
    }
}
</style>