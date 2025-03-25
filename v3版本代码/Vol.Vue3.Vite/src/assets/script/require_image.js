
import errImgUrl from '@/assets/imgs/error.png'
import logoImgUrl from '@/assets/imgs/logo.png'

var req  =function  (relationPath)  {
    var rst= new URL( relationPath, import.meta.url).href
    return rst;
}

var errImgRequire= req(errImgUrl) 
var logoImgRequire= req(logoImgUrl) 
 
 
 
export { errImgRequire, logoImgRequire}
  