<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	
// 	function loadJson(){
// 		$.ajax({
// 			uri:"production/workOrderList",
// 			type:"GET"
// 			dataType:"json",
// 			sucess:ajaxHtml,
// 			error:function(){
// 				alert("error");
// 			}
// 		});
// 	}
	
// 	function ajaxHtml(data){
// 		$
// 	}
	
</script>

<title>Insert title here</title>
</head>
<body>
	<h1>작업지시 등록</h1>
	
	<table border="1">
    <tr>
      <th>수주번호</th>
	  <th>수주처코드</th>
	  <th>수주처이름</th>
	  <th>상품코드</th>
	  <th>상품명</th>
	  <th>담당자</th>
	</tr>
	<c:forEach var="workOrderList" items="${workOrderList }">
	 <tr>  
	  <td>${workOrderList.production_id}</td>
	  <td>${workOrderList.cont_id}</td>
	  <td>${workOrderList.production_emp}</td>
	  <td>${workOrderList.production_date}</td>
	  <td>${workOrderList.production_line}</td>
	  <td>${workOrderList.product_id}</td>
	 </tr>
	</c:forEach>
  </table>
	
	<br>
	
	<form role="form" method="post">
<!-- 		작업지시번호 <input type="text" name="production_id"> <br> -->
		작업지시자 <input type="text" name="production_emp">
		
		생산라인
		<select name="production_line" id="line">
		    <option value="1라인">1라인</option>
		    <option value="2라인">2라인</option>
		    <option value="3라인">3라인</option>
		</select>
		<br>
<!-- 		출고예정일 <input type="text" name="production_id"> -->
		작업지시수량 <input type="text" name="plan_qty">
		<br>
		<button type="submit">등록</button>
	</form>

</body>
</html>