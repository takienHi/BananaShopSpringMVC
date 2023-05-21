<%-- 
    Document   : index
    Created on : Sep 11, 2022, 11:44:19 PM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="layout/linkcss.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="layout/header.jsp"></jsp:include>

            <!-- Body main wrapper start -->
            <main>

                <!-- Banner-area-start -->
                <section class="bd-banner__area pt-30 pb-40">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-4">
                                <div class="row">
                                    <div class="col-xl-12 col-lg-6">
                                        <div class="bd-singel__product-banner product-thumb-bg mb-30"
                                             data-background="${pageContext.request.contextPath}/resources/users/assets/img/product/banner/product-banner-07.jpg">
                                            <div class="bd-product__banner-inner">
                                                <div class="bd-product__banner-content banner-oil product__content-3">
                                                    <span>100% Organic</span>
                                                    <h3><a href="product-details.html">Sunflower Oil</a></h3>
                                                    <div class="product__banner-price">
                                                        <span>From</span>
                                                        <h4>$18.00</h4>
                                                    </div>
                                                    <a class="bd-bn__btn-3" href="product-details.html">Shop Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-lg-6">
                                        <div class="bd-singel__product-banner product-thumb-bg mb-30"
                                             data-background="${pageContext.request.contextPath}/resources/users/assets/img/product/banner/product-banner-08.jpg">
                                            <div class="bd-product__banner-inner">
                                                <div class="bd-product__banner-content banner-coffee product__content-3">
                                                    <span>Fresh & Pure</span>
                                                    <h3><a href="product-details.html">Black Coffee</a></h3>
                                                    <div class="product__banner-price">
                                                        <span>From</span>
                                                        <h4>$8.00</h4>
                                                    </div>
                                                    <a class="bd-bn__btn-3" href="product-details.html">Shop Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-8">
                                <div class="bd-banner-active-2 swiper-container">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            <div class="bd-singel__product-banner product-thumb-bg-2 mb-30"
                                                 data-background="${pageContext.request.contextPath}/resources/users/assets/img/product/banner/large/banner-1.jpg">
                                                <div class="bd-product__banner-inner  product__content-4">
                                                    <div class="bd-product__banner-content">
                                                        <h2 data-animation="fadeInLeft" data-delay="1.5s">Fresh and organic <br>
                                                            Grocery shop</h2>
                                                        <p data-animation="fadeInLeft" data-delay="1.5s">Breakfast, Oils, Sauces, Salad,
                                                            Pasta Rice. Bread <br> Condiment and many more</p>
                                                        <div data-animation="fadeInLeft" data-delay="1.7s" class="product__banner-price-2">
                                                            <span>Price</span>
                                                            <h3>$12.00</h3>
                                                        </div>
                                                        <a data-animation="fadeInUp" data-delay="1.9s" class="bd-bn__btn-4"
                                                           href="product-details.html">Shop Now</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="swiper-slide">
                                            <div class="bd-singel__product-banner product-thumb-bg-2 mb-30"
                                                 data-background="${pageContext.request.contextPath}/resources/users/assets/img/product/banner/large/banner-2.jpg">
                                                <div class="bd-product__banner-inner  product__content-4">
                                                    <div class="bd-product__banner-content">
                                                        <h2 data-animation="fadeInLeft" data-delay="1.5s">Fresh and organic <br>
                                                            Grocery shop</h2>
                                                        <p data-animation="fadeInLeft" data-delay="1.5s">Breakfast, Oils, Sauces, Salad,
                                                            Pasta Rice. Bread <br> Condiment and many more</p>
                                                        <div data-animation="fadeInLeft" data-delay="1.7s" class="product__banner-price-2">
                                                            <span>Price</span>
                                                            <h3>$20.00</h3>
                                                        </div>
                                                        <a data-animation="fadeInUp" data-delay="1.9s" class="bd-bn__btn-4"
                                                           href="product-details.html">Shop Now</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="swiper-slide">
                                            <div class="bd-singel__product-banner product-thumb-bg-2 mb-30"
                                                 data-background="${pageContext.request.contextPath}/resources/users/assets/img/product/banner/large/banner-3.jpg">
                                                <div class="bd-product__banner-inner  product__content-4">
                                                    <div class="bd-product__banner-content">
                                                        <h2 data-animation="fadeInLeft" data-delay="1.5s">Fresh and organic <br>
                                                            Grocery shop</h2>
                                                        <p data-animation="fadeInLeft" data-delay="1.5s">Breakfast, Oils, Sauces, Salad,
                                                            Pasta Rice. Bread <br> Condiment and many more</p>
                                                        <div data-animation="fadeInLeft" data-delay="1.7s" class="product__banner-price-2">
                                                            <span>Price</span>
                                                            <h3>$29.00</h3>
                                                        </div>
                                                        <a data-animation="fadeInUp" data-delay="1.9s" class="bd-bn__btn-4"
                                                           href="product-details.html">Shop Now</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- If we need pagination -->
                                        <div class="banner-pagination-2"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Banner-area-end -->



            </main>
            <!-- Body main wrapper ebd -->

        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>
</html>
