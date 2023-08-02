<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<body>
    <script>
        alert("로그아웃 되었습니다!");
        window.history.replaceState({}, "", "/main/login");
        history.back();
    </script>
</body>
</html>