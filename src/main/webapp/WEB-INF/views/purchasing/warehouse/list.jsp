<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../includes/header.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert창 링크 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

//팝업창 열기	  
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
			
			// td.eq(0)은 체크박스, td.eq(1)이 whs_id
			// -> 배열 tdArr에 정보를 담음
			var whs_id = td.eq(1).text();
			tdArr.push(whs_id);	// tdArr[0] == whs_id
			
			$.ajax({
				url: "modify",
				type: "get",
				data: { whs_id:whs_id },
				success: function(data) {
				      console.log(data);
				$(data).each(function(idx, obj){
						var str = "";
						str += "<tr id='key_id'>";
						str += "<td><input type='checkbox' name='check'></td>";
						str += "<td>"+ obj.whs_id +"</td>";
						str += "<td><input type='text' id='whs_type' name='whs_type' value="+ obj.whs_type +" readonly></td>";
						str += "<td><input type='text' id='whs_tel' name='whs_tel'  value="+ obj.whs_tel +"></td>";
						str += "<td>미사용<input type='radio' id='whs_status' name='whs_status' value='2'>사용<input type='radio' id='whs_status' name='whs_status' value='1'></td>";
						str += "<td><input type='text' id='whs_emp' name='whs_emp' value="+ obj.emp_name +"></td>";
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
					var whs_tels = $('#whs_tel').val();
					var whs_tel = $("input[name='whs_tel']").val();
					var whs_status = $("input[name='whs_status']:checked").val();
					var whs_emp = "${sessionScope.emp_id}";
	                console.log(whs_tel);
	                console.log(whs_tels);
	                console.log(whs_status);
	                console.log(whs_emp);
				    $.ajax({
							url: "modify",
							type: "post",
							contentType : "application/json;charset=UTF-8",
							data: JSON.stringify({ 
								whs_id:whs_id,
								whs_type:whs_type,
								whs_tel:whs_tel,
								whs_status:whs_status,
								whs_emp:whs_emp
							}),
							success: function() {
								alert("창고코드 " + whs_id + ", 수정이 완료되었습니다. ");
								location.href="/purchasing/warehouse/list";
								},
							error: function() {
								alert("창고코드 " + whs_id + ", 수정이 완료되었습니다. @er@ ");
								location.href="/purchasing/warehouse/list";
					    }
			   }); //ajax		
			
		}); // update.click 
		
  }); // modify.click
  
//3-1. '삭제' 클릭
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
			var whs_id = td.eq(1).text();
			tdArr.push(whs_id);	// tdArr[0]
        console.log(whs_id);
		}); // function(i)
		
	
		// 3-2. 체크된 데이터 컨트롤러 전달
		var whs_id = tdArr[0];
		
		$.ajax({
			url: "delete",
			type: "post",
			data: { whs_id:whs_id },
			success: function() {
				Swal.fire({
					text: '창고번호 ' + whs_id + '를 정말 삭제하시겠습니까?',
					icon: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#0ddbb9',
					cancelButtonColor: '#d33',
					confirmButtonText: '확인',
					cancelButtonText: '취소'
				}).then((result) => {
					if (result.isConfirmed) {
						Swal.fire({
							icon: 'success',
							title: '완료',
							text: '창고번호 ' + whs_id + ', 삭제가 완료되었습니다.',
							confirmButtonColor: '#0ddbb9',
							confirmButtonText: '확인',
						}).then((result) => {
							if(result.isConfirmed){
								location.href="/purchasing/warehouse/list";
							}
						}); // then(result) 삭제하시겠습니까?
					}
				}); // then(result) 삭제가 완료되었습니다
			},
			error: function() {
				Swal.fire({
					icon: 'warning',
					text: '삭제할 항목을 선택해주세요.',
					confirmButtonColor: '#0ddbb9',
					confirmButtonText: '확인',
				}).then((result) => {
					if(result.isConfirmed){
						return false;
					}
				}); // then(result)
			} //error
	    }); //ajax		
	
	}); // deleteForm.click
  
}); // jquery
</script>
</head>
<body>
<br>

	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper"> 
			<div class="main-panel">
				<div class="content-wrapper d-flex align-items-center auth px-0"
					style="min-height: 100vh;">
					<div class="row w-100 mx-0">
						<div class="col-lg-12 mx-auto">
							<div class="auth-form-light text-left py-5 px-4 px-sm-5"
								style="height: 1000px;">
 	
 	<!-- 제목 -->
 	<div class="card-body">
	     <h1 class="card-title">
		    <font style="vertical-align: inherit;">
		    <a href="/purchasing/warehouse/list"
   		       style="text-decoration: none; color: #000;">창고 리스트</a></font>
     	 </h1>
	</div>
 	
     <c:if test="${emp_department.equals('구매팀') || emp_department.equals('Master')}">
		<div style=float:right;>
			<button class="btn btn-success add-button" type="button" onclick="openPopup();">등록</button>
		    <button class="btn btn-success modify true">수정</button>
			<button class="btn btn-success" id="delete">삭제</button>
			<button class="btn btn-info insert update">저장</button>
		</div>
	</c:if>	
	<div>
	<ul class="nav nav-tabs tab-no-active-fill" role="tablist">
	   <li class="nav-item">
	<a class="nav-link ps-2 pe-2 active" id="stage1-tab" data-bs-toggle="tab" href="#stage1" role="tab" aria-controls="stage1" aria-selected="true">자재창고</a>
	   </li>
	   <li class="nav-item">
	<a class="nav-link ps-2 pe-2" id="stage2-tab" data-bs-toggle="tab" href="#stage2" role="tab" aria-controls="stage2" aria-selected="false">상품창고</a>
       </li>
	</ul>								
	  <div class="tab-content tab-no-active-fill-tab-content">
	
	  <div class="tab-pane fade active show" id="stage1" role="tabpanel" aria-labelledby="stage1-tab">
     <div>
	<!-- 테이블 -->
	
	<table border="1" class="table table-hover table-bordered text-center">
		<thead>
		<tr>
			<th></th>
			<th>창고번호</th>
			<th>창고타입</th>
			<th>전화번호</th>
			<th>사용여부</th>
			<th>창고관리자</th>
		</tr>
		</thead>
		<tbody id="tbody">
		<c:forEach var="wh" items="${warehouseList}">
			  <tr>
			<c:choose>
			   <c:when test="${wh.whs_type.equals('자재')}">
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
		       <td>${wh.emp_name}</td>
		          </c:when>
		       </c:choose>
			 </tr>
	   	  </c:forEach>
		</tbody>
	</table>
  </div>
</div>
<!-- 2번째 탭 내용들  -->
<div class="tab-pane fade show" id="stage2" role="tabpanel" aria-labelledby="stage2-tab">
	<!-- 테이블 -->
	<table border="1" class="table table-hover table-bordered text-center">
		<thead>
		  <tr>
			<th></th>
			<th>창고번호</th>
			<th>창고타입</th>
			<th>전화번호</th>
			<th>사용여부</th>
			<th>창고관리자</th>
		  </tr>
		</thead>
      <tbody id="tbody">		
		<c:forEach var="wh" items="${warehouseList}">
			<tr>
			<c:choose>
			   <c:when test="${wh.whs_type.equals('상품')}">
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
		       <td>${wh.emp_name}</td>
		         </c:when>
		       </c:choose>
			</tr>
	 	 </c:forEach>
	   </tbody>
	</table>
              </div>
             </div>
           </div>
          </div>
         </div>
        </div>
       </div>
     </div>
    </div>
  </div>
 
<%@ include file="../../includes/footer.jsp" %>
</body>
</html>
