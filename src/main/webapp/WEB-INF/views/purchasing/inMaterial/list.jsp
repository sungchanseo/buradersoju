<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../includes/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
// $(document).ready(function(){
	
// 	// '입고처리' 버튼 클릭
// 	$('.inidDone').click(function(){
// 		var btn = $(this);
// 		var tr = btn.parent().parent();		// btn.parent()          : btn의 부모는 <td>
// 		var td = tr.children();				// btn.parent().parent() : <td>의 부모는 <tr>		
	
// 		var order_id = td.eq(1).text();
// 		var ma_id = td.eq(3).text();
		
// 		$.ajax({
// 			url: "list",
// 			type: "post",
// 			data: {
// 				order_id:order_id,
// 				ma_id:ma_id
// 			},
// 			success: function(data){
// 				alert("maqtyList 가져오기 성공");
// 				var re_inId = data[0].in_id;	// 최신 입고번호
// 				var re_inId = data[0].add_ma;	// 최신 입고번호의 총재고량
				
// 				// 입고처리
// 				// 입고번호 및 총재고량 적용
// 				alert("입고처리 (입고번호+총재고량 적용) 시작");
// 				location.href="/purchasing/inMaterial/inid?order_id="+order_id+"&ma_id="+ma_id;
// 			},
// 			error: function(){
// 				alert("error");
// 			}
// 		});

// 	}); // inidDone.click
	
// }); // JQuery
</script>
</head>
<body>
<br>
${maqtyList }
<br>
<div>
 	<fmt:formatDate value=""/> 
	<table border="1" class="table">
	<tr>
		<th>입고번호</th>
		<th>발주번호</th>
		<th>상세</th>
		<th>자재코드</th>
		<th>품명</th>		
		<th>입고수량</th>
		<th>현재고량</th>
		<th>총재고량</th>
		<th>진행현황</th>
		<th>창고번호</th>
		<th>선반위치</th>
		<th>입고일자</th>
		<th>입고담당직원</th>
		<th>입고처리</th>
	</tr>
      
      <c:forEach var="iml" items="${inMaterialList }">
         <tr>
			<td>
				<c:choose>
					<c:when test="${iml.in_id == '0' }"> </c:when>
					<c:otherwise>${iml.in_id }</c:otherwise>
				</c:choose>
			</td>
			<td>${iml.order_id }</td>		
			<td>
				<a href="info?order_id=${iml.order_id }"
				   onclick="window.open(this.href, '_blank', 'width=900, height=350, left=510, top=365'); return false;">
						<img class="viewDetail" src="${pageContext.request.contextPath}/resources/images/viewDetail.png" width="25px" height="25px" alt="image" />
				</a>
			</td>
			<td>${iml.ma_id }</td>
			<td>${iml.ma_name }</td>
			<td>${iml.order_qty }</td>
			<td>
				<c:choose>
					<c:when test="${iml.ma_qty < 100 }">
						<span style="color:red">${iml.ma_qty }</span>
					</c:when>
					<c:when test="${empty iml.in_id }">
						${iml.ma_qty }
					</c:when>
					<c:when test="${!empty iml.in_id }">
						${iml.add_ma - iml.order_qty }
					</c:when>
				</c:choose>
			</td>
			<td>${iml.add_ma }</td>
			<td>${iml.in_process }</td>			
			<td>${iml.whs_id }</td>
			<td>${iml.shelt_position }</td>
			<td><fmt:formatDate value="${iml.in_date}" pattern="yyyy-MM-dd"/></td>
			<td>
				<c:choose>
					<c:when test="${iml.in_emp == 0}">　</c:when>
					<c:otherwise>${iml.in_emp }</c:otherwise>
				</c:choose>
			</td>
			<td>		
				<c:if test="${empty iml.in_id or iml.in_id == '0'}">
					<input type="button" class="btn-outline-success inidDone" value="입고처리"
					       onclick="location.href='/purchasing/inMaterial/inid?order_id=${iml.order_id }&ma_id=${iml.ma_id }';">
				</c:if>
			</td>
         </tr>
      </c:forEach>
	</table>
</div>

<%@ include file="../../includes/footer.jsp" %>

</body>
</html>