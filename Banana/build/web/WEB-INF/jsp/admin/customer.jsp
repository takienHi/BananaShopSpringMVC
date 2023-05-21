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
                .form-check-inline{
                    height: 36px;
                }
                .bootstrap-select{
                    display: inline-grid !important;
                }
                .bootstrap-select label{
                    order: 2;
                } 
                .calendar-table .month .monthselect{
                    width: 40%;
                }
                .calendar-table .month .yearselect {
                    width: 56%;
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
                                        <h5 class="card-title">Khách hàng </h5>

                                        <div class="header-elements">
                                            <!--<button type="button" class="btn bg-success" data-toggle="modal" data-target="#modal_theme_success">Insert <i class="icon-database-add ml-2"></i></button>-->
                                        </div>
                                    </div>


                                    <table class="table datatable-button-init-basic table-bordered">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Họ và tên</th>
                                                <th>Số điện thoại</th>
                                                <th>Email</th>
                                                <th>Giới tính</th>
                                                <th>Ngày Sinh</th>
                                                <th>Trạng thái</th>
                                                <th class="text-center" style="width: 100px"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <% int i = 1;  %>
                                        <c:forEach var="s" items="${customers}">
                                            <tr>
                                                <td><% out.println(i);
                                                    i++;%></td>
                                                <td>
                                                    ${s.fullName}
                                                </td>
                                                <td>${s.phoneNumber}</td>
                                                <td>${s.email}</td>
                                                <td> 
                                                    <c:if test="${s.gender == true}">
                                                        Nam
                                                    </c:if>
                                                    <c:if test="${s.gender == false}">
                                                        Nữ
                                                    </c:if>
                                                </td>
                                                <td>${s.dateOfBirth}</td>
                                                <td>
                                                    <c:if test="${s.status == true}">
                                                        <span class="badge badge-success">Active</span>
                                                    </c:if>
                                                    <c:if test="${s.status == false}">
                                                        <span class="badge badge-danger">Disabled</span>
                                                    </c:if>
                                                </td>
                                                <td class="text-center">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn btn bg-success-400 border-indigo-400 border-2 btn-icon btn_edit" data-toggle="modal" data-target="#modal_theme_success" 
                                                                data-customerid="${s.customerId}" data-fullname="${s.fullName}" data-address="${s.address}" data-gender="${s.gender}" data-dateb="${s.dateOfBirth}" data-phonenumber="${s.phoneNumber}" data-email="${s.email}" data-username="${s.userName}" data-password="${s.password}" data-status="${s.status}">Xem</button>
                                                        

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
                                    <h6 class="modal-title">Khách hàng</h6>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <div class="modal-body">
                                    <form id="employee-form" action="${pageContext.request.contextPath}/admin/customer/updateCusStatus" method="POST"  enctype="multipart/form-data" autocomplete="off">

                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Họ và tên:</label>
                                                    <div class="form-group form-group-feedback form-group-feedback-right">
                                                        <input type="text" id="fullName5" class="form-control" readonly>
                                                        <input type="text" name="customerId" id="employeeId5" hidden>
                                                        <div class="form-control-feedback">
                                                            <i class="icon-user-check text-muted"></i>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <label>Ngày sinh:</label>
                                                    <div class="form-group form-group-feedback form-group-feedback-right">
                                                        <input type="text" id="dateOfBirth5" class="form-control" readonly>
                                                        <div class="form-control-feedback">
                                                            <i class="icon-calendar2 text-muted"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Tên đăng nhập:</label>
                                                    <div class="form-group form-group-feedback form-group-feedback-right">
                                                        <input type="text" id="userName5" class="form-control" readonly>
                                                        <div class="form-control-feedback">
                                                            <i class="icon-user-check text-muted"></i>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <label>Số điện thoại:</label>
                                                    <div class="form-group form-group-feedback form-group-feedback-right">
                                                        <input type="text" id="phone5" class="form-control"  readonly>
                                                        <div class="form-control-feedback">
                                                            <i class="icon-phone-plus2 text-muted"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Gmail:</label>
                                                    <div class="form-group form-group-feedback form-group-feedback-right">
                                                        <input type="text" id="email5" class="form-control"  readonly>
                                                        <div class="form-control-feedback">
                                                            <i class="icon-mention text-muted"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Giới tính:</label>
                                                    <div class="form-group form-group-feedback form-group-feedback-right">
                                                        <input type="text" id="gender5" class="form-control" readonly>
                                                        <div class="form-control-feedback">
                                                            <i class="fas fa-transgender text-muted"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Địa chỉ:</label>
                                                        <textarea id="address5" name="address" rows="5" cols="5" class="form-control" readonly></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Trạng thái:</label>
                                                        <div>
                                                            <div class="can-toggle">
                                                                <input name="status" id="status5" type="checkbox" checked="true">
                                                                <label for="status5">
                                                                    <div class="can-toggle__switch" data-checked="On" data-unchecked="Off"></div>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-right">
                                            
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
                                        <i class="icon-info22 icon-2x text-info border-info border-3 rounded-round p-3 mb-3"></i>
                                        <h5 class="card-title">Bạn chắc chứ ?</h5>
                                    </div>
                                </div>
                                <!-- /middle alignment -->

                                <div class="modal-footer">
                                    <button type="button" class="btn bg-grey" data-dismiss="modal">Hủy</button>
                                    <a id="deletecat" href="${pageContext.request.contextPath}/admin/category/delete/"><button type="button" class="btn bg-info">Đồng ý</button></a>
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
        <jsp:include page="layout/footer.jsp"></jsp:include>
            <script>
                $(".btn_edit").on("click", function () {
                    var employeeId = $(this).data("customerid");
                    var roleId = $(this).data("roleid");
                    var fullName = $(this).data("fullname");
                    var userName = $(this).data("username");
                    var address = $(this).data("address");
                    var gender = $(this).data("gender");
                    var dateOfBirth = $(this).data("dateb");
                    var phoneNumber = $(this).data("phonenumber");
                    var email = $(this).data("email");
                    var password = $(this).data("password");
                    var status = $(this).data("status");
                    $("#employeeId5").val(employeeId);
                    $("#fullName5").val(fullName);
                    $("#dateOfBirth5").val(dateOfBirth);
                    $("#userName5").val(userName);
                    $("#phone5").val(phoneNumber);
                    $("#email5").val(email);
                    $("#address5").val(address);
                    if (gender === true) {
                        $("#gender5").val("Nam");
                    } else {
                        $("#gender5").val("Nữ");
                    }
                    $("#address5").val();
                    $('select[name=selValue]').val(roleId);
                    $('.selectpicker').selectpicker('refresh');
                    $("#status5").attr('checked', status);
                });

                $(".btn_delete").on("click", function () {
                    var fullName = $(this).data("categoryid");
                    var deleteHref = $("#deletecat").attr('href');
                    $("#fullName").val(fullName);
                    $("#deletecat").attr('href', deleteHref + fullName);
                    deleteHref = $("#deletecat").attr('href');
                    console.log(deleteHref);
                });
        </script>
        <script>
            $(function () {
                // Initialize
                var validator = $('#employee-form').validate({
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
                        dateOfBirth: {
                            minAge: 18
                        },
                        password: {
                            required: true,
                            minlength: 5,
                            maxlength: 20
                        },
                        repeat_password: {
                            equalTo: '#password'
                        },
                        email: {
                            required: true,
                            uniqueGmail: true,
                            gmailGoogle: true
                        },
                        repeat_email: {
                            equalTo: '#email'
                        },
                        userName: {
                            required: true,
                            uniqueUserName: true,
                            minlength: 5
                        },
                        phone: {
                            required: true,
                            uniquePhone: true,
                            phoneVN: true
                        }
                    },
                    messages: {
                        fullName: {
                            required: "Không được để trống họ và tên",
                            minlength: "Số kí tự phải lớn hơn {0}",
                            maxlength: "Số kí tự phải nhỏ hơn {0}"
                        },
                        dateOfBirth: {
                            minAge: "Chưa đủ tuổi lao động ({0} tuổi)"
                        },
                        password: {
                            required: "Không được để trống mật khẩu",
                            minlength: "Số kí tự phải lớn hơn {0}",
                            maxlength: "Số kí tự phải nhỏ hơn {0}"
                        },
                        repeat_password: {
                            equalTo: 'Mật khẩu nhập lại không đúng !'
                        },
                        email: {
                            required: "Không được để trống gmail"
                        },
                        repeat_email: {
                            equalTo: 'Email nhập lại không đúng !'
                        },
                        userName: {
                            required: "Không được để trống tên đăng nhập",
                            uniqueEmp: "Đã tồn tại user name này !",
                            maxlength: "Số kí tự phải nhỏ hơn {0}"
                        },
                        phone: {
                            required: "Không được để trống số điện thoại",
                            phoneVN: "Không phải số điên thoại tại Việt Nam"
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
        <script>
            $(document).ready(function () {
                var deleteAlert = '0';
                deleteAlert = ${sessionScope.deleteAlert} + '';
                if (deleteAlert === '1') {
                    new PNotify({
                        title: 'Không thể xóa !',
                        text: 'Đã có sản phẩm thuộc danh mục này',
                        addclass: 'alert alert-danger alert-styled-left',
                        type: 'error'
                    });
                    deleteAlert = '0';
                } else if (deleteAlert === '2') {
                    new PNotify({
                        title: 'Xóa thành công !',
                        text: '',
                        addclass: 'alert alert-success alert-styled-left',
                        type: 'success'
                    });
                    deleteAlert = '0';
                    console.log(deleteAlert);
                }
            <% session.removeAttribute("deleteAlert");%>
            });
        </script>
        <script>
            $('.daterange-single2').daterangepicker({
                singleDatePicker: true,
                showDropdowns: true,
                locale: {
                    format: 'DD-MM-YYYY',
                    "daysOfWeek": [
                        "Hai",
                        "Ba",
                        "Tư",
                        "Năm",
                        "Sáu",
                        "Bảy",
                        "CN"
                    ],
                    "monthNames": [
                        "1",
                        "2",
                        "3",
                        "4",
                        "5",
                        "6",
                        "7",
                        "8",
                        "9",
                        "10",
                        "11",
                        "12"
                    ],
                }
            });
        </script>
    </body>
</html>