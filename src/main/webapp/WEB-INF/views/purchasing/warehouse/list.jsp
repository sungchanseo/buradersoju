<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../../includes/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

function openPopup() {
	window.open('./insert', 'warehousePopup', 'width=800, height=500, left=2000');
}

//체크박스 선택된 개수 출력
function getCheckedCnt()  {
	  // 선택된 목록 가져오기
	  var count = 'input[name="check"]:checked';
	  var selectedElements = document.querySelectorAll(count);
	  // 선택된 목록의 갯수 세기
	  var cnt = selectedElements.length;
	  
	  return cnt;  
	}
//2-1. '수정' 클릭
$(document).ready(function() {
$('.modify').click(function(){ 
	
	if($(this).hasClass('true')) {
		$(this).removeClass('true');	// 한번 더 수정이 안된다면 얘가 문제임 ! remove해서!
		
		// 배열 & 체크박스 변수 생성
		var rowData = new Array();
		var tdArr = new Array();
		var checkbox = $("input[name=check]:checked");
		
		// 체크박스 항목 개수 제어
		if(checkbox.length > 1){
			alert("하나의 항목만 수정이 가능합니다.");
			location.reload();
			return false;
		}else if($('input:checkbox[name="check"]:checked').length == 0){
			alert("수정할 항목을 선택해주세요.");
		}
			
		// 체크된 체크박스 값 가져오기
		checkbox.each(function(i) {

			var tr = checkbox.parent().parent().eq(i);	// checkbox의 부모는 <td>, <td>의 부모는 <tr>
			var td = tr.children();
			
			// 체크된 row의 모든 값 배열에 담기
			rowData.push(tr.text());
			
			// td.eq(0)은 체크박스, td.eq(1)이 ma_id
			// -> 배열 tdArr에 정보를 담음
			var whs_id = td.eq(1).text();
			tdArr.push(whs_id);	// tdArr[0] == ma_id
			
			$.ajax({
				url: "modify",
				type: "get",
				data: { whs_id:whs_id },
				success: function(data) {	// 기존데이터정보(orderVo) 받아옴 
	
					// 여기서 order_id를 이용해서 if문걸어가지고 같은 값일때 아래처럼 나오게하면될듯?!
					
					// orderVo에서 테이블 값 가져오기
				//	var order_date = data.order_date;
				//    console.log(order_date);
				//    console.log(order_date);
				$(data).each(function(idx, obj){
						var str = "";
						str += "<tr>";
						str += "<td><input type='checkbox' name='check'></td>";
						str += "<td>"+ obj.whs_id +"</td>";
						str += "<td><input type='text' id='whs_type' name='whs_type' value="+ obj.whs_type +" readonly></td>";
						str += "<td><input type='text' id='whs_tel' name='whs_tel' value="+ obj.whs_tel +"></td>";
						str += "<td>미사용<input type='radio' id='whs_status' name='whs_status' value='2'>사용<input type='radio' id='whs_status' name='whs_status' value='1'></td>";
						str += "<td><input type='text' id='whs_emp' name='whs_emp' value="+ obj.whs_emp +"></td>";
						// 담당직원 세션에 저장된 아이디 들고오기
						str += "</tr>";			
						$('table').prepend(str);
					});
				},
				error: function() {
					alert("error");
				}
				
			}); //ajax	
			
		}); // function(i)
   }
				// 2-2. '저장' 클릭 
			 	$('.update').click(function(){
					$('.modify').addClass('true');
					var whs_id = tdArr[0];
					var whs_type = $('#whs_type').val();
					var whs_tel = $('#whs_tel').val();
					var whs_status = $('#whs_status').val();
					var whs_emp = $('#whs_emp').val();
	
								
					if(whs_id==="" || whs_type==="" ) {
						alert("모든 order_qty 입력해주세요.");
					} else {
						$.ajax({
							url: "modify",
							type: "post",
							dataType : "json",
							contentType : "application/json;charset=UTF-8",
							data: JSON.stringify({ 
								whs_id:whs_id,
								whs_type:whs_type,
								whs_tel:whs_tel,
								whs_status:whs_status,
								whs_emp:whs_emp
						   }),
							success: function() {
//		 						alert("자재코드 " + ma_id + ", 수정이 완료되었습니다.");
//		 						location.href="/purchasing/material/list";
								alert("발주코드 " + whs_id + ", 수정이 완료되었습니다. @success@" );
								location.href="/purchasing/warehouse/list";
								},
							error: function() {
								alert("발주코드 " + whs_id + ", 수정이 완료되었습니다. @er@ ");
								location.href="/purchasing/warehouse/list";
					    }
			   }); //ajax		
			
			} // if-else
				
		}); // update.click 
		
  }); // modify.click
});



</script>
</head>
<body>
<br>


<div class="card-body">
	<h1 class="card-title">
		<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">창고 리스트</font></font>
	</h1>
	
	
	<!-- 검색 기능 -->
	<form action="/purchasing/inMaterial/list" method="get" style="display: inline;">
		<select name="selector">
			<option value="ma_name">자재명</option>	
			<option value="in_date">입고일자</option>
			<option value="in_emp">담당직원</option>
		</select> <input type="text" class="form-control" style="width:10%; display:inline;" name="search" placeholder="검색어를 입력해주세요">
		<input type="submit"  class="btn btn-info" value="검색">
	</form>
	
	
	<!-- 구매팀일때만 버튼 활성화 -->
	<c:if test="${emp_department.equals('구매팀')}">
		<div style=float:right;>
			<button class="btn btn-success add-button" type="button" onclick="openPopup();">창고등록</button>
			<button class="btn btn-success modify true">창고수정</button>
			<button class="btn btn-success add-button" type="button" onclick="click_add();">창고삭제</button>
			<button class="btn btn-info insert update">저장</button>
		</div>
	</c:if>
	
	
	<!-- 테이블 -->
	<table border="1" class="table table-hover table-bordered text-center">
		<tr>
			<th></th>
			<th>창고번호</th>
			<th>창고타입</th>
			<th>전화번호</th>
			<th>사용여부</th>
			<th>창고관리자</th>
		</tr>
		
		<c:forEach var="wh" items="${warehouseList}">
			<tr>
			   <td><input type="checkbox" name="check"></td>
		       <td>${wh.whs_id}</td>
		       <td>${wh.whs_type}</td>
		       <td>${wh.whs_tel}</td>
		       <td>
		       	 <c:choose>
		       		<c:when test="${wh.whs_status == 1}">사용중</c:when>
		       		<c:when test="${wh.whs_status == 2}">미사용</c:when>
		       	 </c:choose>
		       </td>
		       <td>${wh.whs_emp}</td>
<%-- 		       <td><a href="/purchasing/warehouse/modify?whs_id=${wh.whs_id}">수정</a></td> --%>
<%-- 		       <td><a href="/purchasing/warehouse/remove?whs_id=${wh.whs_id}">삭제</a></td> --%>
			</tr>
		</c:forEach>
	</table>
</div>





<%@ include file="../../includes/footer.jsp" %>
</body>
</html>