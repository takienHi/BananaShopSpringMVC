
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="layout/linkcss.jsp"></jsp:include>
            <style>
                .product-img{
                    width: 85px !important;
                    height: 100px  !important;
                }
                .checkout-form-list textarea{
                    background: var(--clr-common-white);
                    border: 1px solid var(--clr-border-2);
                    border-radius: 0;
                    height: 60px;
                    line-height: 60px;
                    padding: 0 0 0 20px;
                    width: 100%;
                    outline: none;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    -ms-box-shadow: none;
                    -o-box-shadow: none;
                    box-shadow: none;
                    min-height: 120px;
                }
                .checkout-form-list textarea:focus {
                    border-color: var(--clr-border-2);
                }

                .checkout-form-list textarea::-moz-placeholder {
                    color: #575757;
                    opacity: 1;
                }

                .checkout-form-list textarea::placeholder{
                    color: #575757;
                    opacity: 1;
                }
                .validation-valid-label{
                    display: none !important;
                }
                .validation-invalid-label{
                    margin-top: 2px;
                    color: #f44336 !important;
                }
                .row input:read-only {
                    background-color: #f8f8f8;
                }
                
                .row textarea:read-only {
                    background-color: #f8f8f8;
                }
            </style>
        </head>

        <body>
        <jsp:include page="layout/header.jsp"></jsp:include>

            <main>

                <!-- Breadcrumb-area-start -->
                <div class="breadcrumb-area pt-10 pb-10">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="breadcrumb__list">
                                    <span><a href="index.html">Home</a></span>
                                    <span class="dvdr"><i class="fa-regular fa-angle-right"></i></span>
                                    <span>Checkout</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb-area-end -->


                <!-- checkout-area start -->
                <section class="checkout-area pb-100">
                    <div class="container small-container">
                        <form id="checkout-form" action="${pageContext.request.contextPath}/checkout/saveorder" method="POST">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkbox-form">
                                    <h3>Billing Details</h3>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="checkout-form-list">
                                                <label>Người nhận hàng <span class="required">*</span></label>
                                                <input name="fullName" value="${orderr.fullName}" type="text" readonly/>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="checkout-form-list">
                                                <label>Số điện thoại <span class="required">*</span></label>
                                                <input name="phoneNumber" value="${orderr.phoneNumber}" type="text" readonly/>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="checkout-form-list">
                                                <label>Địa chỉ giao hàng <span class="required">*</span></label>
                                                <textarea name="shippingAddress" placeholder="Số nhà, phố (phường),thành phố (quận, huyện), Tỉnh thành" readonly>${orderr.shippingAddress}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="checkout-form-list">
                                                <label>Ghi chú </label>
                                                <textarea name="note" readonly>${orderr.note}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="your-order mb-30 ">
                                    <h3>Hóa đơn</h3>
                                    <div class="your-order-table table-responsive">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th class="img">Ảnh</th>
                                                    <th class="product-name">Tên sản phẩm</th>
                                                    <th class="product-total">Đơn giá</th>
                                                    <th class="product-total">Thành tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${!empty orderDetails}">
                                                    <c:forEach var="c" items="${orderDetails}">
                                                        <tr class="cart_item">
                                                            <td class="img">
                                                                <img src="${pageContext.request.contextPath}/images/product/${c.productImage}" class="product-img" alt="img">
                                                            </td>
                                                            <td class="product-name">
                                                                ${c.productName} 
                                                            </td>
                                                            <td class="product-total">
                                                                <strong class="amount"><fmt:formatNumber value = "${c.price}" type = "currency"/></strong><strong class="product-quantity"> × ${c.quantity}</strong>
                                                            </td>
                                                            <td>
                                                                <strong><fmt:formatNumber value = "${c.getThanhTien()}" type = "currency"/></strong>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                            </tbody>
                                            <tfoot>
                                                <tr class="order-total">
                                                    <th>Tổng tiền</th>
                                                    <td>
                                                        <strong><span class="amount"><fmt:formatNumber value = "${orderr.totalPrice}" type = "currency"/></span></strong>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <!-- checkout-area end -->

        </main>

        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>
</html>
