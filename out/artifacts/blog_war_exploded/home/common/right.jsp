<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 右侧导航栏 -->
<aside class="nva-right">
    <div class="idebar-top">
        <ul id="right-qh">
            <li class="qh"><a href="javascript:"><span class="glyphicon glyphicon-thumbs-up"></span></a>
            </li>
            <li><a href="javascript:"><span class="fa fa-comment-o"></span></a></li>

            <li><a href="javascript:"><span class="glyphicon glyphicon-gift"></span></a></li>
        </ul>
    </div>


    <div class="tab-content">
        <!-- 热门文章 -->
        <div class="wz-pane">
            <h5>热门文章</h5>
            <ul id="randomBlog">
                <%--                        <li>--%>
                <%--                            <a class="wz-pane-img" href="#">--%>
                <%--                                <img src="https://www.bsat1314.cn/usr/themes/handsome/assets/img/sj2/1.jpg" alt="">--%>
                <%--                            </a>--%>
                <%--                            <div class="wz-pane-a">--%>
                <%--                                <a href="">--%>
                <%--                                    <h4 class="h5 l-h text-second">QQ等级签到拓展包介绍</h4>--%>
                <%--                                    <div class="liulan"><span class="glyphicon glyphicon-eye-open"></span></div>--%>
                <%--                                </a>--%>
                <%--                            </div>--%>
                <%--                        </li>--%>
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
