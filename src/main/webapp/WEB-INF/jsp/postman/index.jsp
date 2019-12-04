<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>邮差快递--邮差平台</title>
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
                <a href="index.jsp" class="logo"><span>POSTMAN</span></a>
            </div>
	
			<div class="contain">
				<ul class="am-nav am-navbar-nav am-navbar-left">

					<li><h4 class="page-title">首页</h4></li>
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
	                            <img src="/img/postman-header.png" alt="user-img" title="Mat Helme" class="img-circle img-thumbnail img-responsive">
	                            <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
	                        </div>
							<h5>${username}</h5>
	                    </div>
	                    <!-- End User -->
	            
						<ul class="am-list admin-sidebar-list">
						    <li><a class="am-cf am-active" href="index.jsp"><span class="am-icon-home"></span> 首页</a></li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-table"></span> 收派件记录 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
						        <li><a href="post_receipt.jsp" class="am-cf"> 我的收件 </a></li>
						        <li><a href="post_delivery.jsp">我的派件</a></li>
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
								<h4 class="header-title m-t-0 m-b-30">本月基本工资</h4>
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
						<div class="am-u-md-3">
							<div class="card-box">
								<h4 class="header-title m-t-0 m-b-30">本月工作量（收派件计件数）</h4>
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
						<div class="am-u-md-3 am-u-end">
							<div class="card-box">
								<h4 class="header-title m-t-0 m-b-30">工作打卡</h4>
								<c:if test="${postmanState == 0}"><a href="/postman/workOut?no=${UserInfo.postmanId}" class="am-btn am-btn-warning">打卡下班</a></c:if>
								<c:if test="${postmanState == 1}"><a href="/postman/workUp?no=${UserInfo.postmanId}" class="am-btn am-btn-primary">打卡上班</a></c:if>
							</div>
						</div>
						<!-- col end -->
					<!-- Row end -->
				</div>
				
				<!-- Row start -->
				<div class="am-g">
						<!-- col start -->
						<div class="am-u-md-12">
							<div class="card-box">
								<h4 class="header-title m-t-0 m-b-30">收件中</h4>
								<div class="am-scrollable-horizontal am-text-ms" style="font-family: '微软雅黑';">
                                        <table class="am-table   am-text-nowrap">
                                            <thead>
                                            <tr>
                                                <th>运单号</th>
                                                <th>寄件人</th>
                                                <th>区域</th>
                                                <th>联系电话</th>
                                                <th>状态</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
											<c:forEach items="${GaddressList}" var="list">
                                                <tr>
                                                    <td>${list['no']}</td>
                                                    <td>${list['realName']}</td>
                                                    <td>${list['area']}-${list['town']}</td>
                                                    <td>${list['tel']}</td>
                                                    <td><span class="label label-danger">待取件</span></td>
                                                    <td>
														<button type="button" onclick="receiptFinish(${list['no']})" class="am-btn am-btn-primary am-btn-xs">确认取件</button>
														<button type="button" onclick="receiptFault(${list['no']})" class="am-btn am-btn-danger am-btn-xs">无法取件</button>
													</td>
                                                </tr>
											</c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
							</div>
						</div>
						<!-- col end -->
					</div>
					<!-- Row end -->

					<!-- Row start -->
					<div class="am-g">
						<!-- col start -->
						<div class="am-u-md-12">
							<div class="card-box">
								<h4 class="header-title m-t-0 m-b-30">派件中</h4>
								<div class="am-scrollable-horizontal am-text-ms" style="font-family: '微软雅黑';">
                                        <table class="am-table   am-text-nowrap">
                                            <thead>
                                            <tr>
                                                <th>运单号</th>
												<th>收件人</th>
												<th>区域</th>
                                                <th>联系电话</th>
                                                <th>状态</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
											<c:forEach items="${SaddressList}" var="list">
												<tr>
													<td>${list['no']}</td>
													<td>${list['realName']}</td>
													<td>${list['area']}-${list['town']}</td>
													<td>${list['tel']}</td>
													<td><span class="label label-danger">派件中</span></td>
													<td>
														<button type="button" onclick="pieFinish(${list['no']})" class="am-btn am-btn-primary am-btn-xs">完成派件</button>
														<button type="button" onclick="pieFault(${list['no']})" class="am-btn am-btn-danger am-btn-xs">无法派件</button>
													</td>
												</tr>
											</c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
							</div>
						</div>
						<!-- col end -->
					</div>
					<!-- Row end -->
			</div>
		</div>
		<!-- end right Content here -->
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

		<script>
			function receiptFinish(no) {
				window.location.href = "/postman/receiptFinish?no=" + no;
			}
			function pieFinish(no) {
				window.location.href = "/postman/pieFinish?no=" + no;
			}
			function receiptFault(no) {
				window.location.href = "/postman/receiptFault?no=" + no;
			}
			function pieFault(no) {
				window.location.href = "/postman/pieFault?no=" + no;
			}
		</script>

	</body>
	
</html>
