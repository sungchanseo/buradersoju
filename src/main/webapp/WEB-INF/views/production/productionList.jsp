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

								<!-- 이 곳에 내용 작성하시면 됩니다 -->
								
									<style type="text/css">
									/* 인쇄하기 가로 기본출력 지정 */
										@page { size: A4 landscape; margin:0; }
									</style>
								
								<h1>생산목록</h1>
										제목 <input type="text"
										class="form-control" name="" id=""
										placeholder="샘플을 입력하세요" required style="width: 400px;">

										내용<textarea class="form-control" name="notice_content"
										id="notice_content" rows="3" placeholder="샘플을 입력하세요" required
										style="width: 600px; height: 300px;"></textarea>
										
								<input type="button" value="등록" onclick="openPopup();">

								<button>엑셀파일</button>
								<button class="print-button" onclick="info_print()">인쇄하기</button>
										
								<h1>샘플 테이블</h1>		
								<table class="table table-color">
								<tbody>
									<tr>
										<th style="width: 60px">번호</th>
										<th>작업지시번호</th>
										<th>생산라인</th>
										<th>상품코드</th>
										  <th>상품명</th>
										  <th>수주량</th>
										  <th>생산수량</th>
										  <th>불량수량</th>
										  <th>불량률</th>
										  <th>생산담당자</th>
										  <th>생산단계</th>
										  <th>작업완료일시</th>
									</tr>
										<c:forEach var="productionList" items="${productionList }">
	 <tr>  
	  <td>
		<a href="./workOrder?production_id=${productionList.production_id}"
		onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">
		${productionList.production_id}
		</a>
	  </td>
	  <td>
	  	<a href="/contract/info?cont_id=${productionList.cont_id }"
	  	onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">
	  	${productionList.cont_id}
	  	</a>
	  </td>	  
	  <td>${productionList.production_emp}</td>
	  <td>${productionList.production_date}</td>
	  <td>${productionList.production_line}</td>
	  <td>${productionList.product_id}</td>
	  <td>${productionList.product_name}</td>
	  <td>${productionList.plan_qty}</td>
	  <td>${productionList.production_qty}</td>
	  <td>${productionList.production_state}</td>
	  <td>${productionList.production_state}</td>
	  <td>${productionList.production_state}</td>
	  <td>${productionList.production_state}</td>
	 </tr>
	</c:forEach>
									
								</tbody>
							</table>
							
							<script type="text/javascript">

/* 등록 버튼 팝업 */
function openPopup() {
	window.open('./workOrderInsert', 'workOrderPopup', 'width=800, height=500, left=2000');
}


/* 인쇄 버튼 기능 */
function info_print() {
  let initBody = document.body;
  let hiddenBtn = document.querySelector('.print-button'); 
  let hiddenHeader = document.querySelector('#header');
  let hiddenNavbar = document.querySelector('.navbar-device');
  let hiddenClearfix = document.querySelector('.clearfix');
 
  window.onbeforeprint = function () {
    hiddenBtn.style.display = "none";
    hiddenHeader.style.display = "none";
    hiddenNavbar.style.display = "none";
    hiddenClearfix.style.display = "none";
    document.body = document.querySelector('.main-container');
  }
  window.onafterprint = function () {
    hiddenBtn.style.display = "block";
    hiddenHeader.style.display = "block";
    hiddenNavbar.style.display = "block";
    hiddenClearfix.style.display = "block";
    document.body = initBody;
  }
  window.print();
} 
</script>
							
							
								<!-- 이 곳에 내용 작성하시면 됩니다 -->

								</div>
								<button class="btn btn-success btn-fw" type="submit">
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