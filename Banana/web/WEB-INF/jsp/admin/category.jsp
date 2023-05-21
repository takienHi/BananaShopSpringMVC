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
                    <!-- Content area -->
                    <div class="content">
                        <!-- Horizontal form options -->
                        <div class="row">

                            <div class="col-md-12">
                                <!-- Basic initialization -->
                                <div class="card">

                                    <div class="card-header header-elements-inline">
                                        <h5 class="card-title">Danh mục </h5>

                                        <div class="header-elements">
                                            <button type="button" class="btn bg-success" data-toggle="modal" data-target="#modal_theme_success">Insert <i class="icon-database-add ml-2"></i></button>
                                        </div>
                                    </div>


                                    <table class="table datatable-button-init-basic table-bordered">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Tên danh mục</th>
                                                <th>Trang thái</th>
                                                <th class="text-center" style="width: 50px"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <% int i = 1;  %>
                                        <c:forEach var="s" items="${categories}">
                                            <tr>
                                                <td>
                                                    <% out.println(i);
                                                    i++;%>
                                                </td>
                                                <td>${s.categoryName}</td>
                                                <td>
                                                    <c:if test="${s.status == true}">
                                                        <span class="badge badge-success">Hoạt động</span>
                                                    </c:if>
                                                    <c:if test="${s.status == false}">
                                                        <span class="badge badge-danger">Vô hiệu</span>
                                                    </c:if>

                                                </td>
                                                <td class="text-center">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn btn bg-success-400 border-indigo-400 border-2 btn-icon btn_edit" data-toggle="modal" data-target="#modal_theme_success" 
                                                                data-categoryid="${s.categoryId}" data-categoryname="${s.categoryName}" data-status="${s.status}">Edit</button>
                                                        <button type="button" class="btn btn-outline bg-warning-400 text-dark-400 border-indigo-400 border-2 btn-icon btn_delete" data-toggle="modal" data-target="#modal_theme_warning"
                                                                data-categoryid="${s.categoryId}">Delete</button>
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
                    <!-- Success modal -->
                    <div id="modal_theme_success" class="modal fade" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-success">
                                    <h6 class="modal-title">Thêm Danh Mục</h6>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <div class="modal-body">
                                    <form id="category-form" action="${pageContext.request.contextPath}/admin/category/saveCat" method="POST"  enctype="multipart/form-data" autocomplete="off">

                                        <div class="form-group">
                                            <input hidden name="categoryId" id="categoryId" value="0"/>
                                            <label>Tên danh mục:</label>
                                            <input name="categoryName" id="categoryName" type="text" class="form-control" placeholder="Category Name">
                                        </div>

                                        <div class="form-group">
                                            <label>Trang thái:</label>
                                            <div>
                                                <div class="can-toggle">
                                                    <input name="status" id="status" type="checkbox" checked="true">
                                                    <label for="status">
                                                        <div class="can-toggle__switch" data-checked="On" data-unchecked="Off"></div>
                                                    </label>
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
                    <!-- /success modal -->
                    <!-- Warning modal -->
                    <div id="modal_theme_warning" class="modal fade" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <!-- Middle alignment -->
                                <div class="card card-body justify-content-center text-center">
                                    <div>
                                        <i class="icon-warning22 icon-2x text-warning border-warning border-3 rounded-round p-3 mb-3"></i>
                                        <h5 class="card-title">Xóa danh mục</h5>
                                        <p class="mb-3">Bạn có chắc muốn xóa không ?</p>
                                    </div>
                                </div>
                                <!-- /middle alignment -->

                                <div class="modal-footer">
                                    <button type="button" class="btn bg-grey" data-dismiss="modal">Hủy</button>
                                    <a id="deletecat" href="${pageContext.request.contextPath}/admin/category/delete/"><button type="button" class="btn bg-warning">Đông ý</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /warning modal -->
                </div>
                <!-- /content area -->

            </div>
            <!-- /main content -->
        </div>
        <!-- /page content -->
        <script>
            $(".btn_edit").on("click", function () {
                var categoryId = $(this).data("categoryid");
                var categoryName = $(this).data("categoryname");
                var status = $(this).data("status");
                console.log(categoryId);
                console.log(categoryName);
                console.log(status);
                $("#categoryId").val(categoryId);
                $("#categoryName").val(categoryName);
                $("#status").attr('checked', status);
            });

            $(".btn_delete").on("click", function () {
                var categoryId = $(this).data("categoryid");
                var deleteHref = $("#deletecat").attr('href');
                $("#categoryId").val(categoryId);
                $("#deletecat").attr('href', deleteHref + categoryId);
                deleteHref = $("#deletecat").attr('href');
                console.log(deleteHref);
            });
        </script>
        <script>
            $(function () {
                // Initialize
                var validator = $('#category-form').validate({
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
                        categoryName: {
                            required: true,
                            minlength: 1,
                            maxlength: 50
                        }
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
                        text: 'Đã có sản phẩm thuộc danh mục này',
                        addclass: 'alert alert-danger alert-styled-left',
                        type: 'error'
                    });
                    deleteAlert = 0;
                }else if (deleteAlert === 2) {
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