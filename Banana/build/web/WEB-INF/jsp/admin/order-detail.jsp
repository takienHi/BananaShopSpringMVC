<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<fmt:setLocale value="vi-VN"  scope="session"/> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="layout/linkcss.jsp"></jsp:include>
            <style>

                .product-img{
                    width: 80px !important;
                    height: auto  !important;
                    border-radius: 20% !important;
                }
                td .list-icons i{
                    font-size: 20px;
                }
                .option-img {
                    height: 1.2em;
                }
                .bootstrap-select{
                    display: inline-grid !important;
                }
                .bootstrap-select label{
                    order: 2;
                } 
            </style>
        </head>
        <body class="sidebar-xs">
            <!-- Main navbar -->
        <jsp:include page="layout/navbar.jsp"></jsp:include>
            <!-- /main navbar -->
            <!-- Page content -->
            <div class="page-content">
                <!-- Main sidebar -->
            <jsp:include page="layout/sidebar.jsp"></jsp:include>
                <!-- /main sidebar -->
                <!-- Main content -->
                <div class="content-wrapper">
                    <div class="content">
                        <div class="row">
                            <div class="col-xl-6">

                                <!-- Traffic sources -->
                                <div class="card">
                                    <div class="card-header header-elements-inline">
                                        <h6 class="card-title">Chi tiết đơn hàng</h6>
                                    </div>

                                    <div class="card-body">
                                        <div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label>Người nhận hàng:</label>
                                                        <input type="text" value="${orderr.fullName}" readonly="readonly" placeholder="Tên sản phẩm" class="form-control">
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Số điện thoại:</label>
                                                    <input type="text" value="${orderr.phoneNumber}" readonly="readonly" placeholder="Tên danh mục" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label>Địa chỉ giao hàng:</label>
                                                    <textarea name="shippingAddress"  class="form-control" readonly >${orderr.shippingAddress}</textarea>
                                                </div>
                                                <div class="col-md-12">
                                                    <label>Địa chỉ giao hàng:</label>
                                                    <textarea name="shippingAddress"  class="form-control"  readonly>${orderr.note}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                                <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label>Tổng tiền:</label>
                                                        <div class="input-group">
                                                        <input type="text" name="money" value="${orderr.totalPrice}" class="form-control money2 text-right" placeholder="Giá tiền" readonly>
                                                        <span class="input-group-append">
                                                            <span class="input-group-text">VNĐ</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>

                                <div class="chart position-relative" id="traffic-sources"></div>
                            </div>
                            <!-- /traffic sources -->

                        </div>

                        <div class="col-xl-6">

                            <!-- Sales stats -->
                            <div class="card">
                                <div class="card-header header-elements-inline">
                                    <h6 class="card-title">Chi tiết đơn hàng</h6>
                                </div>

                                <div class="card-body py-0">

                                    <table class="table datatable-button-init-basic table-bordered">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Ảnh</th>
                                                <th>Tên Thương hiệu</th>
                                                <th>Trạng thái</th>
                                                <th>Thành tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% int i = 1;  %>
                                            <c:forEach var="c" items="${orderDetails}">
                                                <tr>
                                                    <td><% out.println(i);
                                                                            i++;%></td>
                                                    <td>
                                                        <img class="product-img" src="${pageContext.request.contextPath}/images/product/${c.productImage}"/>
                                                    </td>
                                                    <td>${c.productName} </td>
                                                    <td>
                                                        <fmt:formatNumber value = "${c.price}" type = "currency"/>
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber value = "${c.getThanhTien()}" type = "currency"/>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>

                            </div>
                            <!-- /sales stats -->

                        </div>                           
                    </div>
                </div>

            </div>
            <!-- /main content -->
        </div>
        <!-- /page content -->
<script>
            var moneyy = $("input[name=money]").val().split('.')[0];
            $("input[name=money]").val(moneyy);
            $('.money2').simpleMoneyFormat();
            $(".money2").on("input", function () {

                var money = $(this).val().replace(/,/g, '');
                $("input[name=price]").val(money);
            });
        </script>
    </body>
</html>