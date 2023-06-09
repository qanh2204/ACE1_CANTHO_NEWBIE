<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--Hero Section-->
<div class="hero-section hero-background">
	<h1 class="page-title">User information</h1>
</div>

<!--Navigation section-->
<div class="container">
	<nav class="biolife-nav">
		<span class="current-page">${url }</span>
	</nav>
</div>

<div class="page-contain shopping-cart">

	<!-- Main content -->
	<div id="main-content" class="main-content">
		<div class="container">
			<!--Cart Table-->
			<div class="shopping-cart-container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<h3 class="box-title">
							Information <a href="${path}/user-update-info"
								class="btn btn-info"
								style="background-color: #e73918; border-color: #e73918">Update</a>
							<a href="${path}/user-change-password" class="btn btn-info"
								style="background-color: #e73918; border-color: #e73918">Change
								Password</a> <a href="${path}/client-logout" class="btn btn-info">Log
								out</a>
						</h3>
						<div style="margin-left: 30px;">
							<form action="${path}/save-change-password-client" method="post"
								id="frmChangePassword">
								<p class="form-row">
									<label>Old password</label> <input type="password"
										name="passOld" class="form-control" id="txtPassOld"
										placeholder="Enter old password" />

								</p>
								<p class="form-row">
									<span class="text-danger">${mess }</span>
								</p>
								<p class="form-row">
									<label>New password</label> <input type="password"
										name="passNew" class="form-control" id="txtPassNew"
										placeholder="Enter your new password" />
								</p>
								<p class="form-row">
									<label>Confirm new password</label> <input type="password"
										class="form-control" id="txtPassConfirm"
										placeholder="Enter a new password" />
								</p>
								<p class="form-row">
									<button class="btn btn-bold" type="button" id="btnSubmit"
										onClick="changePassword();">Confirm</button>
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="../js-form/change-pass.js"></script>