<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>邮差快递--后台管理系统--物流管理</title>
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

<body data-type="widgets">
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
                    <a href="/admin/findAddressAll" class="active">
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
                        <div class="page-header-heading"><span class="am-icon-table page-header-heading-icon"></span> 物流管理 </div>
                    </div>
                </div>
            </div>
        	
            <div class="row-content am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title  am-cf">物流信息</div>
                            </div>
                            <div class="widget-body  am-fr">

                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <button type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                    <div class="am-form-group tpl-table-list-select">
                                        <select data-am-selected="{btnSize: 'sm'}">
                                          <option value="option1">所有区域</option>
                                          <option value="option2">太平镇</option>
                                          <option value="option3">良口镇</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" class="am-form-field " placeholder="搜索运单号">
                                        <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" type="button"></button>
          </span>
                                    </div>
                                </div>

                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
                                                <th>运单号</th>
                                                <th>联系人</th>
                                                <th>联系人电话</th>
                                                <th>地址</th>
                                                <th>创建时间</th>
                                                <th>物流状态</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${addressViewList}" var="list">
                                            <tr class="gradeX">
                                                <td>${list.no}</td>
                                                <td>${list.realName}</td>
                                                <td>${list.tel}</td>
                                                <td>${list.area}-${list.town}</td>
                                                <td>${list.createTime}</td>
                                                <td>
                                                    <c:if test="${list.type == 21}"><span class="am-badge am-badge-primary am-radius">正在派件</span></c:if>
                                                    <c:if test="${list.type == 22}"><span class="am-badge am-badge-success am-radius">派件成功</span></c:if>
                                                    <c:if test="${list.type == 29}"><span class="am-badge am-badge-danger am-radius">派件失败</span></c:if>
                                                    <c:if test="${list.type == 10}"><span class="am-badge am-badge-primary am-radius">正在取件</span></c:if>
                                                    <c:if test="${list.type == 19}"><span class="am-badge am-badge-danger am-radius">取件失败</span></c:if>
                                                </td>
                                                <td>
                                                    <div class="tpl-table-black-operation">
                                                        <a href="javascript:;">
                                                            <i class="am-icon-pencil"></i> 编辑
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                            <!-- more data -->
                                        </tbody>
                                    </table>
                                </div>
<%--                                <div class="am-u-lg-12 am-cf">--%>

<%--                                    <div class="am-fr">--%>
<%--                                        <ul class="am-pagination tpl-pagination">--%>
<%--                                            <li class="am-disabled"><a href="#">«</a></li>--%>
<%--                                            <li class="am-active"><a href="#">1</a></li>--%>
<%--                                            <li><a href="#">2</a></li>--%>
<%--                                            <li><a href="#">3</a></li>--%>
<%--                                            <li><a href="#">4</a></li>--%>
<%--                                            <li><a href="#">5</a></li>--%>
<%--                                            <li><a href="#">»</a></li>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script src="/assets/admin/js/amazeui.min.js"></script>
    <script src="/assets/admin/js/amazeui.datatables.min.js"></script>
    <script src="/assets/admin/js/dataTables.responsive.min.js"></script>
    <script src="/assets/admin/js/app.js"></script>

</body>

</html>