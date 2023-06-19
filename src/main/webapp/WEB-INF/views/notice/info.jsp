<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>공지 상세보기</h1>
<form role="form" id="fr">
	<input type="hidden" name="bno" value="${vo.notice_id }">
</form>

<div class="box-body">
	<div class="form-group">
		<label for="exampleInputEmail1">No.</label> <input type="text"
			name="title" class="form-control" id="exampleInputEmail1" readonly
			value="${vo.notice_id }">
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">제 목</label> <input type="text"
			name="title" class="form-control" id="exampleInputEmail1" readonly
			value="${vo.notice_title }">
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">작성일</label> <input type="text"
			name="title" class="form-control" id="exampleInputEmail1" readonly
			value="${vo.notice_regdate }">
	</div>
	<div class="form-group">
		<label>내 용</label><br>
		<textarea class="form-control" style="width: 300px; height: 150px;" name="content" rows="3" readonly>${vo.notice_content }</textarea>
	</div>
</div>


<div class="box-footer">
	<!-- 	<button type="button" class="btn btn-success"  
			         onclick=" location.href='/board/listALL';"
			>목록으로</button> -->
			
<c:if test="${sessionScope.emp_id == 111}">
	<button onclick="location.href='/notice/modify?notice_id=${vo.notice_id}'">수정하기</button>

	<button onclick="location.href='/notice/list'">공지 목록</button>
	<form action="/notice/remove" method="post" onsubmit="return confirmDelete()">
	  <input type="hidden" name="notice_id" value="${vo.notice_id}">
	  <button type="submit">삭제하기</button>
	</form>
	<script>function confirmDelete() {return confirm("삭제하시겠습니까?");}</script>
</c:if>

</div>

