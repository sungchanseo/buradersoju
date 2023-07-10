<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../includes/header.jsp" %>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>재고관리</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert창 링크 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>
<body>
<br>


<!-- 리스트 형식 -->
<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="main-panel">
				<div class="content-wrapper d-flex align-items-center auth px-0"
					style="min-height: 100vh;">
					<div class="row w-100 mx-0">
						<div class="col-lg-12 mx-auto">
							<div class="auth-form-light text-left py-5 px-4 px-sm-5"
								style="height: 1000px;">


								<!-- 제목 -->
								     <div class="card-body">
								<h1 class="card-title">
										<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">재고 리스트</font></font>
							    </h1>
									
									
								<!-- 검색창기능 -->
								<form action="/purchasing/inventory/list" method="get" style="display: inline;">
									<select name="selector">
										<option value="ma_id">자재코드</option>
										<option value="ma_name">자재명</option>
									</select> <input type="text" class="form-control" style="width:10%; display:inline;" name="search" placeholder="검색어를 입력해주세요">
									<input type="submit"  class="btn btn-info" value="검색">
								</form>
								<!-- 검색창기능 -->
								 
								 
								<!-- 테이블 -->
								<fmt:formatDate value=""/>
							    <table border="1" id="example-table-3" class="table table-bordered table-hover text-center tbl" style="width: 100%;">
								   <thead>
								      <tr>
								         <th>자재코드</th>
								         <th>자재명</th>
								         <th>현재고</th>
								         <th>단위</th>
								         <th>날짜</th>
								         <th>실사량</th>
								         <th>수정</th>
								      </tr>
								    </thead>
								    <tbody>  
								      <c:forEach var="in" items="${inventoryList}" >
								         <tr>
								            <td>${in.ma_id}<input type="hidden" name="ma_id" value="${in.ma_id}"></td>
								            <td>${in.ma_name}</td>
								            <td><c:choose>
													<c:when test="${in.ma_name eq '아스파탐' }">
													<c:if test="${in.ma_qty <= 1000}">
								                    <span style="color:red">
													${in.ma_qty}
													</span>
													</c:if>
													<c:if test="${in.ma_qty > 1000}">
													${in.ma_qty}
													</c:if>
													</c:when>
													<c:otherwise>
													<c:if test="${in.ma_qty <= 1000}">
								                    <span style="color:red">
													<fmt:formatNumber type="number" maxFractionDigits="0" value="${in.ma_qty }"/> 		
													</span>
													</c:if>
													<c:if test="${in.ma_qty > 1000}">
													<fmt:formatNumber type="number" maxFractionDigits="0" value="${in.ma_qty }"/> 		
													</c:if>
													</c:otherwise>
											 	    </c:choose></td>
								            <td>${in.unit}</td>	
								            <td><fmt:formatDate value="${in.ma_regdate}" pattern="yyyy-MM-dd"/></td>
								            <td><input type="text" class="ma_qty" ></td>
								            <td><input type="button" class="update btn-success" value="수정" data-ma_id="${in.ma_id}"></td>
								         <!-- 날짜 포맷팅 표현식 OOOO년-OO월-OO일  -->	
								         </tr>
								      </c:forEach>
								      </tbody>
								   </table>
								 
								   
								   	<!-- 	페이징 처리  -->
									<div class="template-demo">
										<div class="btn-group" role="group" aria-label="Basic example">
											<c:if test="${pvo.startPage > pvo.pageBlock }">
												<a href="/purchasing/inventory/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
											</c:if>
											
											<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
												<a href="/purchasing/inventory/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
											</c:forEach>
											
											<c:if test="${pvo.endPage<pvo.pageCount }">
												<a href="/purchasing/inventory/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
											</c:if>
										</div>
									</div>
									<!-- 	페이징 처리  -->
									
								 <script>
								    /*실사량 수정 버튼 동작  */
								 $(document).ready(function() {
									  $(".update").click(function() {
									    var ma_id = $(this).data("ma_id");
									    var ma_qty = $(this).closest("tr").find(".ma_qty").val();
									    // form 태그 동적 생성
									    const form = $('<form>', {
									      method: 'post',
									      action: 'modify',
									      'accept-charset': 'utf-8'
									    });
									
									    // 파라미터 전달용 hidden 추가
									    form.append($('<input>', {
									      type: 'hidden',
									      name: 'ma_id',
									      value: ma_id
									    }));
									
									    form.append($('<input>', {
									      type: 'hidden',
									      name: 'ma_qty',
									      value: ma_qty
									    }));
									
									    // form태그 body에 추가 후 전송
									    $('tbody').append(form);
									     if(ma_qty ===""){
									    	Swal.fire({
												icon: 'success',										// Alert 타입 (warning / success / error)
												title: '오류',											// Alert 제목
												text: '수정할 값을 입력해 주세여 ',	    // Alert 내용
												confirmButtonColor: '#0ddbb9',							// Alert 버튼 색깔
												confirmButtonText: '확인',								// Alert 버튼내용
											}).then((result) => {
												if(result.isConfirmed){									// '확인'누르면 이동
													location.href="/purchasing/inventory/list";
												}
											}); // then(result)
									    	
									    }else{ 
									    	   form.submit();
									    } 
									 
									  });
									});
								 </script>
 
 
 						</div>
					</div>
				</div>
			</div>
		  </div>
		</div>
	</div>
</div>

<%@ include file="../../includes/footer.jsp" %>

</body>
</html>