<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>邮差快递--邮差平台--我的派件</title>
		<link rel="stylesheet" href="assets/before/before/css/amazeui.css" />
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/before/before/css/core.css" />
		<link rel="stylesheet" href="assets/before/before/css/menu.css" />
		<link rel="stylesheet" href="assets/before/before/css/index.css" />
		<link rel="stylesheet" href="assets/before/before/css/admin.css" />
		<link rel="stylesheet" href="assets/before/before/css/page/typography.css" />
		<link rel="stylesheet" href="assets/before/before/css/page/form.css" />

	</head>
	<body>
		<!-- Begin page -->
		<header class="am-topbar am-topbar-fixed-top">		
			<div class="am-topbar-left am-hide-sm-only">
                <a href="index.jsp" class="logo"><span>POSTMAN</span></a>
            </div>
	
			<div class="contain">
				<ul class="am-nav am-navbar-nav am-navbar-left">

					<li><h4 class="page-title">我的派件</h4></li>
				</ul>
				
				<ul class="am-nav am-navbar-nav am-navbar-right">
					<li class="inform"><i class="am-icon-bell-o" aria-hidden="true"></i></li>
					<li class="hidden-xs am-hide-sm-only">
                        <form role="search" class="app-search">
                            <input type="text" placeholder="搜索..." class="form-control">
                            <a href=""><i class="am-icon-search" style="margin: 0;"></i></a>
                        </form>
                    </li>
				</ul>
			</div>
		</header>
		<!-- end page -->
		
		
		<div class="admin">
		<!-- ========== Left Sidebar Start ========== -->
                  <!-- sidebar start -->
				  <div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas">
				    <div class="am-offcanvas-bar admin-offcanvas-bar">
				    	<!-- User -->
						<div class="user-box am-hide-sm-only">
	                        <div class="user-img">
	                            <img src="img/postman-header.png" alt="user-img" title="Mat Helme" class="img-circle img-thumbnail img-responsive">
	                            <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
	                        </div>
	                        <h5><a href="#">Mat Helme</a> </h5>
	                        <ul class="list-inline">
	                            <li>
	                                <a href="#">
	                                    <i class="am-icon-cog" aria-hidden="true"></i>
	                                </a>
	                            </li>
	
	                            <li>
	                                <a href="#" class="text-custom">
	                                    <i class="am-icon-cog" aria-hidden="true"></i>
	                                </a>
	                            </li>
	                        </ul>
	                    </div>
	                    <!-- End User -->
	            
						<ul class="am-list admin-sidebar-list">
						    <li><a class="am-cf" href="index.jsp"><span class="am-icon-home"></span> 首页</a></li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-table"></span> 收派件记录 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
						        <li><a href="post_receipt.jsp" class="am-cf"> 我的收件 </a></li>
						        <li><a class="am-cf am-active" href="post_delivery.jsp">我的派件</a></li>
						      </ul>
						    </li>
						</ul>
					</div>
				  </div>
				  <!-- sidebar end -->
		<!-- ========== Left Sidebar end ========== -->

		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<!-- row start -->
				<div class="am-g">
					<!-- col start -->
					<div class="am-u-md-12">
						<div class="card-box">
							<table class="am-table  am-table-striped">
								    <thead>
								        <tr>
								            <th>网站名称</th>
								            <th>网址</th>
								            <th>创建时间</th>
								        </tr>
								    </thead>
								    <tbody>
								        <tr>
								            <td>Amaze UI</td>
								            <td>http://amazeui.org</td>
								            <td>2012-10-01</td>
								        </tr>
								        <tr>
								            <td>Amaze UI</td>
								            <td>http://amazeui.org</td>
								            <td>2012-10-01</td>
								        </tr>
								        <tr>
								            <td>Amaze UI</td>
								            <td>http://amazeui.org</td>
								            <td>2012-10-01</td>
								        </tr>
								        <tr>
								            <td>Amaze UI</td>
								            <td>http://amazeui.org</td>
								            <td>2012-10-01</td>
								        </tr>
								        <tr>
								            <td>Amaze UI</td>
								            <td>http://amazeui.org</td>
								            <td>2012-10-01</td>
								        </tr>
								    </tbody>
								</table>
						</div>
					</div>
					<!-- col end -->
				</div>
				<!-- row end -->

				
			</div>
		</div>
		<!-- end right Content here -->
		</div>
		</div>
		
		<!-- navbar -->
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
		
		<script type="text/javascript" src="assets/before/before/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="assets/before/before/js/amazeui.min.js"></script>
		<script type="text/javascript" src="assets/before/before/js/app.js" ></script>
		<script type="text/javascript" src="assets/before/before/js/blockUI.js" ></script>



	</body>
	
</html>
