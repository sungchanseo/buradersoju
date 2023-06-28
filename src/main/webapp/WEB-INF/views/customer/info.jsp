<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> <!-- 제이쿼리 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
     <h1 class="card-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${customerInfo.cust_name } </font></font></h1>

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
	<input type="button" class="btn btn-success" value="거래처수정" onclick="location.href='/customer/modify?cust_id=${customerInfo.cust_id }'">
	<input type="button" class="btn btn-success" value="거래처삭제" onclick="deleteAction(${customerInfo.cust_id});">
	<input type="button" class="btn btn-light" value="QR코드생성" onclick="">
	<input type="button" class="btn btn-light" value="창닫기" onclick="window.close();">

<script type="text/javascript">
	function deleteAction(cust_id){
		if(confirm('삭제하시겠읍니까?')){
			$.ajax({
				url : '/customer/remove?cust_id='+cust_id, 
				type : 'POST', 
				success : function(json){ //가져올 데이타가 따로 없을 때는 json 타입을 넣는다. 있을 때는 data라고 적는다. 
					alert("거래처는 사라졌읍니다.");
					window.opener.location.reload();
					window.close();
				}
			});
		}else{
			return false;
		}
	}

</script>
</body>
</html>