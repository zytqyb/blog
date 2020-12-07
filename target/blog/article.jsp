<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>小破站-首页</title>
    <%-- 导入css --%>
    <jsp:include page="home/common/css.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/editormd/css/editormd.css">
</head>

<body>

<div class="container">
    <%-- 头部导航栏 --%>
    <jsp:include page="home/common/header.jsp"/>
    <%-- 头部导航栏结束 --%>
    <%-- 左侧导航条 --%>
    <jsp:include page="home/common/left.jsp"/>
    <%-- 左侧导航条 --%>
    <!-- 主体部分 -->
    <main id="main" class="main-zhong row">
        <div class="main-box">
            <!-- 内容区头部 -->
            <header class="main-top">
                <h1 id="blogTitle">${blog.title}</h1>
                <ul>
                    <li id="blogUsername"><i class="fa fa-user"></i>${blog.username}</li>
                    <li id="blogUploadTime"><i class="glyphicon glyphicon-time"></i>${blog.uploadTime}</li>
                    <li id=""><i class="glyphicon glyphicon-eye-open"></i>22次浏览</li>
                </ul>
            </header>
            <!-- 主要内容区 -->
            <div class="center-part">
                <ol class="breadcrumb">
                    <li><a href="index.jsp"><i class="glyphicon glyphicon-home" style="margin-right: 5px"></i>首页</a></li>
                    <li class="active">正文</li>
                </ol>

                <img class="post-img" src="${blog.photo}" alt="">

                <!--首页输出文章-->
                <div class="blog-post">
                    <div class="single-post panel" style="padding: 30px">
                        <div id="test-editormd">
                            　　<textarea id="blogContent" style="display:none;" placeholder="markdown语言">${blog.content}</textarea>
                        </div>
                    </div>
                </div>


            </div>
            <!-- 主要内容区结束 -->
        </div>
        <!-- 右侧导航栏 -->
        <aside class="nva-right">
            <div class="idebar-top">
                <ul id="right-qh">
                    <li class="qh"><a href="javascript:"><span class="glyphicon glyphicon-thumbs-up"></span></a>
                    </li>
                    <li><a href="javascript:"><span class="glyphicon glyphicon-comment"></span></a></li>
                    <li><a href="javascript:"><span class="glyphicon glyphicon-gift"></span></a></li>
                </ul>
            </div>


            <div class="tab-content">
                <!-- 热门文章 -->
                <div class="wz-pane">
                    <h5>热门文章</h5>
                    <ul>
                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/1.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">QQ等级签到拓展包介绍</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/2.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">QQ超级萌宠签到机器人抓包CK登陆教程</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/3.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">基于node.js的一些总结</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/4.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">QQ等级签到拓展包介绍</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/5.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">QQ等级签到拓展包介绍</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/6.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">QQ等级签到拓展包介绍</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>

                <!-- 最新评论 -->
                <div class="wz-pane" style="display: none">
                    <h5>最新评论</h5>
                    <ul>
                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/1.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">QQ等级签到拓展包介绍</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/2.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">QQ超级萌宠签到机器人抓包CK登陆教程</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/3.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">基于node.js的一些总结</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/4.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">QQ等级签到拓展包介绍</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/5.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">QQ等级签到拓展包介绍</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/6.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">QQ等级签到拓展包介绍</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>

                <!-- 随机文章 -->
                <div class="wz-pane" style="display: none">
                    <h5>随机文章</h5>
                    <ul>
                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/1.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">QQ等级签到拓展包介绍</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/2.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">QQ超级萌宠签到机器人抓包CK登陆教程</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/3.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">基于node.js的一些总结</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/4.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">QQ等级签到拓展包介绍</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/5.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">QQ等级签到拓展包介绍</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a class="wz-pane-img" href="#">
                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/6.jpg" alt="">
                            </a>
                            <div class="wz-pane-a">
                                <a href="">
                                    <h4 class="h5 l-h text-second">QQ等级签到拓展包介绍</h4>
                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>

            <!-- 博客信息 -->
            <div class="blog-xx">
                <h5>博客信息</h5>
                <ul class="list-group">
                    <li class="list-group-item">
                        <span class="badge">14</span>
                        文章数目
                    </li>
                    <li class="list-group-item">
                        <span class="badge">18</span>
                        评论数目
                    </li>
                    <li class="list-group-item">
                        <span class="badge">20天</span>
                        运行天数
                    </li>
                    <li class="list-group-item">
                        <span class="badge">1天前</span>
                        最后活动
                    </li>
                </ul>
            </div>
        </aside>
        <!-- 右侧导航栏结束 -->
    </main>
</div>
<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jquery_growl/jquery.growl.js"></script>
<script src="${pageContext.request.contextPath}/home/js/index.js"></script>
<script src="${pageContext.request.contextPath}/home/js/login.js"></script>

<script src="${pageContext.request.contextPath}/plugins/editormd/lib/marked.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/editormd/lib/prettify.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/editormd/lib/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/editormd/lib/underscore.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/editormd/lib/sequence-diagram.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/editormd/lib/flowchart.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/editormd/lib/jquery.flowchart.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/editormd/editormd.js"></script>

<script type="text/javascript">
    // $.ajax({
    //     type: "POST",
    //     url: "/blog",
    //     data: {method: "ajaxArticle", id: "11"},
    //     dataType: "json",
    //     success: function (data) {
    //         console.log(data.blog);
    //         $("#blogTitle").html(data.blog.title);
    //         $("#blogUsername").html(data.blog.username);
    //         $("#blogUploadTime").html(data.blog.uploadTime);
    //         $("#blogPhoto").css("backgroundImage", "url(" + data.blog.photo + ")")
    //         $("#blogContent").val(data.blog.content);
    //         console.log($("#blogContent").val())
    //     },
    //     error: function (data) {
    //
    //     }
    // })

    editormd.markdownToHTML("test-editormd", {
        htmlDecode: "style,script,iframe", //可以过滤标签解码
        emoji: true,
        taskList: true,
        tex: true,
        flowChart: true,
        sequenceDiagram: true,
    });

</script>
</body>

</html>