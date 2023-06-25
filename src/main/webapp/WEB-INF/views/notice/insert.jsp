<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%@ include file="../includes/header.jsp" %>
<div class="container-scroller">
	<div class="container-fluid page-body-wrapper full-page-wrapper">
		<div class="main-panel">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-12 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5" style="height: 1000px;">
							<form role="form" method="post">
								<div class="form-group">
										제목 <input type="text"
										class="form-control" name="notice_title" id="notice_title"
										placeholder="제목을 입력하세요" required style="width: 400px;">
								
										작성자 <input type="text"
										class="form-control" name="notice_writer" id="notice_writer"
										value="${sessionScope.emp_name}" readonly required
										style="width: 400px;">
								
										내용<textarea class="form-control" name="notice_content"
										id="notice_content" rows="3" placeholder="내용을 입력하세요" required
										style="width: 600px; height: 300px;"></textarea>
								</div>
								<button class="btn btn-success btn-fw" type="submit">공지
									등록</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../includes/footer.jsp" %>