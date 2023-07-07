<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert창 링크 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/table.css"/>
</head>
<body>
	<h1>수주번호 : ${contractInfo.cont_id }</h1>
	<table border="1">
		<tr>
			<th>수주번호</th>
			<td>${contractInfo.cont_id }</td>
			<th>수주처</th>
			<td>${contractInfo.cust_name }</td>
			<th>수주일</th>
			<td>${contractInfo.cont_date }</td>
		</tr>
		<tr>
			<th>상품코드</th>
			<td>${contractInfo.product_id }</td>
			<th>수주량</th>
			<td>${contractInfo.cont_qty }</td>
			
			<th>납기일</th>
			<td>${contractInfo.due_date }</td>
		</tr>
		<tr>
			<th>상품명</th>
			<td>${contractInfo.product_name }</td>
			<th>작업지시번호</th>
			<td>${contractInfo.production_id }</td>
			<th>담당자</th>
			<td>${contractInfo.cont_emp }</td>
		</tr>
	</table>
	<input type="button" class="btn btn-success" value="수주수정" onclick="location.href='/contract/modify?cont_id=${contractInfo.cont_id }'">
	<input type="button" class="btn btn-success" value="수주삭제" onclick="deleteAction('${contractInfo.cont_id}');">
	<input type="button" class="btn btn-light" value="창닫기" onclick="window.close();">
	
	<script type="text/javascript">
	
	function deleteAction(cont_id){
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
					url : '/contract/remove?cont_id='+cont_id, 
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
	}// deleteAction() END
</script>
	
</body>
</html>