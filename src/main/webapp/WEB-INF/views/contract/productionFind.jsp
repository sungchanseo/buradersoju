<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업지시번호 등록</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
</head>
<body>
<h1>작업지시번호 검색</h1>
	<!-- 검색창기능 -->
<!-- 	<form action="" method="get" style="display: inline;"> -->
<!-- 		<select name="selector"> -->
<!-- 			<option value="">상호</option> -->
<!-- 			<option value="">거래처코드</option> -->
<!-- 		</select> <input type="text" style="display:inline;" name="search" placeholder="검색어를 입력해주세요"> -->
<!-- 		<input type="submit"  class="btn btn-info" value="검색"> -->
<!-- 	</form> -->
	<!-- 검색창기능 -->

	<!-- 사원목록 테이블 -->
	<div class="table-responsive">
        <table class="table table-hover" style="text-align :center;">
          <thead>
            <tr>
              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">작업지시번호</font></font></th>
              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품코드</font></font></th>
              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품명</font></font></th>
              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">생산담당자</font></font></th>
              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">생산단계</font></font></th>
              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">작업완료일시</font></font></th>
            </tr>
          </thead>
          <c:forEach var="vo" items="${productionList }">
           <tbody>
			  <c:if test="${vo.production_status == '혼합'}">
	             <tr onclick="sendProductionInfoValue('${vo.production_id}');">
	               <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.production_id }</font></font></td>
	               <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.product_id }</font></font></td>
	               <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.product_name }</font></font></td>
	               <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.emp_name }</font></font></td>
	               <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.production_status }</font></font></td>
	               <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.stage1_date }</font></font></td>
	             </tr>
             </c:if>
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
	<script>
	
	//부모창으로 값 보내기 
	function sendProductionInfoValue(id){
		$.ajax({
			url : '/contract/productionInfo',
			type : 'get',
			data : {
				cust_id : id
			},
			success : function(data){
				window.opener.document.getElementById("production_id").value = data.production_id;
				window.close();
			}
		});//ajax END
	}//sendEmpInfoValue END
	
	</script>
</body>
