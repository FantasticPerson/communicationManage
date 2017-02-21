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
    <title>devices</title>
    <!--headerEmbedJs-->
    <script>
        window.__APP_NAME__ = "dandan.wu";
        window.__VERSION__ = "0.0.1";
        window.__APP_ENV__ = "dev";
        window.__DEBUG__ = true;
        window.__BUILD_TIME_STAMP__ = 1486607203136;
        window.__BUILD_TIME_STR__ = "Thu Feb 09 2017 10:26:43 GMT+0800 (CST)";
        window.__ELECTRON__ = false;
        window.__LAUNCH_TIME__ = Date.now()
    </script>
    <!--css-->
</head>
<body>
<div id="react-root"></div>
<!--js-->
<script>
    load();
    setLoginListLocation();
    $('a.devicesid').on('click', function () {
        switchNode2(true);
        setLoginListLocation();
    });
    $('.icon-login').parent().on('click', function () {
        switchNode2(true);
        setLoginListLocation();
    });
    function setLoginListLocation() {
        var location = window.location.toString();
        var index = location.indexOf('main.do');
        window.location = location.substring(0, index) + 'main.do#/loginList';
    }
    function showUnitBox2() {
        var unitBox = $('.layoutBox').children();
        var tabIndex = getTabIndex('a.devicesid:parent');
        for (var i = 0; i < unitBox.length; i++) {
            if (tabIndex != i) {
                unitBox[i].style.display = 'none';
            } else {
                unitBox[i].style.display = 'block';
            }
        }
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
    function onNavClick2(args){
        var id = args.id;
        var cIndex = getTabIndex('a.appsid:parent');
        var index = getReactNodeIndex()+1;
        if(id == cIndex && index == id) {
            switchNode2(false);
        }
        setTimeout(function(){
            var $tabNode = $node = $('a.devicesid').parent();
            console.log($tabNode);
            if($tabNode.hasClass('selected')){
                setLoginListLocation();
            }
        },200);
    }
    function load(){
        if (hasReact2()) {
            switchNode2(true);
        }
        else {
            loadCss({{.baseurl}}+'/static/subapp/common/main-bundle-[9711b13801786ed19685a3c1a72bac0a].css');
            loadScript({{.baseurl}}+'/static/subapp/common/main-bundle-[036c299d89f6b827350f].js', function () {
                setLoginListLocation();
            });
            var tabIndex = getTabIndex('a.devicesid:parent');
            $('.navTab-tab').on('myClick',function(e,args){
                onNavClick2(args);
            })

        }
    }
    function switchNode2(show=false){
        setTimeout(function() {
            doSwitch2(show);
        },100);
    }
    function getReactNodeIndex(){
        if(hasReact2() <= 0){
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
    function hasReact2(){
        return $('#react-app').length > 0;
    }

    function doSwitch2(show){
        var appIndex = getTabIndex('a.appsid:parent')-1;
        var cIndex = getTabIndex('a.devicesid:parent')-1;
        if(appIndex >= 0 && cIndex >= 0) {
            var index = getReactNodeIndex();
            if (appIndex > -1 && cIndex != index) {
                var $node1 = $('.unitBox:eq(' + appIndex + ')');
                var $node2 = $('.unitBox:eq(' + cIndex + ')');
                if (Math.abs(appIndex - cIndex) == 1) {
                    if(appIndex > cIndex) {
                        $node1.insertBefore($node2);
                    } else {
                        $node1.insertAfter($node2);
                    }
                } else {
                    var $node1Pre = $('.unitBox:eq(' + (appIndex - 1) + ')');
                    var $node2Pre = $('.unitBox:eq(' + (cIndex - 1) + ')');
                    $node1.insertAfter($node2Pre);
                    $node2.insertAfter($node1Pre);
                }
                if(show) {
                    console.log('switch box');
                    showUnitBox2();
                }
            }
        }
    }
</script>
</body>
</html>