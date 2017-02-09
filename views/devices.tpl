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
    <title>dandan.wu</title>
    <style type="text/css">
        #bootstrapLoading {
            position: absolute;
            z-index: 9999999;
            top: 50%;
            left: 50%;
            width: 80px;
            height: 80px;
            margin: -40px 0 0 -40px;
        }

        .double-bounce1, .double-bounce2 {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background-color: #007CB9;
            opacity: 0.6;
            position: absolute;
            top: 0;
            left: 0;
            animation: bounce 2.0s infinite ease-in-out;
        }

        .double-bounce2 {
            animation-delay: -1.0s;
        }

        @keyframes bounce {
            0%, 100% {
                transform: scale(0.0);
            }
            50% {
                transform: scale(1.0);
            }
        }

    </style>
    <script></script>
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
    <link href="{{.baseurl}}/static/subapp/loginList/main-bundle-[bb7954c09598a1244d32b0683dc00b4a].css" rel="stylesheet">
</head>
<body>
<div id="react-root"></div>
<!--js-->
<script src="{{.baseurl}}/static/subapp/loginList/main-bundle-[c8d00f3a9b826cf84ecf].js" defer></script>
</body>
</html>