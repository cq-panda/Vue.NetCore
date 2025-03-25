
let isClickDisabled = false;
export default function debounce(callback, delay = 300) {
  if (!isClickDisabled) {
    isClickDisabled = true;
    setTimeout(() => {
      isClickDisabled = false;
    }, delay);
    callback();
    //console.log('按钮点击事件');
  }
}
