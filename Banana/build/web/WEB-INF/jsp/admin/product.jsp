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


                                    <table class="table datatable-button-init-basic table-bordered">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Ảnh</th>
                                                <th>Tên sản phẩm</th>
                                                <th>Danh mục</th>
                                                <th>Thương hiệu</th>
                                                <th>Giá</th>
                                                <th>Số lượng</th>
                                                <th>Status</th>
                                                <th class="text-center" style="width: 50px">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <% int i = 1;  %>
                                        <c:forEach var="s" items="${products}">
                                            <tr>
                                                <td><% out.println(i);
                                                    i++;%></td>
                                                <td>
                                                    <img class="product-img" src="${pageContext.request.contextPath}/images/product/${s.image}"/>
                                                </td>
                                                <td>${s.productName}</td>
                                                <td>${s.categoryName}</td>
                                                <td>${s.brandName}</td>
      
                                                <td style="width: 120px;"><span><fmt:formatNumber value = "${s.price}" type = "currency"/></span></td>
                                                <td>${s.quantity}</td>
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
                                                        <a type="button" href="${pageContext.request.contextPath}/admin/product/detail-product/${s.productId}" class="btn btn bg-success-400 border-indigo-400 border-2 btn-icon btn_edit">Detail</a>
                                                        <button type="button" class="btn btn-outline bg-warning-400 text-dark-400 border-indigo-400 border-2 btn-icon btn_delete" data-toggle="modal" data-target="#modal_theme_warning"
                                                                data-productid="${s.productId}">Delete</button>
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
                        <div class="modal-dialog modal-full">
                            <div class="modal-content">
                                <div class="modal-header bg-success">
                                    <h6 class="modal-title">Thêm sản phẩm</h6>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <div class="modal-body">
                                    <form id="product-form" action="${pageContext.request.contextPath}/admin/product/saveProduct" method="POST"  enctype="multipart/form-data">

                                        <div class="row">
                                            <div class="col-md-6">
                                                <fieldset>

                                                    <div class="form-group">
                                                        <label>Tên sản phẩm:</label>
                                                        <input type="text" name="productName" class="form-control" placeholder="sản phẩm abc">
                                                    </div>


                                                    <div class="form-group">

                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Giá:</label>
                                                                    <div class="input-group">
                                                                        
                                                                        <input id="monney" name="money" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0+/, '');"  type="text" value="25000" class="form-control text-right money2">
                                                                        
                                                                        <span class="input-group-prepend">
                                                                            <span class="input-group-text">VNĐ</span>
                                                                        </span>
                                                                    </div>
                                                                    <input name="price" type="number" value="25000" hidden>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Số lượng:</label>
                                                                    <input name="quantity" type="text" value="1" class="form-control text-right touchspin-set-value">
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>

                                            <div class="col-md-6">
                                                <fieldset>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Danh mục:</label>
                                                                <select name="categoryId" data-placeholder="Select Category" class="form-control selectpicker" data-live-search="true" title="Choose Category" data-fouc>
                                                                    <c:forEach var="s" items="${categories}">
                                                                        <option value="${s.categoryId}">${s.categoryName}</option> 
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Thương hiệu:</label>
                                                                <select name="brandId" data-placeholder="Select Brand" class="form-control selectpicker" data-live-search="true" title="Choose Brand" data-fouc>
                                                                    <c:forEach var="s" items="${brands}">
                                                                        <option  data-content="<img class='option-img' src='${pageContext.request.contextPath}/images/brand/${s.brandImage}'><span class='text-dark'>   ${s.brandName}</span>" value="${s.brandId}"></option> 
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
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


                                                </fieldset>
                                            </div>
                                            <div class="col-md-12">
                                                <label>Product Images:</label>
                                                <div>
                                                    <input name="productImage" type="file" accept="image/*" class="file-input-product" multiple="multiple" data-show-upload="false" data-show-caption="true" data-show-preview="true" data-fouc>
                                                </div>
                                            </div>
                                            <div class="col-md-12" style="margin-top: 10px ">
                                                <label>Description:</label>
                                                <textarea name="description" class="summernote-height">
							<h2>Apollo 11</h2>
							<div class="float-right" style="margin-left: 20px;"><img alt="Saturn V carrying Apollo 11" class="right" src="http://c.cksource.com/a/1/img/sample.jpg"></div>

							<p><strong>Apollo 11</strong> was the spaceflight that landed the first humans, Americans <a href="#">Neil Armstrong</a> and <a href="#">Buzz Aldrin</a>, on the Moon on July 20, 1969, at 20:18 UTC. Armstrong became the first to step onto the lunar surface 6 hours later on July 21 at 02:56 UTC.</p>

							<p class="mb-3">Armstrong spent about <s>three and a half</s> two and a half hours outside the spacecraft, Aldrin slightly less; and together they collected 47.5 pounds (21.5&nbsp;kg) of lunar material for return to Earth. A third member of the mission, <a href="#">Michael Collins</a>, piloted the <a href="#">command</a> spacecraft alone in lunar orbit until Armstrong and Aldrin returned to it for the trip back to Earth.</p>

							<h5 class="font-weight-semibold">Technical details</h5>
							<p>Launched by a <strong>Saturn V</strong> rocket from <a href="#">Kennedy Space Center</a> in Merritt Island, Florida on July 16, Apollo 11 was the fifth manned mission of <a href="#">NASA</a>'s Apollo program. The Apollo spacecraft had three parts:</p>
							<ol>
								<li><strong>Command Module</strong> with a cabin for the three astronauts which was the only part which landed back on Earth</li>
								<li><strong>Service Module</strong> which supported the Command Module with propulsion, electrical power, oxygen and water</li>
								<li><strong>Lunar Module</strong> for landing on the Moon.</li>
							</ol>
							<p class="mb-3">After being sent to the Moon by the Saturn V's upper stage, the astronauts separated the spacecraft from it and travelled for three days until they entered into lunar orbit. Armstrong and Aldrin then moved into the Lunar Module and landed in the <a href="#">Sea of Tranquility</a>. They stayed a total of about 21 and a half hours on the lunar surface. After lifting off in the upper part of the Lunar Module and rejoining Collins in the Command Module, they returned to Earth and landed in the <a href="#">Pacific Ocean</a> on July 24.</p>

							<h5 class="font-weight-semibold">Mission crew</h5>
							<div class="card card-table table-responsive shadow-0">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Position</th>
											<th>Astronaut</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Commander</td>
											<td>Neil A. Armstrong</td>
										</tr>
										<tr>
											<td>Command Module Pilot</td>
											<td>Michael Collins</td>
										</tr>
										<tr>
											<td>Lunar Module Pilot</td>
											<td>Edwin "Buzz" E. Aldrin, Jr.</td>
										</tr>
									</tbody>
								</table>
							</div>

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
                    <!-- /success modal -->
                    <!-- Warning modal -->
                    <div id="modal_theme_warning" class="modal fade" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <!-- Middle alignment -->
                                <div class="card card-body justify-content-center text-center">
                                    <div>
                                        <i class="icon-warning22 icon-2x text-warning border-warning border-3 rounded-round p-3 mb-3"></i>
                                        <h5 class="card-title">Delete Product</h5>
                                        <p class="mb-3">Are you sure ?</p>
                                    </div>
                                </div>
                                <!-- /middle alignment -->

                                <div class="modal-footer">
                                    <button type="button" class="btn bg-grey" data-dismiss="modal">Close</button>
                                    <a id="deletecat" href="${pageContext.request.contextPath}/admin/product/delete/"><button type="button" class="btn bg-warning">Im sure</button></a>
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