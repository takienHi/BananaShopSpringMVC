<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<fmt:setLocale value="vi-VN"  scope="session"/> 
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="layout/linkcss.jsp"></jsp:include>
            <style>
                .product-img{
                    width: 185px !important;
                    height: 200px  !important;
                }
                .bd-product__title a{
                    font-size: 18px;
                }
                .cart-btn{
                    cursor: pointer;
                }
            </style>
        </head>
        <body>
        <jsp:include page="layout/header.jsp"></jsp:include>

            <!-- Body main wrapper start -->
            <main>
                <!-- Breadcrumb-area-start -->
                <div class="breadcrumb-area pt-10 pb-10">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="breadcrumb__list">
                                    <span><a href="index.html">Home</a></span>
                                    <span><i class="fa-regular fa-angle-right"></i></span>
                                    <span>Shop</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb-area-end -->

                <!-- Shop-area-start -->
                <section class="bd-shop__area pt-110 pb-85">
                    <div class="container">
                        <div class="row">
                            <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-8">
                                <div class="bd-sidebar__widget-warpper mb-60">
                                    <div class="bd-product__filters">
                                        <div class="bd-filter__widget child-content-hidden">
                                            <h4 class="bd-filter__widget-title drop-btn">Danh mục</h4>
                                            <div class="bd-filter__content">
                                                <div class="bd-product__check">
                                                    <ul>

                                                    <c:forEach var="s" items="${categories}">
                                                        <li>
                                                            <input class="check-input" type="checkbox" id="s-01">
                                                            <label class="check-label" for="s-01">${s.categoryName}</label>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                        <div class="bd-filter__widget child-content-hidden">
                                            <h4 class="bd-filter__widget-title drop-btn">Thương hiệu</h4>
                                            <div class="bd-filter__content">
                                                <div class="bd-product__check">
                                                    <ul>

                                                    <c:forEach var="b" items="${brands}">
                                                        <li>
                                                            <input class="check-input" type="checkbox" id="s-01">
                                                            <label class="check-label" for="s-01">${b.brandName}</label>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="bd-filter__widget child-content-hidden">
                                        <div class="bd-filter__content">
                                            <a href="product-details.html">
                                                <div class="bd-flash___banner-item p-relative">
                                                    <div class="bd-flash__banner-thumb w-img">
                                                        <img src="${pageContext.request.contextPath}/resources/users/assets/img/trending/flash/flash-banner-03.jpg" alt="flash-banner">
                                                    </div>
                                                    <div class="bd-flash__banner-content">
                                                        <h4>Freshly</h4>
                                                        <h3>Maitta Potato</h3>
                                                        <h6>From<span class="price">$9.00</span></h6>
                                                    </div>
                                                    <div class="bd-flash__banner-shape">
                                                        <div class="text">
                                                            <span>Hot</span>Item
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                                    
                            </div>
                        </div>
                        <div class="col-xxl-9 col-xl-8 col-lg-8">
                            <div class="row">
                                <div class="col-xl-4">
                                    <div class="bd-top__filter-search p-relative mb-30">
                                        <form class="bd-top__filter-input" action="#">
                                            <input type="text" placeholder="Search keyword...">
                                            <button><i class="fa-regular fa-magnifying-glass"></i></button>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-xl-8">
                                    <div class="bd-filter__tab-inner mb-30">
                                        <div class="bd-top__filter">

                                        </div>
                                        <div class="bd-sort__type-filter">
                                            <select class="sorting-list" name="sorting-list" id="sorting-list">
                                                <option value="1">Default</option>
                                                <option value="1">Newly published</option>
                                                <option value="2">Most popular</option>
                                                <option value="4">Trending</option>
                                                <option value="4">Featured</option>
                                                <option value="4">Discounted</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="bd-shop__wrapper">
                                        <div class="tab-content" id="myTabContent">
                                            <div class="tab-pane fade show active" id="home" role="tabpanel"
                                                 aria-labelledby="home-tab">
                                                <div class="bd-trending__item-wrapper">
                                                    <div class="row list-wrapper">

                                                        <c:forEach var="p" items="${products}">
                                                            <div class="col-xxl-3 col-xl-4 col-lg-6 col-md-6 col-sm-6 list-item">
                                                                <div class="bd-trending__item text-center mb-30">
                                                                    <div class="bd-trending__product-thumb border-5">
                                                                        <a href="product-details.html">
                                                                            <img class="product-img" src="${pageContext.request.contextPath}/images/product/${p.image}" alt="product-img"/>
                                                                        </a>
                                                                        <div class="bd-product__tag">

                                                                        </div>
                                                                        <div class="bd-product__action">
                                                                            <span class="btn-giohang cart-btn" data-masp="${p.productId}" data-tensp="${p.productName}" data-giatien="${p.price}" data-anh="${p.image}">
                                                                                <i class="fal fa-cart-arrow-down"></i>
                                                                            </span>
                                                                            <a href="${pageContext.request.contextPath}/shop/detail-product/${p.productId}" class="btn-productmodal">
                                                                                <i class="fal fa-eye"></i>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="bd-trending__content">
                                                                        <h4 class="bd-product__title">
                                                                            <a href="product-details.html">${p.productName}</a></h4>
                                                                        <div class="bd-product__price">
                                                                        </span><span class="bd-product__new-price"><fmt:formatNumber value = "${p.price}" type = "currency"/></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="shop-filter-bar">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-xxl-12">
                            <div id="pagination-container" class="bd-basic__pagination d-flex justify-content-center mt-20  mb-45">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Add cart modal area start -->
        <div class="product__modal-sm modal fade" id="productmodal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="product__modal">
                        <div class="product__modal-wrapper p-relative">
                            <button type="button" class="close product__modal-close" data-bs-dismiss="modal" aria-label="Close">
                                <i class="fal fa-times"></i>
                            </button>
                            <div class="modal__inner">
                                <div class="bd__shop-details-inner">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="product-details__thumb-inner p-relative">
                                                <div class="bd__shop-details-img-gallery mb-30">
                                                    <div class="product-details-active2 swiper-container">
                                                        <div class="swiper-wrapper" id="swiper-wrapper1">

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="bd-product__details-small-img">
                                                    <div class="swiper-container product-details-nav2">
                                                        <div class="swiper-wrapper" id="swiper-wrapper2">

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="modal-product-info modal-product__details-content">
                                                <div class="product-ratting mt-10">
                                                </div>
                                                <h3>Organic Fresh Honey</h3>
                                                <div id="modal-product-price" class="product-price">
                                                    <span><fmt:formatNumber value = "0" type = "currency"/></span>
                                                </div>
                                                <div class="modal-product-meta bd__product-details-menu-1">
                                                    <ul>
                                                        <li>
                                                            <strong>Products:</strong>
                                                            <span>
                                                                <a href="#">Vegetable</a>
                                                                <a href="#">Fruits</a>
                                                            </span>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="product-quantity-cart mb-25">
                                                    <div class="product-quantity-form">
                                                        <form action="#">
                                                            <button class="cart-minus"><i class="far fa-minus"></i></button>
                                                            <input class="cart-input" type="text" value="1">
                                                            <button class="cart-plus"><i class="far fa-plus"></i></button>
                                                        </form>
                                                    </div>
                                                    <span class="cart-btn bd-fill__btn" href="javascript:void(0)" data-toggle="tooltip"
                                                          data-placement="top" title="Add to Cart" data-bs-toggle="modal"><i
                                                            class="fal fa-cart-arrow-down"></i>Add to Cart</span>
                                                </div>
                                                <div class="bd__product-details-menu-3">
                                                    <ul>
                                                        <li>
                                                            <a href="javascript:void(0)" class="wishlist-btn" title="Wishlist"
                                                               data-toggle="modal" data-target="#liton_wishlist_modal">
                                                                <i class="far fa-heart"></i>
                                                                <span>Add to Wishlist</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:void(0)" class="wishlist-btn cart-btn" title="Compare"
                                                               data-toggle="modal" data-target="#quick_view_modal">
                                                                <i class="fas fa-exchange-alt"></i>
                                                                <span>Compare</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Add cart modal area end -->
    </section>
    <!-- Shop-area-ende -->

