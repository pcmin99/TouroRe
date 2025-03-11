<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty errorMessage}">
    <script>
        alert("${errorMessage}");
    </script>
</c:if>

<%-- login_failed.jsp --%>
<!DOCTYPE html>
<html>
<head>
    <!-- sweetalert.js -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <title>Login Failed</title>
</head>
<body>
    <script>
        swal("", "아이디 또는 비밀번호가 올바르지 않습니다.", "error");
        // alert("아이디 또는 비밀번호가 올바르지 않습니다.");
        history.back(); // 이전 페이지로 돌아감
    </script>
</body>
</html>