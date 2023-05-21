<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Preloader -->
<div id="preloader">
    <div class="preloader">
        <span></span>
        <span></span>
    </div>
</div>
<!-- Preloader end  -->

<!-- Offcanvas area start -->
<div class="offcanvas__area">
    <div class="modal fade" id="offcanvasmodal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="offcanvas__wrapper">
                    <div class="offcanvas__content">
                        <div class="offcanvas__top mb-40 d-flex justify-content-between align-items-center">
                            <div class="offcanvas__logo logo">
                                <a href="index.html">
                                    <img src="${pageContext.request.contextPath}/resources/users/assets/img/logo/logo-2.png" alt="logo">
                                </a>
                            </div>
                            <div class="offcanvas__close">
                                <button class="offcanvas__close-btn" data-bs-toggle="modal" data-bs-target="#offcanvasmodal">
                                    <i class="fal fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <div class="bd-utilize__buttons mb-25 d-xl-none">
                            <div class="bd-action__item">
                                <div class="bd-action__cart">
                                    <div class="bd-action__cart-icon">
                                        <a href="${pageContext.request.contextPath}/cart">
                                            <svg id="shopping-bag" xmlns="http://www.w3.org/2000/svg" width="16.508"
                                                 height="18.5" viewBox="0 0 16.508 18.5">
                                                <path id="Path_76" data-name="Path 76"
                                                      d="M24.21,35.5H34.3a3.214,3.214,0,0,0,3.21-3.21v-9.6a.571.571,0,0,0-.569-.569H33.523v-.854a4.269,4.269,0,0,0-8.538,0v.854H21.569a.571.571,0,0,0-.569.569v9.6A3.214,3.214,0,0,0,24.21,35.5Zm1.913-14.231a3.131,3.131,0,0,1,6.262,0v.854H26.123Zm-3.985,1.992h2.846v1.423a.569.569,0,0,0,1.138,0V23.262h6.262v1.423a.569.569,0,0,0,1.138,0V23.262h2.846V32.29A2.076,2.076,0,0,1,34.3,34.362H24.21a2.076,2.076,0,0,1-2.072-2.072Z"
                                                      transform="translate(-21 -17)" fill="#1c1d1b"></path>
                                            </svg>
                                        </a>
                                        <span class="bd-action__item-number cart-count2">${soluongsanphamgiohang}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="bd-action__item d-flex align-items-center">
                                <div class="bd-action__cart">
                                    <div class="bd-action__cart-icon">
                                        <a href="${pageContext.request.contextPath}/customer/customer-detail">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="13.539" height="16"
                                                 viewBox="0 0 13.539 16">
                                                <path id="Path_32fgf" data-name="Path 32"
                                                      d="M48.566,7.419a4.1,4.1,0,1,0-4.824,0,6.78,6.78,0,0,0-4.357,6.325A2.259,2.259,0,0,0,41.641,16h9.026a2.259,2.259,0,0,0,2.256-2.256A6.78,6.78,0,0,0,48.566,7.419ZM43.282,4.1a2.872,2.872,0,1,1,2.872,2.872A2.875,2.875,0,0,1,43.282,4.1Zm7.385,10.667H41.641a1.027,1.027,0,0,1-1.026-1.026,5.538,5.538,0,1,1,11.077,0A1.027,1.027,0,0,1,50.667,14.769Z"
                                                      transform="translate(-39.385)" fill="#171717"></path>
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                                <div class="bd-action__user">
                                    <c:choose>
                                            <c:when test="${!empty sessionScope.usercustomer}">
                                                <a href="${pageContext.request.contextPath}/customer/customer-detail">
                                                    <span>${sessionScope.fullnamecustomer}</span>
                                                    <span>
                                                        <span>${sessionScope.usercustomer}</span>
                                                    </span>
                                                </a>
                                            </c:when>    
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/login">
                                                    <span>Tài khoản</span>
                                                    <span>
                                                        <span>Đăng nhập</span>
                                                    </span>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                </div>
                            </div>
                        </div>
                        <div class="offcanvas__search mb-25">
                            <form action="#">
                                <input type="text" placeholder="What are you searching for?">
                                    <button type="submit"><i class="far fa-search"></i></button>
                            </form>
                        </div>
                        <div class="mobile-menu fix mb-40"></div>

                        <div class="offcanvas__color">
                            <h5>Choose your favorite color : </h5>
                            <input type="color" id="theme-color" value="#ff5e14">
                                <label for="theme-color"></label>
                        </div>
                        <div class="offcanvas__map d-none d-lg-block mb-15">
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d29176.030811137334!2d90.3883827!3d23.924917699999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sbd!4v1605272373598!5m2!1sen!2sbd"></iframe>
                        </div>
                        <div class="offcanvas__contact mt-30 mb-20">
                            <h4>Contact Info</h4>
                            <ul>
                                <li class="d-flex align-items-center">
                                    <div class="offcanvas__contact-icon mr-15">
                                        <i class="fal fa-map-marker-alt"></i>
                                    </div>
                                    <div class="offcanvas__contact-text">
                                        <a target="_blank"
                                           href="https://www.google.com/maps/place/Dhaka/@23.7806207,90.3492859,12z/data=!3m1!4b1!4m5!3m4!1s0x3755b8b087026b81:0x8fa563bbdd5904c2!8m2!3d23.8104753!4d90.4119873">12/A,
                                            Mirnada City Tower, NYC</a>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center">
                                    <div class="offcanvas__contact-icon mr-15">
                                        <i class="far fa-phone"></i>
                                    </div>
                                    <div class="offcanvas__contact-text">
                                        <a href="tel:+088889797697">+088889797697</a>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center">
                                    <div class="offcanvas__contact-icon mr-15">
                                        <i class="fal fa-envelope"></i>
                                    </div>
                                    <div class="offcanvas__contact-text">
                                        <a href="tel:+012-345-6789"><span
                                                class="mailto:support@mail.com"><span class="__cf_email__" data-cfemail="e695939696899492a68b878f8ac885898b">[email&#160;protected]</span></span></a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="offcanvas__social">
                            <ul>
                                <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                                <li><a href="#"><i class="fab fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- offcanvas area end -->

<!-- Added to cart message  -->
<div class="added-to-cart">
    <div class="added-to-cart-content d-flex align-items-center">
        <i class="fa-light fa-check"></i>
        <p>Successfully Added to cart</p>
    </div>
</div>

<!-- Added to wishlist message -->
<div class="added-to-wishlist">
    <div class="added-to-cart-content d-flex align-items-center">
        <i class="fa-light fa-check"></i>
        <p>Successfully Added to wishlist</p>
    </div>
</div>



<!-- Cartmini area start  -->
<div class="offcanvas offcanvas-end" id="cartmini">
    <div class="cartmini__wrapper">
        <div class="cartmini__title">
            <h4>Shopping Cart</h4>
        </div>
        <div class="cartmini__close">
            <button type="button" class="cartmini__close-btn" data-bs-dismiss="offcanvas" aria-label="Close"><i
                    class="fal fa-times"></i></button>
        </div>
        <div class="cartmini__widget">
            <div class="cartmini__inner">
                <ul>
                    <li>
                        <div class="cartmini__thumb">
                            <a href="product-details.html">
                                <img src="${pageContext.request.contextPath}/resources/users/assets/img/trending/populer-item/populer-thumb-01.png" alt="product image">
                            </a>
                        </div>
                        <div class="cartmini__content">
                            <h5><a href="product-details.html">Organic Apple</a></h5>
                            <div class="product-quantity mt-10 mb-10">
                                <span class="cart-minus">-</span>
                                <input class="cart-input" type="text" value="1">
                                    <span class="cart-plus">+</span>
                            </div>
                            <div class="product__sm-price-wrapper">
                                <span class="product__sm-price">$46.00</span>
                            </div>
                        </div>
                        <a href="#" class="cartmini__del"><i class="fal fa-times"></i></a>
                    </li>
                    <li>
                        <div class="cartmini__thumb">
                            <a href="product-details.html">
                                <img src="${pageContext.request.contextPath}/resources/users/assets/img/trending/populer-item/populer-thumb-02.png" alt="product image">
                            </a>
                        </div>
                        <div class="cartmini__content">
                            <h5><a href="product-details.html"> Organic bannna</a></h5>
                            <div class="product-quantity mt-10 mb-10">
                                <span class="cart-minus">-</span>
                                <input class="cart-input" type="text" value="1">
                                    <span class="cart-plus">+</span>
                            </div>
                            <div class="product__sm-price-wrapper">
                                <span class="product__sm-price">$32.00</span>
                            </div>
                        </div>
                        <a href="#" class="cartmini__del"><i class="fal fa-times"></i></a>
                    </li>
                    <li>
                        <div class="cartmini__thumb">
                            <a href="product-details.html">
                                <img src="${pageContext.request.contextPath}/resources/users/assets/img/trending/populer-item/populer-thumb-05.png" alt="product image">
                            </a>
                        </div>
                        <div class="cartmini__content">
                            <h5><a href="product-details.html"> Orange Juice</a></h5>
                            <div class="product-quantity mt-10 mb-10">
                                <span class="cart-minus">-</span>
                                <input class="cart-input" type="text" value="1">
                                    <span class="cart-plus">+</span>
                            </div>
                            <div class="product__sm-price-wrapper">
                                <span class="product__sm-price">$62.00</span>
                            </div>
                        </div>
                        <a href="product-details.html" class="cartmini__del"><i class="fal fa-times"></i></a>
                    </li>
                </ul>
            </div>
            <div class="cartmini__checkout">
                <div class="cartmini__checkout-title mb-30">
                    <h4>Subtotal:</h4>
                    <span>$113.00</span>
                </div>
                <div class="cartmini__checkout-btn">
                    <a href="cart.html" class="bd-fill__btn w-100"> <span></span> view cart</a>
                    <a href="checkout.html" class="bd-unfill__btn w-100"> <span></span> checkout</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Cartmini area end -->

<!-- Wishlist modal area start -->
<div class="offcanvas offcanvas-end" id="wishlist">
    <div class="cartmini__wrapper">
        <div class="cartmini__title">
            <h4>Wishlist</h4>
        </div>
        <div class="cartmini__close">
            <button type="button" class="cartmini__close-btn" data-bs-dismiss="offcanvas" aria-label="Close"><i
                    class="fal fa-times"></i></button>
        </div>
        <div class="cartmini__widget">
            <div class="cartmini__inner">
                <ul>
                    <li>
                        <div class="cartmini__thumb">
                            <a href="product-details.html">
                                <img src="${pageContext.request.contextPath}/resources/users/assets/img/trending/populer-item/populer-thumb-01.png" alt="product image">
                            </a>
                        </div>
                        <div class="cartmini__content">
                            <h5><a href="product-details.html">Organic Apple</a></h5>
                            <div class="product-quantity mt-10 mb-10">
                                <span class="cart-minus">-</span>
                                <input class="cart-input" type="text" value="1">
                                    <span class="cart-plus">+</span>
                            </div>
                            <div class="product__sm-price-wrapper">
                                <span class="product__sm-price">$46.00</span>
                            </div>
                        </div>
                        <a href="#" class="cartmini__del"><i class="fal fa-times"></i></a>
                    </li>
                    <li>
                        <div class="cartmini__thumb">
                            <a href="product-details.html">
                                <img src="${pageContext.request.contextPath}/resources/users/assets/img/trending/populer-item/populer-thumb-05.png" alt="product image">
                            </a>
                        </div>
                        <div class="cartmini__content">
                            <h5><a href="product-details.html"> Orange Juice</a></h5>
                            <div class="product-quantity mt-10 mb-10">
                                <span class="cart-minus">-</span>
                                <input class="cart-input" type="text" value="1">
                                    <span class="cart-plus">+</span>
                            </div>
                            <div class="product__sm-price-wrapper">
                                <span class="product__sm-price">$62.00</span>
                            </div>
                        </div>
                        <a href="product-details.html" class="cartmini__del"><i class="fal fa-times"></i></a>
                    </li>
                </ul>
            </div>
            <div class="cartmini__checkout">
                <div class="cartmini__checkout-title mb-30">
                    <h4>Subtotal:</h4>
                    <span>$108.00</span>
                </div>
                <div class="cartmini__checkout-btn">
                    <a href="cart.html" class="bd-fill__btn w-100"> <span></span> view cart</a>
                    <a href="checkout.html" class="bd-unfill__btn w-100"> <span></span> checkout</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Wishlist modal area end -->

<!-- Header-area-start -->
<header>

    <div class="bd-header__border">
        <div id="header-sticky" class="bd-header__middle-inner">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xxl-3 col-xl-3 col-lg-3 col-md-6 col-6">
                        <div class="bd-header__logo-3">
                            <a href="index.html">
                                <img src="${pageContext.request.contextPath}/resources/users/assets/img/logo/logo-2.png" alt="logo">
                            </a>
                        </div>
                    </div>
                    <div class="col-xxl-6 col-xl-6 col-lg-6 d-none d-lg-block">
                        <div class="bd-header__left">
                            <div class="main-menu d-none d-none d-lg-block">
                                <nav id="mobile-menu">
                                    <ul>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/shop">Shop</a>
                                        </li>
                                        <li class="has-dropdown">
                                            <a href="javascript:void(0)">Danh mục</a>
                                            <ul class="submenu">

                                                <c:forEach var="c" items="${categories}">
                                                    <li><a href="${pageContext.request.contextPath}/shop/category/${c.categoryId}">${c.categoryName}</a></li>
                                                    </c:forEach> 
                                            </ul>
                                        </li>
                                        <li class="has-dropdown">
                                            <a href="javascript:void(0)">Thương hiệu</a>
                                            <ul class="submenu">

                                                <c:forEach var="b" items="${brands}">
                                                    <li><a href="${pageContext.request.contextPath}/shop/brand/${b.brandId}">${b.brandName}</a></li>
                                                    </c:forEach> 
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="col-xxl-3 col-xl-3 col-lg-3 col-md-6 col-6">
                        <div class="bd-header__right d-flex align-items-center justify-content-end">
                            <div class="bd-action__cart-list">
                                <div class="bd-action__item">
                                    <div class="bd-action__cart">
                                        <div class="bd-action__cart-icon">
                                            <a href="${pageContext.request.contextPath}/cart">
                                                <svg id="shopping-bag11" xmlns="http://www.w3.org/2000/svg" width="16.508"
                                                     height="18.5" viewBox="0 0 16.508 18.5">
                                                    <path id="Path_7611" data-name="Path 76"
                                                          d="M24.21,35.5H34.3a3.214,3.214,0,0,0,3.21-3.21v-9.6a.571.571,0,0,0-.569-.569H33.523v-.854a4.269,4.269,0,0,0-8.538,0v.854H21.569a.571.571,0,0,0-.569.569v9.6A3.214,3.214,0,0,0,24.21,35.5Zm1.913-14.231a3.131,3.131,0,0,1,6.262,0v.854H26.123Zm-3.985,1.992h2.846v1.423a.569.569,0,0,0,1.138,0V23.262h6.262v1.423a.569.569,0,0,0,1.138,0V23.262h2.846V32.29A2.076,2.076,0,0,1,34.3,34.362H24.21a2.076,2.076,0,0,1-2.072-2.072Z"
                                                          transform="translate(-21 -17)" fill="#1c1d1b" />
                                                </svg>
                                            </a>
                                            <span class="bd-action__item-number cart-count2">${soluongsanphamgiohang}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="bd-action__item d-flex align-items-center">
                                    <div class="bd-action__cart">
                                        <div class="bd-action__cart-icon">
                                            <a href="${pageContext.request.contextPath}/customer/customer-detail">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="13.539" height="16"
                                                     viewBox="0 0 13.539 16">
                                                    <path id="Path_32" data-name="Path 32"
                                                          d="M48.566,7.419a4.1,4.1,0,1,0-4.824,0,6.78,6.78,0,0,0-4.357,6.325A2.259,2.259,0,0,0,41.641,16h9.026a2.259,2.259,0,0,0,2.256-2.256A6.78,6.78,0,0,0,48.566,7.419ZM43.282,4.1a2.872,2.872,0,1,1,2.872,2.872A2.875,2.875,0,0,1,43.282,4.1Zm7.385,10.667H41.641a1.027,1.027,0,0,1-1.026-1.026,5.538,5.538,0,1,1,11.077,0A1.027,1.027,0,0,1,50.667,14.769Z"
                                                          transform="translate(-39.385)" fill="#171717" />
                                                </svg>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="bd-action__user">
                                        <c:choose>
                                            <c:when test="${!empty sessionScope.usercustomer}">
                                                <a href="${pageContext.request.contextPath}/customer/customer-detail">
                                                    <span>${sessionScope.fullnamecustomer}</span>
                                                    <span>
                                                        <span>${sessionScope.usercustomer}</span>
                                                    </span>
                                                </a>
                                            </c:when>    
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/login">
                                                    <span>Tài khoản</span>
                                                    <span>
                                                        <span>Đăng nhập</span>
                                                    </span>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                </div>
                            </div>
                            <div class="header__hamburger d-flex ml-25">
                                <button type="button" data-bs-toggle="modal" data-bs-target="#offcanvasmodal"
                                        class="hamburger-btn">
                                    <span class="hamburger-icon">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bd-header__buttom d-none d-md-block">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xxl-8 col-xl-8 col-md-8 col-sm-6">
                        <div class="bd-header__butttom-left">
                            <div class="bd-header__category-nav p-relative">
                                <div class="bd-category__click">
                                    <div class="bd-bar__icon">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </div>
                                    <span>All Categories</span>
                                </div>
                                <div class="category__items">
                                    <div class="category-item">
                                        <nav>
                                            <ul>
                                                <c:forEach var="c" items="${categories}">
                                                    <li class="pl-20">

                                                        <a href="#">${c.categoryName}</a>

                                                    </li>
                                                </c:forEach> 
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                            <div class="bd-header__filterbar d-none d-md-block">
                                <form class="bd-filter__input" action="#">
                                    <input type="text" placeholder="Search products...">
                                        <button><i class="flaticon-magnifiying-glass"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class=" col-xxl-4 col-xl-4 col-md-4 col-sm-6">
                        <div class="bd-action__support d-flex justify-content-end">
                            <div class="bd-support__inner">
                                <div class="bd-support__icon">
                                    <img src="${pageContext.request.contextPath}/resources/users/assets/img/icon/support.png" alt="support-icon">
                                </div>
                                <div class="bd-support__text">
                                    <span>8:30 AM - 9:30 PM</span>
                                    <a href="tel:878-185-287">(+2) 695 023 52</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header-area-end -->