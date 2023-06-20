<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 수정(get-post)/삭제(post) 정보 전달용 -->
<%@ include file="../includes/header.jsp" %>
<div class="container-scroller">
	<div class="container-fluid page-body-wrapper full-page-wrapper">
		<div class="main-panel">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-12 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5"
							style="height: 1000px;">
							<form action="" method="post">
								No. <input type="text" class="form-control" style="width: 60px;" name="notice_id" value="${vo.notice_id }"
									readonly> 
								작성자 <input type="text" name="notice_writer"
									value="${sessionScope.emp_id}" class="form-control" style="width: 60px;" disabled required><br>
								<br> 제목 <input type="text"
									name="notice_title" class="form-control" style="width: 400px;" value="${vo.notice_title }"> <br>
								내용 <br>
								<textarea name="notice_content"
									class="form-control" 
									style="width: 800px; height: 400px;"
									placeholder="내용을 입력하세요"
									required>${vo.notice_content }</textarea>
								<br> <button class="btn btn-success btn-fw" type="submit">공지 수정</button>
							</form>
							<br> 
							<button class="btn btn-success btn-fw"
								onclick="location.href='/notice/list'">공지 목록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../includes/footer.jsp" %>