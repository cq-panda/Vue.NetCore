import Vue from 'vue'
import Vuex from 'vuex'
import { stat } from 'fs';


Vue.use(Vuex);
const moduleA = {
    state: {
        m: 123
    }, mutations: {

    }, getters: {

    }, actions: {
        toDo(context) {
            return context.Store.m;
        }
    }
};
const moduleB = {
    state: {
        m: 456
    }, mutations: {

    }, getters: {

    }, actions: {
        toDo(context) {
            return context.Store.m;
        }
    }
};

const test = new Vuex.Store({
    modules: {   //分成多个模块
        a: moduleA, //store.state.a 
        b: moduleB //store.state.b 
    },
    state: {
        count: 12220
    },
    mutations: {
        increment(state, par1) {
            state.count++
        }
    },
    getters: {
        newVal: (parState, getters) => { //parState这个是参数,是vuex调用时传的state对象.getters同样可以调用getters.state.count
            parState.count = 888;
            return parState.count;
        }
    }, actions: {
        increment(context, par1) {//传入参数
            context.commit('increment', par1)  //store.dispatch('increment')
        }
    }
})

function getUserInfo(state) {
    if (state.userInfo) return state.userInfo;
    let userInfo = localStorage.getItem(keys.USER);
    if (userInfo) {
        state.userInfo = JSON.parse(userInfo);
    }
    return state.userInfo;
}
//getter 相当于 state 的计算属性，mutation 是用来修改 state 的
//使用actions或mutation获取不了state对象
const keys = { USER: 'user' }
//因为分了模块所有属性调试方法都需要加上this.$store.system(system为模块名称)
const system = {
    state: {
        permission: [],
        userInfo: null
    },
    mutations: {
        setPermission(state, data) {  //调用方式 this.$store.commit('setPermission', data)
            if (!data || typeof data != 'object') return;
            if (data instanceof Array) {
                state.permission.push(...data);
            } else {
                state.permission = data;
            }
        }, setUserInfo(state, data) {
            state.userInfo = data;
            localStorage.setItem(keys.USER, JSON.stringify(data));
        },
        clearUserInfo(state) {
            state.permission = [];
            localStorage.removeItem(keys.USER);
        },
        test(state) {
            return 113344;
        },
    }, getters: {
        getPermission: (state) => (path) => {  //调用方式 store.getters.getPermission('sys_User')
            if (!path) return state.permission;
            return state.permission.find(x => x.path == path);
        },
        getUserInfo: (state) => () => {
            getUserInfo(state);
            return state.userInfo;
        },  getUserName: (state) => () => {
            getUserInfo(state);
            if (state.userInfo) {
                return state.userInfo.userName;
            }
            return '未获取到登陆信息';
        },
        getToken:(state) => () => {
            getUserInfo(state);
            if (state.userInfo) {
                return 'Bearer '+state.userInfo.token;
            }
            return '';
        },
        isLogin: (state) => () => {
            if (getUserInfo(state)) {
                return true;
            }
            return false;
        }

    }, actions: {
        setPermission(context, data) {
            context.commit('setPermission', data); //调用方式 store.dispatch('push')
        },
        toDo(context) {
            return context.Store.m;
        }
    }
};
const store = new Vuex.Store({
    modules: {   //分成多个模块
        system //this.$store.state.system
    }
})
export default store;