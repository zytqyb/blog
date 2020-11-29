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

</head>

<body>
<div class="container" style="height: 100%">
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
                <h1>邱同学的小破站</h1>
                <span>" 记住,无论以后遇到什么,都不要对这个世界失去希望 "</span>
            </header>
            <!-- 主要内容区 -->
            <div class="center-part">
                <%--                <ol style="display: none;" class="breadcrumb">--%>
                <%--                    <li><a href="#">首页</a></li>--%>
                <%--                    <li><a href="#">Library</a></li>--%>
                <%--                    <li class="active">Data</li>--%>
                <%--                </ol>--%>
                <!--首页输出文章-->
                <div class="blog-post">
                    <c:forEach var="blogList" items="${blogList}">
                        <div class="single-post panel" style="height: 451px">
                            <div class="index-post-img">
                                <a href="${pageContext.request.contextPath}/blog?method=getArticle&id=${blogList.id}">
                                    <!-- 展示文章头图 -->
                                    <div class="post-img"
                                         style="background-image: url(${blogList.photo})">
                                    </div>

                                    <div class="article-data" style="max-height: 200px">
                                        <h2>${blogList.title}</h2>
                                        <p>
                                                ${blogList.content100}......
                                        </p>
                                        <div class="line"></div>
                                    </div>

                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>


                <!-- 分页 -->
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <%-- 上一页 --%>
                        <li id="previous" class="<c:if test="${currentPageNo <=1}">
                        disabled
                        </c:if>">
                            <a href="index.jsp?title=${title}&CategoryId=${queryCategoryId}&pageIndex=${currentPageNo-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <%
                            int totalPageCount = (int) request.getAttribute("totalPageCount");
                            int currentPageNo = (int)request.getAttribute("currentPageNo");
                            for (int i = 1; i <= totalPageCount; i++) {
                        %>

                        <li class="<%if (currentPageNo == i){%>active<%}%>">
                        <%-- 跳转页数 --%>
                        <a href="index.jsp?title=${title}&CategoryId=${queryCategoryId}&pageIndex=<%=i%>"><%=i%></a></li>
                        <%}%>

                        <li id="next" class="<c:if test="${currentPageNo >= totalPageCount}">
                            disabled
                            </c:if>">
                            <a href="index.jsp?title=${title}&CategoryId=${queryCategoryId}&pageIndex=${currentPageNo+1}" >
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- 分页结束 -->
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
                        <span class="badge">${totalCount}</span>
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
</body>

</html>