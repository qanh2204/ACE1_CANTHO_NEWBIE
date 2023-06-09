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
							Information <a href="${path}/user-update-info" class="btn btn-info"
								style="background-color: #e73918; border-color: #e73918">Update</a> <a href="${path}/user-change-password" class="btn btn-info"
								style="background-color: #e73918; border-color: #e73918">Change password</a> <a href="${path}/client-logout" class="btn btn-info">Log out</a>
						</h3>
						<div style="margin-left: 30px;">
							<p class="form-row">
								<label>Name: ${user.name }</label>
							</p>
							<p class="form-row">
								<label>Email: ${user.email}</label>
							</p>
							<p class="form-row">
								<label>Account: ${user.username}</label>
							</p>
							<p class="form-row">
								<label>Phone: ${user.phone}</label>
							</p>
							<p class="form-row">
								<label>Address: ${user.address}</label>
							</p>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<h3 class="box-title">Order List</h3>
						<form class="shopping-cart-form" action="#" method="post">
							<table class="shop_table cart-form">
								<thead>
									<tr>
										<th class="">#</th>
										<th class="">Time</th>
										<th class="product-name">Address</th>
										<th class="">Phone</th>
										<th class="">Form</th>
										<th class="">Total</th>
										<th class="">Status</th>
										<th></th>
									</tr>
								</thead>
								<tbody id="userDetailBodyTable">
									<c:forEach var="item" items="${orders}">
										<tr>
											<td>${item.id }</td>
											<td>${item.createTime}</td>
											<td>${item.address }</td>
											<td>${item.phone }</td>
											<td>${item.tblPayment.method}</td>
											<td><fmt:formatNumber type="number" groupingUsed="true"
													value="${item.total}" /><span class="currencySymbol">
													<u>đ</u></td>
											<td><c:if test="${item.status == 0}">
													<a
														href="${path}/user-change-status-order?orderId=${item.id}"
														class="btn btn-warning">Order</a>
												</c:if> <c:if test="${item.status == 3}">
													<span class="btn btn-danger">Cancelled</span>
												</c:if></td>
											<td><a
												href="${path}/user-order-detail?orderId=${item.id}"
												class="btn btn-default">Detail</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>