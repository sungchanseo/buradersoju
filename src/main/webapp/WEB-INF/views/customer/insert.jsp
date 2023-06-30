<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->
<title>거래처 등록하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<h1 class="">거래처 등록</h1>
	<form action="" role="form" id="fr" method="post">
		<table border="1">
			<tr>
				<th>거래처유형</th>
				<td><label><input type="radio" name="cust_type" value="사업자(국내)" checked>사업자(국내)</label>
					<label><input type="radio" name="cust_type" value="사업자(해외)">사업자(해외)</label>
					<label><input type="radio" name="cust_type" value="개인">개인</label></td>
				<th>사업자등록번호</th>
				<td><input type="text" name="reg_num" id="reg_num" placeholder="사업자번호를 입력하세요">
				<span id="regCheckMsg"></span>
				</td>
			</tr>
			<tr>
				<th>거래처이름</th>
				<td><input type="text" name="cust_name" id="cust_name" placeholder="상호를 입력하세요."></td>
				<th>담당자이름</th>
				<td><input type="text" name="emp_id" id="" placeholder="담당자이름을 입력하세요."></td>
			</tr>
			<tr>
				<th>대표자명</th>
				<td><input type="text" name="owner_name" id="" placeholder="대표자명을 입력하세요."></td>
				<th>담당자전화번호</th>
				<td><input type="tel" name="emp_tel" id="" placeholder="연락처를 입력하세요."></td>
			</tr>
			<tr>
				<th>대표전화</th>
				<td><input type="tel" name="main_phone" id="" placeholder="대표번호를 입력하세요."></td>
				<th>담당자이메일</th>
				<td><input type="email" name="emp_email" id="" placeholder="이메일을 입력하세요."></td>
			</tr>
			<tr>
				<th>업태</th>
				<td>
				<select name="cust_business">
						<option value="도매업" selected>도매업</option>
						<option value="소매업">소매업</option>
						<option value="서비스업">서비스업</option>
						<option value="제조업">제조업</option>
				</select>
				</td>
				<th>거래처구분</th>
				<td>
				<select name="cust_class">
						<option value="수주처" selected>수주처</option>
						<option value="발주처">발주처</option>
						<option value="납품처">납품처</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>종목</th>
				<td>
					<select name="cust_event">
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
					<input type="text" name="cust_address" size="45" placeholder="상세주소를 입력해주세요."maxlength="45">
				</td>
			</tr>
			<tr>
				<th>기타</th>
				<td rowspan="2"><textarea name="cust_etc"></textarea></td>
				<th>홈페이지</th>
				<td><input type="text" name="cust_homepage" placeholder="홈페이지를 입력하세요(선택)."></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-success" id="submit" onclick="sendForm();">작성완료</button>
		<button type="reset" class="btn btn-success" id="submit">초기화</button>
		<button type="button" class="btn btn-light" onclick="window.close();">창닫기</button>
	</form>
<!-- 	http://localhost:8088/customer/list -->
<!-- 	제이쿼리 -->
	<script type="text/javascript">
	
		//우편번호 자동입력 api 메소드
		function addr() {
			new daum.Postcode({
				    oncomplete : function(data) {
					document.getElementById("zipcode").value = data.zonecode; // 우편 번호 넣기
					document.getElementById("address").value = data.address; // 주소 넣기
				}
			}).open(); 
		};//우편번호 자동입력 api 메소드
	
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
// 			  if($('#reg_num').val() == ""){
// 				  $('#regCheckMsg').css('color','red');
// 				  $('#regCheckMsg').text("사업자번호를 작.");  
// 				  $('#submit').attr('disabled','disabled'); 
// 				  return;
// 			  }
		  }); //사업자 중복체크 ajax끝
		  
		  //빈칸이 있을때 submit 제어 
		  $('#fr').submit(function() {
				if($('#cust_name').val() == ""){
					alert('거래처이름을 입력하세요.');
					$('#cust_name').focus();
					return false;
				}//cust_name 제어 
				if($('#owner_name').val() == ""){
					alert('대표자명을 입력하세요.');
					$('#owner_name').focus();
					return false;
				}//owner_name 제어 
				if($('#main_phone').val() == ""){
					alert('대표전화를 입력하세요.');
					$('#main_phone').focus();
					return false;
				}//main_phone 제어 
				if($('#reg_num').val() == ""){
					alert('사업자등록번호를 입력하세요.');
					$('#reg_num').focus();
					return false;
				}//reg_num 제어 
				if($('#emp_name').val() == ""){
					alert('담당자이름을 입력하세요.');
					$('#emp_name').focus();
					return false;
				}//emp_name 제어 
				if($('#emp_tel').val() == ""){
					alert('담당자전화번호를 입력하세요.');
					$('#emp_tel').focus();
					return false;
				}//emp_tel 제어 
				if($('#emp_email').val() == ""){
					alert('담당자이메일을 입력하세요.');
					$('#emp_email').focus();
					return false;
				}//emp_email 제어 
				if($('#cust_address').val() == ""){
					alert('주소를 입력하세요.');
					$('#cust_address').focus();
					return false;
				}//cust_address 제어 
				
				//작성완료를 눌렀을 때 ajax 메소드
// 				function sendForm() {
				//상단의 폼태그를 변수에 저장한다. 
				var formObject = $("form[role='form']").serializeArray();
				
				$.ajax({
					url : '/customer/insert', 
					type : 'POST', 
					data : formObject, //form데이타의 객체형으로 값을 전달한다. 
					success : function() {
						alert("수주등록이 완료되었습니다.");
						window.opener.location.reload();
						window.close();
					},
					error : function(){
						alert("수주등록이 완료되었습니다.");
						window.opener.location.reload();
						window.close();
					}
				}); //ajax end
				
			});//정보 입력안하면 submit기능 제어 끝
		  
	});//dom 객체 끝 
		
	</script>	
		

</body>
</html>