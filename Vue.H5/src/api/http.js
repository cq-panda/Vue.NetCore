import axios from 'axios'
// import Vue from 'vue'
// npm install qs
// import qs from 'qs'
import Vue from 'vue'
import store from '@/store/index'
axios.defaults.timeout = 50000;
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8';
//axios.defaults.headers.post['Content-Type'] = 'application/json;charset=UTF-8';


//'application/json;charset=utf-8';//
if (process.env.NODE_ENV == 'development') {
  axios.defaults.baseURL = 'http://127.0.0.1:9991/';
  console.log(axios.defaults.baseURL)
}
else if (process.env.NODE_ENV == 'debug') {
  axios.defaults.baseURL = 'http://127.0.0.1:9991/';
}
else if (process.env.NODE_ENV == 'production') {
  axios.defaults.baseURL = 'http://120.53.251.208:9991/';
}
let ipAddress = axios.defaults.baseURL;
axios.interceptors.request.use((config) => {
  //axios.defaults.headers[_authkey] = $httpVue.$store.getters.getToken();
  _showLoading && loading.show();
  //console.log(axios.defaults.headers[_authkey])
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
  checkResponse(res);
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

let $httpVue,
  currentToken = '';
const _authkey = 'Authorization', _Bearer = '';
function init (vue) {
  $httpVue = vue;
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
// let $loading;
let loading = {
  show (obj) {  //可选值为true,string="当前提示的文本"
    try {
      let text = '正在处理中.....';
      if (typeof obj == 'string') {
        text = obj;
      }
      $httpVue.$loading.show();
    } catch (error) {
      console.log(error)
    }
  },
  close () {
    try {
      $httpVue.$loading.hide();
      //   $httpVue.$toast.clear();
    } catch (error) {
      console.log(error)
    }
  }
}
function getToken () {
  if (currentToken) {
    return _Bearer + currentToken;
  }
  //同步页面这里会获取到的都是null
  if (!$httpVue) {
    $httpVue = new Vue();
    return store.getters.getToken();
  }
  return $httpVue.$store.getters.getToken();
}
let _showLoading;
//_showLoading=true异步请求时会显示遮罩层,_showLoading=字符串，异步请求时遮罩层显示当前字符串
function post (url, params, showLoading) {
  _showLoading = showLoading;
  axios.defaults.headers[_authkey] = getToken();
  return new Promise((resolve, reject) => {
    //  axios.post(url, qs.stringify(params))   //
    axios.post(url, params)
      .then(response => {
    
        resolve(response.data);
      }, err => {
        if (err.status == 403 || err.status == 401) {
          return redirect(err);
        }
        if (err.status == 404) {
          $httpVue.$toast("未找到请求地址,404!");
          return
        }
        reject(err.data && err.data.message ? err.data.message : '访问出了点问题~~');
      })
      .catch((error) => {
        reject(error)
      })
  })
}

//_showLoading=true异步请求时会显示遮罩层,_showLoading=字符串，异步请求时遮罩层显示当前字符串
function get (url, param, showLoading) {
  _showLoading = showLoading;
  axios.defaults.headers[_authkey] = getToken();
  return new Promise((resolve, reject) => {
    axios.get(url, { params: param })
      .then(response => {

        resolve(response.data)
      }, err => {
        // if (err.status == 401) {
        //  // $httpVue.$toast("没有权限操作");

        // }
        if (err.status == 403 || err.status == 401) {
          return redirect(err);
        }
        if (err.status == 404) {
          $httpVue.$toast("未找到请求地址,404!");
          return
        }
        redirect(response.data);
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
          console.log("no");
        }
      }
    }
    return new ActiveXObject(arguments.callee.activeXString);
  }
}

function redirect (responseText, message) {
  try {
    let responseData = typeof responseText == 'string' ? JSON.parse(responseText) : responseText;
    //  $httpVue.$message.error(responseData.message || '~服务器好像出了点问题...')
    if ((responseData.hasOwnProperty('code') && responseData.code == 401)
      || (responseData.data && responseData.data.code == 401)) {
      toLogin();
    } else {
      $httpVue.$toast(message || (responseData.data.message));
    }
  } catch (error) {
    console.log(error);
    // $httpVue.$message.error(responseText)
  }
}
function toLogin () {
  currentToken = "";
  $httpVue.$router.push({ path: '/login', params: { r: Math.random() } });
}
//当前token快要过期时，用现有的token换成一个新的token
function replaceToken (callBack) {
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
  httpParam.headers[_authkey] = getToken();
  var xhr = createXHR();
  // console.log(xhr.readyState);
  xhr.onreadystatechange = function () {
    if (xhr.status == 403 || xhr.status == 401) {
      redirect(xhr.responseText);
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
  try {
    xhr.send(dataStr);
  } catch (error) {
    toLogin();
    //  console.log(error)
  }
}

ajax.post = function (url, param, success, errror) {
  ajax({ url: url, param: param, success: success, error: errror, type: 'post' })
}
ajax.get = function (url, param, success, errror) {
  ajax({ url: url, param: param, success: success, error: errror, type: 'get' })
}
export default { post, get, ajax, init, ipAddress }
