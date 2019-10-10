function initScroll() {
    return;
    var $content = $("#tabs .tabs-ul");
    $("#tabs .scroll-left").click(function () {
        if (!$content.is(":animated")) {
            $content.animate({ left: "30px" }, 600);
        }
    });
    $("#tabs .scroll-right").click(function () {
        //if ($content[0].offsetLeft < 40)
        //    return;
        if (!$content.is(":animated")) {
            $content.animate({ left: "-=96px" }, 600);
        }
    });
}


$(function () {
    var bodyWidth = document.body.clientWidth;
    var bodyHeight = document.body.clientHeight;
    $(".skin-container").css({ 'min-height':'500px', 'min-width': '1000px' });

    var containerHeight = bodyHeight - 40 - 1;
    // $("#menu-container,#tabs").height(containerHeight);
    $('#menu-tree').slimScroll({
        width: '200px',
        color: '#C7BBBB',
        height: bodyHeight - 41 + 'px',
        size: '3px'
    });
    $(".skin-content").show();
    var tabs = $("#tabs").jqTabs([{
        title: '<span class="icon-home" style="font-size: 14px;padding-right: 4px;"></span>首页', text: '<div  style="height: 100%;display: block;">\
                                    <iframe width="100%"  scrolling="auto" \
                                    height="100%" frameborder="false" \
                                    allowtransparency="true" \
                                    style="border: medium none; width: 100%;"\
                                    src="/Html/ReportIndex.html" name="right">\
                                    </iframe>\
                                    </div>'}]);
    var $tabsBody = $(".tabs-body:eq(0)", $(tabs));
    $tabsBody.height(containerHeight - $(".title-nav").height() - 5);

    //$("#tabs .tabs-ul").before('<div class="icon-backward scroll-left"></div>');
    //$("#tabs .tabs-ul").after('<div class="icon-forward scroll-right"></div>');
    initScroll();
    var menuNode = $("#menu-tree").jqTree({ data: menuList, rootIcon: null });
    menuNode.jqTree('onSelect', function (obj, nodeData) {
        var url = nodeData.url;
        if (!url || url == '.' || url == '/') return true;
        url = url.replace("#Menu_Id#", nodeData.id);
        if (nodeData.haschild || !url)
            return true;
        $.message('项目已迁移至vue', 'red');
        return false;
        tabs.jqTabs([{
            title: nodeData.name,
            show: true,
            text: '<div  style="height: 100%;display: block;">\
             <div class="i-loading" style="">\
             <i class="icon-spinner icon-spin" style="margin-right: 7px;"></i>正在加载.............\
            </div>\
                                    <iframe width="100%"  scrolling="auto" id="'+ nodeData.id + '" \
                                    height="100%"  frameborder="false" \
                                    allowtransparency="true" \
                                    style="border: medium none; width: 100%;position: relative;"\
                                    src="'+ url + '" name="right" onload="$(this).prev().hide();">\
                                    </iframe>\
                                    </div>'}]);
    });
    $("#menu-tree > li > div:eq(0)").click();

    var $MPWindow, $taskWindow, pwdData = {};

    function modifyPwd() {
        var $pwds = $MPWindow.find('.pwd-box input');
        pwdData.oldPwd = $pwds[0].value.trim();
        if (!pwdData.oldPwd) {
            $pwds[0].focus();
            $.message('旧密码不能为空', 'red');
            return false;
        }
        pwdData.newPwd = $pwds[1].value.trim();
        if (!pwdData.newPwd || pwdData.newPwd.length < 6) {
            $pwds[1].focus();
            $.message('新密码不能为空并且长度至少为6位', 'red');
            return false;
        }
        pwdData.newPwd1 = $pwds[2].value.trim();
        if (!pwdData.newPwd1 || pwdData.newPwd1.length < 6) {
            $pwds[2].focus();
            $.message('确认密码不能为空并且长度至少为6位', 'red');
            return false;
        }
        if (pwdData.newPwd.length != pwdData.newPwd1.length) {
            $.message('新密码与确认密码长度不致', 'red');
            return false;
        }
        if (pwdData.newPwd != pwdData.newPwd1) {
            $.message('新密码与确认密码必须相同', 'red');
            return false;
        }

        helper.post('/Sys_User/ModifyPwd', pwdData, function (data) {
            $.message(data.Desc)
            if (data.Status) {
                $MPWindow.jqWindow('close');
            }
        });
    }
    function initPwdBox() {
        $MPWindow = $("<div></div>").jqWindow({
            title: '修改密码',
            titleIcon: 'icon-lock',
            width: '460',
            headStyle: 'background: #00847e;',
            height: '273',
            text: '<div class="pwd-box"><div class="col-sm-12"><label class="col-sm-3"><small>*</small>旧密码：</label><span class="col-sm-8"><input type="password" class="form-control"></span></div>\
                       <div class="col-sm-12"><label class="col-sm-3"><small>*</small>新密码：</label><span class="col-sm-8"><input type="password" class="form-control"></span></div>\
                       <div class="col-sm-12"><label class="col-sm-3"><small>*</small>确认密码：</label><span class="col-sm-8"><input type="password" class="form-control"></span></div></div>',
            buttons: [{
                text: '确认修改', icon: 'btn btn-danger icon-file-alt',
                handler: function (_evenWin, winHtml) {
                    modifyPwd();
                }
            }]
        });
    }

    function getAuditQty(tb) {
        if (!auditInfo || auditInfo.length == 0) {
            return 0;
        }
        for (var i = 0; i < auditInfo.length; i++) {
            if (auditInfo[i].tb == tb) {
                return auditInfo[i].qty;
            }
        }
        return 0;
    }

    function initTaskBox() {
        $taskWindow = $("<div></div>").jqWindow({
            title: '任务列表',
            titleIcon: 'icon-laptop',
            width: '660',
            headStyle: 'background: #e26000;',
            height: '390',
            showFooter: false,
            text: '<div class="task-box" class="col-xs-12" style="border-bottom:1px dotted #e0b0b0;">\
          <div class="info-box bg-yellow col-lg-12 ">\
            <div>\
            <span class="info-box-icon" ><i class="glyphicon glyphicon-user"></i></span>\
            <div class="info-box-content">\
                <span class="info-box-number">'+ getAuditQty("App_Expert") + '</span>\
                <span class="progress-description">专家申请审核</span>\
            </div>\
            <div class="right-view">\
                <span onClick="javascript:window.open(\'/App_Expert/Manager\')">查看</span>\
            </div>\
             </div>\
          </div>\
           <div class="info-box bg-green col-lg-12 ">\
           <div>\
            <span class="info-box-icon" ><i class="icon-question-sign"></i></span>\
            <div class="info-box-content">\
                <span class="info-box-number">'+ getAuditQty("App_Question") + '</span>\
                <span class="progress-description">提问记录审核</span>\
            </div>\
            <div class="right-view">\
                <span onClick="javascript:window.open(\'/App_Question/Manager\')">查看</span>\
            </div>\
              </div>\
          </div>\
            <div class="info-box bg-red col-lg-12 ">\
            <div>\
            <span class="info-box-icon" ><i class=" icon-truck"></i></span>\
            <div class="info-box-content">\
                <span class="info-box-number">'+ getAuditQty("App_ReportPrice") + '</span>\
                <span class="progress-description">肉牛上报记录审核</span>\
            </div>\
            <div class="right-view">\
                <span onClick="javascript:window.open(\'/App_ReportPrice/Manager\')">查看</span>\
            </div>\
              </div>\
          </div>\
             <div class="info-box bg-yellow col-lg-12 ">\
            <div>\
            <span class="info-box-icon" ><i class=" icon-truck"></i></span>\
            <div class="info-box-content">\
                <span class="info-box-number">'+ getAuditQty("App_CompanyAuthor") + '</span>\
                <span class="progress-description">肉企认证</span>\
            </div>\
            <div class="right-view">\
                <span onClick="javascript:window.open(\'/App_CompanyAuthor/Manager\')">查看</span>\
            </div>\
              </div>\
          </div>\
              <div class="info-box bg-blue col-lg-12 ">\
            <div>\
            <span class="info-box-icon" ><i class="icon-suitcase"></i></span>\
            <div class="info-box-content">\
                <span class="info-box-number">'+ getAuditQty("App_BeefTransaction") + '</span>\
                <span class="progress-description">活牛交易</span>\
            </div>\
            <div class="right-view">\
                <span onClick="javascript:window.open(\'/App_BeefTransaction/Manager\')">查看</span>\
            </div>\
              </div>\
          </div>\
          </div>'
        });
    }


    $("#head-right .modifyPwd").click(function () {
        if ($MPWindow) {
            $MPWindow.find('input').val('');
            $MPWindow.jqWindow('open');
        } else {
            initPwdBox();
        }
    });
    $("#head-right .task-message").click(function () {
        if ($taskWindow) {
            $taskWindow.jqWindow('open');
        } else {
            if ($(this).hasClass('bounce')) {
                $(this).removeClass('bounce');
            }
            initTaskBox();
        }
    });
})