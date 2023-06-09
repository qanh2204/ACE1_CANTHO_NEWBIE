<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--Hero Section-->
<div class="hero-section hero-background">
	<h1 class="page-title">Sign in</h1>
</div>

<!--Navigation section-->
<div class="container">
	<nav class="biolife-nav">
		<span class="current-page">${url}</span>
	</nav>
</div>
<div class="page-contain">

	<!-- Main content -->
	<div id="main-content" class="main-content">
		<div class="container">

			<div class="row">
				<!--Form Sign In-->
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="signin-container">
						<form:form action="login-save" name="frm-login" id="frmLogin"
							method="post" modelAttribute="userLogin">
							<p class="form-row">
								<label for="fid-name">Account<span
									class="requite text-danger"> (*) ${messUsername }</span></label>
								<form:input path="username" type="text" id="txtUsername"
									name="name" class="txt-input" />
							</p>
							<p class="form-row">
								<label for="fid-pass">Password<span
									class="requite text-danger"> (*) ${messPass }</span></label>
								<form:input path="password" type="password" id="txtPassword"
									name="email" class="txt-input" />
							</p>
							<p class="form-row wrap-btn">
								<form:button class="btn btn-submit btn-bold" id="btnSubmit" type="button">Sign in</form:button>
								<!--<a href="#" class="link-to-help">Forgot your password</a>  -->
							</p>
						</form:form>
					</div>
				</div>

				<!--Go to Register form-->
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="register-in-container">
						<div class="intro">
							<h4 class="box-title">New member ?</h4>
							<p class="sub-title">Create an account with us and you will
								be able to :</p>
							<ul class="lis">
								<li>Check faster</li>
								<li>Access your order history</li>
								<li>Order from us</li>
								<li>Comments and product reviews</li>
								<li>Manage your orders</li>
							</ul>
							<a href="${path }/register" class="btn btn-bold">Sign up</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="js-form/login.js"></script>