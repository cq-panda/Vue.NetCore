let base = {
  isPhone(val) {
    return /^[1][3,4,5,6,7,8,9][0-9]{9}$/.test(val)
  },
  isDecimal(val) {
    return /(^[\-0-9][0-9]*(.[0-9]+)?)$/.test(val);
  },
  isNumber(val) {
    return /(^[\-0-9][0-9]*([0-9]+)?)$/.test(val);
  },
  isMail(val) {
    return /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/.test(val);
  }, previewImg(src) { //图片预览，目前只支持单图片预览
    if (!src) {
      return;
    }
    src = src.replace('@w_300', '');
    let id = "vol-preview";
    let $div = document.getElementById(id);
    if (!$div) {
      $div = document.createElement("div");
      $div.setAttribute("id", "vol-preview");
      let $mask = document.createElement("div");
      $mask.style.position = "absolute";
      $mask.style.width = "100%";
      $mask.style.height = "100%";
      $mask.style.background = "black"
      $mask.style.opacity = "0.6";
      $div.appendChild($mask);
      $div.style.position = "fixed";
      $div.style.width = "100%";
      $div.style.height = "100%";
      // $div.style.overflow = "scroll";
      $div.style.top = 0;
      $div.style['z-index'] = 9999999;
      let $img = document.createElement("img");
      $img.setAttribute("class", "vol-preview-img");
      $img.style.position = "absolute";
      $img.style.top = "50%";
      $img.style.left = "50%";
      $img.style['width'] = "100%";
      $img.style['max-height'] = "90%";
      $img.style.transform = "translate(-50%,-50%)";
      // $img.src = src;
      $img.setAttribute("src", src);
      $div.appendChild($img);
      $div.addEventListener("click", function () {
        this.style.display = "none";
      })
      document.body.appendChild($div);
      return;
    }
    let $img1 = document.body.appendChild($div).querySelector(".vol-preview-img");
    // img.src = src;
    $img1.setAttribute("src", src);
    $div.style.display = "block";
  }
}
export default base;


