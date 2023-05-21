<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                        <h6 class="card-title">Chi tiết sản phẩm</h6>
                                        <div class="header-elements">
                                            <button type="button" class="btn bg-success"  data-toggle="modal" data-target="#modal_update2"
                                                    data-header="Cập nhật" data-productid="${prodetail.productId}" data-categoryid="${prodetail.categoryId}" data-brandid="${prodetail.brandId}" data-price="${prodetail.price}" data-quantity="${prodetail.quantity}" data-status="${prodetail.status}">Cập nhật</button>

                                    </div>
                                </div>

                                <div class="card-body">
                                    <div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label>Tên sản phẩm:</label>
                                                    <input type="text" value="${prodetail.productName}" readonly="readonly" placeholder="Tên sản phẩm" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Danh mục:</label>
                                                    <input type="text" value="${prodetail.categoryName}" readonly="readonly" placeholder="Tên danh mục" class="form-control">
                                                </div>

                                                <div class="col-md-6">
                                                    <label>Thương hiệu:</label>
                                                    <input type="text" value="${prodetail.brandName}" readonly="readonly" placeholder="Tên thương hiệu" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Giá:</label>
                                                    <div class="input-group">
                                                        <input type="text" name="money" value="${prodetail.price}" class="form-control money2 text-right" placeholder="Giá tiền" readonly>
                                                        <span class="input-group-append">
                                                            <span class="input-group-text">VNĐ</span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <label>Số lượng:</label>
                                                    <div class="input-group">
                                                        <span class="input-group-prepend">
                                                            <span class="input-group-text">Hiện có:</span>
                                                        </span>
                                                        <input value="${prodetail.quantity}" type="text" class="form-control border-right-0 text-right" readonly>
                                                        <span class="input-group-append">
                                                            <button class="btn bg-success" type="button" data-toggle="modal" data-target="#modal_themsl">Thêm số lượng</button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Ngày thêm:</label>
                                                    <div class="form-group form-group-feedback form-group-feedback-right">
                                                        <input type="text" class="form-control daterange-single2 text-center" value="${prodetail.addedDate}" placeholder="02/07/2001" readonly>
                                                        <div class="form-control-feedback">
                                                            <i class="icon-calendar2 text-muted"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Ngày cập nhật:</label>
                                                    <div class="form-group form-group-feedback form-group-feedback-right">
                                                        <input type="text" class="form-control daterange-single2 text-center" value="${prodetail.updateDate}" placeholder="02/07/2001" readonly>
                                                        <div class="form-control-feedback">
                                                            <i class="icon-calendar2 text-muted"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Trạng thái:</label>
                                                        <div>
                                                            <c:if test="${prodetail.status == true}">
                                                                <div class="btn bg-success disabled status-display">
                                                                    Hoạt động
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${prodetail.status == false}">
                                                                <div class="btn bg-grey disabled status-display">
                                                                    Vô hiệu
                                                                </div>
                                                            </c:if>

                                                        </div>
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
                                    <h6 class="card-title">Ảnh sản phẩm</h6>
                                    <div class="header-elements">
                                        <button type="button" class="btn bg-success" data-toggle="modal" data-target="#modal_update_images">Cập nhật toàn bộ ảnh</button>
                                    </div>
                                </div>

                                <div class="card-body py-0">
                                    <div class="row text-center">
                                        <c:forEach var="imgde" items="${imagedetail}">
                                            <div class="col-sm-4">
                                                <div class="card">
                                                    <div class="card-img-actions m-1">
                                                        <img class="card-img img-fluid" src="${pageContext.request.contextPath}/images/product/${imgde.linkImage}" alt="">
                                                        <div class="card-img-actions-overlay card-img">
                                                            <a href="${pageContext.request.contextPath}/images/product/${imgde.linkImage}" class="btn btn-outline bg-white text-white border-white border-2 btn-icon rounded-round" data-popup="lightbox" rel="group">
                                                                <i class="icon-image2"></i>
                                                            </a>
                                                            <button  data-toggle="modal" data-id="${imgde.imgId}" data-productid="${imgde.productId}"  data-linkimage="${imgde.linkImage}"  data-ismain="${imgde.isMain}" data-target="#modal_update_image" class="edit_single_img btn btn-outline bg-white text-white border-white border-2 btn-icon rounded-round ml-2">
                                                                <i class="fas fa-wrench"></i>
                                                            </button>
                                                            <button  data-toggle="modal" data-id="${imgde.imgId}" data-productid="${imgde.productId}"  data-linkimage="${imgde.linkImage}"  data-ismain="${imgde.isMain}" data-target="#modal_delete_image" class="delete_single_img btn btn-outline bg-white text-white border-white border-2 btn-icon rounded-round ml-2">
                                                                <i class="icon-trash"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>                    

                                    </div>
                                </div>

                            </div>
                            <!-- /sales stats -->

                        </div>

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header header-elements-inline">
                                    <h5 class="card-title">Mô tả sản phẩm</h5>
                                    <div class="header-elements">
                                        <button type="button" class="btn bg-success"  data-toggle="modal" data-target="#update-description">Cập nhật</button>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <div>
                                        ${prodetail.description}
                                    </div>
                                </div>
                            </div>
                        </div>                                
                    </div>
                </div>

            </div>
            <!-- /main content -->
            <!-- Success modal -->
            <div id="modal_update2" class="modal fade" tabindex="-1">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header bg-success">
                            <h6 class="modal-title">Thêm Danh Mục</h6>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <div class="modal-body">
                            <form id="category-form" action="${pageContext.request.contextPath}/admin/product/updatePro" method="POST"  enctype="multipart/form-data" autocomplete="off">
                                <div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label>Tên sản phẩm:</label>
                                                <input name="productId" type="number" value="${prodetail.productId}" hidden>
                                                <input type="text" name="productName" value="${prodetail.productName}"  placeholder="Tên sản phẩm" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Danh mục:</label>
                                                <select name="categoryId" data-placeholder="Select Category" class="form-control selectpicker" data-live-search="true" title="Chọn danh mục" data-fouc>
                                                    <c:forEach var="c" items="${categories}">
                                                        <c:if test="${c.status == true}">

                                                            <c:choose>
                                                                <c:when test="${c.categoryId != prodetail.categoryId}">
                                                                    <option value="${c.categoryId}">${c.categoryName}</option>  
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option selected value="${c.categoryId}">${c.categoryName}</option>  
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>

                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <div class="col-md-6">
                                                <label>Thương hiệu:</label>
                                                <select name="brandId" data-placeholder="Select Brand" class="form-control selectpicker" data-live-search="true" title="Chọn thương hiệu" data-fouc>
                                                    <c:forEach var="b" items="${brands}">
                                                        <c:if test="${b.status == true}">

                                                            <c:choose>
                                                                <c:when test="${b.brandId != prodetail.brandId}">
                                                                    <option  data-content="<img class='option-img' src='${pageContext.request.contextPath}/images/brand/${b.brandImage}'><span class='text-dark'>   ${b.brandName}</span>" value="${b.brandId}"></option> 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option selected  data-content="<img class='option-img' src='${pageContext.request.contextPath}/images/brand/${b.brandImage}'><span class='text-dark'>   ${b.brandName}</span>" value="${b.brandId}"></option>  
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>


                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Giá:</label>
                                                <div class="input-group">
                                                    <input type="text" name="money" value="${prodetail.price}" class="form-control money2 text-right" placeholder="Giá tiền" >
                                                    <span class="input-group-append">
                                                        <span class="input-group-text">VNĐ</span>
                                                    </span>
                                                    <input name="price" type="number" value="${prodetail.price}" hidden>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="row">

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Status:</label>
                                                            <div>
                                                                <div class="can-toggle">
                                                                    <input name="status" id="status" type="checkbox" checked="true">
                                                                    <label for="status">
                                                                        <div class="can-toggle__switch" data-checked="On" data-unchecked="Off"></div>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>


                                <div class="text-right">
                                    <button type="reset" class="btn btn-light" id="reset2">Làm mới <i class="icon-reload-alt ml-2"></i></button>
                                    <button type="submit" class="btn bg-success">Lưu</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <div id="modal_themsl" class="modal fade" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header bg-success">
                            <h6 class="modal-title">Thêm số lượng</h6>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <form class="modal-body form-inline justify-content-center" action="${pageContext.request.contextPath}/admin/product/addQuantityPro" method="POST" autocomplete="off">
                            <div class="input-group">
                                <span class="input-group-prepend">
                                    <span class="input-group-text">Hiện có:</span>
                                    <span class="input-group-text text-right" style="width: 100px">${prodetail.quantity}</span><input value="${prodetail.productId}" name="productId" type="text" readonly hidden>
                                    <span class="input-group-text">Thêm</span>
                                </span>
                                <input type="text" name="quantity" class="form-control  text-right">
                            </div>
                            <button type="submit" class="btn bg-success ml-sm-2 mb-sm-0">Thêm <i class="icon-plus22"></i></button>
                        </form>

                    </div>
                </div>
            </div>
            <div id="modal_update_image" class="modal fade" tabindex="-1">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header bg-success">
                            <h6 class="modal-title">Cập nhật ảnh mới</h6>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <div class="modal-body">
                            <form id="category-form" action="${pageContext.request.contextPath}/admin/product/updateSingleImage" method="POST"  enctype="multipart/form-data" autocomplete="off">
                                <div class="form-group">
                                    <input id="imgId2" name="imgId" hidden>
                                    <input id="productId2" name="productId" hidden>
                                    <input id="linkImage2" name="linkImage" hidden>
                                    <input id="isMain2" name="isMain" hidden>
                                    <input name="file" type="file" class="file-input" accept="image/*"  data-show-upload="false" data-fouc>
                                    <!--<input name="file" type="file" accept="image/*" class="file-input-custom"  data-show-upload="false" data-show-caption="true" data-show-preview="true" data-fouc>-->
                                </div>
                                <div class="text-right">
                                    <button type="reset" class="btn btn-light">Làm mới <i class="icon-reload-alt ml-2"></i></button>
                                    <button type="submit" class="btn bg-success">Lưu</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <!-- /success modal -->
            <div id="modal_update_images" class="modal fade" tabindex="-1">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header bg-success">
                            <h6 class="modal-title">Cập nhật ảnh mới</h6>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <div class="modal-body">
                            <form id="category-form" action="${pageContext.request.contextPath}/admin/product/updateAllImages" method="POST"  enctype="multipart/form-data" autocomplete="off">
                                <div class="form-group">
                                    <input name="productId" value="${prodetail.productId}" hidden>
                                    <input name="productImage" type="file" accept="image/*" class="file-input-product" multiple="multiple" data-show-upload="false" data-show-caption="true" data-show-preview="true" data-fouc>
                                </div>
                                <div class="text-right">
                                    <button type="reset" class="btn btn-light">Làm mới <i class="icon-reload-alt ml-2"></i></button>
                                    <button type="submit" class="btn bg-success">Lưu</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <!-- Warning modal -->
            <div id="modal_delete_image" class="modal fade" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="category-form" action="${pageContext.request.contextPath}/admin/product/deleteSingleImage" method="POST"  enctype="multipart/form-data" autocomplete="off">
                            <div class="form-group">
                                <input id="imgId3" name="imgId" hidden>
                                <input id="productId3" name="productId" hidden>
                                <input id="linkImage3" name="linkImage" hidden>
                                <input id="isMain3" name="isMain" hidden>
                            </div>
                            <!-- Middle alignment -->
                            <div class="card card-body justify-content-center text-center border-0">
                                <div>
                                    <i class="icon-warning22 icon-2x text-warning border-warning border-3 rounded-round p-3 mb-3"></i>
                                    <h5 class="card-title">Xóa ảnh</h5>
                                    <p class="mb-3">Bạn có chắc muốn xóa không ?</p>
                                </div>
                            </div>
                            <!-- /middle alignment -->

                            <div class="modal-footer">
                                <button type="button" class="btn bg-grey" data-dismiss="modal">Hủy</button>
                                <button type="submit" class="btn bg-warning">Đông ý</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
            <!-- /warning modal -->
            <div id="update-description" class="modal fade" tabindex="-1">
                        <div class="modal-dialog modal-full">
                            <div class="modal-content">
                                <div class="modal-header bg-success">
                                    <h6 class="modal-title">Insert Product</h6>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <div class="modal-body">
                                    <form id="product-form" action="${pageContext.request.contextPath}/admin/product/updatedescription" method="POST"  enctype="multipart/form-data">

                                        <div class="row">
                                            <input name="productId" value="${prodetail.productId}" hidden>
                                            <div class="col-md-12" style="margin-top: 10px ">
                                                <label>Mô tả:</label>
                                                <textarea name="description" class="summernote-height">
							${prodetail.description}
                                                </textarea>
                                            </div>
                                        </div>

                                        <div class="text-right">
                                            <button type="reset" class="btn btn-light" id="reset2">Reset <i class="icon-reload-alt ml-2"></i></button>
                                            <button type="submit" class="btn bg-success">Save changes</button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
        </div>
        <!-- /page content -->
        <script>
            $('.selectpicker').selectpicker();
            $(".edit_single_img").on("click", function () {
                var imageId = $(this).data("id");
                var productId = $(this).data("productid");
                var linkImage = $(this).data("linkimage");
                var isMain = $(this).data("ismain");
                $("#imgId2").val(imageId);
                $("#productId2").val(productId);
                $("#linkImage2").val(linkImage);
                $("#isMain2").val(isMain);
            });

            $(".delete_single_img").on("click", function () {
                var imageId = $(this).data("id");
                var productId = $(this).data("productid");
                var linkImage = $(this).data("linkimage");
                var isMain = $(this).data("ismain");
                $("#imgId3").val(imageId);
                $("#productId3").val(productId);
                $("#linkImage3").val(linkImage);
                $("#isMain3").val(isMain);
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
                var validator2 = $('#product-form').validate({
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
                            maxlength: 50
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
                    validator2.resetForm();
                });
                $("#modal_theme_success").on('hidden.bs.modal', function () {
                    $("#reset2").click();
                });
            });


        </script>
        <script>
            var moneyy = $("input[name=money]").val().split('.')[0];
            $("input[name=money]").val(moneyy);
            $('.money2').simpleMoneyFormat();
            $(".money2").on("input", function () {

                var money = $(this).val().replace(/,/g, '');
                $("input[name=price]").val(money);
            });
        </script>
        <script>
            $(document).ready(function () {
                var updateAlert = 0;
                updateAlert = ${sessionScope.updateAlert}
                console.log(updateAlert);
                if (updateAlert === 1) {
                    new PNotify({
                        title: 'Cập nhật lỗi !',
                        text: '',
                        addclass: 'alert alert-danger alert-styled-left',
                        type: 'error'
                    });
                    updateAlert = 0;
                } else if (updateAlert === 2) {
                    new PNotify({
                        title: 'Cập nhật thành công !',
                        text: '',
                        addclass: 'alert alert-success alert-styled-left',
                        type: 'success'
                    });
                    updateAlert = 0;
                    console.log(updateAlert);
                }
            <% session.removeAttribute("updateAlert");%>
                var deleteAlert = 0;
                deleteAlert = ${sessionScope.deleteAlert}
                console.log(deleteAlert);
                if (deleteAlert === 1) {
                    new PNotify({
                        title: 'Không thể xóa !',
                        text: 'Không thể xóa ảnh chính',
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
    </body>
</html>