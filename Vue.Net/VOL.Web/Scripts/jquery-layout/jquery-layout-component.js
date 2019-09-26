/*
 *Author：jxx
 *Contact：283591387@qq.com
 *Date：2018-07-01
 */

/*************jqTree***************/
(function ($) {

    function hasChilde(args, menuId, parentId) {
        for (var i = 0; i < args.length; i++) {
            if (args[i].parentId == menuId) {
                return 1;
            }
        }
        return 0;
    }

    function toggleIconClass() {
        var nodeData = $.data(this[0], 'nodeData');
        if (nodeData.parentId == 0 && !treeRoots.rootIcon)
            return;
        var toggleData = { open: '', colse: '' };
        if (treeRoots.rootIcon) {
            toggleData.open = treeRoots.rootIcon.open;
            toggleData.close = treeRoots.rootIcon.close;
        } else {
            toggleData.open = nodeData.openClass;
            toggleData.close = nodeData.closeClass;
        }
        $('b:eq(0)', this).removeClass(
            nodeData.open ?
                toggleData.open :
                toggleData.close
        ).addClass(nodeData.open ?
            toggleData.close :
            toggleData.open);
        nodeData.open = !nodeData.open;
    }

    function loadChilde(obj, menuId) {
        menuId = menuId || 0;
        var ul;
        var nodeData = $.data(obj[0], 'nodeData');
        if (nodeData) {
            //节点选中前事件
            if (!obj.jqTree('onSelect', nodeData)) { return; }
            if (nodeData.haschild == 0) {
                return;
            }
            if (nodeData.loaded == 1) {
                toggleIconClass.call(obj);
                obj.next().slideToggle(300);
                return;
            }
            nodeData.loaded = 1;
            toggleIconClass.call(obj);
        }
        var rootData = treeRoots.rootData;
        $.each(rootData, function () {
            if (this.parentId != menuId) { return; }
            this.haschild = hasChilde(rootData, this.id);
            this.loaded = 0;
            this.open = false;
            this.openClass = ' icon-minus-sign';
            this.closeClass = 'icon-plus-sign-alt';
            var li = $('<li></li>');
            var currentMenuId = this.id;
            var $element_a = $('<div><span><a href="javascript:void(0);"></a></span></div>');
            if (treeRoots.rootIcon && this.haschild) {
                this.icon = treeRoots.rootIcon.close;
            }
            if (!this.icon) {
                this.icon = ' icon-copy';
            }
            if (!this.haschild && menuId != 0) {
                this.icon = this.icon + ' child-margin ';
            }
            if (menuId > 0 && !this.haschild) {
                $element_a.addClass("tree-not-child ");
            }

            $element_a.find("span").append('<b class="' + this.icon + '">  &nbsp; </b> <b>' + this.name + '</b>');
            var selectData = this;
            $.data($element_a[0], 'nodeData', selectData);
            $element_a.click(function () {
                if (treeRoots.selectData) {
                    var selectNodeData = $.data(treeRoots.selectData[0], 'nodeData');//.parentId;
                    if (selectNodeData.id == 0 && !selectNodeData.icon) {
                        treeDefaultOptions.rootIcon
                            && $(' > span > b:eq(0)', treeRoots.selectData[0]).removeClass(treeRoots.open).addClass(treeRoots.close);
                    }
                    treeRoots.selectData.removeClass('active-bg');
                }
                $element_a.addClass('active-bg');
                treeRoots.selectData = $element_a;
                loadChilde($(this), currentMenuId);
            });
            li.append($element_a);
            if (menuId == 0) {
                obj.append(li);
            } else {
                if (!ul) { ul = $('<ul style="display:none"></ul>'); }
                ul.append(li);
            }
        })
        if (menuId != 0) {
            obj.parent('li').append(ul);
            ul.slideToggle(300);
        } else {
            obj.addClass('tree-list');
        }
        return obj;
    }

    var treeDefaultOptions = {
        data: [],
        rootIcon: { open: 'icon-folder-open', close: 'icon-folder-close' }
    }, treeRoots = {};

    //数据格式{
    //  data: [{ "id": 4783, "parentId": 4648, "name": "测试", "OrderNo": 132131, icon: '' }]
    //  rootIcon:{ open: 'icon-folder-open',close:'icon-folder-close'} //所有节点默认使用rootIcon图标，若不想使用此图标请将rootIcon设置为null
    // };
    $.fn.jqTree = function (args, data) {
        if (typeof args == 'string') {
            if (typeof data == 'object') {
                return $.fn.jqTree.methods[args](this, data);
            }
            if (data) {
                $.fn.jqTree.methods[args] = data;
            } else {
                return $.fn.jqTree.methods[args]();
            }
            return;
        }
        this.addClass('jqTree');
        args = $.extend({}, treeDefaultOptions, args);
        treeRoots.rootData = args.data;
        treeRoots.rootIcon = args.rootIcon;
        return loadChilde(this, 0);
    }
    $.fn.jqTree.methods = {
        getData: function () {
            return treeRoots.rootData;
        },
        onSelectBefore: function (obj, node) {
            //  alert('这里是选中前事件,选中的节点绑定的对象' + JSON.stringify(node));
            return true;
        },
        onSelect: function (obj, node) {
            return true;
            // alert('选中的节点事件绑定的对象' + JSON.stringify(node));
        },
        onSelectAfter: function (obj, node) {
            return true;
            //alert('节点选中后事件' + JSON.stringify(node));
        }, onSelectParentBefore: function (obj, node) {//父节点点击事件
            //alert('父节点选中事件');
            return true;
        },
        getSelectData: function () {
            if (!treeRoots.selectData) {
                return [];
            }
            return [$.data(treeRoots.selectData[0], 'nodeData')];
        }

    }
})(jQuery);



