<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<body>
    <script>
        alert("접근 권한이 없습니다!");
        window.history.replaceState({}, "", "/main/login");
        history.back();
    </script>
</body>
</html>