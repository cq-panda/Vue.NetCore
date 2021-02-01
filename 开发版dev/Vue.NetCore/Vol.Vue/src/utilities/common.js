let base = {
  isPhone (val) {
    return /^[1][3,4,5,6,7,8,9][0-9]{9}$/.test(val)
  },
  isDecimal (val) {
    return /(^[\-0-9][0-9]*(.[0-9]+)?)$/.test(val)
  },
  isNumber (val) {
    return /(^[\-0-9][0-9]*([0-9]+)?)$/.test(val)
  },
  isMail (val) {
    return /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/.test(val)
  },
  isUrl (url) {
    return this.checkUrl(url)
  },
  checkUrl (url) {
    // url= 协议://(ftp的登录信息)[IP|域名](:端口号)(/或?请求参数)
    var strRegex =
      '^((https|http|ftp)://)?' + // (https或http或ftp):// 可有可无
      "(([\\w_!~*'()\\.&=+$%-]+: )?[\\w_!~*'()\\.&=+$%-]+@)?" + // ftp的user@  可有可无
      '(([0-9]{1,3}\\.){3}[0-9]{1,3}' + // IP形式的URL- 3位数字.3位数字.3位数字.3位数字
      '|' + // 允许IP和DOMAIN（域名）
      '(localhost)|' + // 匹配localhost
      "([\\w_!~*'()-]+\\.)*" + // 域名- 至少一个[英文或数字_!~*\'()-]加上.
      '\\w+\\.' + // 一级域名 -英文或数字  加上.
      '[a-zA-Z]{1,6})' + // 顶级域名- 1-6位英文
      '(:[0-9]{1,5})?' + // 端口- :80 ,1-5位数字
      '((/?)|' + // url无参数结尾 - 斜杆或这没有
      "(/[\\w_!~*'()\\.;?:@&=+$,%#-]+)+/?)$" // 请求参数结尾- 英文或数字和[]内的各种字符
    var re = new RegExp(strRegex, 'i') // i不区分大小写
    // 将url做uri转码后再匹配，解除请求参数中的中文和空字符影响
    if (re.test(encodeURI(url))) {
      return true
    }
    return false
  },
  matchUrlIp (url, ip) { // url使用是否使用的当前ip
    if (!url || !ip) {
      return false
    }
    return url.indexOf(ip.replace('https://', '').replace('http://', '')) >= 0
  },
  getImgSrc (src, httpUrl) {
    if (this.isUrl(src)) {
      return src
    }
    if (httpUrl) {
      return httpUrl + src
    }
    return src
  },
  previewImg (src, httpUrl) { // 图片预览，目前只支持单图片预览
    if (src && !this.isUrl(src) && httpUrl) {
      if (src.substr(0, 1) == '/' && httpUrl.substr(httpUrl.length - 1, 1) == '/') {
        src = src.substr(1)
      }
      src = (httpUrl + src)
    }
    let id = 'vol-preview'
    let $div = document.getElementById(id)
    if (!$div) {
      $div = document.createElement('div')
      $div.setAttribute('id', 'vol-preview')
      let $mask = document.createElement('div')
      $mask.style.position = 'absolute'
      $mask.style.width = '100%'
      $mask.style.height = '100%'
      $mask.style.background = 'black'
      $mask.style.opacity = '0.6'
      $div.appendChild($mask)
      $div.style.position = 'fixed'
      $div.style.width = '100%'
      $div.style.height = '100%'
      // $div.style.overflow = "scroll";
      $div.style.top = 0
      $div.style['z-index'] = 9999999
      let $img = document.createElement('img')
      $img.setAttribute('class', 'vol-preview-img')
      $img.style.position = 'absolute'
      $img.style.top = '50%'
      $img.style.left = '50%'
      $img.style['max-width'] = '90%'
      $img.style['max-height'] = '90%'
      $img.style.transform = 'translate(-50%,-50%)'
      // $img.src = src;
      $img.setAttribute('src', src)
      $div.appendChild($img)
      $div.addEventListener('click', function () {
        this.style.display = 'none'
      })
      document.body.appendChild($div)
      return
    }
    let $img1 = document.body.appendChild($div).querySelector('.vol-preview-img')
    // img.src = src;
    $img1.setAttribute('src', src)
    $div.style.display = 'block'
  },
  // 下载文件 $element 标签, url完整url, fileName 文件名, header 以key/value传值
  // backGroundUrl 后台url，如果后台url直接从后台下载，其他全部通过点击a标签下载
  dowloadFile (url, fileName, header, backGroundUrl) {
    if (!url) return alert('此文件没有url不能下载')
    if (!this.isUrl(url)) {
      url = backGroundUrl + url
    }
    window.open(url)

    // let $element = document.getElementById('dowonloadfile-a');
    // if (!$element) {
    //   $element = document.createElement('a');
    //   $element.setAttribute("id", "dowonloadfile-a");
    //   document.body.append($element);
    // }
    // //url为一个完整的地址，并且不是后台api的地址，直接点击a标签下载
    // // if (this.isUrl(url) && !this.matchUrlIp(url, backGroundUrl)) {
    // // $element.href = url;
    // // $element.click();
    // // return;
    // //  }

    // if (!this.isUrl(url)) {
    //   if (!this.isUrl(backGroundUrl + url)) {
    //     console.log("文件路径不正确");
    //     alert('文件路径不正确')
    //     return;
    //   }
    //   url = backGroundUrl + url;
    // }
    // $element.href = url;
    // $element.click();

    // //通过后台api服务器下载
    // if (!this.isUrl(url)) {
    //   if (!this.isUrl(backGroundUrl + url)) {
    //     alert('当前下载的文件url【' + url + '】不正确')
    //     return;
    //   }
    //   url = backGroundUrl + url;
    // }
    // let xmlResquest = new XMLHttpRequest();
    // xmlResquest.open("GET", url, true);
    // xmlResquest.setRequestHeader("Content-type", "application/json");
    // if (header && typeof header == 'object') {
    //   for (const key in header) {
    //     xmlResquest.setRequestHeader(
    //       key,
    //       header[key]
    //     );
    //   }
    // }

    // xmlResquest.responseType = "blob";
    // xmlResquest.onload = function (oEvent) {
    //   if (xmlResquest.status != 200) {
    //     return alert('没有下载到此文件的信息')
    //   }
    //   let content = xmlResquest.response;
    //   $element.download = fileName;
    //   let blob = new Blob([content]);
    //   $element.href = URL.createObjectURL(blob);
    //   $element.click();
    // };
    // xmlResquest.send();
  },
  downloadImg (data) {
    if (!data.url || !data.callback || typeof data.callback !== 'function') {
      return
    }
    // url, backGroundUrl, header, callback
    if (this.isUrl(data.url) && !this.matchUrlIp(data.url, data.backGroundUrl)) {
      return data.url
    }
    // 通过后台api服务器下载
    if (!this.isUrl(data.url)) {
      if (!this.isUrl(data.backGroundUrl + data.url)) {
        return
      }
      data.url = data.backGroundUrl + data.url
    }
    var xmlResquest = new XMLHttpRequest()
    xmlResquest.open('get', data.url, true)
    xmlResquest.responseType = 'blob'
    xmlResquest.setRequestHeader('Content-Type', 'application/json')
    if (data.header && typeof data.header === 'object') {
      for (const key in data.header) {
        xmlResquest.setRequestHeader(
          key,
          data.header[key]
        )
      }
    }
    xmlResquest.onload = function () {
      if (this.status == 200) {
        var blob = this.response
        callback(window.URL.createObjectURL(blob))
      }
    }
    xmlResquest.send()
  },
  // 2020.06.01增加通用方法，将普通对象转换为tree结构
  // data数据格式[
  //     { name: 'tree1', id: 1, parentId: 0 },
  //     { name: 'tree2', id: 2, parentId: 0 }]

  // 1、id与parentId这两个字段必须有
  // 2、树形tree需要注意Id与parentId循环依赖的问题
  // 3、callback每次生成一新的节点的时回调的方法

  convertTree (data, callback) {
    var treeIds = []
    var root_data = []
    data.forEach(x => {
      if (!x.children) {
        x.children = []
      }
      if (!x.hidden && x.id !== undefined && x.id !== x.parentId && !data.some(s => {
        return x.parentId == s.id
      })) {
        x.isRoot = true
        callback && callback(x, data, true, treeIds)
        root_data.push(x)
        getTree(x.id, x, data, callback, treeIds)
      }
    })
    var exceptionNodes = data.filter(f => {
      return treeIds.indexOf(f.id) == -1 && !f.hidden
    })

    root_data.push(...exceptionNodes)
    return root_data
  },
  getTreeAllParent (id, data) { // 获取某个节点的所有父节点信息2020.11.01
    var nodes = []
    if (!(data instanceof Array)) {
      return nodes
    }

    var _child = data.find(x => { return x.id === id })
    if (!_child) {
      return []
    }
    nodes.push(_child)
    var _parentIds = [_child.parentId]
    for (let index = 0; index < _parentIds.length; index++) {
      var _node = data.find(x => { return x.id === _parentIds[index] && x.id !== x.parentId })
      if (!_node) {
        return nodes
      }
      _parentIds.push(_node.parentId)
      nodes.unshift(_node)
    }
    return nodes
  }

}
export default base

// 2020.06.01增加通用方法，将普通对象转换为tree结构
function getTree (id, node, data, callback, treeIds) {
  if (treeIds.indexOf(id) == -1) {
    treeIds.push(id)
  }
  data.forEach(x => {
    if (!x.hidden && x.parentId == id) {
      if (!node.children) node.children = []
      callback && callback(x, node, false)
      node.children.push(x)
      getTree(x.id, x, data, callback, treeIds)
    }
  })
}
