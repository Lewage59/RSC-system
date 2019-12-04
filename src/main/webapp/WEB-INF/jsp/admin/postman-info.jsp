<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>邮差快递--后台管理系统--邮差管理</title>
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

<body data-type="postman">
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
                        <img src="/img/admin-header.png" alt="">
                    </div>
                    <span class="user-panel-logged-in-text">
              		<i class="am-icon-circle-o am-text-success tpl-user-panel-status-icon"></i>  Admin
                    </span>
                </div>
            </div>

            <!-- 菜单 -->
            <ul class="sidebar-nav">
                <li class="sidebar-nav-link">
                    <a href="/admin/index">
                        <i class="am-icon-home sidebar-nav-link-logo"></i> 首页
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="/admin/findAddressAll">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 物流管理
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="/admin/findAllPostmans" class="active">
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
                        <div class="page-header-heading"><span class="am-icon-users page-header-heading-icon"></span> 邮差信息 </div>
                    </div>
                </div>
            </div>
            
            <div class="row-content am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-6">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">邮差基本信息</div>
                            </div>
                            <div class="widget-body  widget-body-lg am-fr">
                                <table width="100%" class="am-table am-table-compact tpl-table-black " id="example-r">
                                    <tbody>
                                    <tr class="gradeX">
                                        <td>邮差名</td>
                                        <td>${postmanView.ename}</td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>联系电话</td>
                                        <td>${postmanView.etel}</td>
                                    </tr>
                                    <tr class="gradeX">
                                        <td>所属区域</td>
                                        <td>${postmanView.ecity}-${postmanView.earea}-${postmanView.etown}</td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>本月工作量</td>
                                        <td>${postmanView.sumnumber}</td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>基本工资</td>
                                        <td>${postmanView.basesalary}</td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>本月预计获得工资</td>
                                        <td>${postmanView.sumbasesalary}</td>
                                    </tr>
                                    <!-- more data -->
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

	                <div class="am-u-sm-12 am-u-md-6">
	                    <div class="widget am-cf">
		                    <div class="widget-head am-cf">
		                        <div class="widget-title am-fl">邮差${month}月工作情况</div>
		                    </div>
		                    <form class="am-form tpl-form-line-form" action="/admin/findPostmanInfo">
			                    <div class="am-form-group">
                                    <label class="am-u-sm-3 am-form-label">按月份查询</label>
	                                <div class="am-u-sm-5">
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
                                    <input type="hidden" value="${postmanView.id}" name="postmanId">
	                                <button type="submit" class="am-u-sm-2 am-u-end am-btn am-round am-btn-primary">查询</button>
	                            </div>
                           	</form>
		                    <div class="widget-body am-fr">
		                        <div style="height: 300px;" id="postman-echarts-work"></div>
		                    </div>
		                </div>
	                </div>
                </div>
            </div>
            <!--row-end-->
        </div>
    </div>
    </div>
    <script>
        var workday = ${postmanView.workday};
        var leaveday = ${postmanView.leaveday};
        var overtimeday = ${postmanView.overtimeday};
    </script>

    <script src="/assets/admin/js/amazeui.min.js"></script>
    <script src="/assets/admin/js/amazeui.datatables.min.js"></script>
    <script src="/assets/admin/js/dataTables.responsive.min.js"></script>
    <script src="/assets/admin/js/app.js"></script>

</body>

</html>