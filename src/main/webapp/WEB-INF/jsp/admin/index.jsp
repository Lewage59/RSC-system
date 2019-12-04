<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>邮差快递--后台管理系统</title>
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

<body data-type="index">
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
                <div class="row  am-cf">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-4">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">月度所有邮差工作量</div>
                                <div class="widget-function am-fr">
                                    <a href="javascript:;" class="am-icon-cog"></a>
                                </div>
                            </div>
                            <div class="widget-body am-fr">
                                <div class="am-fl">
                                    <div class="widget-fluctuation-period-text">
                                        <button onclick="morePostman()" class="widget-fluctuation-tpl-btn"><i class="am-icon-calendar"></i>   更多</button>
                                    </div>
                                </div>
                                <div class="am-fr am-cf">
                                    <div class="widget-fluctuation-description-amount text-success" am-cf>
                                        ${monthSum}件
                                    </div>
                                    <div class="widget-fluctuation-description-text am-text-right">
                                        ${month}月份工作量
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                        <div class="widget widget-primary am-cf">
                            <div class="widget-statistic-header">
                                本月邮差最大工作量
                            </div>
                            <div class="widget-statistic-body">
                                <div class="widget-statistic-value">
                                    ${postmansum.maxsum}件
                                </div>
                                <div class="widget-statistic-description">邮差名：<strong>${postmansum.maxpostname}</strong></div>
                                <span class="widget-statistic-icon am-icon-database"></span>
                            </div>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                        <div class="widget widget-purple am-cf">
                            <div class="widget-statistic-header">
                                本月邮差最小工作量
                            </div>
                            <div class="widget-statistic-body">
                                <div class="widget-statistic-value">
                                    ${postmansum.minsum}件
                                </div>
                                <div class="widget-statistic-description">邮差名：<strong>${postmansum.minpostname}</strong></div>
                                <span class="widget-statistic-icon am-icon-database"></span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row am-cf">
	                <div class="am-u-md-8 am-u-sm-12">
                        <div class="widget am-cf">
		                    <div class="widget-head am-cf" style="padding-bottom: 0;">
		                        <div class="tpl-caption font-red ">
	                                <i class="am-icon-bar-chart"></i>
	                                <span>  统计RSC系统邮件</span>
	                            </div>
                                <div class="actions">
	                                <ul class="actions-btn">
	                                    <li id="byday" class="purple-on">按天</li>
	                                    <li id="bymonth" class="green">按月</li>
	                                </ul>
	                            </div>
		                    </div>
		                    <div class="widget-body am-fr">
		                        <div style="height: 400px;" id="tpl-echarts-rsc-day"></div>
		                        <div style="height: 400px;" id="tpl-echarts-rsc-month"></div>
		                    </div>
		                </div>
	                </div>
	                
	                <div class="am-u-sm-12 am-u-md-4">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">邮差本月工作量排行</div>
                                <div class="widget-function am-fr">
                                    <a href="javascript:;" class="am-icon-cog"></a>
                                </div>
                            </div>
                            <div class="widget-body  widget-body-lg am-fr">

                                <table width="100%" class="am-table am-table-compact tpl-table-black " id="example-r">
                                    <thead>
                                        <tr>
                                            <th>邮差id</th>
                                            <th>邮差名</th>
                                            <th>工作量</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${monthPostmans}" var="list">
                                        <tr class="gradeX">
                                            <td>${list.postmans.id}</td>
                                            <td>${list.postmans.ename}</td>
                                            <td>${list.receipt+list.deliver}件</td>
                                        </tr>
                                    </c:forEach>
                                        <!-- more data -->
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
	            </div>

                <div class="row am-cf">
                    <div class="am-u-sm-12 am-u-md-12">
                        <div class="widget am-cf">
		                    <div class="widget-head am-cf">
		                        <div class="widget-title am-fl">本年平台邮差工作量对比</div>
		                        <div class="widget-function am-fr">
		                            <a href="javascript:;" class="am-icon-cog"></a>
		                        </div>
		                    </div>
		                    <div class="widget-body am-fr">
		                        <div style="height: 400px" id="tpl-echarts-C">
		
		                        </div>
		                    </div>
		                </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- 全局变量数据 -->
    <script>
        var day = new Array();
        var month = new Array();
        var send_byday = new Array();
        var get_byday = new Array();
        var dis_byday = new Array();
        var send_bymonth = new Array();
        var get_bymonth = new Array();
        var dis_bymonth = new Array();
        <c:forEach items="${dayViewList}" var="list" varStatus="status">
        send_byday[${status.index}] = "${list['receiptnumber']}";
        get_byday[${status.index}] = "${list['receiptnumber']}";
        dis_byday[${status.index}] = "${list['faultnumber']}";
        day[${status.index}] = "${list['day']}号";
        </c:forEach>
        <c:forEach items="${monthViewList}" var="list" varStatus="status">
        send_bymonth[${status.index}] = "${list['delivernumber']}";
        get_bymonth[${status.index}] = ${list["receiptnumber"]};
        dis_bymonth[${status.index}] = "${list['faultnumber']}";
        month[${status.index}] = "${list['month']}月";
        </c:forEach>

        function morePostman() {
            window.location.href = "/admin/findAllPostmanWorks";
        }
    </script>

    <script src="/assets/admin/js/amazeui.min.js"></script>
    <script src="/assets/admin/js/amazeui.datatables.min.js"></script>
    <script src="/assets/admin/js/dataTables.responsive.min.js"></script>
    <script src="/assets/admin/js/app.js"></script>

</body>

</html>