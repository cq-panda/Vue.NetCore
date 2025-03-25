

 //// import zhCn from "element-plus/lib/locale/lang/zh-cn";
 import en from 'element-plus/es/locale/lang/en'
 import zhCn from "element-plus/es/locale/lang/zh-cn";
 import zhTW from "element-plus/es/locale/lang/zh-tw";
 import fr from 'element-plus/es/locale/lang/fr';
 import es from 'element-plus/es/locale/lang/es'
 import ar from 'element-plus/es/locale/lang/ar'
const locale = function () {
    let locale=zhCn;
    let currnet_lang = currentLang();
    if (currnet_lang == 'zh-tw') {//繁体中文
        locale =zhTW// require('element-plus/lib/locale/lang/zh-tw')
    } else if (currnet_lang == 'en') {//英语
        locale =en;//require('element-plus/lib/locale/lang/en')
    } else if (currnet_lang == 'fr') {//法语
        locale = fr;// require('element-plus/lib/locale/lang/fr')
    } else if (currnet_lang == 'es') {//西班牙语
        locale =es;// require('element-plus/lib/locale/lang/es')
    }  else if (currnet_lang == 'ru') { //俄语
       // locale = require('element-plus/lib/locale/lang/ru')
    } else if (currnet_lang == 'ar') {//阿拉伯语
        locale =ar;//// require('element-plus/lib/locale/lang/ar')
    }else {
        locale =zhCn// require('element-plus/lib/locale/lang/zh-cn')//zhCn;
    }
    //console.log(locale)
    return locale;
}
const currentLang = function () {
    let currnet_lang = localStorage.getItem(lang_storage_key);
    if (!currnet_lang) {
        currnet_lang = navigator.language || navigator.userLanguage;
    }
    currnet_lang = currnet_lang;
    if (['zh-tw','en','fr','es','ru','ar'].indexOf(currnet_lang)==-1) {
        return 'zh-cn';
    }
    return currnet_lang;
}

export {
    locale,
    currentLang
}