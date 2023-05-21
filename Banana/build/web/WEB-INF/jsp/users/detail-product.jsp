
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="layout/linkcss.jsp"></jsp:include>
        <style>
            .product__details-des{
                padding: 20px;
            }
        </style>
    </head>
    
    <body>
        <jsp:include page="layout/header.jsp"></jsp:include>

            <!-- Body main wrapper start -->
   <main>
      <!-- Breadcrumb-area-start -->
      <div class="breadcrumb-area pt-10 pb-10 mb-70">
         <div class="container">
            <div class="row">
               <div class="col-12">
                  <div class="breadcrumb__list">
                     <span><a href="index.html">Home</a></span>
                     <span><i class="fa-regular fa-angle-right"></i></span>
                     <span>Product Deatils</span>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Breadcrumb-area-end -->

      <!-- Shop-details-area-start -->
      <div class="container-pro-details">
      <div class="bd__shop-details-area pt-20 pb-75">
         <div class="container small-container">
            <div class="row">
               <div class="col-lg-12 col-md-12">
                  <div class="bd__shop-details-inner mb-55">
                     <div class="row">
                        <div class="col-md-6">
                           <div class="product-details__thumb-inner small-device p-relative pdpro2">
                              <div class="bd__shop-details-img-gallery mb-30">
                                 <div class="product-details-active swiper-container">
                                    <div class="swiper-wrapper">
                                        <c:forEach var="imgde" items="${imagedetail}">
                                            <div class="swiper-slide">
                                          <div class="bd-product__details-large-img w-img">
                                             <img src="${pageContext.request.contextPath}/images/product/${imgde.linkImage}">
                                          </div>
                                       </div>
                                        </c:forEach> 
                                       
                                    </div>
                                 </div>
                              </div>
                              <div class="bd-product__details-small-img">
                                 <div class="swiper-container product-details-nav">
                                    <div class="swiper-wrapper">
                                        <c:forEach var="imgde" items="${imagedetail}">
                                       <div class="swiper-slide m-img">
                                          <div class="product-small__img">
                                             <img src="${pageContext.request.contextPath}/images/product/${imgde.linkImage}" alt="product-thumb">
                                          </div>
                                       </div>
                                          </c:forEach> 
                                    </div>
                                 </div>
                              </div>
                              <!-- If we need navigation buttons -->
                              <div class="bd-product__details-nav">
                                 <button class="product-details__button-prev"><i
                                       class="fa-regular fa-angle-left"></i></button>
                                 <button class="product-details__button-next"><i
                                       class="fa-regular fa-angle-right"></i></button>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6">
                           <div class="modal-product-info shop-details-info">
                              <div class="product-ratting">
                                 
                              </div>
                              <h3>${prodetail.productName}</h3>
                              <div class="product-price">
                                 <span><fmt:formatNumber value = "${prodetail.price}" type = "currency"/></span>
                              </div>
                              <div class="modal-product-meta bd__product-details-menu-1">
                                 <ul>
                                    <li>
                                       <strong>Products:</strong>
                                       <span>
                                          <a href="#">${prodetail.categoryName}</a>
                                          <a href="#">${prodetail.brandName}</a>
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
                                 <a class="cart-btn bd-fill__btn" href="javascript:void(0)" data-toggle="tooltip"
                                    data-placement="top" title="Add to Cart" data-bs-toggle="modal"><i
                                       class="fal fa-cart-arrow-down"></i>Add to Cart</a>
                              </div>
                              
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- Shop Tab Start -->
                  <div class="product_info-faq-area pt-50">
                     <nav class="product-details-tab">
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                           <a class="nav-item nav-link active" id="nav-general-tab" data-bs-toggle="tab"
                              href="#nav-general" role="tab" aria-selected="true">Description</a>
                        </div>
                     </nav>
                     <div class="tab-content product-details-content" id="nav-tabContent">
                        <div class="tab-pane fade active show" id="nav-general" role="tabpanel">
                           <div class="tabs-wrapper mt-35 mb-40">
                              <div class="product__details-des">
                                 ${prodetail.description}
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- Shop Tab End -->
               </div>
            </div>
         </div>
      </div>
      </div>
      <!-- Shop-details-area-end -->

      <!-- Related-Product start -->
      <div class="bd-related-Product__area mb-95">
         <div class="small-container container">
            <div class="col-xxl-12 col-xl-12 col-lg-12">
               <div class="row align-items-center">
                  <div class="col-xxl-4 col-xl-5 col-lg-4">
                     <div class="bd-section__title-wrapper mb-40">
                        <div class="bd-sm__section-title">
                           <h3>Related Product</h3>
                        </div>
                     </div>
                  </div>
                  <div class="col-xxl-8 col-xl-7 col-lg-8">
                     <div class="bd-trending__tab-wrapper mb-40 p-relative">
                        <div class="bd-tending-nav">
                           <nav>
                              <div class="nav nav-tabs" id="nav-tab-item" role="tablist">
                                 <button class="nav-link active" id="nav-tab-1-tab" data-bs-toggle="tab"
                                    data-bs-target="#nav-tab-1" type="button" role="tab" aria-controls="nav-tab-1"
                                    aria-selected="true">View All</button>
                                 <button class="nav-link" id="nav-tab-2-tab" data-bs-toggle="tab"
                                    data-bs-target="#nav-tab-2" type="button" role="tab" aria-controls="nav-tab-2"
                                    aria-selected="false">New Arrival</button>
                                 <button class="nav-link" id="nav-tab-3-tab" data-bs-toggle="tab"
                                    data-bs-target="#nav-tab-3" type="button" role="tab" aria-controls="nav-tab-3"
                                    aria-selected="false">Best Sale</button>
                                 <button class="nav-link" id="nav-tab-4-tab" data-bs-toggle="tab"
                                    data-bs-target="#nav-tab-4" type="button" role="tab" aria-controls="nav-tab-4"
                                    aria-selected="false">Featured</button>
                              </div>
                           </nav>
                        </div>
                        <!-- If we need navigation buttons -->
                        <div class="bd-trending__navigation">
                           <button class="trending-button-prev"><i class="fa-regular fa-angle-left"></i></button>
                           <button class="trending-button-next"><i class="fa-regular fa-angle-right"></i></button>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="bd-trending__item-wrapper">
                  <div class="tab-content" id="nav-tabContent-2">
                     <div class="tab-pane fade show active" id="nav-tab-1" role="tabpanel"
                        aria-labelledby="nav-tab-1-tab">
                        <div class="bd-trending-active swiper-container">
                           <div class="swiper-wrapper">
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-16.png" alt="trending-thumb"></a>
                                       <div class="bd-product__tag">
                                          <span class="tag-text theme-bg">New</span>
                                       </div>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Organic Fresh
                                             Honey</a></h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/product/product-01.png" alt="product-thumb"></a>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Organic Tomato</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/product/product-02.png" alt="product-thumb"></a>
                                       <div class="bd-product__tag">
                                          <span class="tag-text danger-bg">50%</span>
                                       </div>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Hisma Green Tea</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/product/product-03.png" alt="product-thumb"></a>
                                       <div class="bd-product__tag">
                                          <span class="tag-text color-black yellow-bg">Sale</span>
                                       </div>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Fresh Payaz Milk</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="tab-pane fade" id="nav-tab-2" role="tabpanel" aria-labelledby="nav-tab-2-tab">
                        <div class="bd-trending-active swiper-container">
                           <div class="swiper-wrapper">
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-13.png" alt="fruits-thumb"></a>
                                       <div class="bd-product__tag">
                                          <span class="tag-text theme-bg">New</span>
                                       </div>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Kach Kogozi Labu</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-16.png" alt="fruits-thumb"></a>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Organic Tomato</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-15.png" alt="fruits-thumb"></a>
                                       <div class="bd-product__tag">
                                          <span class="tag-text danger-bg">50%</span>
                                       </div>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Hisma Green Tea</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-14.png" alt="fruits-thumb"></a>
                                       <div class="bd-product__tag">
                                          <span class="tag-text color-black yellow-bg">Sale</span>
                                       </div>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Fresh Payaz Milk</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-15.png" alt="fruits-thumb"></a>
                                       <div class="bd-product__tag">
                                          <span class="tag-text color-black yellow-bg">Sale</span>
                                       </div>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Fresh Payaz Milk</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="tab-pane fade" id="nav-tab-3" role="tabpanel" aria-labelledby="nav-tab-3-tab">
                        <div class="bd-trending-active swiper-container">
                           <div class="swiper-wrapper">
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-07.png" alt="fruits-thumb"></a>
                                       <div class="bd-product__tag">
                                          <span class="tag-text theme-bg">New</span>
                                       </div>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Kach Kogozi Labu</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-08.png" alt="fruits-thumb"></a>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Organic Tomato</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-09.png" alt="fruits-thumb"></a>
                                       <div class="bd-product__tag">
                                          <span class="tag-text danger-bg">50%</span>
                                       </div>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Hisma Green Tea</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-10.png" alt="fruits-thumb"></a>
                                       <div class="bd-product__tag">
                                          <span class="tag-text color-black yellow-bg">Sale</span>
                                       </div>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Fresh Payaz Milk</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-14.png" alt="fruits-thumb"></a>
                                       <div class="bd-product__tag">
                                          <span class="tag-text color-black yellow-bg">Sale</span>
                                       </div>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Fresh Payaz Milk</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="tab-pane fade" id="nav-tab-4" role="tabpanel" aria-labelledby="nav-tab-4-tab">
                        <div class="bd-trending-active swiper-container">
                           <div class="swiper-wrapper">
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-02.png" alt="trending-thumb"></a>
                                       <div class="bd-product__tag">
                                          <span class="tag-text theme-bg">New</span>
                                       </div>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Kach Kogozi Labu</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-14.png" alt="product-thumb"></a>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Organic Tomato</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-15.png" alt="product-thumb"></a>
                                       <div class="bd-product__tag">
                                          <span class="tag-text danger-bg">50%</span>
                                       </div>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Hisma Green Tea</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-16.png" alt="product-thumb"></a>
                                       <div class="bd-product__tag">
                                          <span class="tag-text color-black yellow-bg">Sale</span>
                                       </div>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Fresh Payaz Milk</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="bd-trending__item text-center mb-30">
                                    <div class="bd-trending__product-thumb">
                                       <a href="product-details.html"><img
                                             src="${pageContext.request.contextPath}/resources/users/assets/img/trending/fruits/fruits-10.png" alt="fruits-thumb"></a>
                                       <div class="bd-product__tag">
                                          <span class="tag-text color-black yellow-bg">Sale</span>
                                       </div>
                                       <div class="bd-product__action">
                                          <a class="cart-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick View" data-bs-toggle="modal"><i
                                                class="fal fa-cart-arrow-down"></i></a>
                                          <a href="#" data-toggle="tooltip" data-placement="top" title="Quick Shop"
                                             data-bs-toggle="modal" data-bs-target="#productmodal"><i
                                                class="fal fa-eye"></i></a>
                                          <a class="wishlist-btn" href="javascript:void(0)" data-toggle="tooltip"
                                             data-placement="top" title="Quick Wishlist" data-bs-toggle="modal"> <i
                                                class="fal fa-heart"></i></a>
                                       </div>
                                    </div>
                                    <div class="bd-teanding__content">
                                       <h4 class="bd-product__title"><a href="product-details.html">Fresh Payaz Milk</a>
                                       </h4>
                                       <div class="bd-product__price">
                                          <span class="bd-product__old-price"><del>$9.00</del></span><span
                                             class="bd-product__new-price">$9.00</span>
                                       </div>
                                       <div class="bd-product__icon">
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-solid fa-star"></i>
                                          <i class="fa-regular fa-star"></i>
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
      </div>
      <!-- Related-Product end -->
   </main>
   <!-- Body main wrapper end -->

        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>
</html>