/*************jqTabs***************/
(function ($) {

    function getIndex(par) {
        if (typeof this != 'object') {
            return -1;
        }
        var parString = typeof par == 'object' ? par.title : par;
        var parIndex = -1;
        $.each(this, function (i) {
            if (this.title == parString) {
                parIndex = i;
                return false;
            }
        });
        return parIndex;
    }

    ////args格式:
    //[{
    //    title: nodeData.name,//tabs选项卡名
    //    show: true,//如果已经存在此项，是否显示，默认不显示
    //    text:'tabs内容'
    //}];
    $.fn.extend({
        jqTabs: function (args, data) {
            if (typeof args == "string") {
                return $.fn.jqTabs.methods[args].call(this, data);
            }
            var tabsCalss = {
                iconRemove: 'icon-remove-sign',
                tabAction: 'tab-nav-action'
            };
            var _init;
            if (!args) {
                _init = true;
                args = [{ title: '首页', text: '这里是首页内容' }];
            }

            if (typeof defaultData == 'string') {
                return;
            }
            var tabsData = $.data(this, 'tabs'), containsPar = false;
            if (tabsData && args.length == 1 && getIndex.call(tabsData, args[0]) != -1) {
                if (args[0].show) {
                    $('.tabs-ul > li', this).each(function () {
                        if ($(this).text() == args[0].title) {
                            $(this).click();
                            return false;
                        }
                    });
                }
                return;
            }
            if (containsPar) { return; }
            tabsData = tabsData || [];
            var $this = $(this),
                defaultElement = {
                    titles: null,
                    tabsBody: null,
                    ul: null,
                };
            var tabsElement = $.data(this, 'element');
            if (typeof cache == "boolean" && !cache) {
                $.data(this, 'tabs', null);
                $.data(this, 'element', null);
                $(this).text('');
                tabsElement = [];
            }

            if (!tabsElement) {
                $this.addClass('jqTabs');
                tabsElement = $.extend({}, defaultElement);
                tabsElement.titles = $('<div class="title-nav"></div>');
                tabsElement.ul = $('<ul class="tabs-ul"></ul>');
                tabsElement.titles.append(tabsElement.ul);
                $this.append(tabsElement.titles);
                tabsElement.tabsBody = $('<div class="tabs-body"></div>');
                $this.append(tabsElement.tabsBody);
            }
            var style = ['style="display:none;"', ''];
            var _index = tabsData.length;

            var tabsAdd = _index > 0 || false;
            if (tabsData.length > 0) {
                tabsElement.ul.find('li').removeClass(tabsCalss.tabAction);
            }

            $.each(args, function (j) {
                var $tabs_liItems = $('<li class="tab-nav ' + (!style[!_index || 0] ? tabsCalss.tabAction : "") + '">' + this.title + '</li>');
                var $tabs_remove;
                if (!this.hasOwnProperty('showRemove')) {
                    $tabs_remove = $('<i class="icon-remove-sign"></i>');
                    $tabs_liItems.append($tabs_remove);
                }

                tabsElement.ul.append($tabs_liItems);
                var bodyDiv = $('<div  ' + style[!_index || 0] + '></div>');
                bodyDiv.append(this.text);
                tabsElement.tabsBody.append(bodyDiv);
                $tabs_liItems.click(function () {
                    $(this).addClass(tabsCalss.tabAction);
                    $(this).siblings('li').removeClass(tabsCalss.tabAction);
                    $(' > div', tabsElement.tabsBody).hide();
                    bodyDiv.show();
                });
                var options = this;
                if ($tabs_remove) {
                    $tabs_remove.click(function () {
                        var parIndex = getIndex.call(tabsData, options);
                        if (parIndex != -1) {
                            tabsData.splice(parIndex, 1);
                        }
                        $tabs_liItems.remove();
                        bodyDiv.remove();
                        $('li:last', tabsElement.ul).addClass(tabsCalss.tabAction).siblings().removeClass(tabsCalss.tabAction);
                        $(' > div:last', tabsElement.tabsBody).show().siblings().hide();
                    });
                }
                tabsData.push(this);
                _index++;
            });

            $.data(this, 'tabs', tabsData);
            $.data(this, 'element', tabsElement);

            if (tabsAdd) {
                $(' > div', tabsElement.tabsBody).hide();
                $(' > div:last', tabsElement.tabsBody).show();
                $('li:last', tabsElement.titles).addClass(tabsCalss.tabAction);
            }
            if (_init) {
                this.jqTabs("init");
            }
            return this;
        }

    });
    $.fn.jqTabs.methods = {
        init: function () {
            $(".tabs-body", this).height(this.height() - $(".title-nav", this).height());
        },
        getIndex: function () {//获取选中项的序号
            return $('li.tab-nav-action', this).index();
        },
        getBody: function (data) {//获取选中项的body内容
            if (typeof data == 'string') {
                return $('.tabs-body > div:eq(' + this.jqTabs('getIndex') + ')').find(data);
            }
            return $('.tabs-body > div:eq(' + this.jqTabs('getIndex') + ')');
        },
        setSelect: function (index) {
            $('.tabs-ul li.tab-nav:eq(' + index + ')', this).click();
        }
    }

})(jQuery);






