<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--Hero Section-->
<div class="hero-section hero-background">
	<h1 class="page-title">Thrift Fashion Shop</h1>
</div>

<!--Navigation section-->
<div class="container">
	<nav class="biolife-nav">
		<span class="current-page">${url}</span>
	</nav>
</div>

<div class="page-contain category-page no-sidebar">
	<div class="container">
		<div class="row">

			<!-- Main content -->
			<div id="main-content"
				class="main-content col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="product-category grid-style">

					<div id="top-functions-area" class="top-functions-area">
						<div class="flt-item to-left group-on-mobile">
							<span class="flt-title">Filter</span> <a href="#"
								class="icon-for-mobile"> <span></span> <span></span> <span></span>
							</a>
							<div class="wrap-selectors">
								<span class="title-for-mobile">Filter Products</span>
								<div data-title="Price:" class="selector-item">
									<form:form id="frmPrice" action="${path}/shop-price-gid-6"
										method="GET">
										<select class="selector" onChange="price(this);" name="code">
											<option value="-1">Price</option>
											<option value="1">Under 50,000</option>
											<option value="2">50,000-100,000</option>
											<option value="3">100,000-250,000</option>
											<option value="4">250,000-500,000</option>
											<option value="5">500,000-1,000,000</option>
											<option value="6">1,000,000-2,000,000</option>
											<option value="7">Above 2,000,000</option>
										</select>
									</form:form>
								</div>

								<div data-title="Brand:" class="selector-item">
									<form:form id="frmCategory" action="${path}/shop-category-gid-6"
										method="GET">
										<select class="selector" onChange="category(this);" name="id">
											<option value="-1">Category</option>
											<c:forEach items="${categories}" var="item">
												<option value="${item.id}">${item.name}</option>
											</c:forEach>
										</select>
									</form:form>
								</div>

								<div data-title="Avalability:" class="selector-item">
									<form:form id="frmManufacturer"
										action="${path}/shop-manufacturer-gid-6" method="GET">
										<select name="id" class="selector"
											onChange="manufacturer(this);">
											<option value="-1">Manufacturers</option>
											<c:forEach items="${manufacturers}" var="item">
												<option value="${item.id}">${item.name}</option>
											</c:forEach>
										</select>
									</form:form>
								</div>
								<!-- <p class="btn-for-mobile">
									<button type="submit" class="btn-submit">Go</button>
								</p> -->
							</div>
						</div>
						<div class="flt-item to-right">
							<span class="flt-title">Sort By</span>
							<div class="wrap-selectors">
								<div class="selector-item orderby-selector">
									<select name="orderby" class="orderby" aria-label="Shop order">
										<option value="menu_order" selected="selected">Default</option>
										<option value="popularity">Product's name</option>
										<option value="rating">Popularity</option>
										<option value="date">Time</option>
										<option value="price">Price: low-hi</option>
										<option value="price-desc">Price: hi-low</option>
									</select>
								</div>
								<div class="selector-item viewmode-selector">
									<a href="${path}/shop-gid-3" class="viewmode grid-mode"><i
										class="biolife-icon icon-grid"></i></a> <a
										href="${path}/shop-gid-6" class="viewmode detail-mode active"><i
										class="biolife-icon icon-list"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<ul class="products-list">
							<c:forEach var="item" items="${list}">
								<li class="product-item col-lg-2 col-md-3 col-sm-4 col-xs-6">
									<div class="contain-product layout-default">
										<div class="product-thumb">
											<a href="${path}/product-detail?id=${item.id}" class="link-to-product"> <img
												src="../images/${item.tblImageProducts[0].source}" alt="dd"
												width="270" height="270" class="product-thumnail">
											</a>
										</div>
										<div class="info">
											<b class="categories">${item.tblCategory.name}</b>
											<h4 class="product-title">
												<a href="${path}/product-detail?id=${item.id}" class="pr-name">${item.name }</a>
											</h4>
											<div class="price">
												<ins>
													<span class="price-amount"><fmt:formatNumber
															type="number" groupingUsed="true" value="${item.price}" />
														<span class="currencySymbol">$</span></span>
												</ins>
												<!-- <del>
													<span class="price-amount"><span
														class="currencySymbol">$</span>100.00</span>
												</del> -->
											</div>
											<div class="shipping-info">
												<p class="shipping-day">Receive Goods After 3 Days</p>
												<p class="for-today">Buy It Today</p>
											</div>
											<div class="slide-down-box">
												<p class="message">All products are carefully selected to ensure quality.</p>
												<div class="buttons text-center">
													<!-- <a href="#" class="btn wishlist-btn"><i
														class="fa fa-heart" aria-hidden="true"></i></a> -->
													<button type="button" class="btn add-to-cart-btn" onClick="clickAddToCart(${item.id});"><i
														class="fa fa-cart-arrow-down" aria-hidden="true"></i>Add to cart</button>
													<!-- <a href="#" class="btn compare-btn"><i
														class="fa fa-random" aria-hidden="true"></i></a> -->
												</div>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>

					<div class="biolife-panigations-block">
						<ul class="panigation-contain">
							<li><span class="current-page">1</span></li>
							<li><a href="#" class="link-page">2</a></li>
							<li><a href="#" class="link-page">3</a></li>
							<li><span class="sep">....</span></li>
							<li><a href="#" class="link-page">20</a></li>
							<li><a href="#" class="link-page next"><i
									class="fa fa-angle-right" aria-hidden="true"></i></a></li>
						</ul>
					</div>

				</div>

			</div>

		</div>
	</div>
</div>
<script src="js-form/shop.js"></script>