<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../includes/header.jsp" %>

<style type="text/css">
table {width: 100%;
/* table-layout:fixed;  */}

/* table tr>th:nth-of-type(1) {width:50px !important;
}
  */
table tr>td:nth-of-type(1) {width:50px !important;
}

table input {width:7em;}
table input[type:checkbox] {width:1em;}

</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

// http://localhost:8088/purchasing/material/list

// 오늘 날짜 출력
function getToday() {
	var date = new Date();
	var year = date.getFullYear();
	var month = ("0" + (1 + date.getMonth())).slice(-2);
	var day = ("0" + date.getDate()).slice(-2);
     
	return year + "-" + month + "-" + day;
}
	
	
// DB에 있는 품목코드 최대값 + 1
function addNumber(){	
	// maxNumber가 없을 때 (품목코드 첫 등록)
	var maxNumber = "${maxNumber }";
	if(maxNumber == ""){
		maxNumber = "000";
		console.log("************ (if)전달받은 maxNumber =  " + maxNumber);
	}else{	// 있을 때
		maxNumber = "${maxNumber}";
		console.log("************ (else)전달받은 maxNumber =  " + maxNumber);
	}
	
	// 다음 번호 생성
	var nextNumber = String(Number(maxNumber) + 1).padStart(3,'0');
	console.log("************ 포매팅 nextNumber =  " + nextNumber);	
	return nextNumber;
}


// 체크박스 선택된 개수 출력
function getCheckedCnt()  {
  // 선택된 목록 가져오기
  var count = 'input[name="check"]:checked';
  var selectedElements = document.querySelectorAll(count);
  // 선택된 목록의 갯수 세기
  var cnt = selectedElements.length;
  
  return cnt;  
}




