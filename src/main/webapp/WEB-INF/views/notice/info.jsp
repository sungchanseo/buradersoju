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
							style="height: 1000px;">
							<div class="box-body">
								<div class="form-group">
									No.<input type="text" name="notice_id" class="form-control" style="width: 60px;"
										readonly value="${vo.notice_id }">
								</div>
								<div class="form-group">
									제 목 <input type="text" name="notice_title" class="form-control" style="width: 400px;"
										readonly value="${vo.notice_title }">
								</div>
								<div class="form-group">
									작성일 <input type="text" name="notice_content"
										class="form-control" style="width: 400px;" readonly value="${vo.notice_regdate }">
								</div>
								<div class="form-group">
									<label>내 용</label><br>
									<textarea class="form-control"
										style="width: 800px; height: 400px;" readonly
										name="notice_content">${vo.notice_content }
									</textarea>
								</div>
							</div>

							<!-- 수정, 목록, 삭제 버튼-->
							<c:if test="${sessionScope.emp_id == 111}">
								<div class="button-container">
									<button class="btn btn-success btn-fw"
										onclick="location.href='/notice/modify?notice_id=${vo.notice_id}'">수정하기</button>
									<button class="btn btn-success btn-fw"
										onclick="location.href='/notice/list'">공지 목록</button>
									<form action="/notice/remove" method="post"
										onsubmit="return confirmDelete()">
										<input type="hidden" name="notice_id" value="${vo.notice_id}">
										<br>
										<button class="btn btn-success btn-fw" type="submit">삭제하기</button>
									</form>
								</div>
								<script>function confirmDelete() {return confirm("공지를 삭제하시겠습니까?");}</script>
							</c:if>
							<!-- 수정, 목록, 삭제 버튼-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp" %>
