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
        <body>
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
                    <!-- Page header -->
                    <div class="page-header page-header-light">
                        <div class="breadcrumb-line breadcrumb-line-light header-elements-md-inline">
                            <div class="d-flex">
                                <div class="breadcrumb">
                                    <a href="index.html" class="breadcrumb-item"><i class="icon-home2 mr-2"></i> Home</a>
                                    <a href="form_layout_horizontal.html" class="breadcrumb-item">Form layouts</a>
                                    <span class="breadcrumb-item active">Horizontal</span>
                                </div>
                                <a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
                            </div>
                            <div class="header-elements d-none">
                                <div class="breadcrumb justify-content-center">
                                    <a href="#" class="breadcrumb-elements-item">
                                        <i class="icon-comment-discussion mr-2"></i>
                                        Support
                                    </a>
                                    <div class="breadcrumb-elements-item dropdown p-0">
                                        <a href="#" class="breadcrumb-elements-item dropdown-toggle" data-toggle="dropdown">
                                            <i class="icon-gear mr-2"></i>
                                            Settings
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item"><i class="icon-user-lock"></i> Account security</a>
                                            <a href="#" class="dropdown-item"><i class="icon-statistics"></i> Analytics</a>
                                            <a href="#" class="dropdown-item"><i class="icon-accessibility"></i> Accessibility</a>
                                            <div class="dropdown-divider"></div>
                                            <a href="#" class="dropdown-item"><i class="icon-gear"></i> All settings</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /page header -->
                    <!-- Content area -->
                    <div class="content">
                        <!-- Horizontal form options -->
                        <div class="row">

                            <div class="col-md-12">
                                <!-- Basic initialization -->
                                <div class="card">

                                    <div class="card-header header-elements-inline">
                                        <h5 class="card-title">Danh sách sản phẩm</h5>

                                        <div class="header-elements">
                                            <button type="button" class="btn bg-success" data-toggle="modal" data-target="#modal_theme_success">Insert <i class="icon-database-add ml-2"></i></button>
                                        </div>
                                    </div>

                                    <!---->
                                    <table class="table datatable-button-init-basic table-bordered">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Mã đơn</th>
                                                <th>Người nhận</th>
                                                <th>Ngày đặt</th>
                                                <th>Tổng tiền</th>
                                                <th>Tình trạng</th>
                                                <th class="text-center" style="width: 50px">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <% int i = 1;  %>
                                        <c:forEach var="o" items="${orders}">
                                            <tr>
                                                <td>
                                                    <% out.println(i);
                                                        i++;%>
                                                </td>
                                                <td>
                                                    <span>DH</span> ${o.orderId}
                                                </td>
                                                <td>${o.fullName}</td>
                                                <td>${o.dateCreated}</td>
                                                <td><fmt:formatNumber value = "${o.totalPrice}" type = "currency"/></td>
                                                <c:choose>
                                                    <c:when test="${o.status == 1}">
                                                        <td>
                                                            <div class="btn-group">
                                                                <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">Đợi duyêt đơn</button>

                                                                <div class="dropdown-menu">
                                                                    <a href="${pageContext.request.contextPath}/admin/order/duyetdon/${o.orderId}" class="dropdown-item btn bg-success">Duyệt đơn</a>
                                                                    <a href="${pageContext.request.contextPath}/admin/order/huydon/${o.orderId}/${o.status}" class="dropdown-item btn bg-danger">Hủy đơn</a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </c:when>
                                                    <c:when test="${o.status == 2}">
                                                        <td>
                                                            <div class="btn-group">
                                                                <button type="button" class="btn bg-indigo-600 dropdown-toggle" data-toggle="dropdown">Đang giao hàng</button>

                                                                <div class="dropdown-menu">
                                                                    <a href="${pageContext.request.contextPath}/admin/order/giaohang/${o.orderId}" class="dropdown-item btn bg-success">Đã giao hàng</a>
                                                                    <a href="${pageContext.request.contextPath}/admin/order/huydon/${o.orderId}/${o.status}" class="dropdown-item btn bg-danger">Hủy đơn</a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </c:when>
                                                    <c:when test="${o.status == 3}">
                                                        <td>
                                                            <span class="btn bg-success disabled">Giao Hàng thanh công</span>
                                                        </td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>
                                                            <span class="btn bg-danger disabled">Hủy đơng</span>
                                                        </td>
                                                    </c:otherwise>
                                                </c:choose>


                                                <td class="text-center">
                                                    <div class="btn-group">
                                                        <a type="button" href="${pageContext.request.contextPath}/admin/order/order-detail/${o.orderId}" class="btn btn bg-success-400 border-indigo-400 border-2 btn-icon btn_edit">Chi tiết</a>

                                                    </div>

                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <!-- /basic initialization -->
                        </div>
                    </div>

                    <!-- /vertical form options -->
                </div>
                <!-- /content area -->

            </div>
            <!-- /main content -->
        </div>
        <!-- /page content -->
        <script>
            $('.selectpicker').selectpicker();
            $(".btn_edit").on("click", function () {
                var productId = $(this).data("productid");
                var productName = $(this).data("productname");
                var productImage = $(this).data("productimage");
                var status = $(this).data("status");
                console.log(productId);
                console.log(productName);
                console.log(productImage);
                console.log(status);
                $("#productId").val(productId);
                $("#productName").val(productName);
//                $(".filename").val(productImage);
                $(".filename").text(productImage);
                $("#oldProductImage").val(productImage);
                $("#status").attr('checked', status);
            });

            $(".btn_delete").on("click", function () {
                var productId = $(this).data("productid");
                var deleteHref = $("#deletecat").attr('href');
                $("#productId").val(productId);
                $("#deletecat").attr('href', deleteHref + productId);
                deleteHref = $("#deletecat").attr('href');
                console.log(deleteHref);
            });
        </script>
        <script>
            $(function () {
                // Initialize
                var validator = $('#product-form').validate({
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
                        productName: {
                            required: true,
                            minlength: 1,
                            maxlength: 200
                        },
                        categoryId: "required",
                        brandId: "required",
                        productImage: "required"
                    },
                    messages: {
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

        <script>
            $(document).ready(function () {
                var deleteAlert = 0;
                deleteAlert = ${sessionScope.deleteAlert}
                console.log(deleteAlert);
                if (deleteAlert === 1) {
                    new PNotify({
                        title: 'Không thể xóa !',
                        text: 'Đã có đơn hàng có sản phảm này này',
                        addclass: 'alert alert-danger alert-styled-left',
                        type: 'error'
                    });
                    deleteAlert = 0;
                } else if (deleteAlert === 2) {
                    new PNotify({
                        title: 'Xóa thành công !',
                        text: '',
                        addclass: 'alert alert-success alert-styled-left',
                        type: 'success'
                    });
                    deleteAlert = 0;
                    console.log(deleteAlert);
                }
            <% session.removeAttribute("deleteAlert");%>
            });
        </script>
        <script>
            $("#modal_theme_success").on('show.bs.modal', function () {
                $('.money2').simpleMoneyFormat();
            });

            $('.money2').simpleMoneyFormat();
            $(".money2").on("input", function () {

                var money = $(this).val().replace(/,/g, '');
                $("input[name=price]").val(money);
            });
        </script>
    </body>
</html>