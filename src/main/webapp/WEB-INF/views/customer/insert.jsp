<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 등록하기</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert창 링크 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" >	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
<link rel="stylesheet" href="${contextPath }/resources/css/table.css" >
<style>
/* 	table{table-layout:fixed;} */
	table th {width:12%;}
	table input{width:100%;}
</style>
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
		var empPop = window.open('/customer/empFind', '직원검색', 'width=700px,height=500px');
		
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
	<h1 style="display:inline;">거래처 등록</h1>
	<form role="form" id="fr" method="post" onsubmit="return false;" style="display:inline;">
		<div style="float:right;">
			<button type="submit" class="btn btn-success" >작성완료</button>
			<button type="reset" class="btn btn-success" >초기화</button>
			<button type="button" class="btn btn-light" onclick="window.close();">창닫기</button>
		</div>
		<table border="1">
			<tr>
				<th>거래처유형</th>
				<td>
					<label><input type="radio" name="cust_type" value="사업자(국내)" checked>사업자(국내)</label>
					<label><input type="radio" name="cust_type" value="사업자(해외)">사업자(해외)</label>
					<label><input type="radio" name="cust_type" value="개인">개인</label>
				</td>
				<th>사업자등록번호</th>
				<td><input type="text" name="reg_num" id="reg_num" placeholder="000-00-0000">
				<span id="regCheckMsg"></span>
				</td>
			</tr>
			<tr>
				<th>거래처이름</th>
				<td><input type="text" name="cust_name" id="cust_name" placeholder="상호를 입력하세요."></td>
				<th>담당자이름</th>
				<td><input type="text" name="emp_name" id="emp_name" placeholder="담당자이름을 입력하세요." onclick="empPop();">
				<input type="hidden" name="emp_id" id="emp_id">
				</td>
			</tr>
			<tr>
				<th>대표자명</th>
				<td><input type="text" name="owner_name" id="owner_name" placeholder="대표자명을 입력하세요."></td>
				<th>담당자전화번호</th>
				<td><input type="tel" name="emp_tel" id="emp_tel" placeholder="직원검색으로 입력됩니다." readonly></td>
			</tr>
			<tr>
				<th>대표전화</th>
				<td><input type="tel" name="main_phone" id="main_phone" placeholder="대표번호를 입력하세요."></td>
				<th>담당자이메일</th>
				<td><input type="email" name="emp_email" id="emp_email" placeholder="직원검색으로 입력됩니다." readonly></td>
			</tr>
			<tr>
				<th>업태</th>
				<td>
				<select name="cust_business" id="cust_business">
						<option value="도매업" selected>도매업</option>
						<option value="소매업">소매업</option>
						<option value="서비스업">서비스업</option>
						<option value="제조업">제조업</option>
				</select>
				</td>
				<th>거래처구분</th>
				<td>
				<select name="cust_class" id="cust_class">
						<option value="수주처" selected>수주처</option>
						<option value="발주처">발주처</option>
						<option value="납품처">납품처</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>종목</th>
				<td>
					<select name="cust_event" id="cust_event">
						<option value="종목1" selected>종목1</option>
						<option value="종목2">종목2</option>
						<option value="종목3">종목3</option>
					</select>
				</td>
				<th>주소</th>
				<td>
					<input type="text" id="zipcode" onclick="addr();" maxlength="200" size="15">
					<input type="button" value="우편번호찾기" onclick="addr();"><br>
					<input type="text" name="address" id="address" size="45" onclick="addr();"><br>
					<input type="text" name="cust_address" id="cust_address" size="45" placeholder="상세주소를 입력해주세요."maxlength="45">
				</td>
			</tr>
			<tr>
				<th>기타</th>
				<td rowspan="2"><textarea name="cust_etc" id="cust_etc" placeholder="메모를 입력하세요(선택)"></textarea></td>
				<th>홈페이지</th>
				<td><input type="text" name="cust_homepage"id="cust_homepage" placeholder="홈페이지를 입력하세요(선택)."></td>
			</tr>
		</table>
		
	</form>
<!-- 	http://localhost:8088/customer/list -->
<!-- 	제이쿼리 -->
	<script type="text/javascript">
	
	$(document).ready(function(){ 
		//사업자번호 중복확인 ajax 메소드
		  $('#reg_num').keyup(function(){
			 $.ajax({
				  url : "/customer/regCheck",
				  data: {"reg_num": $('#reg_num').val()}, 
				  dataType : "text", //String 타입 데이타를 전달하므로 text로 전달한다. 
				  success:function(data){ //콘츄롤러에 갔다가 온 값을 data에 저장한다. 
					  const result = $.trim(data);
						  if(result=="yes" && !$('#reg_num').val() == ""){
						
						  $('#regCheckMsg').css('color','green');
						  $('#regCheckMsg').text("사용가능한 사업자번호입니다.");
// 						  $('#submit').removeAttr('disabled');
						  return;
					  }else if ( result=="no" && !$('#reg_num').val() == ""){

						  $('#regCheckMsg').css('color','red');
						  $('#regCheckMsg').text("중복된 사업자번호입니다.");  
// 						  $('#submit').attr('disabled','disabled');
						  return;
					  }
				  }//success 
			  });// ajax
		  }); //사업자 중복체크 ajax끝
		  
	});//dom 객체 끝 

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
					url : '/customer/insert', 
					type : 'POST', 
					contentType : 'application/json; charset=utf-8',
					data : JSON.stringify(formObject), 	
					headers: {'Content-Type': 'application/json'},
					success : function() {
						 Swal.fire({
		                        title: '거래처등록이 완료되었습니다.',
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
					} // error END
				}); //ajax end
				
			});//정보 입력안하면 submit기능 제어 끝
		  
	});//dom 객체 끝 
		
	</script>	
		

</body>
</html>