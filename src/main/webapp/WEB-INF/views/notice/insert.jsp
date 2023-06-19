<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
<head>
<meta charset="UTF-8">
<title>공지 등록</title>
</head>
<body>
<h1>공지 등록</h1>
<form role="form" method="post">
    <div class="form-group">
        <label>제목</label>
        <input type="text" name="notice_title" placeholder="제목을 입력하세요" required><br>
        <label>작성자</label>
        <input type="text" name="notice_writer" value="${sessionScope.emp_id}" disabled required><br>
        <label>내용</label>
        <textarea class="form-control" name="notice_content" rows="3" placeholder="내용을 입력하세요" required></textarea>
    </div>
    <button type="submit" class="">글쓰기</button>
</form>
</body>
</html>

