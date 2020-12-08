<%--
  Created by IntelliJ IDEA.
  User: bsat
  Date: 2020/12/8
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>html5 svg太空人404动画特效 www.bootstrapmb.com</title>

    <style>
        html {
            margin: 0;
            padding: 0;
            background-color: white;
        }

        body,
        html {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        #svgContainer {
            width: 640px;
            height: 512px;
            background-color: white;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            margin: auto;
        }
    </style>

</head>
<body>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/bodymovin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/data.js"></script>

<div id="svgContainer"></div>

<script type="text/javascript">
    var svgContainer = document.getElementById('svgContainer');
    var animItem = bodymovin.loadAnimation({
        wrapper: svgContainer,
        animType: 'svg',
        loop: true,
        animationData: JSON.parse(animationData)
    });
</script>

<div style="text-align:center;margin:10px 0; font:normal 14px/24px 'MicroSoft YaHei';">
</div>
</body>
</html>


