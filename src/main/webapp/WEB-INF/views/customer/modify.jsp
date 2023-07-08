<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
<link rel="stylesheet" href="${contextPaht }/resources/css/table.css"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert창 링크 -->
</head>
<body>
	<script>
		//우편번호 자동입력 api 메소드
		function addr() {
			new daum.Postcode({
				    oncomplete : function(data) {
					document.getElementById("zipcode").value = data.zonecode; // 우편 번호 넣기
					document.getElementById("address").value = data.address; // 주소 넣기
				}
			}).open();
		};//우편번호 자동입력 api 메소드
		
		//직원정보 검색 및 자동완성 기능 
		function empPop(){
			var empPop = window.open('/customer/empFindModify', '직원검색', 'width=700px,height=500px');
			
			if(empPop == null){
				  Swal.fire({
			            icon: 'warning',				// Alert 타입
			            title: '팝업이 차단되었습니다.',	// Alert 제목
			            text: '차단을 해제하세요.',		// Alert 내용
			            confirmButtonText: '확인',		// Alert 버튼내용
			        });
			  }
			empPop.moveBy(100,100);
		}//empPop END
	</script>

	<h1>${customerVO.cust_name } 수정 </h1>
	<form action="" role="form" id="fr" method="post" onsubmit="return false;">
	<table border="1">
	<tr>
		<th>거래처유형</th>
		<td><label>
		<input type="hidden" id="cust_id" value="${customerVO.cust_id }">
		<input type="radio" name="cust_type" id="cust_type" value="사업자(국내)"
			<c:if test="${customerVO.cust_type =='사업자(국내)' }">
				checked
			</c:if>
			>사업자(국내)</label>
			<label><input type="radio" name="cust_type" id="cust_type" value="사업자(국내)"
			<c:if test="${customerVO.cust_type =='사업자(해외)' }">
				checked
			</c:if>
			>사업자(해외)</label>
			<label><input type="radio" name="cust_type" id="cust_type" value="개인"
			<c:if test="${customerVO.cust_type =='개인' }">
				checked
			</c:if>
			>개인</label>
		</td>
		<th>사업자등록번호</th>
		<td>
			<input type="text" name="reg_num" id="reg_num" value="${customerVO.reg_num }" readonly><br>
			<span id="regCheckMsg"></span>
		</td>
	</tr>
	<tr>
		<th>거래처이름</th>
		<td><input type="text" name="cust_name" id="cust_name" value="${customerVO.cust_name }"></td>
		<th>담당자이름</th>
		<td><input type="text" name="emp_name" id="emp_name" value="${customerVO.emp_name }" onclick="empPop();"></td>
	</tr>
	<tr>
		<th>대표자명</th>
		<td><input type="text" name="owner_name" id="owner_name" value="${customerVO.owner_name }"></td>
		<th>담당자전화번호</th>
		<td><input type="text" name="emp_tel" id="emp_tel" value="${customerVO.emp_tel }" readonly>
		<input type="hidden" name="emp_id" id="emp_id">
		</td>
	</tr>
	<tr>
		<th>대표전화</th>
		<td><input type="text" name="main_phone" id="main_phone" value="${customerVO.main_phone }"></td>
		<th>담당자이메일</th>
		<td><input type="text" name="emp_email" id="emp_email" value="${customerVO.emp_email }" readonly></td>
	</tr>
	<tr>
		<th>업태</th>
		<td>
			<select name="cust_business" id="cust_business">
				<option value="도매업"
					<c:if test="${customerVO.equals('도매업') }">
						selected
					</c:if>
				>도매업</option>
				<option value="소매업"
					<c:if test="${customerVO.equals('소매업') }">
						selected
					</c:if>
				>소매업</option>
				<option value="서비스업"
					<c:if test="${customerVO.equals('서비스업') }">
						selected
					</c:if>
				>서비스업</option>
				<option value="제조업"
					<c:if test="${customerVO.equals('제조업') }">
						selected
					</c:if>
				>제조업</option>
			</select>
		</td>
		<th>거래처구분</th>
		<td>
				<select name="cust_class" id="cust_class">
						<option value="수주처" 
							<c:if test="${customerVO.cust_class.equals('수주처') }">
								selected
							</c:if>
						>수주처</option>
						<option value="발주처"
							<c:if test="${customerVO.cust_class.equals('발주처') }">
								selected
							</c:if>
						>발주처</option>
						<option value="납품처"
							<c:if test="${customerVO.cust_class.equals('납품처') }">
								selected
							</c:if>
						>납품처</option>
				</select>
				</td>
	</tr>
	<tr>
		<th>종목</th>
		<td>
			<select name="cust_event" id="cust_event">
				<option value="종목1"
					<c:if test="${customerVO.cust_event.equals('종목1') }">
						selected
					</c:if>
				>종목1</option>
				<option value="종목2"
					<c:if test="${customerVO.cust_event.equals('종목2') }">
						selected
					</c:if>
				>종목2</option>
				<option value="종목3"
					<c:if test="${customerVO.cust_event.equals('종목3') }">
						selected
					</c:if>
				>종목3</option>
			</select>
		</td>
		<th>주소</th>
		<td>
			<input type="text" id="zipcode" onclick="addr();" maxlength="200" size="15">
			<input type="button" value="우편번호찾기" onclick="addr();"><br>
			<input type="text" name="address" id="address" size="45" onclick="addr();"><br>
			<input type="text" name="cust_address" size="45" placeholder="상세주소를 입력해주세요."maxlength="45">
		</td>
	</tr>
	<tr>
		<th>기타</th>
		<td rowspan="2">
		<textarea name="cust_etc" id="cust_etc">${customerVO.cust_etc }</textarea>
		</td>
		<th>홈페이지</th>
		<td><input type="text" name="cust_hompage" id="cust_hompage" value="${customerVO.cust_homepage }"></td>
	</table>
		<button type="submit" class="btn btn-success">수정완료</button>
		<button type="button" class="btn btn-success" onclick="history.back();">뒤로가기</button>
		<button type="button" class="btn btn-light" onclick="window.close();">창닫기</button>
	</form>
	
		<script type="text/javascript">
		
		$(document).ready(function(){
			
			 //빈칸이 있을때 submit 제어 
			  $('#fr').submit(function() {
				  
					if($('#cust_name').val() == ""){
						Swal.fire({
				            icon: 'warning',				// Alert 타입
				            title: '거래처이름을 입력하세요.',	// Alert 제목
				            text: '필수입력란 입니다.',		// Alert 내용
				            confirmButtonText: '확인',		// Alert 버튼내용
				        });
						$('#cust_name').focus();
						return false;
					}//cust_name 제어 
					if($('#owner_name').val() == ""){
						Swal.fire({
				            icon: 'warning',				// Alert 타입
				            title: '대표자명을 입력하세요.',	// Alert 제목
				            text: '필수입력란 입니다.',		// Alert 내용
				            confirmButtonText: '확인',		// Alert 버튼내용
				        });
						$('#owner_name').focus();
						return false;
					}//owner_name 제어 
					if($('#main_phone').val() == ""){
						Swal.fire({
				            icon: 'warning',				// Alert 타입
				            title: '대표전화를 입력하세요.',	// Alert 제목
				            text: '필수입력란 입니다.',		// Alert 내용
				            confirmButtonText: '확인',		// Alert 버튼내용
				        });
						$('#main_phone').focus();
						return false;
					}//main_phone 제어 
					if($('#reg_num').val() == ""){
						Swal.fire({
				            icon: 'warning',				// Alert 타입
				            title: '사업자등록번호를 입력하세요.',	// Alert 제목
				            text: '필수입력란 입니다.',		// Alert 내용
				            confirmButtonText: '확인',		// Alert 버튼내용
				        });
						$('#reg_num').focus();
						return false;
					}//reg_num 제어 
					if($('#emp_name').val() == ""){
						Swal.fire({
				            icon: 'warning',				// Alert 타입
				            title: '담당자이름을 입력하세요.',	// Alert 제목
				            text: '필수입력란 입니다.',		// Alert 내용
				            confirmButtonText: '확인',		// Alert 버튼내용
				        });
						$('#emp_name').focus();
						return false;
					}//emp_name 제어 
					if($('#emp_tel').val() == ""){
						Swal.fire({
				            icon: 'warning',				// Alert 타입
				            title: '담당자전화번호를 입력하세요.',	// Alert 제목
				            text: '필수입력란 입니다.',		// Alert 내용
				            confirmButtonText: '확인',		// Alert 버튼내용
				        });
						$('#emp_tel').focus();
						return false;
					}//emp_tel 제어 
					if($('#emp_email').val() == ""){
						Swal.fire({
				            icon: 'warning',				// Alert 타입
				            title: '담당자이메일을 입력하세요.',	// Alert 제목
				            text: '필수입력란 입니다.',		// Alert 내용
				            confirmButtonText: '확인',		// Alert 버튼내용
				        });
						$('#emp_email').focus();
						return false;
					}//emp_email 제어 

					var formObject ={
							cust_id : $('#cust_id').val(),
							cust_name : $('#cust_name').val(),
							emp_name : $('#emp_name').val(),
							reg_num : $('#reg_num').val(),
							cust_type : $('#cust_type').val(),
							emp_id : $('#emp_id').val(),
							emp_tel : $('#emp_tel').val(),
							owner_name : $('#owner_name').val(),
							main_phone : $('#main_phone').val(),
							emp_email : $('#emp_email').val(),
							cust_business : $('#cust_business').val(),
							cust_class : $('#cust_class').val(),
							cust_event : $('#cust_event').val(),
							address : $('#address').val(),
							cust_address : $('#cust_address').val(),
							cust_etc : $('#cust_etc').val(),
							cust_homepage : $('#cust_homepage').val() 
					}//formObject END
					
					console.log(formObject);
					console.log(typeof formObject);
					$.ajax({
						url : '/customer/modify', 
						type : 'POST', 
						contentType : 'application/json; charset=utf-8',
						data : JSON.stringify(formObject), 	
						success : function() {
							 Swal.fire({
			                        title: '거래처수정이 완료되었습니다.',
			                        text: '확인을 누르면 창을 닫습니다.',
			                        icon: 'success',
			                        confirmButtonText: '확인'
			                    }).then(() => {
			                        window.opener.location.reload();
			                        window.close();
			                    });
						}, //success END
						error : function(){
							alert('실패!');
						}
					}); //ajax end
					
				});//정보 입력안하면 submit기능 제어 끝
			  
		});//dom 객체 끝 
	</script>	
	
</body>
</html>