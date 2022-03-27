const tipxx = {
    install: function (vue) {
        alert(1);
        vue.prototype.$tip = function () {
            alert('测试use')
        };
    }
}
export default { tipxx }