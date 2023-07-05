<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../includes/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<br>

<div class="card-body">
		<h1 class="card-title">
			<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">출고 리스트</font></font>
		</h1>
		
		
<!-- 검색 기능 -->
<form action="/purchasing/outProduct/list" method="get" style="display: inline;">
	<select name="selector">
		<option value="op_id">출고번호</option>
		<option value="op_date">출고일자</option>
		<option value="product_name">품명</option>
		<option value="op_emp">담당직원</option>
	</select> <input type="text" class="form-control" style="width:10%; display:inline;" name="search" placeholder="검색어를 입력해주세요">
	<input type="submit"  class="btn btn-info" value="검색">
</form>


<!-- 테이블 -->
<table border="1" class="table table-hover table-bordered text-center">
	<tr>
	   <th>출고관리번호</th>
	   <th>수주관리번호</th>
	   <th>상세</th>
	   <th>납품처명</th>
	   <th>품명</th>
	   <th>주문수량</th>
	   <th>상품재고</th>
	   <th>재고확인</th>
	   <th>납기일자</th>
	   <th>진행현황</th>
	   <th>출고일자</th>
	   <th>담당직원</th>
	   <th>출고처리</th>
	</tr>
	
	<c:forEach var="op" items="${outproductList}">
		<tr>
		    <td>
		    	<c:choose>
					<c:when test="${empty op.op_id || op.op_id == '0'}"> </c:when>
					<c:otherwise>${op.op_id }</c:otherwise>
				</c:choose>
		    </td>
		    <td>${op.cont_id }</td>
		    <td>
		    	<a href="info?cont_id=${op.cont_id }"
		    		onclick="window.open(this.href, '_blank', 'width=850, height=500, left=510, top=365'); return false;">
		    			<img class="viewDetail" src="${pageContext.request.contextPath}/resources/images/viewDetail.png" width="10px" height="10px" alt="image" />
		    	</a>
		    </td>
		    <td>${op.cust_name }</td>
		    <td>${op.product_name }</td>
		    <td>${op.cont_qty }</td>
		    <td>${op.product_qty }</td>
		    <td>
		    	<c:choose>
		    		<c:when test="${op.product_qty - op.cont_qty >= 0 }">
		    			<span style="color:blue">출고가능</span>
		    		</c:when>
		    		<c:when test="${op.product_qty - op.cont_qty < 0 }">
		    			<span style="color:red">출고불가</span>
		    		</c:when>
		    	</c:choose>
		    </td>
		    <td>${op.due_date }</td>
		    <td>${op.op_process}</td>
		    <td>${op.op_date}</td>
		    <td>
		    	<c:choose>
					<c:when test="${empty op.emp_name }"> </c:when>
					<c:otherwise>${op.emp_name }</c:otherwise>
				</c:choose>
		    </td>
		    <td>
		    	<c:choose>
					<c:when test="${emp_department.equals('구매팀') || emp_department.equals('Master')}">
						<c:if test="${empty op.op_id or op.op_id == '0' }">
							<input type="button" class="btn btn-success" value="출고처리"
					       		   onclick="location.href='/purchasing/outProduct/opid?cont_id=${op.cont_id }';">
						</c:if>
					</c:when>
					<c:otherwise> </c:otherwise>
				</c:choose>
		    </td>
		</tr>
	</c:forEach>
</table>
</div>



<!-- 	페이징 처리  -->
	<div class="template-demo">
		<div class="btn-group" role="group" aria-label="Basic example">
			<c:if test="${pvo.startPage > pvo.pageBlock }">
				<a href="/purchasing/outProduct/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
				<a href="/purchasing/outProduct/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
			</c:forEach>
			
			<c:if test="${pvo.endPage<pvo.pageCount }">
				<a href="/purchasing/outProduct/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
			</c:if>
		</div>
	</div>
<!-- 	페이징 처리  -->



<%@ include file="../../includes/footer.jsp" %>

</body>
</html>