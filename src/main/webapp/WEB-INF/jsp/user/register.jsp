<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>邮差快递--用户平台--用户注册</title>
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="/assets/admin/css/amazeui.min.css" />
    <link rel="stylesheet" href="/assets/admin/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="/assets/admin/css/app.css">
    <script src="/assets/admin/js/jquery.min.js"></script>

</head>

<body data-type="register">
    <script src="/assets/admin/js/theme.js"></script>
    <div class="am-g tpl-g">
        <div class="tpl-login">
            <div class="tpl-login-content">
                <div class="tpl-login-title">注册会员用户</div>
                <span class="tpl-login-content-info">
                  创建一个新的会员用户
                </span>
                <form action="/tool/register" method="get" class="am-form tpl-form-line-form">
                    <div class="am-form-group">
                        <input type="email" class="tpl-form-input" name="email" placeholder="邮箱">
                    </div>

                    <div class="am-form-group">
                        <input type="text" class="tpl-form-input" name="username" placeholder="用户名">
                    </div>

                    <div class="am-form-group">
                        <input type="password" class="tpl-form-input" name="upassword" placeholder="请输入密码">
                    </div>

                    <div class="am-form-group">
                        <button type="submit" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn">注册</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="/assets/admin/js/amazeui.min.js"></script>
    <script src="/assets/admin/js/app.js"></script>

</body>

</html>