import axios from 'axios'
// import Vue from 'vue'
// npm install qs
import qs from 'qs'

axios.defaults.timeout = 50000;
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8';
//axios.defaults.headers.post['Content-Type'] = 'application/json;charset=UTF-8';


//'application/json;charset=utf-8';//
if (process.env.NODE_ENV == 'development') {
    axios.defaults.baseURL = 'http://127.0.0.1:9991/';
}
else if (process.env.NODE_ENV == 'debug') {
    axios.defaults.baseURL = 'http://127.0.0.1:8990/';
}
else if (process.env.NODE_ENV == 'production') {
    axios.defaults.baseURL = 'http://132.232.2.109:9991/';
}
let ipAddress = axios.defaults.baseURL;
axios.interceptors.request.use((config) => {
    //axios.defaults.headers[_Authorization] = $httpVue.$store.getters.getToken();

    //console.log(axios.defaults.headers[_Authorization])
    _showLoading && loading.show(_showLoading);
    if (config.method === 'post') {
        //config.data =qs.stringify(config.data);
        //  console.log('post拦截：' + config.data);
    }
    return config;
}, (error) => {
    _showLoading && loading.close();
    return Promise.reject(error);
});

//返回状态判断(添加响应拦截器)
axios.interceptors.response.use((res) => {
    _showLoading && loading.close();
    //对响应数据做些事
    if (res.data.success) {
        return res;
    }
    return Promise.resolve(res);
}, (error) => {
    _showLoading && loading.close();
    let httpMessage = '';
    if (error.response.data && error.response.data.message) {
        httpMessage = error.response.data.message;
    } else if (error.response.status == '404') {
        httpMessage = "没有找到请求的地址";
    } else {
        httpMessage = '网络好像出了点问题~'
    }

    redirect(error.response, httpMessage);
    return Promise.reject(error.response);
});

let $httpVue = null, currentToken = '';
const _Authorization = 'Authorization', _Bearer = 'Bearer ';
function init(vue) {
    $httpVue = vue;
}
let $loading;
let loading = {
    show(obj) {  //可选值为true,string="当前提示的文本"
        let text = '正在处理中.....';
        if (typeof obj == 'string') {
            text = obj;
        }
        $loading = $httpVue.$loading({
            lock: true,
            target: '#loading-container',
            customClass: "el-loading",
            text: text,
            spinner: 'el-icon-loading',
            background: 'rgba(58, 61, 63, 0.32)'
        });
    },
    close() {
        $loading.close();
    }
}
function getToken() {
    if (currentToken) {
        return _Bearer + currentToken;
    }
    return $httpVue.$store.getters.getToken();
}
let _showLoading;
 //_showLoading=true异步请求时会显示遮罩层,_showLoading=字符串，异步请求时遮罩层显示当前字符串
function post(url, params, showLoading) {
    _showLoading = showLoading;
    axios.defaults.headers[_Authorization] = getToken();
    return new Promise((resolve, reject) => {
        //  axios.post(url, qs.stringify(params))   //
        axios.post(url, params)
            .then(response => {
                if (response.status == 202) {
                    getNewToken(() => { post(url, params, _showLoading); });
                    return;
                }
                resolve(response.data);
            }, err => {
                if (err.status == 202) {
                    getNewToken(() => { post(url, params, _showLoading); });
                    return;
                }
                reject(err.data && err.data.message ? err.data.message : '网络好像出了点问题~~');
            })
            .catch((error) => {
                reject(error)
            })
    })
}

 //_showLoading=true异步请求时会显示遮罩层,_showLoading=字符串，异步请求时遮罩层显示当前字符串
function get(url, param, showLoading) {
    _showLoading = showLoading;
    axios.defaults.headers[_Authorization] = getToken();
    return new Promise((resolve, reject) => {
        axios.get(url, { params: param })
            .then(response => {
                if (response.status == 202) {
                    getNewToken(() => { get(url, param, _showLoading); });
                    return;
                }
                resolve(response.data)
            }, err => {
                if (err.status == 202) {
                    getNewToken(() => { get(url, param, _showLoading); });
                    return;
                }
                redirect(response.data);
                reject(err)
            })
            .catch((error) => {
                reject(error)
            })
    })
}




function createXHR() {
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
                    console.log("no");
                }
            }
        }
        return new ActiveXObject(arguments.callee.activeXString);
    }
}

function redirect(responseText, message) {
    try {
        let responseData = typeof responseText == 'string' ? JSON.parse(responseText) : responseText;
        //  $httpVue.$message.error(responseData.message || '~服务器好像出了点问题...')
        if ((responseData.hasOwnProperty('code') && responseData.code == 401)
            || (responseData.data && responseData.data.code == 401)) {
            toLogin();
        } else {
            $httpVue.$message.error(message);
        }
    } catch (error) {
        console.log(error);
        $httpVue.$message.error(responseText)
    }
}
function toLogin() {
    currentToken="";
    $httpVue.$router.push({ path: '/login', params: { r: Math.random() } });
}
//当前token快要过期时，用现有的token换成一个新的token
function getNewToken(callBack) {
    ajax({
        url: "/api/User/replaceToken",
        param: {},
        json: true,
        success: function (x) {
            if (x.status) {
                let userInfo = $httpVue.$store.getters.getUserInfo();
                userInfo.token = x.data;
                currentToken = x.data;
                $httpVue.$store.commit('setUserInfo', userInfo);
                callBack();
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

function ajax(param) {
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
    console.log(xhr.readyState);
    xhr.onreadystatechange = function () {
        if (xhr.status == 403 || xhr.status == 401) {
            redirect(xhr.responseText);
            return;
        }
        if (xhr.status == 202) {
            getNewToken(() => {
                ajax(param);
            });
            return;
        }
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
    xhr.send(dataStr);
}

ajax.post = function (url, param, success, errror) {
    ajax({ url: url, param: param, success: success, error: errror, type: 'post' })
}
ajax.get = function (url, param, success, errror) {
    ajax({ url: url, param: param, success: success, error: errror, type: 'post' })
}
export default { post, get, ajax, init, ipAddress }
