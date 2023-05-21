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
                .cursor2{
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
                                    <span class="dvdr"><i class="fa-regular fa-angle-right"></i></span>
                                    <span>Cart</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb-area-end -->

                <!-- Cart area start  -->
                <section class="cart-area pt-110 pb-130">
                    <div class="container small-container">
                        <div class="row">
                            <div class="col-12">
                                <div class="table-content table-responsive">
                                    <table class="table" id="cart-table">
                                        <thead>
                                            <tr>
                                                <th class="product-thumbnail">Ảnh</th>
                                                <th class="cart-product-name">Tên Sản Phẩm</th>
                                                <th class="product-price">Đơn giá</th>
                                                <th class="product-quantity">Số lượng</th>
                                                <th class="product-subtotal">Thành tiền</th>
                                                <th class="product-remove">xóa</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        <c:if test="${!empty cart}">
                                            <c:forEach var="c" items="${cart}">

                                                <tr>
                                                    <td class="product-thumbnail">
                                                        <a href="${pageContext.request.contextPath}/shop/detail-product/${c.productId}"><img src="${pageContext.request.contextPath}/images/product/${c.image}" alt="img"></a>
                                                    </td>
                                                    <td class="product-name">
                                                        <a href="${pageContext.request.contextPath}/shop/detail-product/${c.productId}">${c.productName}</a>
                                                    </td>
                                                    <td class="product-price">
                                                        <span class="dongia">
                                                            <fmt:formatNumber value = "${c.price}" type = "currency"/>
                                                        </span>
                                                    </td>
                                                    <td class="product-quantity text-center">
                                                        <div class="product-quantity mt-10 mb-10">
                                                            <div class="product-quantity-form">
                                                                <form action="#">
                                                                    <button class="cart-minus"><i class="far fa-minus"></i></button>
                                                                    <input class="cart-input input-soluong" data-productid="${c.productId}" type="text" value="${c.quantityInCart}">
                                                                    <button class="cart-plus"><i class="far fa-plus"></i></button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="product-subtotal">
                                                        <span class="thanhtien${c.productId}">${c.gethanhTienString()}</span>
                                                    </td>
                                                    <td class="product-remove"><span data-productid="${c.productId}" class="deleca cursor2"><i class="fa fa-times"></i></span></td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="offset-md-5 col-md-6">
                                    <div class="cart-page-total">
                                        <h2>Tổng tiền</h2>
                                        <ul class="mb-20">
                                            <li>Tổng tiền <span id="tongtien"><fmt:formatNumber value = "${tongtiengiohang}" type = "currency"/></span></li>
                                        </ul>
                                        <a class="bd-border__btn" href="${pageContext.request.contextPath}/checkout">Đặt hàng</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Cart area end  -->





        </main>
        <!-- Body main wrapper end -->

        <jsp:include page="layout/footer.jsp"></jsp:include>
        <script >
            $(".input-soluong").change(function () {
                var masp = $(this).data("productid");
                var soluongmoi = $(this).val();
                var thanhtienclass = ".thanhtien" + masp;
                $.ajax({
                    url: "/Banana/cart/cap-nhat",
                    type: "GET",
                    data: {
                        masp: masp,
                        soluongmoi: soluongmoi
                    },
                    success: function (value) {
                        var value2 = value;
                        value2 = value2.replace("?", "đ");
                        $(thanhtienclass).text(value2);
                    }
                }).done(function () {
                    // done la khi ajax chay xong thi thuc hien cong viec j do
                    $.ajax({
                        url: "/Banana/cart/tong-tien",
                        type: "GET",
                        success: function (value) {
                            var value2 = value;
                            value2 = value2.replace("?", "đ");
                            $("#tongtien").text(value2);
                        }
                    });
                });
            });
            $(".deleca").click(function () {
                var self = $(this);
                var masp = $(this).data("productid");
                $.ajax({
                    url: "/Banana/cart/xoagiohang",
                    type: "GET",
                    data: {
                        id: masp
                    },
                    success: function (value) {
                        self.closest("tr").remove();
                        $(".cart-count2").text(value);
                    }
                })
            });
        </script>
    </body>
</html>
