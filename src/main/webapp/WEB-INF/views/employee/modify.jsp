<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>사원 정보 수정</title>
</head>
<body>
	<form action="" role="form" method="post">
		<table border="1">
			<tr>
				<th>사원사진</th>
				<th>사번</th>
				<td><input type="text" value="${resultVO.emp_id }" readonly></td>
				<th>비밀번호</th>
				<th><input type="password" name="emp_pw" placeholder="비밀번호를 입력하세요"></th>				
				<th>이름</th>
				<td><input type="text" name="emp_name" value="${resultVO.emp_name }"></td>
			</tr>
			<tr>
				<td rowspan="4">이미지</td>
				<th>생년월일</th>
				<td><input type="text" name="emp_birth" value="${resultVO.emp_birth }"></td>
				<th>휴대전화</th>
				<td><input type="text" name="emp_phone" value="${resultVO.emp_phone }"></td>
				<th>이메일</th>
				<td><input type="text" name="emp_email" value="${resultVO.emp_email }"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="5"><input type="text" name="emp_address" value="${resultVO.emp_address }"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="emp_gender" value="남" ${resultVO.emp_gender == '남' ? 'checked' : ''}>남</label>
					<label><input type="radio" name="emp_gender" value="남" ${resultVO.emp_gender == '여' ? 'checked' : ''}>여</label>
				</td>			
				<th>부서</th>
				<td><select name="emp_department">
						<option value="전산팀" ${resultVO.emp_department == '전산팀' ? 'selected' : ''}>전산팀</option>
						<option value="인사팀" ${resultVO.emp_department == '인사팀' ? 'selected' : ''}>인사팀</option>
						<option value="생산팀" ${resultVO.emp_department == '생산팀' ? 'selected' : ''}>생산팀</option>
						<option value="구매팀" ${resultVO.emp_department == '구매팀' ? 'selected' : ''}>구매팀</option>
						<option value="영업팀" ${resultVO.emp_department == '영업팀' ? 'selected' : ''}>영업팀</option>
				</select></td>
				<th>직급</th>
				<td><select name="emp_position">
						<option value="임원" ${resultVO.emp_position == '임원' ? 'selected' : ''}>임원</option>
						<option value="부장" ${resultVO.emp_position == '부장' ? 'selected' : ''}>부장</option>
						<option value="차장" ${resultVO.emp_position == '차장' ? 'selected' : ''}>차장</option>
						<option value="과장" ${resultVO.emp_position == '과장' ? 'selected' : ''}>과장</option>
						<option value="대리" ${resultVO.emp_position == '대리' ? 'selected' : ''}>대리</option>
						<option value="주임" ${resultVO.emp_position == '주임' ? 'selected' : ''}>주임</option>
						<option value="사원" ${resultVO.emp_position == '사원' ? 'selected' : ''}>사원</option>
				</select></td>
			</tr>
			<tr>
				<th>내선번호</th>
				<td><input type="text" name="emp_tel" value="${resultVO.emp_tel }"></td>			
				<th>재직구분</th>
				<td><select name="emp_status">
						<option value="재직" ${resultVO.emp_status == '재직' ? 'selected' : ''}>재직</option>
						<option value="휴직" ${resultVO.emp_status == '휴직' ? 'selected' : ''}>휴직</option>
						<option value="복직" ${resultVO.emp_status == '복직' ? 'selected' : ''}>복직</option>
						<option value="퇴직" ${resultVO.emp_status == '퇴직' ? 'selected' : ''}>퇴직</option>
				</select></td>
				<th>입사일</th>
				<th><input type="text" name="join_date" value="${resultVO.join_date }"></th>
			</tr>
			<tr>
				<td><input type="file" name="emp_image" accept="image/*" value="이미지등록"></td>
				<th>휴직일</th>
				<th><input type="text" name="absence_date" value="${resultVO.absence_date }"></th>			
				<th>복직일</th>
				<th><input type="text" name="rehabi_date" value="${resultVO.rehabi_date }"></th>
				<th>퇴사일</th>
				<th><input type="text" name="resign_date" value="${resultVO.resign_date }"></th>
			</tr>
			
		</table>
		<input type="submit" value="사원수정" onclick="sendForm();">
		<input type="reset" value="초기화">
		<input type="button" value="창닫기" onclick="window.close();">
	</form>
	<!-- 팝업창 처리 -->
	<script>
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
			
			//수정하기 버튼을 눌렀을 때 ajax를 실행하도록 한다.
			$.ajax({
				url : '/employee/modify', 
				type : 'POST', 
				data : formObject, 
				success : function(json) {
					alert("사원수정이 완료되었습니다.");
					status = true;
					window.opener.location.reload();
					window.close();
				},  
			});
		}
		
		
	</script>
	<!-- 팝업창 처리 -->
</body>
</html>