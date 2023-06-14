<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>거래처 수정하기 </h1>
${customerVO }<br>
<form action="" method="post">
<table border="1">
<tr>
	<th>거래처유형</th>
	<td><label><input type="radio" name="cust_type">사업자(국내)</label>
		<label><input type="radio" name="cust_type">사업자(해외)</label>
		<label><input type="radio" name="cust_type">개인</label>
	</td>
	<th>사업자등록번호</th>
	<td>
		<input type="text" name="reg_num" value="${customerVO.reg_num }">
		<input type="button" value="중복확인">
	</td>
</tr>
<tr>
	<th>거래처이름</th>
	<td><input type="text" name="cust_name" value="${customerVO.cust_name }"></td>
	<th>담당자이름</th>
	<td><input type="text" name="emp_id" value="${customerVO.emp_id }"></td>
</tr>
<tr>
	<th>대표자명</th>
	<td><input type="text" name="owner_name" value="${customerVO.owner_name }"></td>
	<th>담당자전화번호</th>
	<td><input type="text" name="owner_name" value="${customerVO.emp_email }"></td>
</tr>
<tr>
	<th>대표전화</th>
	<td><input type="text" name="main_phone" value="${customerVO.main_phone }"></td>
	<th>담당자이메일</th>
	<td><input type="text" name="emp_email" value="${customerVO.emp_email }"></td>
</tr>
<tr>
	<th>업태</th>
	<td>
		<select name="cust_business">
			<option value="wholesale">도매업</option>
			<option value="retail">소매업</option>
			<option value="service">서비스업</option>
			<option value="manufacturing">제조업</option>
		</select>
	</td>
	<th>FAX번호</th>
	<td><input type="text" name="cust_fax" value="${customerVO.cust_fax }"></td>
</tr>
<tr>
	<th>종목</th>
	<td>
		<select name="cust_event">
			<option value="">종목1</option>
			<option value="">종목2</option>
			<option value="">종목3</option>
		</select>
	</td>
	<th>주소</th>
	<td>
		주소api
	</td>
</tr>
<tr>
	<th>기타</th>
	<td rowspan="2">
	<textarea name="cust_etc">${customerVO.cust_etc }</textarea>
	</td>
	<th>홈페이지</th>
	<td><input type="text" name="cust_hompage" value="${customerVO.cust_homepage }"></td>
</table>
<input type="submit" value="수정완료">
<input type="button" value="목록으로" onclick="location.href='/customer/list';">
</form>
</body>
</html>