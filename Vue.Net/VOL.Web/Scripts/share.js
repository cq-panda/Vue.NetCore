!function (e, t) {
    if (!/(iPhone|iPad|iPod|iOS|Android)/i.test(navigator.userAgent)) {
        var bp = document.createElement('link');
        bp.href = '/Content/app/pc_rowser.css?v=Math.random()';
        bp.setAttribute('rel', 'stylesheet');
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    }
    var i = e.documentElement,
        n = "orientationchange" in window ? "orientationchange" : "resize",
        a = navigator.userAgent.match(/iphone|ipad|ipod/i),
        d = function () {
            var e = i.clientWidth,
                t = i.clientHeight;
            e && (750 <= e && (e = 750),
                i.style.fontSize = e / 750 * 100 + "px",
                i.dataset.percent = e / 750 * 100,
                i.dataset.width = e, i.dataset.height = t)
        };
    d(), a && e.documentElement.classList.add("iosx" + t.devicePixelRatio),
        e.addEventListener && t.addEventListener(n, d, !1)
}(document, window);
function share_box() {
    //alert('测试中..');
}
