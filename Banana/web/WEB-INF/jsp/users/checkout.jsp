
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
                                                    <label>Họ và tên <span class="required">*</span></label>
                                                    <input name="fullName" value="${customer2.fullName}" type="text"/>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="checkout-form-list">
                                                <label>Số điện thoại <span class="required">*</span></label>
                                                <input name="phoneNumber" value="${customer2.phoneNumber}" type="text"/>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="checkout-form-list">
                                                <label>Địa chỉ <span class="required">*</span></label>
                                                <textarea name="shippingAddress" placeholder="Số nhà, phố (phường),thành phố (quận, huyện), Tỉnh thành">${customer2.address}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="checkout-form-list">
                                                <label>Ghi chú </label>
                                                <textarea name="note"></textarea>
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
                                                <c:if test="${!empty cart}">
                                                    <c:forEach var="c" items="${cart}">
                                                        <tr class="cart_item">
                                                            <td class="img">
                                                                <img src="${pageContext.request.contextPath}/images/product/${c.image}" class="product-img" alt="img">
                                                            </td>
                                                            <td class="product-name">
                                                                ${c.productName} 
                                                            </td>
                                                            <td class="product-total">
                                                                <strong class="amount"><fmt:formatNumber value = "${c.price}" type = "currency"/></strong><strong class="product-quantity"> × ${c.quantityInCart}</strong>
                                                            </td>
                                                            <td>
                                                                <strong>${c.gethanhTienString()} </strong>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                            </tbody>
                                            <tfoot>
                                                <tr class="order-total">
                                                    <th>Tổng tiền</th>
                                                    <td>
                                                        <strong><span class="amount"><fmt:formatNumber value = "${tongtiengiohang}" type = "currency"/></span></strong>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>

                                    <div class="payment-method">
                                        <div class="order-button-payment mt-20">
                                            <button type="submit" class="bd-fill__btn">Thanh toán</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <!-- checkout-area end -->

        </main>
        <!-- Body main wrapper end -->
        
        <jsp:include page="layout/footer.jsp"></jsp:include>
        <script>
            $(function () {
                // Initialize
                var validator = $('#checkout-form').validate({
                    ignore: 'input[type=hidden], .select2-search__field', // ignore hidden fields
                    errorClass: 'validation-invalid-label',
                    successClass: 'validation-valid-label',
                    validClass: 'validation-valid-label',
                    highlight: function (element, errorClass) {
                        $(element).removeClass(errorClass);
                    },
                    unhighlight: function (element, errorClass) {
                        $(element).removeClass(errorClass);
                    },
                    success: function (label) {
                        label.addClass('validation-valid-label').text('Success.'); // remove to hide Success message
                    },

                    // Different components require proper error label placement
                    errorPlacement: function (error, element) {

                        // Unstyled checkboxes, radios
                        if (element.parents().hasClass('form-check')) {
                            error.appendTo(element.parents('.form-check').parent());
                        }

                        // Input with icons and Select2
                        else if (element.parents().hasClass('form-group-feedback') || element.hasClass('select2-hidden-accessible')) {
                            error.appendTo(element.parent());
                        }

                        // Input group, styled file input
                        else if (element.parent().is('.uniform-uploader, .uniform-select') || element.parents().hasClass('input-group')) {
                            error.appendTo(element.parent().parent());
                        }

                        // Other elements
                        else {
                            error.insertAfter(element);
                        }
                    },
                    rules: {
                        fullName: {
                            required: true,
                            maxlength: 50
                        },
                        phoneNumber: {
                            required: true,
                            phoneVN: true
                        },
                        shippingAddress: {
                            required: true,
                            minlength: 20,
                            maxlength: 200
                        },
                        note: {
                            maxlength: 200
                        }
                    },
                    messages: {
                        fullName: {
                            required: "Không được để trống họ và tên",
                            maxlength: "Số kí tự phải nhỏ hơn {0}"
                        },
                        phoneNumber: {
                            required: "Không được để trống số điện thoại",
                            phoneVN: "Không phải số điên thoại tại Việt Nam"
                        },
                        shippingAddress: {
                            required: "Để trống địa chỉ sao giao hàng",
                            minlength: "Nhập địa chỉ chi tiết để giao hàng đúng nơi",
                            maxlength: "Số kí tự phải nhỏ hơn {0}"
                        },
                        note: {
                            maxlength: "Số kí tự phải nhỏ hơn {0}"
                        },
                        custom: {
                            required: 'This is a custom error message'
                        },
                        basic_checkbox: {
                            minlength: 'Please select at least {0} checkboxes'
                        },
                        styled_checkbox: {
                            minlength: 'Please select at least {0} checkboxes'
                        },
                        switchery_group: {
                            minlength: 'Please select at least {0} switches'
                        },
                        switch_group: {
                            minlength: 'Please select at least {0} switches'
                        },
                        agree: 'Please accept our policy'
                    }
                });
                $("#reset2").click(function () {
                    validator.resetForm();
                });
                $("#modal_theme_success").on('hidden.bs.modal', function () {
                    $("#reset2").click();
                });
            });


        </script>
    </body>
</html>
