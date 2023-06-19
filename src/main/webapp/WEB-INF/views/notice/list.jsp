<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	

<h1>공지 목록</h1>
<div class="box">
	<div class="box-body">
		<table>
			<tbody>
				<tr>
					<th style="width: 60px">번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th style="width: 60px">조회수</th>
				</tr>
				<c:forEach var="vo" items="${boardList }">
					<tr>
						<td>${vo.notice_id }</td>
						<td><a href="/notice/info?notice_id=${vo.notice_id }">${vo.notice_title }</a>
						</td>
						<td>${vo.notice_writer }</td>
						<td>${vo.notice_regdate }</td>
						<td><span class="badge bg-maroon"> ${vo.notice_count }
						</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<c:if test="${sessionScope.emp_id == 111}">
    <button onclick="location.href='/notice/insert'">공지 작성</button>
	</c:if>
	<!-- 본문내용 -->
	 result : ${result }
	<!-- 본문내용 -->
</div>
