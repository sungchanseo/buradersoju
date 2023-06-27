<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->
<title>사원 등록</title>
</head>
<body>
	<form action="" role="form" id="fr" method="post" >
		<table border="1">
			<tr>
				<th>사원사진</th>
				<th>사번</th>
				<td><input type="text" name="emp_id" readonly value="사번자동생성"></td>
				<th>비밀번호</th>
				<td><input type="password" name="emp_pw" id="emp_pw" placeholder="비밀번호를 입력하세요."></td>
				<th>이름</th>
				<td><input type="text" name="emp_name" id="emp_name" placeholder="이름을 입력하세요."></td>
			</tr>
			<tr>
				<td rowspan="4">이미지</td>
				<th>생년월일</th>
				<td><input type="text" name="emp_birth" id="emp_birth" placeholder="생년월일을 입력하세요."></td>
				<th>연락처</th>
				<td><input type="text" name="emp_phone" id="emp_phone" placeholder="연락처를 입력하세요."></td>
				<th>이메일</th>
				<td>
					<input type="text" name="emp_email" id="emp_email" placeholder="이메일을 입력하세요.">
					<span id="emsg"></span>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="5">
					<input type="text" id="zipcode" onclick="addr();" maxlength="200" size="15">
					<input type="button" value="우편번호찾기" onclick="addr();"><br>
					<input type="text" name="address" id="address" size="45" onclick="addr();"><br>
					<input type="text" name="emp_address" placeholder="상세주소를 입력하세요." size="45" maxlength="45">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="emp_gender" value="남">남</label>
					<label><input type="radio" name="emp_gender" value="여">여</label>
				</td>			
				<th>부서</th>
				<td><select name="emp_department">
						<option value="전산">전산팀</option>
						<option value="인사">인사팀</option>
						<option value="생산">생산팀</option>
						<option value="구매">구매팀</option>
						<option value="영업">영업팀</option>
				</select></td>
				<th>직급</th>
				<td><select name="emp_position">
						<option value="임원">임원</option>
						<option value="부장">부장</option>
						<option value="차장">차장</option>
						<option value="과장">과장</option>
						<option value="대리">대리</option>
						<option value="주임">주임</option>
						<option value="사원">사원</option>
				</select></td>
			</tr>
			<tr>
				<th>내선번호</th>
				<td><input type="text" name="emp_tel" id="emp_tel" placeholder="내선번호를 입력하세요."></td>			
				<th>재직구분</th>
				<td><select name="emp_status">
						<option value="재직">재직</option>
						<option value="휴직">휴직</option>
						<option value="퇴직">퇴직</option>
				</select></td>
				<th>입사일</th>
				<th><input type="text" name="join_date" id="join_date" placeholder="입사일을 입력하세요."></th>
			</tr>
			<tr>
				<td><input type="file" multiple name="emp_image" accept="image/*" value="이미지등록"></td>
				<th>휴직일</th>
				<td><input type="text" name="absence_date" placeholder="휴직시 휴직일을 입력하세요."></td>			
				<th>복직일</th>
				<td><input type="text" name="rehabi_date" placeholder="복직시 복직일을 입력하세요."></td>
				<th>퇴사일</th>
				<td><input type="text" name="resign_date" placeholder="퇴사시 퇴사일을 입력하세요."></td>
			</tr>
			
		</table>
		<input type="submit" class="btn btn-success btn-fw" value="사원등록" onclick="sendForm();">
		<input type="reset" class="btn btn-success btn-fw" value="초기화">
		<input type="button" class="btn btn-success btn-fw" value="창닫기" onclick="window.close();">
	</form>
	
	<script>
		// 주소 자동입력 api 메소드
		function addr() {
			new daum.Postcode({
				    oncomplete : function(data) {
					document.getElementById("zipcode").value = data.zonecode; // 우편 번호 넣기
					document.getElementById("address").value = data.address; // 주소 넣기
				}
			}).open();
		};
		// 주소 자동입력 api 메소드	
	
		// 중복체크와 입력값 확인
// 		$(document).ready(function () { 
			
// 			$('#fr').submit(function() {				
// 				if($('#emp_pw').val() == ""){
// 					alert('비밀번호를 입력하세요.');
// 					$('#emp_pw').focus();
// 					return false;
// 				}//비밀번호 입력 제어
				
// 				if($('#emp_name').val() == ""){
// 					alert('이름을 입력하세요.');
// 					$('#emp_name').focus();
// 					return false;
// 				}//이름 입력 제어
				
// 				if($('#emp_birth').val() == ""){
// 					alert('생년월일을 입력하세요.');
// 					$('#emp_birth').focus();
// 					return false;
// 				}//생년월일 입력 제어
							
// 				if($('#emp_phone').val() == ""){
// 					alert('연락처를 입력하세요.');
// 					$('#emp_phone').focus();
// 					return false;
// 				}//연락처 입력 제어
				
// 				if($('#emp_email').val() == ""){
// 					alert('이메일를 입력하세요.');
// 					$('#emp_email').focus();
// 					return false;
// 				}//이메일 입력 제어
				
// 				if($('#address').val() == ""){
// 					alert('주소를 입력하세요.');
// 					$('#address').focus();
// 					return false;
// 				}//주소 입력 제어
				
// 				if($('#emp_tel').val() == ""){
// 					alert('내선번호를 입력하세요.');
// 					$('#emp_tel').focus();
// 					return false;
// 				}//내선번호 입력 제어

// 				if($('#join_date').val() == ""){
// 					alert('입사일을 입력하세요.');
// 					$('#join_date').focus();
// 					return false;
// 				}//입사일 입력 제어
				
// 			});//정보 입력안하면 submit기능 제어 끝			  
			  
// 		}); // (document).ready(function)
		// 중복체크와 입력값 확인
	
		// 팝업창 처리
		function sendForm() {
			//상단의 폼태그를 변수에 저장한다. 
			var formObject = $("form[role='form']").serialize();
			var status = true;
			
			for (var i = 0; i < formObject.length; i++) {
				if (formObject[i].value == "") {
					alert("정보를 입력하세요!");
					status = false;
					break;
				}
			}	
			
			if (status) {
				//작성완료 버튼을 눌렀을 때 ajax를 실행하도록 한다.
				$.ajax({
					url : '/employee/insert', 
					type : 'POST', 
					data : formObject, 
					success : function(json) {
						alert("사원등록이 완료되었습니다.");
						status = true;
						window.opener.location.reload();
						window.close();
					}
				});
			}
		};
		// 팝업창 처리
	</script>
</body>
</html>