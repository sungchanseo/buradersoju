<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>거래처 상세 페이지 </h1>
<table border="1">
<tr>
	<th>거래처유형</th>
	<td>${customerInfo.cust_type }</td>
	<th>대표자명</th>
	<td>${customerInfo.owner_name }</td>
	<th>담당자이름</th>
	<td>${customerInfo.emp_id }</td>
	<th rowspan="3">주소</th>
	<td rowspan="3">${customerInfo.cust_address }</td>
</tr>
<tr>
	<th>거래처구분</th>
	<td>${customerInfo.cust_class }</td>
	<th>대표전화</th>
	<td>${customerInfo.main_phone }</td>
	<th>담당자이메일</th>
	<td>${customerInfo.emp_email }</td>
</tr>
<tr>
	<th>거래처이름</th>
	<td>${customerInfo.cust_name }</td>
	<th>업태</th>
	<td>${customerInfo.cust_business }</td>
	<th>담당자이메일</th>
	<td>${customerInfo.emp_email }</td>
</tr>
<tr>
	<th>사업자등록번호</th>
	<td>${customerInfo.reg_num }</td>
	<th>종목</th>
	<td>${customerInfo.cust_event }</td>
	<th>FAX번호</th>
	<td>${customerInfo.cust_fax }</td>
	<th>홈페이지</th>
	<td>${customerInfo.cust_homepage }</td>
</tr>
<tr>
	<th>기타</th>
	<td colspan="7">${customerInfo.cust_etc }</td>
</tr>
</table>
<a href="/customer/modify?cust_id=${customerInfo.cust_id }">거래처수정</a>
<a href="/customer/remove?cust_id=${customerInfo.cust_id }">거래처삭제</a>
<a href="/customer/list">목록으로</a>

</body>
</html>