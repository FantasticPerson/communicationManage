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
    if(window.__react_tab_index__){
        showUnitBox();
    }
    else {
        loadCss({{.baseurl}}+'/static/subapp/common/main-bundle-[57949b80a7c8be11a69f83a5625bc99c].css');
        loadScript({{.baseurl}}+'/static/subapp/common/main-bundle-[868d688842b2e4ad8881].js',function(){
                setLoginListLocation();
                });
        var lis = $('.navTab-tab li');
        var cli = $('a.devicesid:parent').parent()[0];
        var tabIndex = -1;
        for (var i = 0; i < lis.length; i++) {
            if (lis[i] == cli) {
                tabIndex = i;
            }
        }
        window.__react_tab_index__ = tabIndex+1;
    }
    setLoginListLocation();
    $('a.devicesid').on('click',function(){
        setLoginListLocation();
        showUnitBox();
    });
    var login_btn = $('.icon-login').parent().on('click',function(){
        setLoginListLocation();
        showUnitBox();
    });
    function setLoginListLocation(){
        var location = window.location.toString();
        var index = location.indexOf('main.do');
        window.location = location.substring(0,index)+'main.do#/loginList';
    }
    function showUnitBox(){
        setTimeout(function(){
            var index = window.__react_tab_index__ -1;
            var unitBox = $('.layoutBox').children();
            for(var i=0;i<unitBox.length;i++){
                if(index != i) {
                    unitBox[i].style.display='none';
                } else {
                    unitBox[i].style.display='block';
                }
            }
        },100);
    }
    function loadScript(url, callback) {
        var script = document.createElement("script");
        script.type = "text/javascript";
        if(typeof(callback) != "undefined"){
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
    function loadCss(url){
        var head = document.getElementsByTagName('head')[0];
        var link = document.createElement('link');
        link.href = url;
        link.rel = 'stylesheet';
        link.type = 'text/css';
        head.appendChild(link);
    }
</script>
</body>
</html>