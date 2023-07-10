<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 정보</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> <!-- 제이쿼리 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert창 링크 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
<link rel="stylesheet" href="${contextPath }/resources/css/table.css" />
</head>
<body>
     <h1 class="card-title" style="display:inline;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${customerInfo.cust_name } </font></font></h1>
    <div style="float:right; display:inline-block;"> 
		<input type="button" class="btn btn-success" value="거래처수정" onclick="location.href='/customer/modify?cust_id=${customerInfo.cust_id }'">
		<input type="button" class="btn btn-success" value="거래처삭제" onclick="deleteAction('${customerInfo.cust_id}');">
<!-- 		<input type="button" class="btn btn-light" value="QR코드생성" onclick=""> -->
		<input type="button" class="btn btn-light" value="창닫기" onclick="window.close();">
	</div>
	<div class="btn_table" style="table-layout: fixed;">
	<table border="1">
		<tr>
			<th>거래처유형</th>
			<td>${customerInfo.cust_type }</td>
			<th>대표자명</th>
			<td>${customerInfo.owner_name }</td>
			<th>담당자이름</th>
			<td>${customerInfo.emp_name }</td>
			<th rowspan="3">기타</th>
			<td rowspan="3" style="width:10%;">${customerInfo.cust_etc }</td>
		</tr>
		<tr>
			<th>거래처구분</th>
			<td>${customerInfo.cust_class }</td>
			<th>대표전화</th>
			<td>${customerInfo.main_phone }</td>
			<th>담당자전화번호</th>
			<td>${customerInfo.emp_tel }</td>
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
			<th>주소</th>
			<td colspan="7">${customerInfo.cust_address }</td>
		</tr>
	</table>
	</div>

<script type="text/javascript">
	function deleteAction(cust_id){
		Swal.fire({
	        title: '삭제하시겠읍니까?',
	        text: '예/아니오를 선택하세요.',
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#0ddbb9',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '삭제',
	        cancelButtonText: '취소'
	    }).then((result) => {
			if(result.isConfirmed){
				$.ajax({
					url : '/customer/remove?cust_id='+cust_id, 
					type : 'POST', 
					success : function(){ 
						Swal.fire({
	                        title: '삭제가 완료되었습니다.',
	                        text: '확인을 누르면 창을 닫습니다.',
	                        icon: 'success',
	                        confirmButtonText: '확인'
	                    }).then(() => {
	                        window.opener.location.reload();
	                        window.close();
	                    }); //then END
					}//success END
				});//ajax END
			}// result.siConfirmed END
	    }); //then(result) END
	}// deleteAction
</script>
</body>
</html>