<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<h1>공지 수정</h1>
<!-- 수정(get-post)/삭제(post) 정보 전달용 -->

<form action="" method="post">
		No. <input type="text" name="notice_id" value="${vo.notice_id }" readonly> <br>
		 제목 <input type="text" name="notice_title" value="${vo.notice_title }"> <br>
		 작성자 <input type="text" name="notice_writer" value="${sessionScope.emp_id}" disabled required><br>
		 내용 <br><textarea class="form-control" name="notice_content" style="width: 300px; height: 150px;" placeholder="내용을 입력하세요" required>${vo.notice_content }</textarea><br> 
		 <input type="submit" value="공지 수정">
</form>
<button onclick="location.href='/notice/list'">공지 목록</button>