/**********************jqWindow***********************/
(function ($) {


    $.fn.jqWindowDefault = {
        title: '消息提示',
        titleIcon: 'icon-info-sign',
        //buttons(footer)按钮格式[{text: '关闭',icon: 'btn btn-info icon-minus', handler: function (_evenWin, winHtml) { winHtml.hide();}}]
        buttons: null,
        edit: null,//系统编辑
        show: true,
        width: '350px',//默认window宽度
        height: '220px',//默认window高度
        //设定window显示位置，若要显示到右下角,请设置 {top: 'auto',left: 'auto',right: 0, bottom: 0}
        top: 0,//指定window顶部距离
        left: 0,//指定window左边距离
        right: 0,
        bottom: 0,
        zIndex: 200,
        footer: true,
        showFooter: true,//是否显示底部button里
        text: null,//window文本
        mask: true,//是否显示遮罩
        bodyClass: '',//body样式
        windowClass: '',//整个window样式
        headStyle: 'background:#dd470d',//'background:linear-gradient(#ff6060,#ce1e0c)',//head样式
        layOutBg: 'rgba(0, 0, 0, 0.15)',//默认弹出框后的遮罩层
        cache: true,//关闭后是否清空内容
        shade: true,//显示最外层的遮罩效果
        isMessage: false
    };

    var jqWindObjects = {
        alert: null,
        message: null,
        window: null
    };

    $.alert = function (options, color) {
        options = typeof options == 'string' ? { text: options } : options;
        if (color) {
            color = "color:" + color + ";";
        }
        options.text = '<div style="font-size:16px;' + color + '">' + options.text + '</div>';
        options = $.extend({}, {
            mask: false,
            layOutBg: '',
            shade: false,
            headStyle: 'background:#c11c10;',
            showFooter: true,
            zIndex: 99999
        }, options);
        if (options.windowClass == 'animated slideInDown') {
            options.shade = false;
        }
        if (options.isMessage) {
            //jqWindObjects.message = jqWindObjects.message
            //    || $('<div class="jqLayer alert"></div>').appendTo($('body'));
            //return jqWindObjects.message.jqWindow(options);
            return $('<div class="jqLayer alert"></div>').appendTo($('body')).jqWindow(options);
        }
        //  options.showFooter = false;
        jqWindObjects.alert = jqWindObjects.alert
            || $('<div class="jqLayer alert"></div>').appendTo($('body'));
        return jqWindObjects.alert.jqWindow(options);
    }
    $.message = function (options, color) {
        options = typeof options == 'string' ? { text: options } : options;
        options = $.extend({}, {
            mask: false,
            isMessage: true,
            showFooter: false,
            headStyle: 'padding: 4px;background: linear-gradient(#e26363,#ce1e0c);height:25px;',
            width: '280px',
            height: '100px',
            zIndex: 99999,
            windowClass: 'animated slideInDown'
        }, options);
        return $.alert(options, color);
    }

    var jqWindowConst = {
        open: 'open',
        close: 'close'
    }
    $.jqWindow = function (options, _data) {
        jqWindObjects.window = jqWindObjects.window
            || $('<div class="jqLayer alert"></div>').appendTo($('body'));

        jqWindObjects.window.jqWindow(options, _data);
        return jqWindObjects.window;
    }

    $.fn.jqWindow = function (options, _data) {

        if (typeof options == "string") {
            return $.fn.jqWindow.methods[options].call(this, _data);
        }
        options = $.extend({}, $.fn.jqWindowDefault, { showFooter: true }, options || {});

        options.buttons = options.buttons || [];
        options.showFooter && options.buttons.push({
            text: '关闭',
            icon: 'btn btn-info icon-remove-sign',
            handler: function (_windowLayout, options) {
                if (options && !options.cache) {
                    $(" .jqWindow > .content", _windowLayout).text('');
                }
                _windowLayout.jqWindow(jqWindowConst.close);
            }
        });
        var newLayer = false;
        if (!this.hasClass('jqLayer')) {
            newLayer = true;
            this.addClass('jqLayer alert').appendTo($('body'));
        }
        if (options.windowClass) {
            this.addClass(options.windowClass);
        }

        var $layer = this;
        if (!newLayer && ($layer.is(":hidden") || $.data(this, 'data'))) {
            $layer.jqWindow('resize', options);
            $layer.jqWindow(jqWindowConst.open);
            return $layer;
        }
        $layer.addClass(options.shade ? 'shade' : 'default');
        $layer.css({ 'z-index': options.zIndex });
        //设置弹出的遮罩层
        $layer.css('background-color', options.layOutBg);
        var $jqWindow = $('<div class="jqWindow"></div>')
            .jqWindow('setWindowCss', options);
        var $head = $('<div class="head" style="' + options.headStyle + '"></div>');

        $head.append('<span class="' + options.titleIcon + '"> ' + options.title + ' </span>')
            .append('<span class="icon-remove"></span>');

        var $content = $('<div class="content"></div>').html(options.text);
        var $footer;
        if (options.showFooter) {
            $footer = $('<div class="footer"><div></div></div>');
        }

        $head.find('.icon-remove').bind('click', function () {
            $layer.jqWindow(jqWindowConst.close, options);
        });

        $layer.jqWindow('createFooter', { footer: $footer, options: options });
        $layer.append($jqWindow.append($head).append($content)
            .append($footer))
            .jqWindow('resize', options);
        $layer.jqWindow('setBoxTimeOut');
        // _head.jqDrag($jqWindow);
        return $layer;
    };


    $.fn.jqWindow.methods = {
        setBoxTimeOut: function () {
            if (!$.data(this, 'data').isMessage) { return; }
            var $_message = this;
            window.setTimeout(function () {
                $_message.fadeOut(1000);
                $_message.remove();
            }, 4000)
            return;
        },
        open: function () {
            this.show();
            this.jqWindow('setBoxTimeOut');
        },
        close: function () {
            this.hide();
        },
        setCss: function (options) {
            return this.jqWindow('setWindowCss', options);
        },
        createFooter: function (args) {
            var $layer = this;
            var options = args.options;
            var $footer = args.footer;
            options.footer && options.showFooter && options.buttons.map(function (data) {
                var btnElement = $('<button type="button" class="' + (data.icon || 'btn btn-info') + '">' + data.text + '</button>');
                data.handler && btnElement.bind('click', function () {
                    data.handler($layer, options);
                });
                $footer.append(btnElement);
            });
        },
        setWindowCss: function (options) {
            var prevOptions = $.data(this, 'data');
            if (prevOptions) {
                var sumPrevVal = prevOptions.width
                    + prevOptions.height
                    + prevOptions.top + prevOptions.left
                    + prevOptions.right + prevOptions.bottom;

                options = $.extend({}, $.fn.jqWindowDefault, options);
                var sumOptionsVal = options.width
                    + options.height
                    + options.top + options.left
                    + options.right + options.bottom;

                if (prevOptions == options) { return this; }
            }
            $.data(this, options);
            if (!options.shade) { return this; }
            return this.css({
                top: options.top,
                left: options.left,
                right: options.right,
                bottom: options.bottom
            });
        },
        resize: function (options) {
            if (~~options.width) {
                options.width == options.width + 'px';
                options.height == options.height + 'px';
            }

            var window_element = $(".jqWindow", this).jqWindow('setCss', options);

            var lay_data = $.data(this, 'data');
            var layer_element = this;
            if (lay_data && lay_data.text != options.text) {
                $('.content', window_element).html(options.text);
            }
            $(' > .head > span:eq(0)', window_element).text(options.title);
            $.data(this, 'data', options);
            var outerWidth, outerHeight;
            //重置footer按钮
            //  && JSON.stringify(lay_data.buttons) != JSON.stringify(options.buttons)
            if (lay_data && (options.showFooter || lay_data.showFooter)) {
                var $footer = $('.footer', this);
                $footer.empty();
                this.jqWindow('createFooter', { footer: $footer, options: options });
            }

            var width = 0, height = 0;
            if (!options.shade) {
                width = height = '100%';
                layer_element.css({ 'width': options.width, 'height': options.height });
            } else {
                width = options.width;
                height = options.height
            }

            if (!options.isMessage) {
                outerWidth = ($(window).width() - layer_element.outerWidth()) / 2;
                outerHeight = ($(window).height() - layer_element.outerHeight() - 30) / 2
            } else {
                outerWidth = 'auto';
                outerHeight = 'auto';
            }

            layer_element.css({
                position: "fixed",
                left: outerWidth,
                top: options.mask ? 0 : outerHeight
            });

            window_element.css({ width: width, height: height });
            var containerHeigth = window_element.height();
            var headHeigth = $(".head", window_element).height();
            var footerHeigth = $(".footer", window_element).height();
            $(".content", window_element).height(containerHeigth - headHeigth - footerHeigth - 40);
            //  $(".content", _jqWin).height(containerHeigth);
        }
    }
})(jQuery);

