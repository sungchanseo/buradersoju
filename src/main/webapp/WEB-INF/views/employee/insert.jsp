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

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css"> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css"> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css"> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"> --%>

<style type="text/css">
table {margin-bottom: 1em;}

table, th {border: none;}

th {background-color: #04AA6D;
color: #fff;
text-align: center;
padding: 10px 8px;}

td {border:1px solid #04AA6D;
padding: 10px 6px;}

#tb-btns {margin-left: 0.5em;}

.btn{
display: inline-block;
font-weight: 600;
line-height: 1;
color: #6c7293;
text-align: center;
text-decoration: none;
vertical-align: middle;
cursor: pointer;
user-select: none;
background-color: transparent;
border: 1px solid transparent;
padding: 0.625rem 1.125rem;
font-size: 0.875rem;
border-radius: 0.25rem;
transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;}
    
.btn-success {
color: #000;
background-color: #0ddbb9;
border-color: #0ddbb9;}

.btn-info {
color: #000;
background-color: #2fddf8;
border-color: #23dbf8;}
/* .btn {background-color: #048; */
/* padding:8px 10px; */
/* color: #fff;} */
</style>
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
					<input type="text" name="emp_address" id="emp_address" size="45" onclick="addr();">
					<input type="button" value="주소찾기" onclick="addr();"><br>
					<input type="text" name="emp_address_detail" id="emp_address_detail" placeholder="상세주소를 입력하세요." size="55" maxlength="55">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="emp_gender" value="남" checked>남</label>
					<label><input type="radio" name="emp_gender" value="여">여</label>
				</td>			
				<th>부서</th>
				<td><select name="emp_department">
						<option value="전산팀">전산팀</option>
						<option value="인사팀">인사팀</option>
						<option value="생산팀">생산팀</option>
						<option value="구매팀">구매팀</option>
						<option value="영업팀">영업팀</option>
				</select></td>
				<th>직급</th>
				<td><select name="emp_position">
						<option value="사원">사원</option>
						<option value="주임">주임</option>
						<option value="대리">대리</option>
						<option value="과장">과장</option>
						<option value="차장">차장</option>
						<option value="부장">부장</option>
						<option value="임원">임원</option>
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
				<td><input type="text" name="join_date" id="join_date" placeholder="입사일을 입력하세요."></td>
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
		<div id="tb-btns">
		 <input type="submit" class="btn btn-info" value="사원등록" onclick="sendForm();">
		 <input type="reset" class="btn btn-success" value="초기화">
		 <input type="button" class="btn btn-success" value="창닫기" onclick="window.close();">
		</div>
	</form>
	
	<script>
		// 주소 자동입력 api 메소드
		function addr() {
			new daum.Postcode({
				    oncomplete : function(data) {
					document.getElementById("emp_address").value = data.address; // 주소 넣기
				}
			}).open();
		};
		// 주소 자동입력 api 메소드	
	
		// 중복체크와 입력값 확인
		$(document).ready(function () {
		
			$('#fr').submit(function() {
				var status = true;
		
				if ($('#emp_pw').val() == ""){
					alert('비밀번호를 입력하세요.');
					$('#emp_pw').focus();
					status = false;
					return false;
				}//비밀번호 입력 제어
		
				if ($('#emp_name').val() == ""){
					alert('이름을 입력하세요.');
					$('#emp_name').focus();
					status = false;
					return false;
				}//이름 입력 제어
		
				if ($('#emp_birth').val() == ""){
					alert('생년월일을 입력하세요.');
					$('#emp_birth').focus();
					status = false;
					return false;
				}//생년월일 입력 제어
		
				if ($('#emp_phone').val() == ""){
					alert('연락처를 입력하세요.');
					$('#emp_phone').focus();
					status = false;
					return false;
				}//연락처 입력 제어
		
				if ($('#emp_email').val() == ""){
					alert('이메일를 입력하세요.');
					$('#emp_email').focus();
					status = false;
					return false;
				}//이메일 입력 제어
				
				if ($('#emp_address').val() == ""){
					alert('주소를 입력하세요.');
					$('#emp_address').focus();
					status = false;
					return false;
				}//주소 입력 제어
				
				if ($('#emp_address_detail').val() == ""){
					alert('상세주소를 입력하세요.');
					$('#emp_address_detail').focus();
					status = false;
					return false;
				}//상세주소 입력 제어
				
				if($('input[name="emp_gender"]:checked').length === 0){
				    alert('성별을 선택해주세요.');
				    $('input[name="emp_gender"]').eq(0).focus(); // 첫 번째 라디오 버튼에 포커스를 줌
				    return false;
				}//성병 입력 제어
				
				if ($('#emp_tel').val() == ""){
					alert('내선번호를 입력하세요.');
					$('#emp_tel').focus();
					status = false;
					return false;
				}//내선번호 입력 제어
		
				if ($('#join_date').val() == ""){
					alert('입사일을 입력하세요.');
					$('#join_date').focus();
					status = false;
					return false;
				}//입사일 입력 제어
				
				if (status) {
					sendForm();
				}
		
				return false; // 폼 제출 막기
			});
		
			function sendForm() {
				var formObject = $("form[role='form']").serialize();
		
				$.ajax({
					url: '/employee/insert',
					type: 'POST',
					data: formObject,
					success: function(json) {
						alert("사원등록이 완료되었습니다.");
						window.opener.location.reload();
						window.close();
					}
				});
			}
		});
	</script>
</body>
</html>