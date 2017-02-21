<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no, email=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="cache-control" content="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!--favicon-->
    <link rel="shortcut icon" href="app-16x16.ico?v=0.0.1" sizes="16x16">
    <title>apps</title>
    <!--headerEmbedJs-->
    <script>
        window.__APP_NAME__ = "dandan.wu";
        window.__VERSION__ = "0.0.1";
        window.__APP_ENV__ = "dev";
        window.__DEBUG__ = false;
        window.__BUILD_TIME_STAMP__ = 1487065176134;
        window.__BUILD_TIME_STR__ = "Tue Feb 14 2017 17:39:36 GMT+0800 (CST)";
        window.__LAUNCH_TIME__ = Date.now()
    </script>
    <!--css-->
</head>
<body>
<div id="react-root"></div>
<script>
    setAppListLocation();
    load();
    $('a.appsid').on('click', function () {
        switchNode(true);
        setAppListLocation();
//        load();
//        showUnitBox();
    });
    $('.icon-apps').parent().on('click', function () {
        switchNode(true);
        setAppListLocation();
//        load();
//        showUnitBox();
    });
    $('.appsid').next().on('click', function () {

    });
    function setAppListLocation() {
        var location = window.location.toString();
        var index = location.indexOf('main.do');
        window.location = location.substring(0, index) + 'main.do#/appList';
    }
    function showUnitBox() {
//        setTimeout(function () {
            var tabIndex = getCurrentTabIndex();
            var index = window.__react_tab_index__ - 1;
            var unitBox = $('.layoutBox').children();
            for (var i = 0; i < unitBox.length; i++) {
                if (tabIndex != i) {
                    unitBox[i].style.display = 'none';
                } else {
                    unitBox[i].style.display = 'block';
                }
            }
//        }, 100);
    }
    function loadScript(url, callback) {
        var script = document.createElement("script");
        script.type = "text/javascript";
        if (typeof(callback) != "undefined") {
            if (script.readyState) {
                script.onreadystatechange = function () {
                    if (script.readyState == "loaded" || script.readyState == "complete") {
                        script.onreadystatechange = null;
                        callback();
                    }
                };
            } else {
                script.onload = function () {
                    callback();
                };
            }
        }
        script.src = url;
        document.body.appendChild(script);
    }

    function getCurrentTabIndex() {
        var lis = $('.navTab-tab li');
        var cli = $('a.appsid:parent').parent()[0];
        var tabIndex = -1;
        for (var i = 0; i < lis.length; i++) {
            if (lis[i] == cli) {
                tabIndex = i;
            }
        }
        return tabIndex;
    }
    function loadCss(url) {
        var head = document.getElementsByTagName('head')[0];
        var link = document.createElement('link');
        link.href = url;
        link.rel = 'stylesheet';
        link.type = 'text/css';
        head.appendChild(link);
    }
    function getTabIndex(name){
        var lis = $('.navTab-tab li');
        var cli = $(name).parent()[0];
        var tabIndex = -1;
        for (var i = 0; i < lis.length; i++) {
            if (lis[i] == cli) {
                tabIndex = i;
            }
        }
        return tabIndex;
    }
    function onNavClick(args){
        var id = args.id;
        var cIndex = getTabIndex('a.appsid:parent');
        var deviceIndex = getTabIndex('a.devicesid:parent');
        var index = getReactNodeIndex()+1;
        if(id == deviceIndex && index == id) {
            switchNode(false);
        }
        setTimeout(function(){
            var $tabNode = $node = $('a.appsid').parent();
            if($tabNode.hasClass('selected')){
                setAppListLocation();
            }
        },200);
    }
    function load(){
        if (hasReact()) {
            switchNode(true);
        } else {
            loadCss({{.baseurl}}+'/static/subapp/common/main-bundle-[9711b13801786ed19685a3c1a72bac0a].css');
            loadScript({{.baseurl}}+'/static/subapp/common/main-bundle-[036c299d89f6b827350f].js', function () {
                setAppListLocation();
            });
            var tabIndex = getTabIndex('a.appsid:parent');
            $('.navTab-tab').on('myClick',function(e,args){
                onNavClick(args);
            })
        }
    }
    function switchNode(show=false){
        setTimeout(function(){
            doWitch(show);
        },100);
    }
    function doWitch(show=false){
        var appIndex = getTabIndex('a.appsid:parent')-1;
        var deviceIndex = getTabIndex('a.devicesid:parent')-1;
        if(appIndex >= 0 && deviceIndex >= 0) {
            var index = getReactNodeIndex();
            if (deviceIndex > -1 && appIndex != index) {
                var $node1 = $('.unitBox:eq(' + appIndex + ')');
                var $node2 = $('.unitBox:eq(' + deviceIndex + ')');
                if (Math.abs(appIndex - deviceIndex) == 1) {
                    if(appIndex > deviceIndex) {
                        $node1.insertBefore($node2);
                    } else {
                        $node1.insertAfter($node2);
                    }
                } else {
                    var $node1Pre = $('.unitBox:eq(' + (appIndex - 1) + ')');
                    var $node2Pre = $('.unitBox:eq(' + (deviceIndex - 1) + ')');
                    $node1.insertAfter($node2Pre);
                    $node2.insertAfter($node1Pre);
                }
                if(show) {
                    showUnitBox();
                }
            }
        }
    }
    function getReactNodeIndex(){
        if(hasReact() <= 0){
            return -1;
        }
        let index = -1;
        var $units = $('.unitBox');
        for(var i=0;i<$units.length;i++){
            if($('.unitBox:eq('+i+')').children('#react-root').children('#react-app').length > 0){
                index = i;
                break;
            }
        }
        return index;
    }

    function hasReact(){
        return $('#react-app').length > 0;
    }
</script>
</body>
</html>