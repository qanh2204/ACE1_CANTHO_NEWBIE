<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="page-contain">
    <!-- Main content -->
    <div id="main-content" class="main-content">
        <!--Block 01: Main slide-->
        <div class="main-slide block-slider">
            <ul class="biolife-carousel nav-none-on-mobile"
                data-slick='{"arrows": true, "dots": false, "slidesMargin": 0, "slidesToShow": 1, "infinite": true, "speed": 800}'>
                <li>
                    <div class="slide-contain slider-opt03__layout01">
                        <div class="media">
                            <div class="child-elememt">
                                <a href="#" class="link-to"> <img
                                        src="assets/images/home-03/banner-05.jpg" width="604"
                                        height="580" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="text-content">
                            <i class="first-line">1987 Second Hand </i>
                            <h3 class="second-line">100% Genuine</h3>
                            <p class="third-line">Cheap, beautiful, quality guaranteed</p>
                            <p class="buttons">
                                <a href="${path}/shop?filter=all&orderby=default&key=-1&page=1"
                                   class="btn btn-bold">Buy now</a>
                            </p>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="slide-contain slider-opt03__layout01">
                        <div class="media">
                            <div class="child-elememt">
                                <a href="#" class="link-to"><img
                                        src="assets/images/home-03/baner-right-image-02.jpg"
                                        width="604" height="580" alt=""></a>
                            </div>
                        </div>
                        <div class="text-content">
                            <i class="first-line">1987 Second Hand </i>
                            <h3 class="second-line">100% Genuine</h3>
                            <p class="third-line">Cheap, beautiful, quality guaranteed</p>
                            <p class="buttons">
                                <a href="${path}/shop?filter=all&orderby=default&key=-1&page=1"
                                   class="btn btn-bold">Buy now</a>
                            </p>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <!--Block 02: Banner-->
        <div class="special-slide">
            <div class="container">
                <ul class="biolife-carousel dots_ring_style"
                    data-slick='{"arrows": false, "dots": true, "slidesMargin": 30, "slidesToShow": 1, "infinite": true, "speed": 800, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 1}},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":20, "dots": false}},{"breakpoint":480, "settings":{ "slidesToShow": 1}}]}'>
                    <li>
                        <div class="slide-contain biolife-banner__special">
                            <div class="banner-contain">
                                <div class="media">
                                    <a href="#" class="bn-link">
                                        <figure>
                                            <img src="assets/images/home-03/banner_1.jpg" width="616"
                                                 height="483" alt="">
                                        </figure>
                                    </a>
                                </div>
                                <div class="text-content">
                                    <b class="first-line">100% Genuine</b> <span
                                        class="second-line"></span> <span class="third-line"><i>Cheap,
                                            beautiful, quality guaranteed</i></span>
                                    <div class="product-detail">
                                        <div class="buttons">
                                            <a
                                                href="${path}/shop?filter=all&orderby=default&key=-1&page=1"
                                                class="btn add-to-cart-btn">Buy Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slide-contain biolife-banner__special">
                            <div class="banner-contain">
                                <div class="media">
                                    <a href="#" class="bn-link">
                                        <figure>
                                            <img src="assets/images/home-03/banner_1.jpg" width="616"
                                                 height="483" alt="">
                                        </figure>
                                    </a>
                                </div>
                                <div class="text-content">
                                    <b class="first-line">100% Genuine</b> <span
                                        class="second-line"></span> <span class="third-line"><i>Cheap,
                                            beautiful, quality guaranteed</i></span>
                                    <div class="product-detail">
                                        <div class="buttons">
                                            <a
                                                href="${path}/shop?filter=all&orderby=default&key=-1&page=1"
                                                class="btn add-to-cart-btn">Buy Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slide-contain biolife-banner__special">
                            <div class="banner-contain">
                                <div class="media">
                                    <a href="#" class="bn-link">
                                        <figure>
                                            <img src="assets/images/home-03/banner_1.jpg" width="616"
                                                 height="483" alt="">
                                        </figure>
                                    </a>
                                </div>
                                <div class="text-content">
                                    <b class="first-line">100% Genuine</b> <span
                                        class="second-line"></span> <span class="third-line"><i>Cheap,
                                            beautiful, quality guaranteed</i></span>
                                    <div class="product-detail">
                                        <div class="buttons">
                                            <a
                                                href="${path}/shop?filter=all&orderby=default&key=-1&page=1"
                                                class="btn add-to-cart-btn">Buy Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slide-contain biolife-banner__special">
                            <div class="banner-contain">
                                <div class="media">
                                    <a href="#" class="bn-link">
                                        <figure>
                                            <img src="assets/images/home-03/banner_1.jpg" width="616"
                                                 height="483" alt="">
                                        </figure>
                                    </a>
                                </div>
                                <div class="text-content">
                                    <b class="first-line">100% Genuine</b> <span
                                        class="second-line"></span> <span class="third-line"><i>Cheap,
                                            beautiful, quality guaranteed</i></span>
                                    <div class="product-detail">
                                        <div class="buttons">
                                            <a
                                                href="${path}/shop?filter=all&orderby=default&key=-1&page=1"
                                                class="btn add-to-cart-btn">Buy Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <div
                    class="biolife-service type01 biolife-service__type01 sm-margin-top-0 xs-margin-top-45px">
                    <b class="txt-show-01">100% Genuine</b> <i class="txt-show-02">Biolife
                        Shop</i>
                    <ul class="services-list">
                        <li>
                            <div class="service-inner">
                                <span class="number">1</span> <span
                                    class="biolife-icon icon-beer"></span> <a class="srv-name"
                                    href="#">Quality Products Guaranteedn</a>
                            </div>
                        </li>
                        <li>
                            <div class="service-inner">
                                <span class="number">2</span> <span
                                    class="biolife-icon icon-schedule"></span> <a class="srv-name"
                                    href="#">Delivery On Time And Right Place</a>
                            </div>
                        </li>
                        <li>
                            <div class="service-inner">
                                <span class="number">3</span> <span
                                    class="biolife-icon icon-car"></span> <a class="srv-name"
                                    href="#">Free Shipping In The Inner City</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!--Block 03: Product Tab-->
        <div
            class="product-tab z-index-20 sm-margin-top-193px xs-margin-top-30px">
            <div class="container">
                <div class="biolife-title-box">
                    <span class="subtitle">All the best products for you</span>
                    <h3 class="main-title">Related Products</h3>
                </div>
                <div class="biolife-tab biolife-tab-contain sm-margin-top-34px">
                    <div class="tab-head tab-head__icon-top-layout icon-top-layout">
                        <ul class="tabs md-margin-bottom-35-im xs-margin-bottom-40-im">
                            <li class="tab-element active"><a href="#tab01_1st"
                                                              class="tab-link">Newest</a></li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div id="tab01_1st" class="tab-contain active">
                            <ul
                                class="products-list biolife-carousel nav-center-02 nav-none-on-mobile eq-height-contain"
                                data-slick='{"rows":2 ,"arrows":true,"dots":false,"infinite":true,"speed":400,"slidesMargin":10,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":25 }},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":15}}]}'>
                                <c:forEach var="item" items="${newProducts}">
                                    <li class="product-item">
                                        <div class="contain-product layout-default">
                                            <div class="product-thumb">
                                                <a href="${path}/product-detail?id=${item.id}"
                                                   class="link-to-product"> <img
                                                        src="../images/${item.tblImageProducts[0].source}"
                                                        width="270" height="270" class="product-thumnail">
                                                </a>
                                            </div>
                                            <div class="info">
                                                <b class="categories">${item.tblCategory.name}</b>
                                                <h4 class="product-title">
                                                    <a href="${path}/product-detail?id=${item.id}"
                                                       class="pr-name">${item.name }</a>
                                                </h4>
                                                <div class="price ">
                                                    <ins>
                                                        <span class="price-amount"><fmt:formatNumber
                                                                type="number" groupingUsed="true" value="${item.price}" />
                                                            <u>$</u> </span>
                                                    </ins>
                                                </div>
                                                <div class="slide-down-box">
                                                    <p class="message">All products are carefully selected to ensure quality.</p>
                                                    <div class="buttons text-center">
                                                        <!-- <a href="#" class="btn wishlist-btn"><i
                                                        class="fa fa-heart" aria-hidden="true"></i></a> -->
                                                        <button type="button" class="btn add-to-cart-btn"
                                                                onClick="clickAddToCart(${item.id});">
                                                            <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Add to cart
                                                        </button>
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
                    </div>
                </div>
            </div>

            <!--Block 04: Banner Promotion 01 -->
            <div class="banner-promotion-01 xs-margin-top-50px sm-margin-top-11px">
                <div class="biolife-banner promotion biolife-banner__promotion">
                    <div class="banner-contain">
                        <div class="media background-biolife-banner__promotion">
                            <div class="img-moving position-1">
                                <img src="assets/images/home-03/slide-02.jpg" width="149"
                                     height="139" alt="img msv">
                            </div>
                            <div class="img-moving position-2">
                                <img src="assets/images/home-03/slide-03.jpg" width="185"
                                     height="265" alt="img msv">
                            </div>
                            <div class="img-moving position-3">
                                <img src="assets/images/home-03/slide-04.jpg"
                                     width="384" height="151" alt="img msv">
                            </div>
                            <div class="img-moving position-4">
                                <img src="assets/images/home-03/slide-05.jpg" width="198"
                                     height="269" alt="img msv">
                            </div>
                        </div>
                        <div class="text-content">
                            <div class="container text-wrap">
                                <i class="first-line">Beautiful</i> <span
                                    class="second-line">Cheap</span>
                                <p class="third-line">Good Quality</p>
                                <div class="product-detail">
                                    <a href="${path}/shop?filter=all&orderby=default&key=-1&page=1"
                                       class="btn add-to-cart-btn">Buy Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Block 05: Banner Promotion 02-->
            <div class="banner-promotion-02 z-index-20">
                <div class="biolife-banner promotion2 biolife-banner__promotion2">
                    <div class="banner-contain">
                        <div class="container">
                            <div class="media"></div>
                            <div class="text-content">
                                <p class="second-line">
                                    <i>Beautiful </i>
                                </p>
                                <p class="second-line">
                                    <i>Cheap</i>
                                </p>
                                <p class="third-line">Good Quality</p>
                                <p class="buttons">
                                    <a href="${path}/shop?filter=all&orderby=default&key=-1&page=1"
                                       class="btn btn-bold">Buy Now</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

