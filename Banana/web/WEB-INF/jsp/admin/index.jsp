<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="layout/linkcss.jsp"></jsp:include>

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
        </div>
        <!-- /page content -->

    </body>
</html>
