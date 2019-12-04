<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>邮差快递--后台管理系统-查询邮差工作量</title>
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <script src="/assets/admin/js/echarts.min.js"></script>
    <link rel="stylesheet" href="/assets/admin/css/amazeui.min.css" />
    <link rel="stylesheet" href="/assets/admin/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="/assets/admin/css/app.css">
    <script src="/assets/admin/js/jquery.min.js"></script>
</head>

<body data-type="search">
    <script src="/assets/admin/js/theme.js"></script>
    <div class="am-g tpl-g">
        <!-- 头部 -->
        <header>
            <!-- logo -->
            <div class="am-fl tpl-header-logo">
                <a href="javascript:;">后台管理系统</a>
            </div>
            <!-- 右侧内容 -->
            <div class="tpl-header-fluid">
                <!-- 侧边切换 -->
                <div class="am-fl tpl-header-switch-button am-icon-list">
                    <span>

                </span>
                </div>
                <!-- 搜索 -->
                <div class="am-fl tpl-header-search">
                    <form class="tpl-header-search-form" action="javascript:;">
                        <button class="tpl-header-search-btn am-icon-search"></button>
                        <input class="tpl-header-search-box" type="text" placeholder="搜索内容...">
                    </form>
                </div>
                <!-- 其它功能-->
                <div class="am-fr tpl-header-navbar">
                    <ul>
                        <!-- 欢迎语 -->
                        <li class="am-text-sm tpl-header-navbar-welcome">
                            <a href="javascript:;">欢迎你, <span>管理员</span> </a>
                        </li>
                        <!-- 退出 -->
                        <li class="am-text-sm">
                            <a href="/logout">
                                <span class="am-icon-sign-out"></span> 退出
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </header>
        <!-- 风格切换 -->
        <div class="tpl-skiner">
            <div class="tpl-skiner-toggle am-icon-cog">
            </div>
            <div class="tpl-skiner-content">
                <div class="tpl-skiner-content-title">
                    选择主题
                </div>
                <div class="tpl-skiner-content-bar">
                    <span class="skiner-color skiner-white" data-color="theme-white"></span>
                    <span class="skiner-color skiner-black" data-color="theme-black"></span>
                </div>
            </div>
        </div>
        <!-- 侧边导航栏 -->
        <div class="left-sidebar">
            <!-- 用户信息 -->
            <div class="tpl-sidebar-user-panel">
                <div class="tpl-user-panel-slide-toggleable">
                    <div class="tpl-user-panel-profile-picture">
                        <img src="/img/admin-header.png" />
                    </div>
                    <span class="user-panel-logged-in-text">
              		<i class="am-icon-circle-o am-text-success tpl-user-panel-status-icon"></i>  Admin
                    </span>
                </div>
            </div>

            <!-- 菜单 -->
            <ul class="sidebar-nav">
                <li class="sidebar-nav-link">
                    <a href="/admin/index" class="active">
                        <i class="am-icon-home sidebar-nav-link-logo"></i> 首页
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="/admin/findAddressAll">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 物流管理
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="/admin/findAllPostmans">
                        <i class="am-icon-users sidebar-nav-link-logo"></i> 邮差管理
                    </a>
                </li>
            </ul>
        </div>

        <!-- 内容区域 -->
        <div class="tpl-content-wrapper">

            <div class="container-fluid am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12">
                        <div class="page-header-heading"><span class="am-icon-home page-header-heading-icon"></span> 首页 </div>
                    </div>
                </div>
            </div>

            <div class="row-content am-cf">
                <div class="widget am-cf">
                    <div class="widget-head am-cf">
                        <div class="widget-title am-fl">查询${month}月${town}所有邮差（邮递员）的工作量</div>
                    </div>
                    <form action="/admin/findAllPostmanWorks" method="get" class="am-form tpl-form-line-form">
	                    <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">选择月份地址</label>
                            <div class="am-u-sm-2">
                                <select data-am-selected="{searchBox: 0}" name="month" style="display: none;">
                                    <option value="0">--选择月份--</option>
                                    <option value="1">1月</option>
                                    <option value="2">2月</option>
                                    <option value="3">3月</option>
                                    <option value="4">4月</option>
                                    <option value="5">5月</option>
                                    <option value="6">6月</option>
                                    <option value="7">7月</option>
                                    <option value="8">8月</option>
                                    <option value="9">9月</option>
                                    <option value="10">10月</option>
                                    <option value="11">11月</option>
                                    <option value="12">12月</option>
                                </select>
                            </div>
                            <div class="am-u-sm-3">
                                <select data-am-selected="{searchBox: 0}" name="town" style="display: none;">
								  <option value="0">--选择区域--</option>
								  <option value="太平镇">太平镇</option>
								  <option value="良口镇">良口镇</option>
								</select>
                            </div>
                            <button type="submit" class="am-u-sm-1 am-u-end am-btn am-round am-btn-primary">查询</button>
                        </div>
                   	</form>
                    <div class="widget-body am-fr">
                        <div style="height: 400px" id="postman-work-count">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script>
        var postmanName = new Array();
        var workload = new Array();
        <c:forEach items="${workConditionViewList}" var="list" varStatus="status">
            postmanName[${status.index}] = "${list['ename']}";
            workload[${status.index}] = ${list["receipt"]} + ${list["deliver"]};
        </c:forEach>
    </script>

    <script src="/assets/admin/js/amazeui.min.js"></script>
    <script src="/assets/admin/js/amazeui.datatables.min.js"></script>
    <script src="/assets/admin/js/dataTables.responsive.min.js"></script>
    <script src="/assets/admin/js/app.js"></script>

</body>

</html>