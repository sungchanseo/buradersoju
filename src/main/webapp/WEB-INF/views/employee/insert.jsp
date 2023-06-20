<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<title>사원 등록</title>
</head>
<body>
	<form action="" method="post" >
		<table border="1">
			<tr>
				<th>사원사진</th>
				<th>사번</th>
				<td><input type="text" name="emp_id" readonly value="${generatedNumber}"></td>
				<th>비밀번호</th>
				<td><input type="password" name="emp_pw"></td>
				<th>이름</th>
				<td><input type="text" name="emp_name"></td>
			</tr>
			<tr>
				<td rowspan="4">이미지</td>
				<th>생년월일</th>
				<td><input type="text" name="emp_birth"></td>
				<th>휴대전화</th>
				<td><input type="text" name="emp_phone"></td>
				<th>이메일</th>
				<td><input type="text" name="emp_email"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="5"><input type="text" name="emp_address"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="emp_gender" value="남">남</label>
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
						<option value="사장">사장</option>
						<option value="부장">부장</option>
						<option value="차장">차장</option>
						<option value="과장">과장</option>
						<option value="대리">대리</option>
						<option value="사원">사원</option>
				</select></td>
			</tr>
			<tr>
				<th>내선번호</th>
				<td><input type="text" name="emp_tel"></td>			
				<th>재직구분</th>
				<td><select name="emp_status">
						<option value="재직">재직</option>
						<option value="휴직">휴직</option>
						<option value="복직">복직</option>
						<option value="퇴직">퇴직</option>
				</select></td>
				<th>입사일</th>
				<th><input type="text" name="join_date"></th>
			</tr>
			<tr>
				<td><input type="file" multiple name="emp_image" accept="image/*" value="이미지등록"></td>
				<th>휴직일</th>
				<td><input type="text" name="absence_date"></td>			
				<th>복직일</th>
				<td><input type="text" name="rehabi_date"></td>
				<th>퇴사일</th>
				<td><input type="text" name="resign_date"></td>
			</tr>
			
		</table>
		<input type="submit" value="사원등록">
	</form>
	
</body>
</html>