<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>작업지시 현황</h1>
	
  <form action="" method="get">   
    <label>검색</label><br>
	  <select name="wosearch" id="wosearch">
	    <option> </option>
	    <option value="production_id">작업지시번호</option>
	    <option value="cont_id">수주번호</option>
	    <option value="production_date">작업지시일시</option>
	    <option value="production_line">생산라인</option>
	  </select>
	  <input type="submit" value="검색">
  </form>
  
	<input type="button" value="생산 등록" onclick="location.href='./workOrderInsert';">
	<br>
	<input type="button" value="엑셀파일">
	<input type="button" value="인쇄하기">
	
  <table border="1">
    <tr>
	  <th>작업지시번호</th>
	  <th>수주번호</th>
	  <th>작업지시자</th>
	  <th>작업지시일시</th>
	  <th>생산라인</th>
	  <th>상품코드</th>
	  <th>상품명</th>
	  <th>작업지시수량</th>
	  <th>생산수량</th>
	  <th>작업상태</th>
	</tr>
	<c:forEach var="workOrderList" items="${workOrderList }">
	 <tr>  
	  <td>${workOrderList.production_id}</td>
	  <td>${workOrderList.cont_id}</td>
	  <td>${workOrderList.production_emp}</td>
	  <td>${workOrderList.production_date}</td>
	  <td>${workOrderList.production_line}</td>
	  <td>${workOrderList.product_id}</td>
	  <td>${workOrderList.product_name}</td>
	  <td>${workOrderList.plan_qty}</td>
	  <td>${workOrderList.production_qty}</td>
	  <td>${workOrderList.production_state}</td>
	 </tr>
	</c:forEach>
  </table>
	
</body>
</html>