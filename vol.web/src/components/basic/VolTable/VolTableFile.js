export const getPath = (url, column, proxy) => {
  // 获取表的图片与文件显示
  if (!url) return []
  // 增加图片自定义操作
  // 返回格式必须是[{name:"文件名",path:"图片全路径或base64格式"}]
  if (column.formatter) {
    return column.formatter(url)
  }
  let filePath
  if (column.base64 && url.indexOf('data') != -1) {
    filePath = (',' + url)
      .split(',data')
      .filter((x) => {
        return x
      })
      .map((m) => {
        return 'data' + m
      })
  } else {
    filePath = url.replace(/\\/g, '/').split(',')
  }

  let fileInfo = []
  for (let index = 0; index < filePath.length; index++) {
    let file = filePath[index]
    // 2020.12.19增加base64图片显示
    if (column.base64) {
      fileInfo.push({
        name: '',
        path: (file.indexOf('data') == -1 ? 'data:image/png;base64,' : '') + file
      })
      continue
    }
    if (file.indexOf('.') != -1) {
      let arr = file.split('/')
      if (arr.length > 0) {
        fileInfo.push({
          name: arr.pop(),
          path: proxy.base.isUrl(file) ? file : proxy.http.ipAddress + file
        })
      }
    }
  }
  return fileInfo
}

export const previewImg = (proxy, row, column, index, viewRref) => {
  const access_token = proxy.base.getAccessToken()
  const imgs = getPath(row[column.field], column,proxy).map((x) => {
    return x.path + access_token
  })
  viewRref.show(imgs, index)
}