/************jqSelect**********/
(function ($) {

    $.fn.selectDefault = {
        valueField: 'ID',//数据key/val字段(实际字段)
        textField: 'Name',
        onSelect: null,//选中事件
        id: null,//input或button标签的ID
        all: false,//是否显示‘全部’选项
        multiple: false,//是否为多选
        //    style:'background: rgb(255, 106, 0)',
        style: 'color: #db0909;',//自定义ul选中样式{ "background": "green" };
        fixClass: null,//固定样式
        data: null//[{ ID: "key", Name: "value", icon: " icon-caret-down",selected:true }]//select是否默认选中
    };

    $.fn.jqSelect = function (options, data) {

        if (typeof options == 'string') {
            return $.fn.jqSelect.methods[options].call(this, data);
        }
        options = $.extend({}, $.fn.selectDefault, options || {});
        if (!options.data) { return this; }
        //显示全部选项
        if (options.all) {
            //$.extend合并时，若有引用对象，合并后实际上还是使用的同一个地址的对象
            options.data = options.data.slice();
            options.data.pushDefault(options.valueField, options.textField);
        }
        var active = 'active';
        var isDefalut = false;
        return this.each(function () {
            var $ul_element = $(this);
            $ul_element.addClass('jq-select');
            $.each(options.data, function (index) {
                var text = '<span>' + this[options.textField] + '</span>';
                var icon = '';
                if (this.icon) { icon = '<span class="' + this.icon + '"></span>' }
                var $li_element = $('<li style="' + (options.style || "") + '">'
                    + icon + text + '</li>');
                //设置默认选中项
                if (this.selected) { isDefalut = true; $li_element.addClass(active); }
                var itemData = this;
                $li_element.bind('click', function () {
                    //如果是多选并且显示全部选项，选中的不是第一个，移除全部样式
                    if (options.all && index != 0) { $ul_element.find('li:eq(0)').removeClass(active); }
                    //如果已选中样式，则移除样式
                    if ($(this).hasClass(active)) {
                        $(this).removeClass(active);
                    } else if (!options.multiple || (options.all && index == 0)) {//单选或点击的全部
                        $(this).addClass(active).siblings().removeClass(active);
                    } else {
                        //多选
                        $(this).addClass(active);
                    }
                    options.onSelect && !options.onSelect.call(this, itemData, $ul_element);
                });
                $.data($li_element[0], 'data', this);
                $ul_element.append($li_element);
            });
            $.data(this, 'data', options);
            if (options.all && !isDefalut) { $ul_element.find('li:eq(0)').addClass(active); }
        });
    }


    $.fn.jqSelect.methods = {
        getSelectData: function (field) {
            //如要是有默认全部选项，并且选中的全部，则获取所有数据
            var element_data = $.map($(' > li[class=active]', this), function (element_li) {
                return $.data(element_li, 'data');
            });
            //移除全部选项
            var multiple = $.data(this[0], 'data').multiple;
            if (!field) {
                if (multiple) { return element_data; }
                //单选的只返回第一个选中项
                return element_data && element_data.length > 0 ? element_data[0] : '';
            }
            var reslut = $.map(element_data, function (data) {
                return data[field];
            })
            if (multiple) {
                return reslut || [];
            }
            return reslut && reslut.length > 0 ? [reslut[0]] : [];
        },
        getValue: function () {
            return this.jqSelect('getValueArray').join(',');
        },
        getText: function () {
            return this.jqSelect('getTextArray').join(',');
        },
        getValueArray: function () {
            return (this.jqSelect('getSelectData', $.data(this[0], 'data').valueField) || []).filterSelect();
        },
        getTextArray: function () {
            return (this.jqSelect('getSelectData', $.data(this[0], 'data').textField) || []).filterSelect();
        },
        getData: function () {
            return $.data(this[0], 'data');
        },
        reset: function () {
            $(' > li', this).removeClass('active');
        },
        setValue: function (val) {
            $(' > li', this).removeClass('active');
            if (!val && val != "0") { return; }
            var valField = $.data(this[0], 'data').valueField;
            $.map($(' > li', this), function (element_li) {
                if ($.data(element_li, 'data')[valField] == val) {
                    $(element_li).addClass("active");
                    return false;
                };
            });
        }
    };
})(jQuery);


