<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="container-scroller">
	<div class="container-fluid page-body-wrapper full-page-wrapper">
		<div class="main-panel">
			<div class="content-wrapper d-flex align-items-center auth px-0" >
				<div class="row w-100 mx-0">
					<div class="col-lg-12 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5"
							style="height: 1000px;">
							<table class="table table-color">
								<tbody style="text-align: center;">
									<tr>
										<th style="width: 60px">번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
									<c:forEach var="vo" items="${boardList }">
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
							<c:if test="${sessionScope.emp_id == 111}">
								<button class="btn btn-success btn-fw"
									onclick="location.href='/notice/insert'">공지 작성</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp" %>
