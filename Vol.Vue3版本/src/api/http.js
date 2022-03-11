import axios from 'axios'
import store from '../store/index'
// import {getCurrentInstance} from 'vue'
import { useRouter, useRoute } from 'vue-router'
const router = useRouter();
axios.defaults.timeout = 50000;
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8';

import { ElLoading as Loading, ElMessage as Message } from 'element-plus';


let loadingInstance;
let loadingStatus = false;
if (process.env.NODE_ENV == 'development') {
    axios.defaults.baseURL = 'http://127.0.0.1:9991/';
}
else if (process.env.NODE_ENV == 'debug') {
    axios.defaults.baseURL = 'http://127.0.0.1:9991/';
}

else if (process.env.NODE_ENV == 'production') {
    axios.defaults.baseURL = 'http://api.volcore.xyz/';
}
let ipAddress = axios.defaults.baseURL;
axios.interceptors.request.use((config) => {
    return config;
}, (error) => {
    return Promise.reject(error);
});

axios.interceptors.response.use((res) => {

    closeLoading();

    checkResponse(res);

    return Promise.resolve(res);
}, (error) => {
    closeLoading();
    let httpMessage = '';
    if (error.response) {
        if (error.response.status == '401') {
            if (error.response.data && error.response.data.code == 401) {
                if (!localStorage.getItem('user')) {
                    Message.error({
                        showClose: true,
                        message: '登陆已过期',
                        type: 'error'
                    });
                }
                toLogin();
                return;
            }

        }
        if (error.response.status == '404') {
            httpMessage = "未找到请求地址";
        }
        else if (error.response.data && error.response.data.message) {
            httpMessage = error.response.data.message;
        }
    }
    else {
        httpMessage = '服务器处理异常'
    }
    redirect(httpMessage);
    return Promise.reject(error.response || {}, httpMessage);
});
function closeLoading () {
    if (loadingInstance) {
        loadingInstance.close();
    }
    if (loadingStatus) {
        loadingStatus = false;
        if (loadingInstance) {
            loadingInstance.close();
        }
    }

}
function checkResponse (res) {
    //刷新token
    if (!res.headers) {
        if (res.getResponseHeader("vol_exp") == "1") {
            replaceToken();
        }
    }
    else if (res.headers.vol_exp == "1") {
        replaceToken();
    }
}

const _Authorization = 'Authorization';

function showLoading (loading) {
    if (!loading || loadingStatus) {
        return;
    }
    loadingInstance = Loading.service({
        target: '#loading-container',
        customClass: "el-loading",
        text: typeof loading == "string" ? loading : '正在处理.....',
        spinner: 'el-icon-loading',
        background: 'rgba(58, 61, 63, 0.32)'
    });
}

function getToken () {
    return store.getters.getToken();
}

/*
  url
  params请求后台的参数,如：{name:123,values:['a','b','c']}
  loading是否显示遮罩层,可以传入true.false.及提示文本
  config配置信息,如{timeout:3000,headers:{token:123}}
*/
function post (url, params, loading, config) {
    showLoading(loading);
    axios.defaults.headers[_Authorization] = getToken();
    return new Promise((resolve, reject) => {
        axios.post(url, params, config)
            .then(response => {
                resolve(response.data);
            }, err => {
                reject(err && err.data && err.data.message ? err.data.message : '服务器处理异常');
            })
            .catch((error) => {
                reject(error)
            })
    })
}

//=true异步请求时会显示遮罩层,=字符串，异步请求时遮罩层显示当前字符串
function get (url, param, loading, config) {
    showLoading(loading);
    axios.defaults.headers[_Authorization] = getToken();
    return new Promise((resolve, reject) => {
        axios.get(url, { params: param }, config)
            .then(response => {
                resolve(response.data)
            }, err => {
                reject(err)
            })
            .catch((error) => {
                reject(error)
            })
    })
}




function createXHR () {
    if (XMLHttpRequest) {
        return new XMLHttpRequest();
    }
    if (ActiveXObject) {
        if (typeof arguments.callee.activeXString != "string") {
            var versions = [
                "MSXML2.XMLHttp.6.0",
                "MSXML2.XMLHttp",
                "MSXML2.XMLHttp.3.0"
            ];
            for (var i = 0; i < versions.length; i++) {
                try {
                    new ActiveXObject(versions[i]);
                    arguments.callee.activeXString = versions[i];
                    break;
                } catch (e) {
                    console.log(e);
                }
            }
        }
        return new ActiveXObject(arguments.callee.activeXString);
    }
}

function redirect (responseText, message) {
    try {
        let responseData = typeof responseText == 'string' ? JSON.parse(responseText) : responseText;
        if ((responseData.hasOwnProperty('code') && responseData.code == 401)
            || (responseData.data && responseData.data.code == 401)) {
            closeLoading();
            toLogin();
        } else {
            if (message) {
                Message.error({
                    showClose: true,
                    message: message,
                    type: 'error'
                });
            }
        }
    } catch (error) {
        console.log(error);
        Message.error({
            showClose: true,
            message: responseText,
            type: 'error'
        });
    }
}


function toLogin () {
    //  const vueinstance=  getCurrentInstance();
    if (window.location.hash) {
        window.location.href = window.location.origin + '/#/login'
        return
    }
    window.location.href = window.location.origin + '/login'
    //  router.push({ path: '/login', params: { r: Math.random() } });
}
//动态刷新token
function replaceToken () {
    ajax({
        url: "/api/User/replaceToken",
        param: {},
        json: true,
        success: function (x) {
            if (x.status) {
                let userInfo = store.getters.getUserInfo();
                userInfo.token = x.data;
                store.commit('setUserInfo', userInfo);
            } else {
                console.log(x.message);
                toLogin();
            }
        },
        errror: function (ex) {
            console.log(ex);
            toLogin();
        },
        type: "post",
        async: false
    });


}

function ajax (param) {
    let httpParam =
        Object.assign({
            url: '', headers: {},
            param: {}, json: true,
            success: function () { },
            errror: function () { },
            type: 'post', async: true
        }, param);

    httpParam.url = axios.defaults.baseURL + httpParam.url.replace(/\/?/, '');
    httpParam.headers[_Authorization] = getToken();
    var xhr = createXHR();
    xhr.onreadystatechange = function () {
        if (xhr.status == 403 || xhr.status == 401) {
            redirect(xhr.responseText);
            return;
        }
        checkResponse(xhr);
        if (xhr.readyState == 4 && xhr.status == 200) {
            httpParam.success(httpParam.json ? JSON.parse(xhr.responseText) : xhr.responseText);
            return;
        }
        if (xhr.status != 0 && xhr.readyState != 1) {
            httpParam.errror(xhr);
        }
    };
    //初始化请求
    xhr.open(
        httpParam.type,
        httpParam.url,
        httpParam.async
    );
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    for (const key in httpParam.headers) {
        xhr.setRequestHeader(key, httpParam.headers[key]);
    }
    let dataStr = '';
    for (const key in httpParam.param) {
        dataStr += key + "=" + httpParam.param[key];
    }
    try {
        xhr.send(dataStr);
    } catch (error) {
        toLogin();
    }
}

ajax.post = function (url, param, success, errror) {
    ajax({ url: url, param: param, success: success, error: errror, type: 'post' })
}
ajax.get = function (url, param, success, errror) {
    ajax({ url: url, param: param, success: success, error: errror, type: 'get' })
}
export default { post, get, ajax, ipAddress }