/******************jqDrop*************************/

//搜索
//<div style="
//">  <input type="text" class="form-control" style="
//border-radius: 3px;
//border: 1px solid  #00adad;
//height: 29px;
//z-index: 9999;
//left: 0;
//position: absolute;
//float: left;
//top: 100%;
//width: 100%;
//"><span class="glyphicon glyphicon-zoom-out
//form-control-feedback" aria-hidden="true" style="
//color: #d0cbcb;
///* top: 9px; */
//height: 29px;
//top: 100%;
//z-index: 999999;
//line-height: 29px;
//font-size: 15px;
//"></span>
//<ul class="drop-list dropdown-menu" style="max-height: 300px;display: block;margin-top: 29px;"><li class="list-group-item" value="-1" style="">全部</li><li class="list-group-item" value="10G4A01X00" style="">ThinkCentre M8600t-N000 I5-6500 8G1T</li></ul></div>
(function ($) {
    $.fn.jqDropDefault = {
        valueField: 'ID',//数据key/val字段(实际字段)
        textField: 'Name',
        all: false,//是否显示‘全部’选项
        multiple: false,//是否为多选,
        readonly: true,//只读
        maxHeight: '300px',//下拉框最大高度
        search: false,//是否启搜索功能
        //当下拉框为button时设置下拉框右边的图标
        //btn: { icon: null, text:''},
        dropIcon: null,//下拉框右边的图标
        onSelect: null,//选中事件
        data: null,//[{ ID: "key", Name: "value", icon: " icon-caret-down",selected:true,onSelect:null }]//select是否默认选中
        handler: null //下拉框选中事件
    };
    $.fn.jqDrop = function (options, data) {
        if (typeof options == 'string') {
            return $.fn.jqDropMethods[options].call(this, data);
        }
        options = $.extend({}, $.fn.jqDropDefault, options);
       if (!options.data || typeof options.data != 'object' || options.data.length == 0) {
         var DD_Data = {};
         DD_Data[options.valueField] = '';
         DD_Data[options.textField] = '';
        options.data = [DD_Data];
       }
        if (typeof options.data[0] != 'object') {
            options.data = $.map(options.data, function (d) {
                var dropItem = {};
                dropItem[options.valueField] = d;
                dropItem[options.textField] = d;
                return dropItem;
            });
        }
        return this.each(function () {
            var $drop_this = $(this);
            $drop_this[0].select = [];
            if (options.multiple) { options.readonly = true; }
            $drop_this.addClass('jqDrop drop-group');
            var readonly = options.readonly ? 'readonly="readonly"' : '';
            var $element_input;
            var $element_span = $('<span class="input-group-addon" ><b></b></span>');;
            if (options.btn) {
                $element_input = $('<button   class="form-control btn  input-sm drop-input ' + options.icon + '" ><span>' + options.btn.text + '</span></button>');
                $element_span.find('b').addClass(options.btn.icon);
            } else {
                $element_input = $('<input type="text" value="" class="form-control  input-sm drop-input" ' + readonly + '>');
                $element_span.find('b').addClass(options.dropIcon ? options.dropIcon : 'icon-caret-down');
            }
            $drop_this.append($element_input).append($element_span);
            if (options.all) {
                //$.extend合并时，若有引用对象，合并后实际上还是使用的同一个地址的对象
                options.data = options.data.slice();
                options.data.pushDefault(options.valueField, options.textField);
            }
            //已经选中的项
            var selected = $drop_this[0].select;
            var $element_dropGroup = $('<div class="search-group" style="display: none;"></div>');

            var $element_ul = $('<ul class="drop-list dropdown-menu" style="display: block;"></ul>').css("max-height", options.maxHeight);;
            $.each(options.data, function () {
                var item = this, text = item[options.textField],
                    value = item[options.valueField], icon = '';
                if (this.icon) { icon = '<span class="' + this.icon + '"></span>'; }
                var $element_li = $('<li class="list-group-item" value="' + value + '">' + icon + text + '</li>');
                $element_li.click(function () {
                    //options.btn按钮组下拉框不需要执行后面的选中项
                    if (options.btn) { item.handler && item.handler(); return false; }
                    if (item.onSelect && !item.onSelect()) { return false; }

                    dropEvenBind.click.call(this, {
                        textField: options.textField,
                        valueField: options.valueField,
                        options: options,
                        input: $element_input,
                        item: item,
                        selected: selected,
                        dropGroup: $element_dropGroup
                    });
                    options.onSelect && options.onSelect(this, item[options.valueField], item[options.textField], item, options);
                });
                $element_ul.append($element_li);
            });

            var $search_input;
            if (options.search) {
                $search_input = $('<input type="text" class="form-control search-text" />');
                $element_ul.addClass('ul-search');
                $element_dropGroup.append($search_input).append($element_ul)
                    .append('<span class="glyphicon glyphicon-zoom-out form-control-feedback search-icon" aria-hidden="true"></span>');
                $search_input.keyup(function () {
                    dropEvenBind.searchKeyup.call(this, $element_ul);
                });
            }
            $element_dropGroup.append($element_ul);
            $drop_this.append($element_dropGroup);
            $element_input.click(function () { dropEvenBind.showDrop($element_dropGroup, $search_input); })
            $element_span.click(function () { dropEvenBind.showDrop($element_dropGroup, $search_input); });

            $drop_this.mouseleave(function () {
                $element_dropGroup.hide();
                if (!options.search) { return; }
                $('li', $element_dropGroup).show();
                $search_input.val('');
            });
            $.data(this, 'data', options);
        });
    }

    var dropEvenBind = {
        hideDrop: function () {

        },
        showDrop: function ($element_dropGroup, $search_input) {
            $element_dropGroup.show(); $search_input && $search_input.focus();
        },
        searchKeyup: function ($element_ul) {
            var $this = $(this);
            var searchVal = $(this).val().toLocaleLowerCase();
            if (searchVal == '') {
                $('li', $element_ul).show();
                return;
            }
            $('li', $element_ul).each(function () {
                $(this)[$(this).text().toLocaleLowerCase().indexOf(searchVal) != -1 ? 'show' : 'hide']();
            });
        },
        click: function (args) {
            var text = args.item[args.textField];
            //单选直接赋值
            if (text == '全部') {
                args.selected.splice(0);
                args.input.val('');
            }
            for (var i = 0; i < args.selected.length; i++) {
                if (args.selected[i][args.textField] == '全部') {
                    args.selected.splice(i, 1);
                    break;
                }
            }
            //$.each(args.select,function());

            //多选，如果当前选中的是全部或已经选择过的是全部直接清空数据
            if ((args.selected.length == 1 && args.selected[0][args.valueField] == -1)
                || args.item[args.valueField] == -1) {
                args.selected.splice(0, args.selected.length)
            }
            //单选或第一次选中值，直接返回
            var multiple = !args.options.multiple;
            if (multiple || args.selected.length == 0) {
                args.input.val(text);
                //单选，如果有选中值，直接替换第一个的值
                if (multiple && args.selected.length > 0) {
                    args.selected[0] = args.item;
                } else {
                    args.selected.push(args.item);
                }
                args.dropGroup.hide();
                return;
            }
            var selectOptions = { text: [], values: [], contains: false };
            var count = args.selected.length;
            var index = 0;
            //多选，如果已经选中过，删除已选的项，没有选中的添加
            while (count > 0) {
                if (args.selected[index][args.valueField] == args.item[args.valueField]) {
                    args.selected.splice(index, 1);
                    selectOptions.contains = true;
                    index = index && index - 1;
                } else {
                    selectOptions.text.push(args.selected[index][args.textField]);
                    index++;
                }
                count--;
            }
            if (!selectOptions.contains) {
                args.selected.push(args.item);
                selectOptions.text.push(text);
            }
            args.input.val(selectOptions.text.join(','));
        }
    }

    $.fn.jqDropMethods = {
        getOptions: function () {
            return $.data(this[0], 'data');
        },
        getData: function () {
            return this.jqDrop('getOptions').data;
        },
        getSelected: function () {
            return this[0].select;
        },
        getValue: function () {
            return this.jqDrop('getValueArray').join(',');
        },
        getText: function () {
            return this.jqDrop('getTextArray').join(',');
        },
        getValueArray: function () {
            return (this.jqDrop('getResult', 'valueField') || []).filterSelect();
        },
        getTextArray: function () {
            return (this.jqDrop('getResult', 'textField') || []).filterSelect();
        },
        getResult: function (property) {
            var selected = this.jqDrop('getSelected');
            if (!selected) { return ''; }
            var field = this.jqDrop('getOptions')[property];
            if (typeof selected == 'object' && selected.length > 0) {
                return $.map(selected, function (d) {
                    return d[field];
                });
            }
            return selected[field];
        },
        setValue: function (val) {
            var dropObject = this[0];
            val == "-1" ? dropObject.select.splice() : dropObject.select.splice(0, this[0].select.length);
            if (val || val == '0') {
                var valArr, dropText = [], dropOptions = this.jqDrop('getOptions');
                valArr = dropOptions.multiple ? val.split(',') : [val + ''];
                $.each(dropOptions.data, function () {
                    if (valArr.indexOf(this[dropOptions.valueField] + '') != -1) {
                        dropObject.select.push(this);
                        dropText.push(this[dropOptions.textField] + '');
                    }
                });
                //如果设置的值没有在下拉绑定的值中，直接设置为空;
                val = dropText.join(',');
            }
            this.find('input:eq(0)').val(val);
        }
    };
})(jQuery);



