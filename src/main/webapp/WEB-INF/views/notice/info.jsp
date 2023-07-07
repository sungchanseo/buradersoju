<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../includes/header.jsp" %>

<form role="form" id="fr">
	<input type="hidden" name="bno" value="${vo.notice_id }">
</form>
<div class="container-scroller">
	<div class="container-fluid page-body-wrapper full-page-wrapper">
		<div class="main-panel">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-12 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5"
							style="height: 100%;">
							<div class="box-body">
								<h2>공지 사항</h2>
								<hr>
								<br>
								<table class="table" style="width: 100%;">
									<tbody>
										<tr>
											<td><h3>No. ${vo.notice_id }</h3></td>
											<td><h3>${vo.notice_title }</h3></td>
											<td colspan="5"></td>
										</tr>
										<tr>
											<td colspan="2" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></td>
											<td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">작성자</td>
											<td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${vo.notice_writer}</td>
											<td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">작성일</td>
											<td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${vo.notice_regdate}</td>
											<td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">조회수</td>
											<td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${vo.notice_count}</td>
										</tr>
										<tr>
											<td>내용</td>
											<td>
												<div>${vo.notice_content}</div>
											</td>
										</tr>
										<tr>
											<td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">첨부파일</td>
											<td>
												<div>
												<a href="/notice/fileDown?fileName=${vo.notice_file.split('/')[1] }">${vo.notice_file.split('/')[1] }</a>
												<a href="/notice/fileDown?fileName=${vo.notice_file.split('/')[2] }">${vo.notice_file.split('/')[2] }</a>
												<a href="/notice/fileDown?fileName=${vo.notice_file.split('/')[3] }">${vo.notice_file.split('/')[3] }</a>	
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<br>
								<div>
									
									
								</div>
							</div>
							<br>
							<!-- 수정, 목록, 삭제 버튼 -->
							<button class="btn btn-success btn-fw"
										onclick="location.href='/notice/list'">공지 목록</button>
							<c:if test="${sessionScope.emp_department == '인사팀'|| sessionScope.emp_department == '전산팀'}">
								<div class="button-container d-flex justify-content-end">
									<button class="btn btn-success btn-fw"
										onclick="location.href='/notice/modify?notice_id=${vo.notice_id}'" style="margin-right: 10px;">수정</button>
									<form action="/notice/remove" method="post"
										onsubmit="return confirmDelete()">
										<input type="hidden" name="notice_id" value="${vo.notice_id}">
										<button class="btn btn-success btn-fw" type="submit">삭제</button>
									</form>
								</div>
								<script>
									function confirmDelete() {
										return confirm("공지를 삭제하시겠습니까?");
									}
								</script>
							</c:if>
							<!-- 수정, 목록, 삭제 버튼 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp" %>
