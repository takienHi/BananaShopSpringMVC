<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Banana</title>

<!-- Global stylesheets -->
<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/admin/global_assets/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/admin/global_assets/css/icons/fontawesome/styles.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/admin/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/admin/assets/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/admin/assets/css/layout.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/admin/assets/css/components.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/admin/assets/css/colors.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/admin/assets/css/mycheckox.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/admin/assets/css/my_custom_css2.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/bootstrap-select.min.css">
<!-- /global stylesheets -->

<!-- Core JS files -->
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/main/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/main/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/loaders/blockui.min.js"></script>
<!-- /core JS files -->

<!-- Theme JS files -->

<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/forms/validation/validate.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/forms/inputs/touchspin.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/ui/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/pickers/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/notifications/bootbox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/forms/selects/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/editors/summernote/summernote.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/forms/styling/uniform.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/tables/datatables/datatables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/forms/styling/switchery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/forms/styling/switch.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/tables/datatables/extensions/buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/uploaders/fileinput/plugins/purify.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/uploaders/fileinput/plugins/sortable.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/uploaders/fileinput/fileinput.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/notifications/pnotify.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/pickers/pickadate/picker.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/pickers/pickadate/picker.date.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/plugins/media/fancybox.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/admin/assets/js/app.js"></script>

<!--<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/dashboard.js"></script>-->
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/form_layouts.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/datatables_basic.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/datatables_extension_buttons_init.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/form_checkboxes_radios.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/table_elements.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/form_validation.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/components_modals.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/editor_summernote.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/form_input_groups.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/uploader_bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/extra_pnotify.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/picker_date.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/gallery.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/global_assets/js/demo_pages/simple.money.format.js"></script>
<!--<script src="${pageContext.request.contextPath}/resources/admin/assets/js/my_custom_js2.js"></script>-->

<!-- /theme JS files -->
<style>
    .list-icons button{
        border: none;
        background-color: inherit;
        outline: none;
    }
    .status-display{
        min-width: 80px;
    }
    .validation-valid-label{
        display: none !important;
    }
</style>
<script>
    jQuery(function ($) {
        var path = window.location.href;

        // because the 'href' property of the DOM element is the absolute path
        $('ul a').each(function () {
            var path2 = this.href + "/";
            if (this.href === path || path2 === path) {
                $(this).addClass('active');
            }
        });
    });
</script>