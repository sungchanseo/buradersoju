<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="container-scroller">
	<div class="container-fluid page-body-wrapper full-page-wrapper">
		<div class="main-panel">
			<div class="content-wrapper d-flex align-items-center auth px-0" style="min-height: 100vh;">
				<div class="row w-100 mx-0" style="height: 100%;">
					<div class="col-lg-12 mx-auto" style="height: 100%;">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5"
							style="height: 100%;">
							<h2>공지 사항</h2>
							<hr>
							<br>
							<!-- 검색창기능 -->
							<form action="/notice/list" method="get" style="display: inline;">
								<select name="selector">
									<option value="notice_title">공지 제목</option>
									<option value="notice_writer">작성자</option>
								</select> <input type="text" name="search" placeholder="검색어를 입력해주세요">
								<input type="submit" class="btn btn-info" value="검색" style="margin-left: 10px;">
							</form>
							<br>
							<!-- 검색창기능 -->
							<br>
							<table class="table table-color">
								<tbody style="text-align: center;">
									<tr>
										<th style="width: 60px">번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
									<c:forEach var="vo" items="${noticeList }">
										<tr>
											<td>${vo.notice_id }</td>
											<td><a href="/notice/info?notice_id=${vo.notice_id }">${vo.notice_title }</a></td>
											<td>${vo.notice_writer }</td>
											<td>${vo.notice_regdate }</td>
											<td>${vo.notice_count }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>

							<div class="box-footer clearfix">
								<div style="display: flex; justify-content: space-between;">
									<!-- 페이징처리(하단부) -->
									<ul class="pagination pagination-sm no-margin pull-right" >
										<c:if test="${pm.prev }">
											<li><a href="/board/listPage?page=${pm.startPage-1 }">«</a></li>
										</c:if>
										<c:if test="${pvo.startPage > pvo.pageBlock }">
											<a
												href="/notice/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}"
												class="btn btn-outline-secondary">이전</a>
										</c:if>
										<c:forEach var="i" begin="${pvo.startPage }"
											end="${pvo.endPage }" step="1">
											<a
												href="/notice/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}"
												class="btn btn-outline-secondary">${i }</a>
										</c:forEach>

										<c:if test="${pvo.endPage<pvo.pageCount }">
											<a
												href="/notice/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}"
												class="btn btn-outline-secondary">다음</a>
										</c:if>
									</ul>
									<!-- 공지 작성 버튼 -->
									<div>
										<c:if test="${sessionScope.emp_department == '인사팀'|| sessionScope.emp_department == '전산팀'}">
											<button class="btn btn-success btn-fw"
												onclick="location.href='/notice/insert'">공지 작성</button>
										</c:if>
									</div>
									<!-- 공지 작성 버튼 -->
								</div>
							</div>
							<br>
							<!-- 페이징처리(하단부) -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp" %>