$(document).ready(function() {
	// 1-1. '등록' 클릭
	$('.insertForm').click(function() {
    	  
		// 날짜 정보 저장
		let regdate = getToday();
		
		// ma_id 정보 저장
		var nextNumber = addNumber();
		var ma_id = "MA" + nextNumber;
		console.log("************ 품목코드 = " + ma_id);
		
		// 직원 정보 저장
		var ma_emp = "${sessionScope.emp_id }";
		var emp_name = "${sessionScope.emp_name }";
		console.log("************ 로그인 아이디 + 이름 = " + ma_emp + emp_name);
		
		// 행 추가
		if($(this).hasClass('true')) {
			var tbl = "<tr>";
			tbl += "<td>";
			tbl += "</td>";
			tbl += "<td>";
			tbl += ma_id; 	// 자동넘버링
	        tbl += "</td>";
	        tbl += "<td>";
	        tbl += "<input type='text' name='ma_name' id='ma_name'>";
	        tbl += "</td>";
	        tbl += "<td>";
	        tbl += "<input type='text' name='unit' id='unit'>";
	        tbl += "</td>";
	        tbl += "<td>";
	        tbl += "<input type='text' name='ma_qty' id='ma_qty'>";
	        tbl += "</td>";
	        tbl += "<td>";
	        tbl += "<input type='text' name='unit_cost' id='unit_cost'>";
	        tbl += "</td>";
	        tbl += "<td>";
	        tbl += "<input type='text' name='whs_id' id='whs_id'>";
	        tbl += "</td>";
	        tbl += "<td>";
	        tbl += "<input type='text' name='shelt_position' id='shelt_position'>";
	        tbl += "</td>";
	        tbl += "<td>";
	        tbl += regdate;
	        tbl += "</td>";
	        tbl += "<td>";
	        tbl += emp_name;
	        tbl += "</td>";
	        tbl += "</tr>";
            
			$('table').prepend(tbl);
			$(this).removeClass('true');
			
			
			// 1-2. '저장' 클릭 
			// 입력한 데이터 컨트롤러 전달 (저장) -> 리스트 이동
			$('.insert').click(function(){
				// ma_id 정보 및 입력된 정보 저장
				var nextNumber = addNumber();
				var ma_id = "MA" + nextNumber;
				var whs_id = $('#whs_id').val();
				var ma_name = $('#ma_name').val();
				var unit = $('#unit').val();
				var ma_qty = $('#ma_qty').val();
				var unit_cost = $('#unit_cost').val();
				var shelt_position = $('#shelt_position').val();
				var ma_regdate = $('#ma_regdate').val();
				var ma_emp = "${sessionScope.emp_id }";
				var emp_name = "${sessionScope.emp_name }";
				
				if(whs_id==="" || ma_name==="" || unit==="" || ma_qty==="" || unit_cost==="" || shelt_position==="") {
					alert("모든 정보를 입력해주세요.");
				} else {
			             
					$.ajax({
						url: 'maid',
						type: 'post',
						data: {
							whs_id:whs_id,
                            ma_id:ma_id,
                            ma_name:ma_name,
                            unit:unit,
                            ma_qty:ma_qty,
                            unit_cost:unit_cost,
                            shelt_position:shelt_position,
                            ma_regdate:ma_regdate,
                            ma_emp:ma_emp,
                            emp_name:emp_name
						},
						success: function() {
							alert("자재코드 " + ma_id + ", 등록 완료되었습니다.");
							location.href="/purchasing/material/list";
						},
						error: function(err) {
							alert("error");
						}
					}); //ajax
				
				} // if-else
						
			}); // regist.click
			
		} // 행추가 if
		
	}); // insertForm.click
	
	
	
	// 2-1. '수정' 클릭
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
				var ma_id = td.eq(1).text();
				tdArr.push(ma_id);	// tdArr[0] == ma_id
				
				$.ajax({
					url: "modify",
					type: "get",
					data: { ma_id:ma_id },
					success: function(data) {	// 기존데이터정보(resultVO) 받아옴 
		
						// 여기서 ma_id를 이용해서 if문걸어가지고 같은 값일때 아래처럼 나오게하면될듯?!
						
						// resultVO에서 테이블 값 가져오기
						$(data).each(function(idx, obj){
							var str = "";
							str += "<tr>";
							str += "<td><input type='checkbox' name='check'></td>";
							str += "<td>"+ obj.ma_id +"</td>";
							str += "<td><input type='text' id='ma_name' name='ma_name' value="+ obj.ma_name +"></td>";
							str += "<td><input type='text' id='unit' name='unit' value="+ obj.unit +"></td>";
							str += "<td><input type='text' id='ma_qty' name='ma_qty' value="+ obj.ma_qty +"></td>";
							str += "<td><input type='text' id='unit_cost' name='unit_cost' value="+ obj.unit_cost +"></td>";
							str += "<td><input type='text' id='whs_id' name='whs_id' value="+ obj.whs_id +"></td>";
							str += "<td><input type='text' id='shelt_position' name='shelt_position' value="+ obj.shelt_position +"></td>";
							str += "<td>"+ getToday() +"</td>";
							str += "<td><input type='text' id='emp_name' name='emp_name' value="+ obj.emp_name +"></td>";	
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
			
			var ma_id = tdArr[0];
			var whs_id = $('#whs_id').val();
			var ma_name = $('#ma_name').val();
			var unit = $('#unit').val();
			var ma_qty = $('#ma_qty').val();
			var unit_cost = $('#unit_cost').val();
			var shelt_position = $('#shelt_position').val();
			var ma_regdate = getToday();
			var ma_emp = "${sessionScope.emp_id }";
			var emp_name = $('#emp_name').val();
						
			if(whs_id==="" | ma_name==="" || unit==="" || ma_qty==="" || unit_cost==="" || shelt_position==="") {
				alert("모든 정보를 입력해주세요.");
			} else {
				$.ajax({
					url: "modify",
					type: "post",
					dataType : "json",
					contentType : "application/json;charset=UTF-8",
					data: JSON.stringify({ 
						    whs_id:whs_id,
						    ma_id:ma_id,
						    ma_name:ma_name,
					  	    unit:unit,
						    ma_qty:ma_qty,
						    unit_cost:unit_cost,
						    shelt_position:shelt_position,
						    ma_regdate:ma_regdate,
						    ma_emp:ma_emp,
						    emp_name:emp_name }),
					success: function() {
// 						alert("자재코드 " + ma_id + ", 수정이 완료되었습니다.");
// 						location.href="/purchasing/material/list";
						alert("찐에러! material/list.jsp line 274 수정하긩");
						},
					error: function() {
						alert("자재코드 " + ma_id + ", 수정이 완료되었습니다.");
						location.href="/purchasing/material/list";
						}
				}); //ajax
						
			} // if-else
				
		}); // update.click
		
	}); // modify.click
	
	
	
	// 3-1. '삭제' 클릭
	$('#delete').click(function(){ 
			
		var rowData = new Array();
		var tdArr = new Array();
		var checkbox = $("input[name=check]:checked");
		
		// 체크된 체크박스 값을 가져옴
		checkbox.each(function(i) {

			// checkbox.parent()          : checkbox의 부모는 <td>
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			// 체크된 row의 모든 값 배열에 담기
			rowData.push(tr.text());
			
			// td.eq(0)은 체크박스, td.eq(1)이 ma_id
			var ma_id = td.eq(1).text();
			tdArr.push(ma_id);	// tdArr[0]

		}); // function(i)
		
	
		// 3-2. 체크된 데이터 컨트롤러 전달
		var ma_id = tdArr[0];
		
		$.ajax({
			url: "delete",
			type: "post",
			data: { ma_id:ma_id },
			success: function() {
				var result = confirm("품목코드 " + ma_id + "를 정말 삭제하시겠습니까?");
				if(result){
					alert("삭제가 완료되었습니다.");
					location.href="/purchasing/material/list";
				}
			},
			error: function() {
				alert("삭제할 항목을 선택해주세요.");
			}
		}); //ajax		

	}); // deleteForm.click
	
}); // jQuery
</script>
</head>
<body>

<div class="card-body">

	<h1 class="card-title">
		<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">자재 리스트</font></font>
	</h1>

	<!-- 검색 기능 -->
	<form action="/purchasing/material/list" method="get" style="display: inline;">
		<select name="selector">
			<option value="ma_id">자재코드</option>
			<option value="ma_name">자재명</option>
		</select> <input type="text" class="form-control" style="width:10%; display:inline;" name="search" placeholder="검색어를 입력해주세요">
		<input type="submit"  class="btn btn-info" value="검색">
	</form>

	
	<!-- 구매팀일때만 버튼 활성화 -->
	<c:if test="${emp_department.equals('구매팀') || emp_department.equals('Master')}">
		<div style=float:right;>
			<button class="btn btn-success insertForm true">등록</button>
			<button class="btn btn-success modify true">수정</button>
			<button class="btn btn-success" id="delete">삭제</button>
			<button class="btn btn-info insert update">저장</button>
		</div>
	</c:if>


	<!-- 테이블 -->
	<div class="row">
  	<fmt:formatDate value=""/> 	
	<table border="1" class="table table-bordered table-hover text-center">
	 <thead>
	 <tr>
		<th></th>
		<th>품목코드</th>
		<th>품목명</th>
		<th>단위</th>
		<th>재고량</th>
		<th>단가 (WON)</th>
		<th>창고번호</th>
		<th>선반위치</th>
		<th>최근 수정 날짜</th>
		<th>담당직원</th>
	 </tr>
	 </thead>
	
	 <tbody id="tbody">
      <c:forEach var="ml" items="${materialList }">
         <tr>
         	<td><input type="checkbox" name="check"></td>
         	<td>${ml.ma_id }</td>
			<td>${ml.ma_name }</td>
			<td>${ml.unit }</td>
			<td>
				<c:choose>
					<c:when test="${ml.ma_qty <= 100 }">
						<span style="color:red">${ml.ma_qty }</span>
					</c:when>
					<c:otherwise>${ml.ma_qty }</c:otherwise>
				</c:choose>
			</td>			
			<td>${ml.unit_cost }</td>
         	<td>${ml.whs_id }</td>
			<td>${ml.shelt_position }</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ml.ma_regdate}"/></td>
			<td>${ml.emp_name }</td>
         </tr>
      </c:forEach>
     </tbody>
    </table>
  	</div>
 </div>
 
 
<!-- 페이징 처리 -->
<div class="template-demo">
	<div class="btn-group" role="group" aria-label="Basic example">
		<c:if test="${pvo.startPage > pvo.pageBlock }">
			<a href="/purchasing/material/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
			<a href="/purchasing/material/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
		</c:forEach>
		
		<c:if test="${pvo.endPage<pvo.pageCount }">
			<a href="/purchasing/material/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
		</c:if>
	</div>
</div>
<!-- 페이징 처리 -->

<%@ include file="../../includes/footer.jsp" %>
</body>
</html>
