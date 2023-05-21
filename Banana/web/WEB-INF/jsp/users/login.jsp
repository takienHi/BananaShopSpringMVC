<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="layout/linkcss.jsp"></jsp:include>
            <style>
                .validation-valid-label{
                    display: none !important;
                }
                .validation-invalid-label{
                    color: #f44336 !important;
                }
            </style>
        </head>
        <body>
        <jsp:include page="layout/header.jsp"></jsp:include>

            <!-- Body main wrapper start -->
            <main>

                <div>
                    <ul class="nav" style="display: none;">
                        <li class="nav-item">
                            <a class="nav-link link-secondary active" id="album-tab" data-bs-toggle="tab" data-bs-target="#album" href="#">ALBUM</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link-secondary" id="about-tab" data-bs-toggle="tab" data-bs-target="#about" href="#">ABOUT</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link-secondary" id="forgot-tab" data-bs-toggle="tab" data-bs-target="#forgot" href="#">FORGOT</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link-secondary" id="newpass-tab" data-bs-toggle="tab" data-bs-target="#newpass" href="#">ABOUT</a>
                        </li>
                    </ul>

                    <div class="tab-content" id="tabContent">
                        <div class="tab-pane fade show active" id="album" role="tabpanel" aria-labelledby="album-tab">
                            <!-- Breadcrumb-area-start -->
                            <div class="breadcrumb-area pt-10 pb-10">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="breadcrumb__list">
                                                <span><a href="${pageContext.request.contextPath}/">Home</a></span>
                                            <span class="dvdr"><i class="fa-regular fa-angle-right"></i></span>
                                            <span>Login</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Breadcrumb-area-end -->

                        <!-- Register area start  -->
                        <div class="bd-login__area pt-110 pb-130">
                            <div class="container small-container">
                                <div class="row justify-content-center">
                                    <div class="col-12">
                                        <div class="bd-section__title-wrapper text-center mb-60">
                                            <h2 class="bd-section__title mb-30">Đăng nhập</h2>
                                        </div>
                                    </div>
                                    <div class="col-xl-8 col-lg-10">
                                        <div class="Login-form-wrapper">
                                            <div class="bd-postbox__contact">
                                                <form id="user-login" action="${pageContext.request.contextPath}/login/customerLogin" method="POST">
                                                    <div class="row">
                                                        <div class="col-xxl-12">
                                                            <div class="bd-postbox__singel-input">
                                                                <input type="text" name="usernamelogin" placeholder="Tên đăng nhập hoặc email">
                                                            </div>
                                                        </div>
                                                        <div class="col-xxl-12">
                                                            <div class="bd-postbox__singel-input">
                                                                <input type="password" name="passwordlogin" placeholder="Mật khẩu">
                                                            </div>
                                                        </div>
                                                        <div class="signup-action">
                                                            <div class="signup-action-check">
                                                                <input class="e-check-input" type="checkbox" id="sing-up">
                                                                <label class="sign-check" for="sing-up"><span>Lưu lại</span></label>
                                                            </div>
                                                        </div>
                                                        <div class="bd-sigin__action-button mb-20">
                                                            <button class="bd-fill__btn w-100">Đăng nhập</button>
                                                        </div>
                                                        <div class="bd-registered__wrapper">
                                                            <div class="not-register">
                                                                <span>Bạn chưa có tài khoản?</span><span onclick="document.getElementById('about-tab').click()"><a href="/" onclick="return false;"> Đăng ký</a></span>
                                                            </div>
                                                            <div class="forget-password">
                                                                <span onclick="document.getElementById('forgot-tab').click()"><a href="/" onclick="return false;"> Quên mật khẩu?</a></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Register area end  -->
                    </div>
                    <div class="tab-pane fade" id="about" role="tabpanel" aria-labelledby="about-tab">
                        <!-- Breadcrumb-area-start -->
                        <div class="breadcrumb-area pt-10 pb-10">
                            <div class="container">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="breadcrumb__list">
                                            <span><a href="${pageContext.request.contextPath}/">Home</a></span>
                                            <span class="dvdr"><i class="fa-regular fa-angle-right"></i></span>
                                            <span>Register</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Breadcrumb-area-end -->

                        <!-- Register area start  -->
                        <div class="bd-register__area pt-110 pb-130">
                            <div class="container small-container">
                                <div class="row justify-content-center">
                                    <div class="col-12">
                                        <div class="bd-section__title-wrapper text-center mb-60">
                                            <h2 class="bd-section__title mb-30">Đăng ký</h2>
                                        </div>
                                    </div>
                                    <div class="col-xl-8 col-lg-10">
                                        <div class="signup-form-wrapper">
                                            <div class="bd-postbox__contact">
                                                <form id="dangky-form" action="${pageContext.request.contextPath}/login/dang-ky" method="POST">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div>
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="checkout-form-list">
                                                                            <label>Họ và tên <span class="required">*</span></label>
                                                                            <input name="fullName" type="text" placeholder="Nguyên Văn An" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="checkout-form-list">
                                                                            <label>Ngày sinh <span class="required">*</span></label>

                                                                            <div class="datepicker date input-group">
                                                                                <div class="col-md-12">
                                                                                    <input type="text" name="dateOfBirth" placeholder="Chọn ngày" class="form-control">
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
                                                                            <input name="address" type="text" placeholder="Số nhà, phố (phường),thành phố (quận, huyện), Tỉnh thành" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="checkout-form-list">
                                                                            <label>Email <span class="required">*</span></label>
                                                                            <input name="email" type="text" placeholder="vidu2@gmail.com" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="checkout-form-list">
                                                                            <label>Số điện thoại <span class="required">*</span></label>
                                                                            <input name="phoneNumber" type="text" placeholder="0987654321" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="checkout-form-list">
                                                                            <label>Tên đăng nhập <span class="required">*</span></label>
                                                                            <input name="userName" type="text" placeholder="tendangnhap">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="checkout-form-list">
                                                                            <label>Mật khẩu <span class="required">*</span></label>
                                                                            <input id="passworddk" name="password" type="password" placeholder="Password">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="checkout-form-list">
                                                                            <label>Nhập lại mật khẩu <span class="required">*</span></label>
                                                                            <input name="repassword" type="password" placeholder="Password">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="checkout-form-list">
                                                                            <label>Giới tính <span class="required">*</span></label>
                                                                            <div class="signup-action-check">
                                                                                <div class=" signup-action-check">
                                                                                    <input class="e-check-input" name="gender" value="true" type="radio" checked>Nam
                                                                                </div>
                                                                                <div class="signup-action-check">
                                                                                    <input class="e-check-input" name="gender" value="false" type="radio">Nữ
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="bd-sigin__action-button mb-20">
                                                                        <button class="bd-fill__btn w-100">Đăng ký</button>
                                                                    </div>
                                                                    <div class="bd-resister__bottom-text text-center">
                                                                        <div class="bd-acount__login-text">
                                                                            <span>Bạn đã có tài khoản?<span onclick="document.getElementById('album-tab').click()"> <a href="/" onclick="return false;" >Đăng nhập</a></span></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Register area end  -->
                    </div>
                    <div class="tab-pane fade" id="forgot" role="tabpanel" aria-labelledby="forgot-tab">
                        <!-- Breadcrumb-area-start -->
                        <div class="breadcrumb-area pt-10 pb-10">
                            <div class="container">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="breadcrumb__list">
                                            <span><a href="${pageContext.request.contextPath}/">Home</a></span>
                                            <span class="dvdr"><i class="fa-regular fa-angle-right"></i></span>
                                            <span>Forgot password</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Breadcrumb-area-end -->

                        <!-- Register area start  -->
                        <div class="bd-login__area pt-110 pb-130">
                            <div class="container small-container">
                                <div class="row justify-content-center">
                                    <div class="col-12">
                                        <div class="bd-section__title-wrapper text-center mb-60">
                                            <h2 class="bd-section__title mb-30">Forgot password</h2>
                                        </div>
                                    </div>
                                    <div class="col-xl-8 col-lg-10">
                                        <div class="Login-form-wrapper">
                                            <div class="bd-postbox__contact">
                                                <form action="#">
                                                    <div class="row">
                                                        <div class="col-xxl-12">
                                                            <div class="bd-postbox__singel-input">
                                                                <input type="text" placeholder="Your email">
                                                            </div>
                                                        </div>
                                                        <div class="bd-sigin__action-button mb-20">

                                                            <span onclick="document.getElementById('newpass-tab').click()">
                                                                <button class="bd-fill__btn w-100" onclick="return false;">Send email</button>
                                                        </div>
                                                        <div class="bd-resister__bottom-text text-center">
                                                            <div class="bd-acount__login-text">
                                                                <span>Bạn đã có tài khoản ?<span onclick="document.getElementById('album-tab').click()"> <a href="/" onclick="return false;" >Đăng nhập</a></span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Register area end  -->
                    </div>
                    <div class="tab-pane fade" id="newpass" role="tabpanel" aria-labelledby="newpass-tab">
                        <!-- Breadcrumb-area-start -->
                        <div class="breadcrumb-area pt-10 pb-10">
                            <div class="container">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="breadcrumb__list">
                                            <span><a href="${pageContext.request.contextPath}/">Home</a></span>
                                            <span class="dvdr"><i class="fa-regular fa-angle-right"></i></span>
                                            <span>Reset password</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Breadcrumb-area-end -->

                        <!-- Register area start  -->
                        <div class="bd-login__area pt-110 pb-130">
                            <div class="container small-container">
                                <div class="row justify-content-center">
                                    <div class="col-12">
                                        <div class="bd-section__title-wrapper text-center mb-60">
                                            <h2 class="bd-section__title mb-30">Reset password</h2>
                                        </div>
                                    </div>
                                    <div class="col-xl-8 col-lg-10">
                                        <div class="Login-form-wrapper">
                                            <div class="bd-postbox__contact">
                                                <form action="#">
                                                    <div class="row">
                                                        <div class="col-xxl-12">
                                                            <div class="bd-postbox__singel-input">
                                                                <input type="text" placeholder="Code reset">
                                                            </div>
                                                        </div>

                                                        <div class="col-xl-12">
                                                            <div class="bd-postbox__singel-input">
                                                                <input type="password" placeholder="New password">
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-12">
                                                            <div class="bd-postbox__singel-input">
                                                                <input type="password" placeholder="Confirm password">
                                                            </div>
                                                        </div>
                                                        <div class="bd-sigin__action-button mb-20">
                                                            <button class="bd-fill__btn w-100">Reset password</button>
                                                        </div>
                                                        <div class="bd-resister__bottom-text text-center">
                                                            <div class="bd-acount__login-text">
                                                                <span>Already have an account?<span onclick="document.getElementById('album-tab').click()"> <a href="/" onclick="return false;" >Log in</a></span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Register area end  -->
                    </div>
                </div>

            </div>
        </main>
        <!-- Body main wrapper ebd -->

        <jsp:include page="layout/footer.jsp"></jsp:include>
        <script>
            $(function () {
                // Initialize
                var validator = $('#user-login').validate({
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
                        usernamelogin: {
                            required: true,
                            minlength: 1,
                            maxlength: 50
                        },
                        passwordlogin: {
                            required: true,
                            minlength: 1,
                            maxlength: 50
                        }
                    },
                    messages: {
                        usernamelogin: {
                            required: "Không được để trống phần này",
                            minlength: "Số kí tự phải lớn hơn {0}",
                            maxlength: "Số kí tự phải nhỏ hơn {0}"
                        },
                        passwordlogin: {
                            required: "Bạn phải nhập mật khẩu chứ",
                            minlength: "Số kí tự phải lớn hơn {0}",
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

                var validator2 = $('#dangky-form').validate({
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
//                            minAge: 12
                        },
                        password: {
                            required: true,
                            minlength: 5,
                            maxlength: 20
                        },
                        repassword: {
                            equalTo: '#passworddk'
                        },
                        email: {
                            required: true,
                            uniqueGmail: true,
                            gmailGoogle: true
                        },
                        userName: {
                            required: true,
                            uniqueUserName: true,
                            minlength: 5
                        },
                        phoneNumber: {
                            required: true,
                            uniquePhone: true,
                            phoneVN: true
                        },
                        address: {
                            required: true
                        }
                    },
                    messages: {
                        fullName: {
                            required: "Không được để trống họ và tên",
                            minlength: "Số kí tự phải lớn hơn {0}",
                            maxlength: "Số kí tự phải nhỏ hơn {0}"
                        },
                        dateOfBirth: {
//                            minAge: "Bạn cần phải trên ({0} tuổi) để đặt hàng"
                        },
                        password: {
                            required: "Không được để trống mật khẩu",
                            minlength: "Số kí tự phải lớn hơn {0}",
                            maxlength: "Số kí tự phải nhỏ hơn {0}"
                        },
                        repassword: {
                            equalTo: 'Mật khẩu nhập lại không đúng !'
                        },
                        email: {
                            required: "Không được để trống gmail",
                            uniqueGmail: "Đã tồn tại Email name này !"
                        },
                        userName: {
                            required: "Không được để trống tên đăng nhập",
                            maxlength: "Số kí tự phải nhỏ hơn {0}"
                        },
                        phoneNumber: {
                            required: "Không được để trống số điện thoại",
//                            uniquePhone: "Đã tồn tại số điện thoại này",
                            phoneVN: "Không phải số điên thoại tại Việt Nam"
                        },
                        address: {
                            required: "vui lòng nhập địa chỉ"
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
            });


        </script>

        <script>
            $(function () {
                $('input[name="dateOfBirth"]').daterangepicker({
                    singleDatePicker: true,
                locale: {
                    format: 'DD-MM-YYYY'
                }
                });
            });
        </script>
    </body>
</html>