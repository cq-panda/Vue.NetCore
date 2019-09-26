/*
 *Author：jxx
 *Contact：283591387@qq.com
 *Date：2018-07-01
 */
var htmlUtil = {
    enCode: function (str) {
        if (!str) return '';
        return str.replace(/&/g, "&amp;").
            replace(/</g, "&lt;").
            replace(/>/g, "&gt;").
            replace(/ /g, "&nbsp;").
            replace(/\'/g, "&#39;").
            replace(/\"/g, "&quot;");
    },
    deCode: function (str) {
        if (!str) return '';
        return str.replace(/&amp;/g, "&")
            .replace(/&lt;/g, "<")
            .replace(/&gt;/g, ">")
            .replace(/&nbsp;/g, " ")
            .replace(/&#39;/g, "\'")
            .replace(/&quot;/g, "\"");
    }
};
var formatterClass = ['#d9534f', '#5bc0de ', '#5cb85c', '#FF5722', '#FF9800',
    '#4CAF50', '#009688', '#ff6398', '#42e1d2', '#c34a93', '#d739f2', '#9834ca', '#9E9E9E'];

function setCellClass(options, cellText, val) {
    if (!this.completed) {
        $.each(this, function (i, v) {
            this.cellClass = formatterClass[i > 12 ? 12 : i];
        });
        this.completed = true;
    }
    var cellClass = 'none;color: #898b8b;';
    $.each(this, function (i, v) {
        if (this[options.valueField] == val) {
            cellClass = this.cellClass;
            return false;
        }
    });
    return "<span class='formatter' style='background:" + cellClass + "'>" + cellText + "</span>";
}

//格式化带数据来源列
Array.prototype.textFormatter = function (options, val, row, index) {
    var cellText = '';
    if (!this || typeof this != 'object' || this.length == 0) {
        cellText = val;
    }  //如果vlaue与text是同一个字段，直接返回当前值(不需要翻译)
    else if (options.valueField == options.textField) {
        cellText = val;
    }  //如果当前的text字段存在，直接返回对应字段的值
    else if (row.hasOwnProperty(options.textField) && row[options.textField]) {//如果出现rows的text与实际数据不一致，可将后面条件去掉
        cellText = row[options.textField];
    } else {  //如果当产有字段的值不存在,则遍历数据来源对象，根据value的值找到textField的值
        $.each(this, function () {
            if (row[options.valueField] == this[options.valueField]) {
                //获取数据源的值
                cellText = this[options.textField];
                return false;
            }
        });
    }
    if (cellText == '' || cellText == null || cellText == undefined) {
        return val;
    }
    return setCellClass.call(this, options, cellText, val);
}

function getDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
        + " " + date.getHours() + seperator2 + date.getMinutes();
    return currentdate;
}

Array.prototype.convertToValueText = function (options) {
    if (!this || typeof this != 'object' || this.length == 0 || !this[0].DicName) {
        return this;
    }
    //如果是两个相同的字段只取生成一个字段的数组对象
    var valueEqualText = false;
    if (options.valueField == options.textField) {
        options.textField = options.textField + 'V';
    }
    //如果是value与name值不同使用 方式配置，读取的时候只会读取
    //valueField: 'Remark',
    // textField: 'Remark',//如果只有value或text，配置时将value/textField写成相同
    var convertReslut = this.map(function (data, index) {
        var configObj = {};
        configObj[options.valueField] = data.DicValue;
        configObj[options.textField] = data.DicName;
        return configObj;
    });
    return convertReslut;
}

var formatDateTime = {
    date: function () {
        return formatDateTime.result.call(this, "yyyy-MM-dd");
    },
    datetime: function () {
        return formatDateTime.result.call(this, "yyyy-MM-dd hh:mm:ss");
    },
    result: function (format) {
        var _regex = /-?\d+/;
        var datePart = _regex.exec(this);
        if (!(datePart && datePart.length > 0)) {
            return "";
        }
        var _newDate = new Date(parseInt(datePart[0]));
        var o = {
            "M+": _newDate.getMonth() + 1, //month
            "d+": _newDate.getDate(),    //day
            "h+": _newDate.getHours(),   //hour
            "m+": _newDate.getMinutes(), //minute
            "s+": _newDate.getSeconds(), //second
            "q+": Math.floor((_newDate.getMonth() + 3) / 3),  //quarter
            "S": _newDate.getMilliseconds() //millisecond
        }
        if (/(y+)/.test(format)) format = format.replace(RegExp.$1,
            (_newDate.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o) if (new RegExp("(" + k + ")").test(format))
            format = format.replace(RegExp.$1,
                RegExp.$1.length == 1 ? o[k] :
                    ("00" + o[k]).substr(("" + o[k]).length));
        return format;
    }
}






//layout相关value操作
var layOutValue = {
    rgexInt: /^[0-9]*[1-9][0-9]*$/,
    regxDate: function (date) {
        date = date.replace(/(^\s+|\s+$)/g, '');
        var result = date.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
        if (result == null) {
            result = date.match(/^(\d+)-(\d{1,2})-(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/);
            if (result == null) {
                return false;
            }
        }
        var d;
        if (date.length == 10) {
            d = new Date(result[1], result[3] - 1, result[4]);
            return (d.getFullYear() == result[1] && (d.getMonth() + 1) == result[3] && d.getDate() == result[4]);
        }
        result[2] = result[2] - 1;
        var d = new Date(result[1], result[2], result[3], result[4], result[5], result[6]);
        if (d.getFullYear() != result[1]) return false;
        if (d.getMonth() != result[2]) return false;
        if (d.getDate() != result[3]) return false;
        if (d.getHours() != result[4]) return false;
        if (d.getMinutes() != result[5]) return false;
        if (d.getSeconds() != result[6]) return false;
        return true;

    },
    formatMsg: function (msg) {
        $.message('<div style="font-size: 20px;text-align: center;margin-top: 15px;color: #12c121;font-weight: bold;letter-spacing: 5px;">' + msg + '</div>!');
    },
    pushObj: function (argsValues, val, displayType) {
        if (!val && val != "0") {
            if (!this.require || ((this.readonly || this.disabled)
                && this.displayType != layOutElement.BIND_TYPE.select
                && this.displayType != layOutElement.BIND_TYPE.selectList
                && this.displayType != layOutElement.BIND_TYPE.drop
                && this.displayType != layOutElement.BIND_TYPE.dropList)) {
                argsValues.push({
                    Name: this.id,
                    Value: null,
                    DisplayType: displayType || this.displayType
                });
                return true;
            }

            if (this.displayType == 'data' || this.displayType == 'dropList') {
                this.element.find("input:eq(0)").click();
            } else if (this.displayType == 'date' || this.displayType == 'datetime') {
                this.element.find("input:eq(1)").focus();
            } else {
                this.element.focus();
            }
            layOutValue.formatMsg((this.text || this.id) + '是必填项!');
            argsValues = [];
            return false;
        }
        var vailMsg;


        if ((this.columnType == 'int' || this.columnType == 'long') && val != '0') {
            var vals = [];
            if (this.displayType == layOutElement.BIND_TYPE.dropList || this.displayType == layOutElement.BIND_TYPE.selectList) {
                vals = val.split(',');
            } else {
                vals.push(val);
            }
            for (var i = 0; i < vals.length; i++) {
                if (!layOutValue.rgexInt.test(vals[i])) {
                    vailMsg = (this.text || this.id) + '必须是数字';
                    return false;
                }
            }
        } else if (this.columnType == 'decimal' && isNaN(Number(val))) {
            vailMsg = (this.text || this.id) + '格式不正确';
        } else if (this.columnType == 'datetime' && !layOutValue.regxDate(val)) {
            vailMsg = (this.text || this.id) + '必须是日期格式';
        }

        if (vailMsg) {
            layOutValue.formatMsg(vailMsg);
            this.element.focus();
            argsValues = [];
            return false;
        }
        argsValues.push({
            Name: this.id,
            Value: val,
            DisplayType: displayType || this.displayType
        });
        return true;
    },
    file: function () {
        return layOutFile.getValue.call(this);
    },
    richText: function () {
        return layOutUEditor.getContent.call(this);
    },
    text: function () {
        return this.val();
    },
    drop: function (argsValues) {
        var bindOptions = $.data(this[0], 'data');
        var getMethod = 'getValue';
        //查询时，判断是否指定了包含的字段，如果包含第1个值为value则取value，否则取key
        //编辑时，如果指定了包含字段，则根据包含字段第一个值来判断是要获取value或text
        //如果没有指定包含字段，如果value与text不相同则，把两个值都提交到后台
        //如果value与text相同则默认提交value的值
        //查询时只需要获取value待完善
        if (bindOptions.containField && bindOptions.containField.length > 0) {
            var selectedData = this.jqDrop('getSelected');
            if (selectedData && selectedData.length > 0) {
                for (var i = 0; i < bindOptions.containField.length; i++) {
                    if (bindOptions.valueField != bindOptions.containField[i]) {
                        argsValues.push({
                            Name: bindOptions.containField[i],
                            Value: selectedData[0][bindOptions.containField[i]],
                            DisplayType: 'text'
                        });
                    }
                }
            }
            //&& bindOptions.valueField != bindOptions.containField[0]) {
            //getMethod = 'getText';
        }
        //如果没有指定字段,默认取valueField，就必须给valueField对应字段绑定下拉框
        return this.jqDrop(getMethod);
    },
    dropList: function () {
        //var bindOptions = $.data(this[0], 'data');
        //var getMethod = 'getValue';
        ////查询时，判断是否指定了包含的字段，如果包含第1个值为value则取value，否则取key
        ////编辑时，如果指定了包含字段，则根据包含字段第一个值来判断是要获取value或text
        ////如果没有指定包含字段，如果value与text不相同则，把两个值都提交到后台
        ////如果value与text相同则默认提交value的值
        //if (bindOptions.containField && bindOptions.containField.length > 0
        //    && bindOptions.valueField != bindOptions.containField[0]) {
        //    getMethod = 'getText';
        //}
        ////如果没有指定字段,默认取valueField，就必须给valueField对应字段绑定下拉框
        //return this.jqDrop(getMethod);
        return this.jqDrop('getValue');
    },
    select: function () {
        return this.jqSelect('getValue');
    },
    selectList: function () {
        return this.jqSelect('getValue');
    },
    textarea: function () {
        return this.val();
        //.replace(/\n/g, ',').
        //replace(/\r\n/g, ',').
        //replace(/\n/, ',').
        //replace('，', ',');
    },
    dateValue: function (isDateBox, callBack) {
        var dateClass = isDateBox ? 'input.datebox' : 'input.datetimebox';
        var dateVal = '';
        this.find(dateClass).each(function (i) {
            dateVal = callBack(this, i);
        });
        return dateVal;
    },
    datebox: function (argsValues, data) {
        return layOutValue.datetimebox.call(this, argsValues, data, true);
    },
    datetimebox: function (argsValues, data, isDateBox) {
        return layOutValue.dateValue.call(this, isDateBox || false, function (obj, i) {
            var dateVal = $(obj)[isDateBox ? 'datebox' : 'datetimebox']('getValue');
            if (!layOutValue.pushObj.call(data, argsValues, dateVal, ['thanorequal', 'lessorequal'][i && 1])) {
                return false;
            }
            return dateVal;
        });
    },
    requireVal: function () {

    },
    //重置所有值,valObj==false，清空所有值，否则对指定字段设置值如{price:8.000}对price设置值
    reset: function (valObj) {
        var elementData = $.data(this[0], 'data'), objEmpty = true;
        if (!valObj) {
            valObj = {};
        } else {
            objEmpty = false;
        }
        $.each(elementData, function () {
            $.each(this, function () {
                var val = '';
                if (objEmpty || valObj.hasOwnProperty(this.id)) {
                    if (valObj.hasOwnProperty(this.id)) { val = valObj[this.id]; }
                    switch (this.displayType) {
                        case 'date':
                        case 'datetime':
                            var disType = this.displayType;
                            var isDate = disType == 'date' ? true : false;
                            //格式化日期
                            if (val && val.indexOf('/Date') != -1) {
                                val = formatDateTime[this.displayType].call(val);
                            }
                            layOutValue.dateValue.call(this.element, isDate, function (obj) {
                                $(obj)[disType + 'box']('setValue', val);
                            });
                            break;
                        case layOutElement.BIND_TYPE.select:
                        case layOutElement.BIND_TYPE.selectList:
                            this.element.jqSelect('setValue', val);
                            break;
                        case layOutElement.BIND_TYPE.drop:
                        case layOutElement.BIND_TYPE.dropList:
                            //如果设置了值，那么直接用绑定的val的字段取valObj的值,再通过值去比较drop绑定数据源与value相的项
                            if (val || val == '0') {
                                val = valObj[this.element.jqDrop('getOptions').valueField];
                                val = !val && val != '0' ? '' : val;
                            }
                            this.element.jqDrop('setValue', val);
                            break;
                        case layOutElement.BIND_TYPE.file:
                            layOutFile.fileSetValue.call(this.element, val);
                            //  layOutImage.createImage.call(this.element, { val: val });
                            break;
                        case layOutElement.BIND_TYPE.richText:
                            layOutUEditor.setContent.call(this.element, val || '');
                            var xxx = 1;
                            break;
                        default:
                            this.element.val(valObj[this.id]);
                            break;
                    }
                }
            })
        });
    },//编辑或新增时，获取drop/list,select/list配置字段的其他的值
    getOtherValue: function (editValues) {
        $.each($.data(this[0], 'data'), function () {
            $.each(this, function () {
                if (this.displayType == layOutElement.BIND_TYPE.drop
                    || this.displayType == layOutElement.BIND_TYPE.dropList
                    || this.displayType == layOutElement.BIND_TYPE.select
                    || this.displayType == layOutElement.BIND_TYPE.selectList
                ) {
                    var _options = $.data(this.element[0], 'data');
                    var selectData = this.element[0].select;
                    if (_options.containField && _options.containField.length > 0) {
                        for (var i = 0; i < _options.containField.length; i++) {
                            $.each(selectData, function () {
                                if (this.hasOwnProperty(_options.containField[i])) {
                                    editValues.push({
                                        Name: _options.containField[i],
                                        Value: this[_options.containField[i]]
                                    });
                                }
                            })
                        }

                    }
                }
            })
        });
    },
    getOption: function (fieldName) {  //根据字段名获取整个字段对象的参数
        var fieldOption = [];
        var elementData = $.data(this[0], 'data');
        if (!elementData) { return fieldOption; }
        $.each(elementData, function () {
            $.each(this, function () {
                if (fieldName == this.id) {
                    fieldOption = this;
                    return false;
                }
            });
        });
        return fieldOption;
    },
    getValues: function (fields) {//获取指定字段的值如:['name','age']
        var elementData = $.data(this[0], 'data');
        if (!elementData) { return []; }
        var argsValues = [];
        var vali = true;
        fields = fields || [];
        $.each(elementData, function () {
            $.each(this, function () {
                if (fields.length > 0 && fields.indexOf(this.id) == -1) {
                    return true;
                }
                if (!layOutValue[this.method]) { return; }
                var val = layOutValue[this.method].call(this.element, argsValues, this);
                if (this.method == 'datebox' || this.method == 'datetimebox') {
                    if (!val && (this.require || typeof val == 'boolean')) {
                        vali = false; return false;
                    }
                    return;
                }

                if (this.displayType == layOutElement.BIND_TYPE.file) {
                    if (val && val.length > this.fileMaxCount) {
                        $.alert("<span style='font-size:18px;color:red;'>最多只能选择【" + this.fileMaxCount + "】个文件</span>");
                        vali = false;
                        return false;
                    }
                    val = (val || []).join(',');
                }
                vali = layOutValue.pushObj.call(this, argsValues, val);
                if (!vali) { return false; }
            })
            if (!vali) { argsValues = []; return false; }
        })
        return argsValues;
    },//根据字段获取绑定的对象,如：$layElement.content.layOut('getElement','ProductCode')
    getElement: function (id) {
        var element;
        var elementData = $.data(this[0], 'data');
        if (!elementData) { return []; }
        $.each(elementData, function () {
            $.each(this, function () {
                if (this.id == id) {
                    element = this.element;
                    return false;
                }
            });
        });
        return element;
    }
};


var layOutUEditor = {
    setContent: function (_content) {
        if (this.body) {
            this.setContent(_content);
            return;
        }
        var _ue = this;
        _ue.ready(function () {//编辑器初始化完成再赋值
            _ue.setContent(_content);
        });
    }, insertHtml: function (_html) {
        this.execCommand('insertHtml', _html);
    },
    execFileCommand: function (url, id) {
        if (layOutFile.isImage.call(url)) {
            this.execCommand('insertimage', [{
                src: url
            }]);
            return;
        }
        if (!id) {
            helper.post('/Sys_ImageLibrary/GetFile', { url: url }, function (result) {
                if (!result.Status) {
                    $.message(result.Desc);
                    return;
                }
                id = result.Desc;
            }, false);
        }
        this.execCommand('insertHtml', '<p><iframe src="/Sys_ImageLibrary/Video?id=' + id + '" style="width:100%;height: 200px;"></iframe></p>');
    },
    getContent: function () {
        return this.getContent();
    },
    getEditor: function (richId) {
        var _ue = UE.getEditor(richId, {
            initialFrameHeight: 200,
            maximumWords: 10000,
            toolbars: [[
                'fullscreen', 'source', '|', 'undo', 'redo', '|',
                'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
                'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                'paragraph', 'fontfamily', 'fontsize', '|',
                'directionalityltr', 'directionalityrtl', 'indent', '|',
                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
                'insertframe', 'pagebreak', '|',
                'horizontal', 'spechars', '|',
                'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', '|'
            ]]
        });
        return _ue;
    }
}

var layOutFile = {
    isImage: function () {
        if (!this) return false;
        if (this.indexOf('@w_') != -1) {
            return true;
        }
        return /\.(gif|jpg|jpeg|png|gif|jpg|png)$/.test(this);
    },
    fileType: ['image', 'video'],
    url: "/RequestSDK/GetBceSTS",
    stsConfig: null,
    createNewFileName: function () {
        var padLeft = function (str, totalLen, padChar) {
            var arr = [];
            if (!padChar) {
                padChar = "0";
            }
            for (var i = 0; i < totalLen; i++) {
                arr.push(padChar);
            }
            return (arr.join("") + str).slice(0 - totalLen);
        }
        var dt = new Date();
        //年月日/毫秒数+4位随机数
        var fileName = dt.getFullYear().toString().substring(2) + padLeft((dt.getMonth() + 1), 2) + padLeft(dt.getDate(), 2) + "/" + dt.getTime() + padLeft(Math.pow(10, 4) * Math.random(), 4);
        return fileName;
    },
    getSTS: function () {
        if (layOutFile.stsConfig && (layOutFile.stsConfig.Sts.Expiration.getTime() - new Date().getTime()) / 1000 / 60 > 30)
            return;
        helper.post(layOutFile.url, {}, function (data) {
            data = JSON.parse(data);
            if (!data.Status) return;
            layOutFile.stsConfig = data;
            var _d = new Date();
            _d.setTime(Date.parse(data.Expiration));
            layOutFile.stsConfig.Sts.Expiration = _d;
        }, false);
    },
    start: function (thisFile, $fileGroup) {
        layOutFile.getSTS();
        helper.filterBox.show();
        var clientConfig = {
            credentials: {
                ak: layOutFile.stsConfig.Sts.AccessKeyId,
                sk: layOutFile.stsConfig.Sts.SecretAccessKey
            },
            sessionToken: layOutFile.stsConfig.Sts.SessionToken,
            endpoint: layOutFile.stsConfig.Endpoint
        };
        var bucket = layOutFile.stsConfig.Bucket,
            client = new baidubce.sdk.BosClient(clientConfig),
            ext = this.name.split(/\./g).pop(),
            objInfo = {
                FileExtension: "." + ext,
                OriginFileName: this.name,
                ContentLength: this.size,
                TableName: '',
                Creator: ''
            };
        objInfo.NewFileName = layOutFile.createNewFileName() + objInfo.FileExtension;
        objInfo.AbsUrl = layOutFile.stsConfig.Endpoint + "/" + layOutFile.stsConfig.Bucket + "/" + objInfo.NewFileName;
        var mimeType = baidubce.sdk.MimeType.guess(ext);
        if (/^text\//.test(mimeType)) {
            mimeType += '; charset=UTF-8';
        }
        var options = {
            'Content-Type': mimeType
        };
        var pathFile = layOutFile.stsConfig.Endpoint + "/" + layOutFile.stsConfig.Bucket + "/" + objInfo.NewFileName;
        client.putObjectFromBlob(bucket, objInfo.NewFileName, this, options).then(function (response) {
            thisFile.filesArr.push(pathFile);
            if (thisFile.fileLenght == thisFile.filesArr.length) {
                //  console.log(JSON.stringify(thisFile.filesArr));
                helper.filterBox.hide();
                layOutFile.fileSetValue.call($fileGroup, null, { saveImage: true, append: true, data: thisFile.filesArr, foots: layOutFile.CKFoots });
            }
        }).catch(function (error) {
            $.message("文件上传出错");
        });
        client.on('progress', function (event) {
            layOutFile.processCallback(event);
            // helper.filterBox.hide();
        });
    },
    upload: function ($fileGroup, fileMaxCount) {
        if (this.files.length > 3) {
            $.message('<span style="font-size: 18px;text-align: center;margin-top: 35px;color: #12c121;font-weight: bold;letter-spacing: 5px;">一次最多只能选择3个文件</span>');
            return;
        }
        this.filesArr = [];
        this.fileLenght = this.files.length;
        var checkUpData = { hasImage: false, haseVideo: false };
        for (var i = 0; i < this.files.length; i++) {
            if (this.files[i].size / 1024.00 / 1024.00 > 50) {
                $.message("上传的文件不能超过50M,请压缩后上传", "red");
                return;
            }
            if (layOutFile.isImage.call(this.files[i].name)) {
                checkUpData.hasImage = true
            } else if (this.files[i].name.indexOf('.mp4') != -1) {
                checkUpData.haseVideo = true;
            }
            if (checkUpData.haseVideo && checkUpData.hasImage) {
                $.message("请将视频和图片分开上传", "red");
                return;
            }
        }


        for (var i = 0; i < this.files.length; i++) {
            layOutFile.start.call(this.files[i], this, $fileGroup);
        }

    },
    onBrowseClick: function ($fileGroup) {
        if (this.window) {
            $('.icon-check', this.window).removeClass('icon-check').addClass('icon-check-empty');
            if (gridParameters.richText) {
                $('.file-menu input:checked', this.window).attr('checked', false);
            }
            this.window.jqWindow('open');            return;
        }
        this.window = $('<div></div>').jqWindow({
            title: '选择文件',
            titleIcon: 'icon-info-sign',
            layOutBg: '',
            showFooter: false,
            width: document.body.clientWidth * 0.7,//默认window宽度
            height: document.body.clientHeight * 0.77,//默认window高度
            footer: true,//是否显示底部button里
            text: '<div style="display:flex"><div class="file-menu">\
                     <ul class="list-group">\
                      <li class="list-group-item" ><input type="radio" value="1" id="_title" name="r_file"/><label for="_title">添加到封面</label></li>\
                      <li class="list-group-item" ><input type="radio" value="2" id="_content" name="r_file"/><label for="_content">添加到信息正文</label></li>\
                      <li class="list-group-item load-file" style="margin-top:20px">\
                       <span style="color: #1aefe6;" class="glyphicon glyphicon-share-alt"></span><span>加载系统分页文件</span></li>\
                       <li class="list-group-item video-conver">\
                       <span style="color: #0eada6;" class="icon-cog"></span><span>设置视频封面</span>\
                       <span style="color:red;" title="先勾选需要设置封面的视频,再勾选图片,再点击设置视频封面,完成后刷新页面即可看到效果!" class=" icon-question-sign"></span>\
                       </li >\
                       <li class="list-group-item" onclick="location.reload()">\
                       <span style="color:#1cd0ef;" class="icon-refresh"></span><span>刷新</span></a></li>\
                      <li class="list-group-item add-file" style="margin-top:20px">\
                        <span style="color: #f39313;" class="glyphicon glyphicon-plus-sign"> </span><span>添加文件</span></li>\
                    </ul>\
                    </div>\
                    <div class="select-upload-tabs tabs"></div></div>',//window文本
            mask: false,//是否显示遮罩
            headStyle: 'background: #2dc4f3;',//head样式
            cache: true,//关闭后是否清空内容
            shade: false,//显示最外层的遮罩效果
        });
        this.browseTabs = $('.tabs', this.window).jqTabs([
            {
                title: "上传", text: '<div class="upload-group"><button type="button"class="btn btn-info  icon-cloud-upload">选择文件</button> <input type="file" style="display:none;" multiple ></div>\
                 <div id="upload-files"></div>', showRemove: false
            },
            {
                title: '图片', text: '', showRemove: false
            },            {
                title: '视频', text: '', showRemove: false
            }        ]);
        var $tbs = this.browseTabs, $fileWindow = this.window;

        $tbs.find(".upload-group input:file").change(function () {
            layOutFile.upload.call(this, $tbs.find('#upload-files'), 5);
        });
        $tbs.find(".upload-group .btn").click(function () {
            $(this).next().click();
        });

        if (!gridParameters.richText) {
            $fileWindow.find("#_title").attr("checked", "1");
            $fileWindow.find("#_content").attr("disabled", "disabled");
        }

        //后台加载文件
        $fileWindow.find('.file-menu .load-file').click(function () {
            var selectIndex = $tbs.jqTabs('getIndex');
            if ($tbs.jqTabs('getIndex') == 0) {
                $tbs.jqTabs('setSelect', 1);
                selectIndex = 1;
            }
            this.page = this.page || { image: 0, video: 0 };
            if (selectIndex == 1) {
                this.page.image++;
            } else {
                this.page.video++;
            }
            layOutFile.getFileLibrary.call($tbs, { page: selectIndex == 1 ? this.page.image : this.page.video, loadType: selectIndex });
        });
        //设置视频封面
        $fileWindow.find('.file-menu .video-conver').click(function () {
            layOutFile.setConver.call($tbs);
        });
        //添加文件
        this.window.find('.file-menu > ul > li.add-file').click(function () {
            var appendToIndex = $fileWindow.find('.file-menu > ul > li input:checked').val();
            if (!appendToIndex) {
                $.message('请选择文件添加类型');
                return;
            }
            var files = $.map($tbs.jqTabs('getBody', '.icon-check'), function (ck_file) {
                var _obj = $(ck_file).parents('li')[0];//.src;
                return _obj.src || $.data(_obj, 'data');//.ImageUrls;
            });
            if (!files || files.length == 0) {
                $.message("请选择文件");
                return;
            }
            if (appendToIndex == 1) {
                $fileGroup.layOutFile('createFile',
                    $.extend({}, {
                        fileType: layOutFile.fileType[0],
                        data: files ? files : [],
                        append: true,
                        foots: layOutFile.foots
                    }));
            } else {
                if (!$layElement) return;
                var _UE = $layElement.content.layOut('getElement', 'Content');
                for (var i = 0; i < files.length; i++) {
                    layOutUEditor.execFileCommand.call(_UE, files[i].ImageUrls || files[i], files[i].Id || 0);
                }
            }
            $.message('添加成功');
            $fileWindow.jqWindow("close");
        });
    },
    foots: [{
        text: '<span class="icon-eye-open"></span>', handler: function ($this_file, _fileEventData) {
            $.jqWindow({
                title: "图片",
                width: document.body.clientWidth * 0.7,
                height: document.body.clientHeight * 0.8,
                text: '<div style="text-align:center;"><img src="' + _fileEventData.src + '"></div>'
            });
        }
    }, {
        text: '<span class="icon-remove"></span>', handler: function () {
            $(this).parents('li').remove();
        }
    }],
    CKFoots: [{
        text: '<span class="icon-check-empty"></span>', handler: function () {
            this.checked = !this.checked;
            if (this.checked) {
                $(this).addClass('icon-check').removeClass('icon-check-empty');
            } else {
                $(this).addClass('icon-check-empty').removeClass('icon-check');
            }
        }
    }],
    fileSetValue: function (val, options) {
        //$.data(this[0], 'data');
        var fileUrls = val ? val.split(',') : (options && options.data);
        //if (!fileUrls || fileUrls.length == 0) {
        //    return;
        //}
        return this.layOutFile('createFile',
            $.extend({
                fileType: fileUrls && layOutFile.isImage.call(fileUrls[0]) ? 'image' : 'video',
                data: fileUrls || [],
                foots: layOutFile.foots,
            }, options || {}));
    }, getValue: function () {
        return $.map(this.find(".ul-item-group > li"), function (_element) {
            return _element.src;
        });//.join(',');
    },
    getFileLibrary: function (pageData) {
        var $fileLibrary = this.jqTabs('getBody');
        var url = pageData.loadType == 1 ? "/Sys_ImageLibrary/GetImage" : "/Sys_ImageLibrary/GetVideo";
        helper.post(url, pageData, function (data) {            if (!data) {
                $.message('数据已全部加载'); return;
            }            $fileLibrary.layOutFile('createFile', {                data: (pageData.loadType == 1 && data) ? data.split(',') : data,                append: true,                fileType: pageData.loadType == 1 ? "image" : "video",                foots: layOutFile.CKFoots            });            return false;        });
    },
    processCallback: function () {

    },
    setConver: function () { //设置封面
        var CKVideos = $('.tabs-body > div:eq(2) .icon-check', this);
        if (CKVideos.length == 0) {
            $.message('请先选择要设置封面的视频');
            return;
        }
        if (this.jqTabs('getIndex') != -1) {
            this.jqTabs('setSelect', 1);
        }
        var CKImages = $('.tabs-body > div:eq(1) .icon-check', this);
        if (CKImages.length == 0) {
            $.message('请先选择要设置封面的图片');
            return;
        }
        if (CKVideos.length != CKImages.length) {
            $.message('已选择【' + CKVideos.length + '】个视频,需要选择【' + CKVideos.length + '】张图片!');
            return;
        }

        var videoArr = $.map(CKImages, function (obj, i) {
            var _obj = $.data($(CKVideos[i]).parents('li')[0], 'data');
            _obj.cover = $(obj).parents('li')[0].src;
            return _obj;
        });
        helper.post('/Sys_ImageLibrary/Update', { coverInfo: JSON.stringify(videoArr) }, function (result) {
            if (result.Status) {
                $.message('视频封面已更新,请刷新页面查看.', 'red');
                return;
            }
            $.message(result.Desc);
        });
    }
};



//layout相关元素操作
var layOutElement = {
    BIND_TYPE: {
        text: 'text',
        drop: 'drop',
        dropList: 'dropList',
        select: 'select',
        selectList: 'selectList',
        date: 'datebox',
        datetime: 'datetimebox',
        textarea: 'textarea',
        richText: 'richText',//富文本编辑
        file: 'file' //文件(图片，视频)
    },
    defaultOptions: {
        valueField: 'ID',
        textField: 'Name',
        all: true,
        multiple: false,
        data: null
    },
    createElement: function (args) {
        var method = layOutElement.BIND_TYPE[this.displayType] || 'text';
        var $element = layOutElement[method].call(this);
        this.method = method;
        return $element;
    },
    drop: function () {
        return layOutElement.dropList.call(this, true);
    },
    richText: function () {
        return $('<div id="' + this.id + '"></div>');
    },
    file: function (options) {
        var fileMaxCount = this.fileMaxCount;
        var _options = $.extend({}, {
            fileChange: function ($file) {
                layOutFile.upload.call(this, $file, fileMaxCount);
            },
            browse: function ($file) {
                layOutFile.onBrowseClick.call(this, $file);
            },
            data: this.data || [],
            fileType: this.displayType || 'image'
        }, options || {}
        );
        return $('<div></div>').layOutFile(_options);
    },
    dropList: function (multiple) {
        var defaults = $.extend({},
            layOutElement.defaultOptions,
            {
                //超过15项的默认启用搜索功能
                search: (this.dataSource && this.dataSource.data.length >= 15) ? true : false
            },
            this.dataSource,
            {
                readonly: this.disabled,
                multiple: (!multiple) && true
            });
        return $('<div class=""></div>').jqDrop(defaults);
    },
    select: function () {
        return layOutElement.selectList.call(this, true);
    },
    selectList: function (multiple) {
        var defaults = $.extend({}, layOutElement.defaultOptions, this.dataSource, { multiple: (!multiple) && true });
        return $('<ul class=""></ul>').jqSelect(defaults);
    },
    datebox: function () {
        return layOutElement.datetimebox.call(this, true);
    },
    datetimebox: function (isDateBox) {
        var dateClass = isDateBox ? 'datebox' : 'datetimebox';
        var dateStyle = " height:30px;";
        var _readonly = '';
        if (this.disabled) {
            _readonly = "readonly=1";
        }
        if (this.edit) {
            dateStyle += "width:" + (this.dateWidth - 15) + "px;";
            return $('<ul class="datebox-group date-view">\
                <li><input type="text"  style="' + dateStyle + '" class="' + dateClass + '"  ' + _readonly + '/></li></ul>');
        }
        dateStyle += "width:" + ((this.dateWidth - 15) / 2) + "px;";
        return $('<ul class="datebox-group date-reset">\
                <li><input type="text"  style=" ' + dateStyle + '" class="' + dateClass + '"  ' + _readonly + '/></li>\
                <li>~</li>\
                <li><input type="text"  style=" ' + dateStyle + '" class="' + dateClass + '"  ' + _readonly + '/></li></ul>');
    },
    text: function (args) {
        var placeholder = this.placeholder ? 'placeholder="' + this.placeholder + '"' : "";
        var $text = $('<input type="text" class="form-control" ' + placeholder + (this.disabled ? "readonly=1" : "") + '/>');
        if (!this.disabled && this.columnType && ['int', 'long', 'decimal'].indexOf(this.columnType.toLowerCase()) != -1) {
            var columnType = this.columnType;
            $text.keyup(function (e) {
                if (columnType == 'int' || columnType == 'long') {
                    $text.val(parseInt($text.val()) || 0);
                    return;
                }
                var val = $text.val();
                if (e.keyCode == 48) {
                    return;
                }
                if (e.keyCode == 190) {
                    var codeIndex = val.indexOf('.');
                    if (val.substring(codeIndex + 1, val.length).indexOf('.') == -1) {
                        return;
                    }
                }
                $text.val(parseFloat(val) || 0);
            });
        }
        return $text;
    },
    textarea: function (args) {
        var areaStyle = "";
        if (this.style) {
            areaStyle = 'style="' + this.style + '"';
        } else if (this.colSize >= 6) {
            areaStyle = 'style="height:120px;"';
        } else {
            areaStyle = 'style="height:45px;"';
        }
        var placeholder = this.placeholder ? 'placeholder="' + this.placeholder + '"' : "";
        return $('<textarea ' + placeholder + areaStyle + ' class="form-control"  ' + (this.disabled ? "readonly=1" : "") + '></textarea>');
    },
    createRequire: function () {
        if (!this.require) { return ''; }
        return '<small>*</small>';
    },
    createBtns: function (tools) {//splitNumber从第几个按钮开始截段(最多显示按钮数)，分成下拉框显示
        tools = $.extend({
            btns: null,
            displayCount: 4,//最多显示几个按钮
            position: null //是否把按钮添加到第一行的最后
        }, tools);
        var moreOptions = [];
        var hasPosition = false;
        if (tools.position && tools.position == 'right') {
            hasPosition = true;
            //if (tools.displayCount==4) {
            //    tools.displayCount = 4;
            //}
        }
        return this.each(function () {
            var $btnGroup = $('<div class="lay-btn-group"></div>');

            $.each(tools.btns, function (i) {
                if (i >= tools.displayCount) { moreOptions.push(this); return; }
                var $elementBtn = $('<div></div>');
                $elementBtn.append('<button type="button" class="' + this.btnClass + '"><span>' + this.text + '</span></button>');
                $btnGroup.append($elementBtn);
                var bindHandler = this.handler;
                if (bindHandler) { $elementBtn.bind('click', function () { bindHandler(); }); }
            });
            if (moreOptions.length > 0) {
                var elementDrop = $('<div class="drop-group btn-drop col-xs-1"></div>')
                    .jqDrop({
                        valueField: 'text',//数据key/val字段(实际字段)
                        textField: 'text',
                        btn: {
                            icon: 'icon-caret-down',
                            text: '更多'
                        },
                        icon: "icon-signin",
                        data: moreOptions
                    });
                $btnGroup.append(elementDrop);
            }
            if (hasPosition) {
                $btnGroup.css({
                    position: 'absolute',
                    right: '50px',
                    top: '1px'
                });
                $btnGroup.find('.drop-list').css({ 'margin-left': '-125px' });
                $btnGroup.addClass("lay-tools");
                $btnGroup.find('.btn').css({ border: '0px', padding: '5px', 'margin-left': '6px' });
            }

            $(this).append($btnGroup);
        });
        return this;
    },
    showView: function (gridParameters) {
        var tr = "<tr><td>字段</td><td>描述</td><td>类型</td></tr>"
        $.each(gridParameters.columns[0], function () {
            tr += "<tr><td>" + this.field + "</td><td>" + this.title + "</td><td>" + (this.datatype || "") + "</td></tr>";
        })
        $.jqWindow({
            title: '数据字典',
            top: 60,
            width: 670,
            height: 350,
            text: '<table class="table">' + tr + '</table>'
        });
    },
    createWindow: function (args) {
        helper.filterBox.show();
        var windowOptions = {
            title: '基本信息',
            headStyle: 'background-image:linear-gradient(135deg, #009aae 10%, #00c1d9 100%);',//"background: #d00a0a;",
            text: '',
            width: '800px',
            height: '600px',
            buttons: args.editBtns
        }
        if (args.gridParameters.richText) {
            //待完善
            windowOptions.buttons.push({
                text: '预 览',
                icon: 'btn btn-info  icon-camera',
                handler: function () {
                    var browserUrl = $layElement.content.layOut('getValue', 'DetailUrl');
                    browserUrl && window.open(browserUrl);
                }
            });
            args.editBtns.length >= 3 && windowOptions.buttons.push({
                text: '生成app页面',
                icon: 'btn btn-success icon-cloud',
                handler: function () {
                    if (!$layElement || !$layElement.content) return;
                    var urlData = {
                        Content: $layElement.content.layOut('getValue', 'Content'),
                        DetailUrl: $layElement.content.layOut('getValue', 'DetailUrl'),
                        Title: $layElement.content.layOut('getValue', 'Title'),
                        Template: $layElement.content.layOut('getOption', 'Content').Template
                    };
                    var fileUrl = layOutElement.createStaticFile({
                        htmlDic: JSON.stringify(urlData),
                        tableName: args.gridParameters.queryParams.TableName,
                        key: $layElement.editRow[args.gridParameters.key]
                    });
                    if (fileUrl) {
                        if (fileUrl != urlData.DetailUrl) {
                            $layElement.content.layOut('setValue', { DetailUrl: fileUrl });
                            $.message('app页面创建成功,请保存最新数据');
                        } else {
                            $.message('app页面创建成功');
                        }
                    }
                }
            });
        }
        var windowSize = layOutElement.getWindowSize(args);
        $.extend(windowOptions, windowSize);
        var $windowObject = $('<div></div>').jqWindow(windowOptions);
        var $content = $('.content:eq(0)', $windowObject);
        var $content_head = $("<div class='content-head'></div>");
        $content.append($content_head);
        var $detailGrid;
        if (args.gridDetailParameters) {
            args.gridDetailParameters.pageSize = 500;
            args.gridDetailParameters.pageList = [500, 1000, 1500, 2000];
            $detailGrid = $("<div class='content-gridDetail'><div class='gridDetail-head'></div><div class='gridDetail-table'></div></div>");
            $content.append($detailGrid);
        }
        $content_head.layOut({
            title: '<span><i class=" icon-legal"></i>' + args.gridParameters.cnName + '</span>',
            edit: true,
            colSize: windowSize.colSize,
            data: args.editData || [],
            headStyle: 'padding: 0px;background: #ffffff;'
        });
        helper.filterBox.hide();
        return {
            window: $windowObject,
            content: $content_head,
            detailGrid: $detailGrid ? $detailGrid.find('.gridDetail-table') : null,
            detailHead: $detailGrid ? $detailGrid.find('.gridDetail-head') : null
        };
    },
    getWindowSize: function (args) {
        var maxColunms = 0, editData = args.editData, gridParameters = args.gridParameters;
        var rows = editData.length;
        $.each(editData, function () {
            if (this.length > maxColunms) {
                maxColunms = this.length;
            }
        });
        var colSize = 4;
        if (maxColunms < 3) { colSize = 6; }
        var widthRatio = 0.95;
        var heightRatio = 0.95;
        //是否有明细数据
        if (!args.gridDetailParameters) {
            if (maxColunms < 3) {
                widthRatio = 0.55;
            } else {
                widthRatio = 0.650;
            }
            heightRatio = rows * 0.1 ;//+ 0.12;
            if (heightRatio > 1) {
                heightRatio = 0.95;
            }
        }

        var _clientWidth = document.body.clientWidth;
        var _clientHeight = document.body.clientHeight;
        args.height = args.height ? parseInt(args.height, 10) : 0;
        args.width = args.width ? parseInt(args.width, 10) : 0;

        if (args.gridParameters.richText) {
            args.height = _clientHeight * 0.95;
            args.width = _clientWidth * 0.77;
        } else if (args.gridParameters.fileLink) {
            args.height = _clientHeight * 0.75;
            args.width = _clientWidth * 0.75;
        }

        if (args.height) {
            if (args.height > _clientHeight) {
                args.height = _clientHeight * 0.95;
            }
        }
        else {
            args.height = _clientHeight * (heightRatio < 0.4 ? heightRatio + 0.2 : heightRatio < 0.7 ? heightRatio + 0.1 : heightRatio);
        }

        if (args.width) {
            if (args.width > _clientWidth) {
                args.width = _clientWidth * 0.95;
            }
        } else {
            args.width = _clientWidth * widthRatio;
        }
        return {
            colSize: colSize,
            width: args.width,
            height: args.height
        }
    },
    initPanel: function ($element_li, colSize) {
        var $element_group = $('<div class=""></div>');
        $element_group.append(' <label class=" control-label">' + layOutElement.createRequire.call(this) + this.text + '：</label>');
        var $element_target = $(' <div class=""></div>');

        var defaultColSize = 0;
        if (this.colSize) {
            defaultColSize = this.colSize;
            if (defaultColSize > 6) {
                defaultColSize = 10;
            } else if (defaultColSize == 6) {
                defaultColSize = 9;
            } else {
                defaultColSize = 8;
            }
            //  defaultColSize = this.colSize;
        }
        this.colSize = this.colSize || (colSize || 4);
        if (this.displayType == 'select' || this.displayType == 'selectList') {
            $element_target.addClass('lay-select-group');
            $element_group.addClass('lay-select');
        }
        else {
            $element_group.addClass('col-sm-' + this.colSize);
            $element_target.addClass('col-sm-' + (defaultColSize ? defaultColSize : (this.colSize + (this.colSize == 12 ? -5 : (this.colSize == 4 ? 3 : 2)))));
        }
        var $element = layOutElement.createElement.call(this);
        this.element = $element;
        if (this.displayType == 'date' || this.displayType == 'datetime') {
            $element_group.append($element);
        } else {
            $element_target.append($element);
            $element_group.append($element_target);
        }
        return $element_li.append($element_group);
    },
    initDetailHead: function (args) {
        this.append("<span class='icon-bar-chart'>" + args.title + "</span>");
        var $head = this;
        args.gridBtns && $.each(args.gridBtns, function () {
            var $headSpan = $("<span class='" + this.icon + "'>" + this.text + "</span>");
            var handler = this.handler;
            handler && $headSpan.click(function () {
                handler();
            });
            $head.append($headSpan);
        });
    },
    validate: function (editValues) {
    },
    createStaticFile: function (data) {
        //{ htmlDic: JSON.stringify(options.mainData), tableName: gridParameters.queryParams.TableName, path: '' }
        var fileUrl;
        helper.post("/UEditor/CreateStaticFile", data, function (pathData) {
            if (!pathData.Status) {
                $.message(pathData.Desc);
                return;
            }
            fileUrl = pathData.Desc;
        }, false);
        return fileUrl;
    },
    submitBefore: function (data, url, isEdit) {
        return true;
    },
    submitAfter: function (data, result, isEdit) {//isEdit是否编辑
        return true;
    },
    submit: function (elements) {
        var editValues = layOutValue.getValues.call(elements.content);
        if (!editValues || editValues.length == 0) { return; }
        //获取drop/list,select/list 配置containField字段其他的值
        layOutValue.getOtherValue.call(elements.content, editValues);
        //  $layElement, $elementGrid
        var options = {
            mainData: {},
            detailData: null,
            delKeys: null
        };
        $.map(editValues, function (data) {
            options.mainData[data.Name] = data.Value;
        });
        var gridOptions = this.datagrid("options");

        //结束编辑
        if (elements.detailGrid) {
            elements.detailGrid.endEditing();
            options.detailData = elements.detailGrid.layOut("getRow");
            options.delKeys = $.data(elements.detailGrid, 'delData');
            if (!layOutGrid.validateGridData.call(options, elements.detailGrid)) {
                return;
            }
        }

        var action = "add", isEdit = false;
        if (elements.editRow) {
            options.mainData[gridOptions.key] = elements.editRow[gridOptions.key];
            action = "edit";
            isEdit = true;
        }
        var tableName = gridOptions.queryParams.TableName;
        var url = "/" + tableName + "/" + action;

        var $this = this;
        if (!layOutElement.submitBefore(options, url, isEdit)) { return false; }

        //创建html页面
        if (gridParameters.richText && !options.mainData['DetailUrl']) {
            var fileUrl = layOutElement.createStaticFile({
                htmlDic: JSON.stringify(options.mainData),
                tableName: tableName
            });
            if (fileUrl) {
                options.mainData['DetailUrl'] = fileUrl;
            }
        }
        helper.post(url, {
            mainData: JSON.stringify(options.mainData),
            detailData: JSON.stringify(options.detailData),
            delKeys: JSON.stringify(options.delKeys)
        }, function (data) {
            if (typeof data == 'string') { data = JSON.parse(data); }
            if (data.Status) {
                //如果是编辑操作，可能会存在分页显示的问题，后台把没有分页显示的数据也删除了,(需要记录删除的主键，后台删除提交的删除的主键)
                if (data.Data) {
                    if (!elements.editRow) {
                        elements.content.find(" > .lay-heading").html('<span><i class=" icon-edit"></i>' + gridOptions.cnName + "编辑" + '</span>');
                    }
                    //   elements.editState = true;
                    $elementGrid.datagrid('reload');
                    elements.editRow = data.Data.data;
                    //刷新主表
                    elements.editRow && elements.content.layOut('reset', elements.editRow);
                    //刷新明细
                    elements.detailGrid && data.Data.list
                        && elements.detailGrid.datagrid("loadData", data.Data.list);
                }
            }
            !layOutElement.submitAfter(options, data, isEdit) || $.message(data.Desc);
        });
    },
    delBefore: function (keys, url) {
        return true;
    },
    delAfter: function (keys, url) {
    },
    del: function () {
        var removeRows = $elementGrid.datagrid('getSelections');
        if (!removeRows || removeRows.length == 0) {
            $.message("请选中要删除的行");
            return;
        }
        var gridOptions = $elementGrid.datagrid("options");
        var warningMessage = '<div style="font-size: 30px;text-align: center;margin-top: 35px;color: #12c121;font-weight: bold;letter-spacing: 5px;">确认要删除数据?</div>';
        $.alert({
            shade: true,
            text: warningMessage,
            buttons: [{
                text: '确认',
                icon: 'btn btn-danger  icon-ok-sign',
                handler: function (_evenWin, winHtml) {
                    var delArr = $.map(removeRows, function (delRow) {
                        return delRow[gridOptions.key];
                    });
                    var url = "/" + gridOptions.queryParams.TableName + "/del";
                    if (!layOutElement.delBefore()) { return false; }
                    _evenWin.hide();
                    helper.post(url, { keys: delArr.join(',') }, function (data) {
                        if (data.Status) {
                            $.message("删除成功");
                            $elementGrid.datagrid("reload")
                            return;
                        }
                        $.message(data.Desc || data.Msg);
                        layOutElement.delAfter();
                    });
                }
            }]
        })
    },
    upload: function () {
        if ($layElement.uploadWindow) {
            $layElement.uploadWindow.jqWindow("open");
            return;
        }
        var uploadoptions = {
            title: '选择上传文件',
            headStyle: 'background-image: linear-gradient(135deg, #009aae 10%, #00c1d9 100%);',//"background: #d00a0a;",
            text: '',
            width: '600px',
            height: '300px',
            buttons: []
        }
        $layElement.uploadWindow = $('<div></div>').jqWindow(uploadoptions);
        var $content = $('.content:eq(0)', $layElement.uploadWindow);
        var $file = $('<input type="file" name="fileInput" style="display:none">');
        var $changeBtn = $('<button type = "button" class= "btn btn-success" >选择文件</button >');
        var $startBtn = $('<button type = "button" class= "btn btn-warning" >开始上传</button >');
        var $templteBtn = $('<button type = "button" class= "btn btn-info" >下载模板</button >');
        var $btnGroup = $('<div class="upload-btn-group"></div>');
        var $uploadFileInfo = $('<div class="upload-file-info">\
                                <div class="tips">\
                                 <div>1、上传的文件的格式只能为xls、xlsx</div>\
                                 <div>2、上传的文件大小不能超过10M</div>\
                                </div>\
                               <div class="select-file"></div></div>');


        $changeBtn.click(function () {
            $file.click();
        });
        $file.change(function () {
            $uploadFileInfo.find('.select-file').html('<span>' + this.files[0].name + '</span><span>大小：' + ~~(this.files[0].size/1024) + 'KB</span>');
        });
        $startBtn.click(function () {
            if ($file[0].files.length==0) {
                $.message("请选择文件");
            }
            var file = $file[0].files[0];
            var data = new FormData();
            data.append("fileInput", file);
            $.ajax({
                type: "POST",
                url: "/" + $elementGrid.datagrid("options").queryParams.TableName+"/upload",
                contentType: false,
                processData: false,
                data: data,
                success: function (result) {
                   // $file.value = ''
                   // $file[0].outerHTML = $file[0].outerHTML;
                    $.message(result.Desc);
                }
            });
        });
        $btnGroup.append($file).append($changeBtn).append($startBtn).append($templteBtn);
        $content.append($btnGroup).append($uploadFileInfo);
    }
}

//grid操作
var layOutGrid = {
    createViewField: function (data) {
        if (!data.val)
            return;
        return '<a class="view-field" onclick="openWindow(null,null,null,' + data.index + ');">' + data.val + '</a>';
        //    return '<a class="view-field" onclick="openWindow(' + JSON.stringify(data.row).replace(/"/g, '&quot;') + ',null,true);">' + data.val + '</a>';
    },
    imageOnerror: function () {
        $(this).css("display", "none");
        //$(this).after('<span class=" icon-picture icon-defalut"></span>')
        //this.src = "../Content/image/default.jpg";
    },
    createImageUrl: function (data) {
        var images = data.row[data.key];
        if (!images) {
            return '';
            //'<span class=" icon-picture icon-defalut"></span>';
        }
        var imageArr = images.split(','), imgUrls = [];
        for (var i = 0; i < imageArr.length; i++) {
            var _src = imageArr[i];
            if (_src && _src.length > 10) {
                if (_src.indexOf('bcebos.') != -1 && _src.indexOf('@w_') == -1) {
                    _src = _src + '@w_' + (data.row.ImageSize || 350);
                }
                imgUrls.push('<img class="img-radius" onclick=window.open("' + _src.replace('@w_250', '') + '") src= "' + _src + '" style= "height:70px; margin-left: 5px;cursor: pointer; " onerror="layOutGrid.imageOnerror.call(this);" ></img>');
            }
        }
        return imgUrls.join(',');
    },
    getRow: function () {
        return this.datagrid("getData").rows || [];
    },
    addRow: function () {
        this.datagrid('appendRow', {});
    },
    delRow: function () {
        var deletedData = this.datagrid('getChecked');
        if (deletedData.length == 0) { $.message("请选择要删除的行!"); return; }
        var gridKey = this.datagrid('options').key;
        var delKeyArr = $.data(this, 'delData') || [];
        for (var i = deletedData.length - 1; i >= 0; i--) {
            //获取删除的key
            if (gridKey && deletedData[i][gridKey] && delKeyArr.indexOf(deletedData[i][gridKey]) == -1) {
                delKeyArr.push(deletedData[i][gridKey]);
            }
            var rowIndex = this.datagrid('getRowIndex', deletedData[i]);
            this.datagrid('deleteRow', rowIndex);
        }
        if (delKeyArr.length > 0) {
            $.data(this, 'delData', delKeyArr);
        }

    },
    validateGridData: function () {
        return true;
    }
    , formatTime: function (gridData) {//格式化日期
        if (!gridData || typeof gridData != 'object') { return; }
        $.each(gridData, function () {
            if (!this || !this.columns || this.columns.length == 0) {
                return;
            }
            $.each(this.columns[0], function () {
                if (this.datatype && this.datatype.toLowerCase() == 'date' || this.datatype.toLowerCase() == 'datetime') {

                    var dateField = this.field;
                    this.formatter = function (val, row, index) {
                        if (!val || typeof val != 'string' || val.indexOf('/Date') == -1) {
                            return val;
                        }
                        var formatReslut = formatDateTime[this.datatype.toLowerCase()].call(val);
                        row[dateField] = formatReslut;
                        return formatReslut;
                    }
                }
            })
        })

    }
}
$(function () {
    $.fn.layOut = function (options, data) {
        if (typeof options == 'string') { return $.fn.layOut.methods[options].call(this, data); }

        var defaultOptions = $.extend({},
            {
                title: ' <span class="icon-search"></span><span >数据信息</span>',
                colSize: 4,//指定列宽度,如4:显示12/4=3列,12/6=2列
                data: [],
                showHead: true,
                edit: true,
                headStyle: 'padding: 5px 10px;height: 30px;background: #009688;'
            }, options);

        return this.each(function () {
            var $rootElement = $(this);
            if (defaultOptions.showHead) {
                var headStyle = defaultOptions.headStyle || '';
                headStyle = 'style="' + headStyle + '"';
                $rootElement.append('<div ' + headStyle + ' class="panel-heading ' + (defaultOptions.edit ? "lay-heading" : "") + '">\
                            ' + defaultOptions.title + ' \
                           </div>');
            }
            $rootElement.append('<div class="panel-body lay-body ' + (defaultOptions.edit ? "body-detail" : "") + '" </div>');
            var $element_ul = $('<div class="unit-group form-horizontal"></div>');
            $.each(options.data, function () {
                var $element_li = $('<div class=" form-group "></div>');
                $.each(this, function () {
                    //计算日期标签的宽度
                    if ((this.displayType == 'datetime' || this.displayType == 'date')) {
                        if (!$rootElement.dateWidth) {
                            var colWidth = $rootElement.width() / (12 / defaultOptions.colSize);
                            $rootElement.dateWidth = colWidth * (defaultOptions.colSize == 4 ? 0.6 : 0.7);// - colWidth * 0.1;//右边间距col-sm-1
                        }
                        this.dateWidth = $rootElement.dateWidth;
                    }
                    this.edit = defaultOptions.edit;
                    layOutElement.initPanel.call(this, $element_li, defaultOptions.colSize);
                    if (this.displayType == layOutElement.BIND_TYPE.richText) {

                        this.element = layOutUEditor.getEditor(this.id);
                    }
                })
                $element_ul.append($element_li);
            })
            $('.lay-body', $(this)).append($element_ul);
            var $dateTime = $('.datebox', $element_ul);
            if ($dateTime.length > 0) {
                $dateTime.datebox();
            }
            $dateTime = $('.datetimebox', $element_ul);
            if ($dateTime.length > 0) {
                $dateTime.datetimebox();
            }
            $.data(this, 'data', options.data);
        });
    }

    $.fn.layOut.methods = {
        getValue: function (field) {//获取指定字段的值
            var values = $.fn.layOut.methods.getValues.call(this, field && [field], false);
            if (values && values.length > 0) {
                return values[0].Value;
            }
            return '';
        },
        getQueryWheres: function () {//获取查询条件的值对象
            var queryObj = $.fn.layOut.methods.getValues.call(this, null, true);
            if (!(queryObj && queryObj.length > 0)) { return queryObj; }

            var queryKeys = $.map($.data(this[0], 'data'), function (_data) {
                return $.map(_data, function (_options) { return _options.id; })
            });
            //移除不是查询的列
            for (var i = 0; i < queryObj.length; i++) {
                if (queryKeys.indexOf(queryObj[i].Name) == -1) {
                    queryObj.splice(i, 1); i--;
                } else if (queryObj[i].DisplayType == 'textarea') {
                    queryObj[i].Value = queryObj[i].Value.replace(/\n/g, ',').
                        replace(/\r\n/g, ',').
                        replace(/\n/, ',').
                        replace('，', ',').replace(',,', ',');
                }
            }
            return queryObj;
        },
        getValues: function (fields, _filter) {//fields获取指定字段的值如:['name','age']//逻辑待完
            var elementValues = layOutValue.getValues.call(this, fields);
            //_filter为bool类型判断是否包含空值的数据(查询用到)true过滤空值，false：不过滤
            if (typeof _filter === 'boolean' && _filter) {
                var filterValues = [];
                $.each(elementValues, function () {
                    if (this.Value != null) {
                        filterValues.push(this);
                    }
                })
                return filterValues;
            }
            return elementValues;
        },
        getOption: function (fieldName) {  //根据字段名获取整个字段对象的参数
            return layOutValue.getOption.call(this, fieldName);
        },
        getKeyValues: function (fields) {
            var _kv = {}, _kvData = $.fn.layOut.methods.getValues.call(this);
            if (_kvData.length == 0)
                return null;
            $.each(_kvData, function () {
                _kv[this.Name] = this.Value;
            })
            return _kv;
        },
        setValue: function (row) {//格式row {page:1,title:'测试设置值'}
            return layOutValue.reset.call(this, row);
        },
        reset: function (row) {//格式row {page:1,title:'测试设置值'}
            return layOutValue.reset.call(this, row);
        },
        createBtns: function (tools) {
            return layOutElement.createBtns.call(this, tools);
        },
        getElement: function (id) {//获取查询或编辑项下ID的对象
            return layOutValue.getElement.call(this, id);
        },
        submit: function ($elementGrid) {
            return layOutElement.submit.call(this, $elementGrid);
        },
        del: function () {
            return layOutElement.del.call(this);
        },
        showView: function (gridParameters) {
            return layOutElement.showView.call(this, gridParameters);
        },
        createWindow: function (args) {
            return layOutElement.createWindow.call(this, args);
        },
        initDetailHead: function (args) {
            return layOutElement.initDetailHead.call(this, args);
        },
        getRow: function () {
            return layOutGrid.getRow.call(this);
        },
        addRow: function (args) {
            return layOutGrid.addRow.call(this);
        },
        createViewField: function (data) {
            return layOutGrid.createViewField(data);
        },
        createImageUrl: function (data) {
            return layOutGrid.createImageUrl(data);
        },
        delRow: function (args) {
            return layOutGrid.delRow.call(this, args);
        },
        audit: function (options) {
            return layOutElement.audit.call(this, args);
        },
        export: function () {
        },
        upload: function () {
            return layOutElement.upload.call(this);
        },
        formatTime: function (args) {
            return layOutGrid.formatTime.call(this, args);
        }
    };
})

