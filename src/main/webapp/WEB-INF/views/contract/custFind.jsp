<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 검색</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert창 링크 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
</head>
<style>
.table-responsive {
	margin-bottom: 1em;}
.input_css {
	border-radius: 10px;
    padding: 6px 6px;}
</style>
<body>
<div style="padding: 2%;">
<h1>거래처 검색</h1>
	<!-- 검색창기능 -->
	<form action="" method="get" style="display: inline;">
		<select name="selector" style="padding: 6px 6px; color: #6C7293; border-radius: 10px; text-align: center;">
			<option value="cust_name">상호</option>
			<option value="cust_id">거래처코드</option>
		</select> <input type="text" style="display:inline;" class="input_css" name="search" placeholder="검색어를 입력해주세요">
		<input type="submit"  class="btn btn-info" value="검색">
	</form>
	<!-- 검색창기능 -->

	<!-- 사원목록 테이블 -->
	<div class="table-responsive">
        <table class="table table-hover" style="text-align :center;">
          <thead>
            <tr>
              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처코드</font></font></th>
              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">사업자등록번호</font></font></th>
              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상호</font></font></th>
              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처구분</font></font></th>
              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">대표자명</font></font></th>
            </tr>
          </thead>
          <c:forEach var="vo" items="${customerList }">
           <tbody>
             <tr onclick="sendCustInfoValue('${vo.cust_id}');">
               <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.cust_id }</font></font></td>
               <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.reg_num }</font></font></td>
               <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.cust_name }</font></font></td>
               <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.cust_class }</font></font></td>
               <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.owner_name }</font></font></td>
             </tr>
           </tbody>
       	  </c:forEach>
        </table>
    </div>
        
        <!--	페이징처리  -->
		<c:if test="${pvo.startPage > pvo.pageBlock }">
			<a href="/contract/custFind?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
			<a href="/contract/custFind?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
		</c:forEach>
		
		<c:if test="${pvo.endPage<pvo.pageCount }">
			<a href="/contract/custFind?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
		</c:if>
		<!--	페이징처리  -->
</div>
	<script>
	
	//부모창으로 값 보내기 
	function sendCustInfoValue(id){
		$.ajax({
			url : '/contract/custInfo',
			type : 'get',
			data : {
				cust_id : id
			},
			success : function(data){
				window.opener.document.getElementById("cust_name").value = data.cust_name;
				window.opener.document.getElementById("cust_id").value = data.cust_id;
				window.close();
			}
		});//ajax END
	}//sendEmpInfoValue END
	
	</script>
</body>
