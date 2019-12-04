<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<title>邮差快递--用户平台--寄快递</title>
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
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
					<li><h4 class="page-title">寄快递</h4></li>
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
	                            <img src="/img/user-header.png" alt="user-img" title="Mat Helme" class="img-circle img-thumbnail img-responsive">
	                            <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
	                        </div>
							<h5>${username}</h5>
	                    </div>
	                    <!-- End User -->
	            
						<ul class="am-list admin-sidebar-list">
						    <li><a class="am-cf" href="/user/toIndex"><span class="am-icon-home"></span> 首页</a></li>
						    <li class="admin-parent">
						      <a class="am-cf am-active" href="/user/toSendAddress"><span class="am-icon-truck"></span> 寄快递 </a>
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
						<!-- col start -->
						<div class="am-u-sm-6">
							<div class="card-box">
								<h4 class="header-title m-t-0 m-b-30">收件人</h4>
								<form class="am-form am-text-sm" action="/address/createAddress" id="addressForm" >
									<div class="am-form-group">
										<div class="am-g">
									      	<label class="am-u-md-2 am-md-text-right am-padding-left-0">姓名</label>
									      	<input class="am-u-md-5 form-control col-end am-u-end" id="realName" name="realName" placeholder="输入姓名">
								      	</div>
								    </div>
								    
								    <div class="am-form-group">
										<div class="am-g">
									      	<label class="am-u-md-2 am-md-text-right am-padding-left-0">电话</label>
									      	<input class="am-u-md-5 form-control am-u-end" id="tel" name="tel" placeholder="输入电话">
								      	</div>
								    </div>

									<div class="am-form-group">
										<div class="am-g">
											<label class="am-u-md-2 am-md-text-right am-padding-left-0">城市/区域</label>
											<div class="am-u-md-3 am-padding-0">
												<select id="city" name="city">
													<option value="0">--选择市--</option>
													<option value="广州市">广州市</option>
												</select>
												<span class="am-form-caret"></span>
											</div>
											<div class="am-u-md-3 am-padding-0">
												<select id="areas" name="area">
													<option value="0">--选择区--</option>
													<option value="从化区">从化区</option>
												</select>
												<span class="am-form-caret"></span>
											</div>
											<div class="am-u-md-3 am-u-end am-padding-0">
												<select id="town" name="town">
													<option value="0">--选择镇--</option>
													<option value="太平镇">太平镇</option>
													<option value="良口镇">良口镇</option>
												</select>
												<span class="am-form-caret"></span>
											</div>
										</div>
									</div>
								    <div class="am-form-group">
								    	<div class="am-g">
									      	<label class="am-u-md-2 am-md-text-right am-padding-left-0">详细地址</label>
									      	<input class="am-u-md-10 form-control" id="resAddress" name="resAddress" placeholder="填写详细地址">
									    </div>
								    </div>
									<div class="am-form-group">
										<div class="am-g">
										    <div class="am-u-md-offset-9 am-u-md-3">
												<input type="hidden" name="Ptype" value="2"/>
										      	<button type="submit" class="am-btn am-btn-primary am-btn-block delivery-btn am-disabled" id="submit-btn">保存</button>
										    </div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- col end -->
					<!-- Row end -->
				</div>
			</div>
			<!-- row end -->	
		</div>
		</div>
		<!-- end right Content here -->
		</div>
		</div>

		<script type="text/javascript" src="/assets/before/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="/assets/before/js/amazeui.min.js"></script>
		<script type="text/javascript" src="/assets/before/js/app.js" ></script>
		<script type="text/javascript" src="/assets/before/js/blockUI.js" ></script>
	</body>
	
</html>