(function ($) {
    //添加全部项
    Array.prototype.pushDefault = function (valueField, textField) {
        if (!valueField || !textField) {
            return [];
        }
        var defaultItem = {};
        defaultItem[valueField] = -1;
        defaultItem[textField] = '全部';
        this.splice(0, 0, defaultItem);
    }
    Array.prototype.filterSelect = function () {
        if (this.length == 0 || this[0] == '-1' || this[0] == '全部') {
            return [];
        }
        return this;
    };
})(jQuery);


(function ($) {
    $.fn.layOutFileDefault = {
        data: [],
        handler: {
            fileChange: function () {

            },
            browse: function () {

            }
        }
    };
    $.fn.layOutFile = function (options, data) {

        if (typeof options == 'string') {
            return $.fn.layOutFile.methods[options].call(this, data);
        }
        var options = $.extend({}, $.fn.layOutFileDefault, options);
        return this.each(function () {
            var $this_file = $(this).addClass('select-upload-group'),
                $btn_group = $('<div class="select-btn-group"></div>'),
                $browseLibrary = $('<button type="button"  class="btn btn-info  icon-paste">文件库选择</button>'),
                $ul_items = $('<div class="image-group"><ul class="ul-item-group"></ul></div>');
            $btn_group.append($browseLibrary);
            $this_file.append($btn_group).append($ul_items);
            $this_file.append($ul_items).append($btn_group);

            $browseLibrary.click(function () {
                options.browse.call(this, $this_file);
            });
            if (options.data && options.data.length > 0) {
                $this_file.layOutFile('createFile', options.data);
            }
            $.data($this_file[0], 'data', options);
            return $this_file;
        });
    };

    $.fn.layOutFile.methods = {
        fileOptions: {
            append: false,
            data: [],
            saveImage: false,
            fileType: 'image',
            foots: null,//[{ text: '', handler: function () { }}],
            addFileUrls: '/Sys_ImageLibrary/AddImage'
        },
        createImage: function ($file_items, _options) {
            var fileData = _options.data;
            var $this_file = this;
            for (var i = 0; i < fileData.length; i++) {
                var imageSrc = fileData[i];
                if (!imageSrc) {
                    continue;
                }
                if (imageSrc.indexOf('bcebos.com') != -1 && imageSrc.indexOf('@w_') == -1) {
                    imageSrc += '@w_500';
                }
                var $file = $('<li><img src="' + imageSrc + '"></li>');
                $file_items.append($file);
                var $footerGroup = $('<div class="image-footer"></div>');
                $file[0].src = imageSrc;
                if (_options.foots) {
                    $.fn.layOutFile.methods.createFoot($footerGroup, imageSrc, $this_file, _options);
                }
                $file.append($footerGroup);
                $file_items.append($file);
            }
        },
        createVideo: function ($file_items, _options) {
            var fileData = typeof _options.data == 'string' ? JSON.parse(_options.data) : _options.data;
            var $this_file = this;
            for (var i = 0; i < fileData.length; i++) {
                var fileInfo = typeof fileData[i] == 'string' ? { Id: 0, Cover: '', ImageUrls: fileData[i] } : fileData[i];
                var $videos = $('<li><video class="video-js" controls preload="auto" width= "310" height= "160"\
                    poster = "'+ fileInfo.Cover + '" setup="{}" >\
                        <source src="'+ fileInfo.ImageUrls + '" type="video/mp4">\
               </video><div class="video-footer"></div></li>');
                $.data($videos[0], 'data', fileInfo);
               if (_options.foots) {
                   $.fn.layOutFile.methods.createFoot($videos.find('.video-footer'), fileData[i], $this_file, _options);
               }
               $file_items.append($videos);
            }
        },
        createFoot: function ($footerGroup, _scr, $this_file,_options) {
            var _fileEventData = { fileType: $.fn.layOutFile.methods.fileOptions.fileType };
            _options.foots && $.each(_options.foots, function () {
                var $footObj = $(this.text), handler = this.handler;
                $footObj.src = _scr;
                $footerGroup.append($footObj);
                handler && $footObj.click(function () {
                    _fileEventData.src = $footObj.src;
                    handler.call(this, $this_file, _fileEventData);
                });
            });
        },
        createFile: function (options) {
            var _options = $.extend({}, $.fn.layOutFile.methods.fileOptions, options);
            var $this_file = $(this), $file_items = $('.ul-item-group', $this_file);

            if (_options.append && $file_items.length == 0) {
                if (_options.fileType == "image") {
                    $this_file.append('<div class="image-group image-library-group" >\
                                          <ul class="ul-item-group"></ul>\
                                        </div>');
                } else {
                    $this_file.append('<div class="video-group video-library-group" >\
                                          <ul class="ul-item-group"></ul>\
                                       </div>');
                }
                $file_items = $('.ul-item-group', $this_file);
            }

            if (_options.saveImage && _options.data) {
                $.post(_options.addFileUrls, {
                    imageUrls: _options.data.join(','),
                    table: gridParameters && gridParameters.queryParams.TableName
                }, function () { });
            }
            //不是追加，直接清空数据
            !_options.append && $file_items.text('');
            var fileData = _options.data;
            if (!fileData || fileData.length == 0)
                return;
            if (_options.fileType == "image") {
                $.fn.layOutFile.methods.createImage.call($this_file,$file_items, _options);
                return;
            }
            $.fn.layOutFile.methods.createVideo.call($this_file,$file_items, _options);

        }
    }
})(jQuery);




