<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>邮差快递--用户平台</title>
		<link rel="stylesheet" href="/assets/before/css/amazeui.css" />
		<link rel="stylesheet" href="/assets/before/css/core.css" />
		<link rel="stylesheet" href="/assets/before/css/menu.css" />
		<link rel="stylesheet" href="/assets/before/css/index.css" />
		<link rel="stylesheet" href="/assets/before/css/admin.css" />
		<link rel="stylesheet" href="/assets/before/css/page/typography.css" />
		<link rel="stylesheet" href="/assets/before/css/page/form.css" />
		<link rel="stylesheet" href="/assets/before/css/component.css" />
	</head>
	<body>
		<!-- Begin page -->
		<header class="am-topbar am-topbar-fixed-top">		
			<div class="am-topbar-left am-hide-sm-only">
                <a href="/user/toIndex" class="logo"><span>USER</span></a>
            </div>

			<div class="contain">
				<ul class="am-nav am-navbar-nav am-navbar-left">
					<li><h4 class="page-title">首页</h4></li>
				</ul>
				<ul class="am-nav am-navbar-nav am-navbar-right">
					<li class="inform"><i class="am-icon-bell-o" aria-hidden="true"></i></li>
					<li class="hidden-xs am-hide-sm-only">
                        <form role="search" class="app-search">
                            <input type="text" placeholder="搜索..." class="form-control" />
                            <a href=""><i class="am-icon-search" style="margin: 0;"></i></a>
                        </form>
                    </li>
				</ul>
			</div>
		</header>
		<!-- end page -->
		
		<div class="admin">
				<div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas">
				    <div class="am-offcanvas-bar admin-offcanvas-bar">
				    	<!-- User -->
						<div class="user-box am-hide-sm-only">
	                        <div class="user-img">
	                            <img src="/img/user-header.png" alt="user-img" title="Mat Helme" class="img-circle img-thumbnail img-responsive">
	                            <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
	                        </div>
	                        <h5>${username}</h5>
	                    </div>
	                    <!-- End User -->
	            
						<ul class="am-list admin-sidebar-list">
						    <li><a class="am-cf am-active" href="/user/toIndex"><span class="am-icon-home"></span> 首页</a></li>
						    <li class="admin-parent">
						      <a class="am-cf" href="/user/toSendAddress"><span class="am-icon-truck"></span> 寄快递 </a>
						    </li>
						    <li class="admin-parent">
						      <a class="am-cf" href="#"><span class="am-icon-file"></span> 地址簿 </a>
						    </li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-table"></span> 查快递 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
						        <li><a href="my_send.jsp" class="am-cf"> 我寄的</a></li>
						        <li><a href="my_get.jsp">我收的</a></li>
						      </ul>
						    </li>
							<li class="admin-parent">
								<a class="am-cf" href="/logout"><span class="am-icon-sign-out"></span> 退出 </a>
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
				<div class="am-g">
					<!-- Row start -->
						<div class="am-u-md-3">
							<div class="card-box">
								<h4 class="header-title m-t-0 m-b-30">寄出数量</h4>
								<div class="widget-box-2">
                                    <div class="widget-detail-2">
                                        <h2 class="m-b-0"> 8451 </h2>
                                    </div>
                                    <div class="am-progress am-progress-xs am-margin-bottom-0">
									    <div class="am-progress-bar" style="width: 100%"></div>
									</div>
                                </div>
							</div>
						</div>
						<!-- col end -->
						<div class="am-u-md-3 am-u-end">
							<div class="card-box">
								<h4 class="header-title m-t-0 m-b-30">收件数量</h4>
								<div class="widget-box-2">
                                    <div class="widget-detail-2">
                                        <h2 class="m-b-0"> 8451 </h2>
                                    </div>
                                    <div class="am-progress am-progress-xs am-margin-bottom-0" style="background: rgba(255, 138, 204, 0.2);">
									    <div class="am-progress-bar progress-bar-pink" style="width: 100%"></div>
									</div>
                                </div>
							</div>
						</div>
						<!-- col end -->
					<!-- Row end -->
				</div>

				<!-- Row start -->
				<div class="am-g">
					<!-- col start -->
					<div class="am-u-md-6">
						<div class="card-box">
							<h4 class="header-title m-t-0 m-b-30">最新物流信息</h4>
							<div class="inbox-widget nicescroll" style="overflow: hidden; outline: none;" tabindex="5000">
								<a href="#">
									<div class="inbox-item">
										<div class="inbox-item-img"><img src="assets/before/img/avatar-1.jpg" class="img-circle" alt=""></div>
										<p class="inbox-item-author">Chadengle</p>
										<p class="inbox-item-text">Hey! there I'm available...</p>
										<p class="inbox-item-date"><span class="label label-pink">未开展</span></p>
									</div>
								</a>
								<a href="#">
									<div class="inbox-item">
										<div class="inbox-item-img"><img src="assets/before/img/avatar-2.jpg" class="img-circle" alt=""></div>
										<p class="inbox-item-author">Shahedk</p>
										<p class="inbox-item-text">Hey! there I'm available...</p>
										<p class="inbox-item-date"><span class="label label-success">已发布</span></p>
									</div>
								</a>
								<a href="#">
									<div class="inbox-item">
										<div class="inbox-item-img"><img src="assets/before/img/avatar-2.jpg" class="img-circle" alt=""></div>
										<p class="inbox-item-author">Shahedk</p>
										<p class="inbox-item-text">Hey! there I'm available...</p>
										<p class="inbox-item-date"><span class="label label-purple">进行中</span></p>
									</div>
								</a>
								<a href="#">
									<div class="inbox-item">
										<div class="inbox-item-img"><img src="assets/before/img/avatar-2.jpg" class="img-circle" alt=""></div>
										<p class="inbox-item-author">Shahedk</p>
										<p class="inbox-item-text">Hey! there I'm available...</p>
										<p class="inbox-item-date"><span class="label label-primary">即将开始</span></p>
									</div>
								</a>
							</div>
						</div>
					</div>
					<!-- col end -->
				</div>
				<!-- Row end -->
			</div>
		</div>
		<!-- end right Content here -->
		<!--</div>-->
		</div>
		</div>
		
		<!-- navbar -->
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
		
		<script type="text/javascript" src="/assets/before/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="/assets/before/js/amazeui.min.js"></script>
		<script type="text/javascript" src="/assets/before/js/app.js" ></script>
		<script type="text/javascript" src="/assets/before/js/blockUI.js" ></script>
		<script type="text/javascript" src="/assets/before/js/charts/echarts.min.js" ></script>
		<script type="text/javascript" src="/assets/before/js/charts/indexChart.js" ></script>

	</body>
	
</html>
