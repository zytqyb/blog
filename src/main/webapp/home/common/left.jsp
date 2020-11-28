<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 左侧导航栏 -->
<aside class="aside">
    <div class="aside-wrap">
        <div class="nav-left">
            <div class="txq">
                <!-- 左侧导航栏头像 -->
                <div class="nav-left-tx">
                    <img src="https://www.bsat1314.cn//blog_img20201018004524.jpg" alt="">
                </div>

                <!-- 左侧导航栏个性签名 -->
                <a class="qm" href="#">
                    <span class="name">bsat</span>
                    <span class="caret"></span>
                    <p>言念君子，温其如玉</p>
                </a>
            </div>
            <!-- 分割线 -->
            <div class="link"></div>
            <!-- 左侧导航栏选项 -->
            <nav class="left-rn">
                <ul>
                    <li class="dhm">
                        <span>导航</span>
                    </li>
                    <li>
                        <a href="index.jsp">
                            <span class="glyphicon glyphicon-home"></span>
                            <span>首页</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-ice-lolly-tasted"></span>
                            <span>介绍</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-headphones"></span>
                            <span>音乐</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>
                            <span>动态</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-picture"></span>
                            <span>相册</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-book"></span>
                            <span>笔记</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-heart-empty"></span>
                            <span>朋友</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-comment"></span>
                            <span>留言</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-italic"></span>
                            <span>关于</span>
                        </a>
                    </li>

                    <!-- 分割线 -->
                    <div class="link"></div>

                    <li class="dhm">
                        <span>组成</span>
                    </li>

                    <li id="fl">
                        <a href="javascript:" onclick="toggle($('#fl ul'), $('#fl a i'))">
                            <span class="glyphicon glyphicon-th-large"></span>
                            <span>分类</span>
                            <i class="glyphicon glyphicon-menu-right"></i>
                        </a>
                        <ul class="secondary-menu">
                            <li>
                                <a href="javascript:">java教程</a>
                            </li>
                            <li>
                                <a href="javascript:">js教程</a>
                            </li>
                            <li>
                                <a href="javascript:">css教程</a>
                            </li>
                            <li>
                                <a href="javascript:">html教程</a>
                            </li>
                            <li>
                                <a href="javascript:">node.js教程</a>
                            </li>
                            <li>
                                <a href="javascript:">Mongodb教程</a>
                            </li>
                            <li>
                                <a href="javascript:">javaweb教程</a>
                            </li>
                            <li>
                                <a href="javascript:">123基础</a>
                            </li>
                            <li>
                                <a href="javascript:">12312412</a>
                            </li>
                        </ul>
                    </li>
                    <li id="ym">
                        <a href="javascript:" onclick="toggle($('#ym ul'), $('#ym a i'))">
                            <span class="glyphicon glyphicon-file"></span>
                            <span>页面</span>
                            <i class="glyphicon glyphicon-menu-right"></i>
                            <i style="display: none" class="glyphicon glyphicon-menu-down"></i>
                        </a>
                        <ul class="secondary-menu">
                            <li>
                                <a href="javascript:">java教程</a>
                            </li>
                            <li>
                                <a href="javascript:">js教程</a>
                            </li>
                            <li>
                                <a href="javascript:">css教程</a>
                            </li>
                            <li>
                                <a href="javascript:">html教程</a>
                            </li>
                            <li>
                                <a href="javascript:">node.js教程</a>
                            </li>
                            <li>
                                <a href="javascript:">Mongodb教程</a>
                            </li>
                            <li>
                                <a href="javascript:">javaweb教程</a>
                            </li>
                            <li>
                                <a href="javascript:">123基础</a>
                            </li>
                            <li>
                                <a href="javascript:">12312412</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-user"></span>
                            <span>友链</span>
                            <i class="glyphicon glyphicon-menu-right"></i>
                            <i style="display: none" class="glyphicon glyphicon-menu-down"></i>
                        </a>
                    </li>
                </ul>

            </nav>
        </div>
        <!-- 底部菜单 -->
        <div class="left-fotter">
            <div>
                <a href="#">
                    <i class="glyphicon glyphicon-cog"></i>
                    <span>管理</span>
                </a>
            </div>
            <div> <a href="#">
                <i class="glyphicon glyphicon-cog"></i>
                <span>文章</span>
            </a></div>
            <div> <a href="#">
                <i class="glyphicon glyphicon-cog"></i>
                <span>评论</span>
            </a></div>
        </div>
    </div>

</aside>
<!-- 左侧导航栏结束 -->