var helper = {
    active: true,
    appnedFilter: function () {
        this.filterBox = $('<div id="filter-box" style="display:none;">\
                 <div><span>\
                     <label class="icon-spinner icon-spin"></label>\
                     <label>正在处理.......</label>\
                </span> </div>\
                 </div>');
        $("body").append(this.filterBox);
    },
    filterBox: null,
    ajax: function (parameters) {
      var  _options = $.extend({
            type: "type",
            data: "",
            success: function (data, textStatus) {
                helper.filterBox.hide();
                fun(data, textStatus);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                helper.error(XMLHttpRequest);
            }
        }, parameters);
        $.ajax(_options);
    },
    post: function (url, data, fun, async) {
        this.submit(url, data, fun, 'post', async);
    },
    get: function (url, data, fun, async) {
        this.submit(url, data, fun, 'get', async);
    },
    error: function (XMLHttpRequest) {
        helper.filterBox.hide();
        try {
            $.message(JSON.parse(XMLHttpRequest.responseText).Desc);
        } catch (e) {
            if (XMLHttpRequest.responseText) {
                $.message(XMLHttpRequest.responseText);
                return;
            }
            if (XMLHttpRequest.status == 401) {
                $.message('登陆已超时,请刷新后重试!','red');
                window.parent.location.href = '/';
                return;
            }
            $.message(XMLHttpRequest.status==404?'未找服务器路径!':'服务器未响应,请刷新后重试!','red');
        }
    },
    submit: function (url, data, fun, type, async) {
        this.filterBox.show();
        var sendOptions = {
            url: url,
            type: type,
            async: typeof async == 'boolean' ? async : true,
            data: data,
            success: function (data, textStatus) {
                helper.filterBox.hide();
                fun(data, textStatus);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                helper.error(XMLHttpRequest);
            }
        };
        $.ajax(sendOptions);
    }
};
$(function () {
    helper.appnedFilter();
})