</main>
<!-- Body main wrapper ebd -->

<jsp:include page="layout/footer.jsp"></jsp:include>

<script>
    var items = $(".list-wrapper .list-item");
    var numItems = items.length;
    var perPage = 12;

    items.slice(perPage).hide();

    $('#pagination-container').pagination({
        items: numItems,
        itemsOnPage: perPage,
        prevText: "&laquo;",
        nextText: "&raquo;",
        onPageClick: function (pageNumber) {
            var showFrom = perPage * (pageNumber - 1);
            var showTo = showFrom + perPage;
            items.hide().slice(showFrom, showTo).show();
        }
    });
    if (numItems <= perPage) {
        $("#pagination-container").attr('style', 'display:none !important');
    }
</script>
<script>
    //chưa thêm số liệu
    $(".btn-giohang").click(function () {
        var masp = $(this).data("masp");
        var tensp = $(this).data("tensp");
        var giatien = $(this).data("giatien");
        var anh = $(this).data("anh");
        var soluong = 1;


        $.ajax({
            url: "/Banana/cart/themgiohang",
            type: "GET",
            data: {
                maSp: masp,
                tensp: tensp,
                giaTien: giatien,
                anh: anh,
                soLuong: soluong
            },
            success: function (value) {

                $(".cart-count2").text(value);
            }
        });
    });
</script>
</body>
</html>
