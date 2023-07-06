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
							style="height: 100%;">
							<h2>공지 수정</h2>
							<hr width="800px">
							<br>
							<form action="" method="post" enctype="multipart/form-data">
								<div class="form-group">
									제목 <input type="text" name="notice_title" class="form-control"
										style="width: 600px;" value="${vo.notice_title}"> <br>
									작성자 <input type="text" class="form-control"
										name="notice_writer" id="notice_writer"
										value="${sessionScope.emp_name}" readonly required
										style="width: 600px;"> <br> 
									내용 <textarea id="summernote" name="notice_content">${vo.notice_content}</textarea>
									<br>
									<input type="button" value="파일 추가" id="btnAdd"  class="btn btn-success btn-fw"> 
									<hr>
									<div id="divFile"></div>
									<hr>
								</div>
							  <button class="btn btn-success btn-fw" onclick="location.href='/notice/list'">공지 목록</button>
								<div style="text-align: right; margin-right: 580px;">
									<button class="btn btn-light btn-fw" type="reset">초기화</button>
									<button class="btn btn-success btn-fw" type="submit">수정 완료</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../includes/footer.jsp" %>
  <!-- 서머노트 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/notice/summernote/summernote-lite.css">
  <script src="${pageContext.request.contextPath}/resources/notice/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/notice/summernote/summernote-ko-KR.js"></script>
  <script type="text/javascript">
	  function checkForm() {
	    if (document.getElementsByName("notice_title")[0].value == "") {
	      alert("공지 제목을 입력하세요");
	      return false;
	    }
	    if (document.getElementsByName("notice_content")[0].value == "") {
	      alert("공지 내용을 입력하세요");
	      return false;
	    }
	    return true;
	  }

  $(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			  height: 400,                 // 에디터 높이
			  width: 1200,
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '공지 내용을 작성하세요 :)',
			  callbacks : { 
		            	onImageUpload : function(files, editor,
		                        welEditable) {
		                        for (var i = files.length - 1; i >= 0; i--) {
		                        uploadSummernoteImageFile(files[i],
		                        this);
		                        		}
		                        	}
		                        }
		});
		$('#summernote').summernote(setting);
	});

  $(document).ready(function(){
	  var cnt = 0;
	  
	  $("#btnAdd").click(function(){
		  if(cnt < 5){
		  $('#divFile').append("<input type='file' class='form-control' name='file"+(cnt++)+"' accept='image/*' style='width: 800px;'>");
		  cnt++;  
		  }
	  }); // btnAdd-click
  });

</script>	