
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<fmt:setLocale value="vi-VN"  scope="session"/> 
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="layout/linkcss.jsp"></jsp:include>
            <style>


                .profile .img-lg {
                    width: 9rem;
                    height: 9rem;
                }

            </style>
        </head>

        <body>
        <jsp:include page="layout/header.jsp"></jsp:include>

            <div id="user" class="container profile">
                <!--                <div class="row">
                                    <div class="col text-center mt-3">
                                        <img alt="picture" src="https://i1.wp.com/avatars.phantauth.net/ai/male/nelYogaK.jpg?ssl=1" class="img-lg rounded-circle border shadow" />
                                        <h2 class="mt-3"></h2>
                                    </div>
                                </div>-->

                <div class="row mt-2">
                    <!-- Shop Tab Start -->
                    <div class="product_info-faq-area pt-50">
                        <nav class="product-details-tab">
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-general-tab" data-bs-toggle="tab"
                                   href="#nav-general" role="tab" aria-selected="true">Thông tin người dùng</a>
                                <a class="nav-item nav-link show" id="nav-seller-tab" data-bs-toggle="tab"
                                   href="#nav-seller" role="tab" aria-selected="false">Đơn hàng</a>
                            </div>
                        </nav>
                        <div class="tab-content product-details-content" id="nav-tabContent">
                            <div class="tab-pane fade  active show" id="nav-general" role="tabpanel">
                                <div class="container small-container">
                                    <div class="row justify-content-center">

                                        <div class="col-xl-8 col-lg-10 pt-50">
                                            <div class="signup-form-wrapper">
                                                <div class="bd-postbox__contact">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div>
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="checkout-form-list">
                                                                            <label>Họ và tên <span class="required">*</span></label>
                                                                            <input name="fullName" value="${customer2.fullName}" type="text" placeholder="Nguyên Văn An" readonly/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="checkout-form-list">
                                                                        <label>Ngày sinh <span class="required">*</span></label>

                                                                        <div class="datepicker date input-group">
                                                                            <div class="col-md-12">
                                                                                <input type="text" value="${customer2.dateOfBirth}" name="dateOfBirth" placeholder="Chọn ngày" class="form-control" readonly/>
                                                                            </div>
                                                                            <div class="input-group-append col-md-1" hidden>
                                                                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="checkout-form-list">
                                                                        <label>Địa chỉ <span class="required">*</span></label>
                                                                        <input name="address" value="${customer2.address}" type="text" placeholder="Số nhà, phố (phường),thành phố (quận, huyện), Tỉnh thành" readonly/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="checkout-form-list">
                                                                        <label>Email <span class="required">*</span></label>
                                                                        <input name="email" value="${customer2.email}" type="text" placeholder="vidu2@gmail.com" readonly />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="checkout-form-list">
                                                                        <label>Số điện thoại <span class="required">*</span></label>
                                                                        <input name="phoneNumber" value="${customer2.phoneNumber}" type="text" placeholder="0987654321" readonly/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="checkout-form-list">
                                                                        <label>Tên đăng nhập <span class="required">*</span></label>
                                                                        <input name="userName" value="${customer2.userName}" type="text" placeholder="tendangnhap" readonly/>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-6">
                                                                    <div class="checkout-form-list">
                                                                        <label>Giới tính <span class="required">*</span></label>
                                                                        <div class="signup-action-check">
                                                                            <div class=" signup-action-check">
                                                                                <input class="e-check-input" name="gender" value="true" type="radio" checked disabled>Nam
                                                                            </div>
                                                                            <div class="signup-action-check">
                                                                                <input class="e-check-input" name="gender" value="false" type="radio" disabled>Nữ
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="bd-sigin__action-button mb-20">
                                                                    <button class="bd-fill__btn w-100">Cật nhật thông tin</button>
                                                                </div>
                                                                <div class="bd-resister__bottom-text text-center">
                                                                    <div class="bd-acount__login-text">
                                                                        <span>Bạn muốn đăng xuất?<span> <a href="${pageContext.request.contextPath}/login/dang-xuat" >Đăng xuất</a></span></span>
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
                        <div class="tab-pane fade" id="nav-seller" role="tabpanel">
                            <div class="tabs-wrapper mt-35 mb-50">
                                <section class="cart-area pt-110 pb-130">
                                    <div class="container small-container">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="table-content table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th class="product-thumbnail">Mã đơn</th>
                                                                <th class="cart-product-name">Người nhận</th>
                                                                <th class="product-price">Ngày đặt</th>
                                                                <th class="product-subtotal">Tổng tiền</th>
                                                                <th class="product-quantity">Tình trạng</th>
                                                                <th class="product-remove">Chi tiết</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="o" items="${ordercustomer}">
                                                                <tr>
                                                                    <td class="product-thumbnail">
                                                                        <span>DH</span> ${o.orderId}
                                                                    </td>
                                                                    <td>${o.fullName}</td>
                                                                    <td>${o.dateCreated}</td>
                                                                    <td><fmt:formatNumber value = "${o.totalPrice}" type = "currency"/></td>
                                                                    <c:choose>
                                                                        <c:when test="${o.status == 1}">
                                                                            <td>Đợi duyêt đơn</td>
                                                                        </c:when>
                                                                        <c:when test="${o.status == 2}">
                                                                            <td>Đang giao hàng</td>
                                                                        </c:when>
                                                                        <c:when test="${o.status == 3}">
                                                                            <td>Giao thành công</td>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <td>Hủy đơn</td>
                                                                        </c:otherwise>
                                                                    </c:choose>

                                                                    <td><a href="${pageContext.request.contextPath}/customer/orderdetail/${o.orderId}">Xem chi tiết</a></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Shop Tab End -->
            </div>
        </div>

        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>
</html>
