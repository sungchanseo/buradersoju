<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> <!-- 제이쿼리 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->
</head>
<body>
	<div class="card-body">
		<h1 class="card-title">
			<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처 리스트</font></font>
		</h1>

		<!-- 검색창기능 -->
		<form action="/customer/list" method="get" style="display: inline;">
		
			<select name="selector">
				<option value="cust_name">상호</option>
				<option value="cust_id">거래처코드</option>
			</select> <input type="text" style="display:inline;" name="search" placeholder="검색어를 입력해주세요">
			<input type="submit"  class="btn btn-info" value="검색">
		</form>
		
		<!-- 검색창기능 -->
		
		<!-- 영업팀이 아닐때 버튼 감추기 -->
		<c:if test="${emp_department.equals('영업') || emp_department.equals('영업팀')}">
			<input type="button" value="거래처등록" class="btn btn-success" onclick="insertPop();"> 
			<input type="button" value="거래처삭제"  class="btn btn-success" id="btnD" onclick="removeChecked();">
		</c:if>
		<!-- 영업팀이 아닐때 버튼 감추기 -->

		<!-- 거래처목록 테이블 -->
		<div class="table-responsive">
            <table class="table table-hover" style="text-align :center;">
              <thead>
                <tr>
                  <th><input type="checkbox" id="checkAll" onclick="allCheckBox();"></th>
                  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처코드</font></font></th>
                  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">사업자등록번호</font></font></th>
                  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상호</font></font></th>
                  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처구분</font></font></th>
                  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">대표자명</font></font></th>
                  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">대표번호</font></font></th>
                  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">업태</font></font></th>
                  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">종목</font></font></th>
                  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자이메일</font></font></th>
                </tr>
              </thead>
              <c:forEach var="vo" items="${customerList }">
               <tbody>
                 <tr>
                   <td><input type="checkbox" name="checkRow" class="checkRow" value="${vo.cust_id}"></td>
                   <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;" onclick="infoPop('${vo.cust_id}');">${vo.cust_id }</font></font></td>
                   <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;" onclick="infoPop('${vo.cust_id}');">${vo.reg_num }</font></font></td>
                   <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;" onclick="infoPop('${vo.cust_id}');">${vo.cust_name }</font></font></td>
                   <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.cust_class }</font></font></td>
                   <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.owner_name }</font></font></td>
                   <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.main_phone }</font></font></td>
                   <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.cust_business }</font></font></td>
                   <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.cust_event }</font></font></td>
                   <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${vo.emp_email }</font></font></td>
                 </tr>
               </tbody>
           	  </c:forEach>
            </table>
        </div>
      </div>
		<!-- 거래처목록 테이블 -->
	
	<!-- 	페이징 처리  -->
	<div class="template-demo">
		<div class="btn-group" role="group" aria-label="Basic example">
			<c:if test="${pvo.startPage > pvo.pageBlock }">
				<a href="/customer/list?pageNum=${pvo.startPage-pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
				<a href="/customer/list?pageNum=${i }&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">${i }</a>
			</c:forEach>
			
			<c:if test="${pvo.endPage<pvo.pageCount }">
				<a href="/customer/list?pageNum=${pvo.startPage+pvo.pageBlock}&selector=${pvo.selector}&search=${pvo.search}" class="btn btn-outline-secondary">다음</a>
			</c:if>
		</div>
	</div>
	<!-- 	페이징 처리  -->
	
	
	<script type="text/javascript">
		// 거래처등록 새창열기
		function insertPop(){
		  var insertPop = window.open('/customer/insert', '거래처등록', 'width=1000px,height=400px');
		  
		  if(insertPop == null){
			  alert("팝업이 차단되었습니다. 차단을 해제하세요.");
		  }
		  openPop.moveBy(100,100);
		}
		// 거래처등록 새창열기  
	
		// 거래처 상세보기 새창열기 
		function infoPop(cust_id){
			var url = "/customer/info?cust_id="+cust_id;
			var infoPop = window.open(url, '거래처 상세보기', 'width=1000px,height=400px');
		  
			if(infoPop == null){
			  alert("팝업이 차단되었습니다. 차단을 해제하세요.");
		  }
		}//거래처 상세보기 새창열기 
		
		//체크박스 전체 선택, 전체 해제
		function allCheckBox(){
			if($('#checkAll').is(':checked')){
				$("input[name=checkRow]").prop("checked", true);
			}else{
				$("input[name=checkRow]").prop("checked", false);	
			}// else END
		}// allCheckBox END
		
		//체크박스 선택한 것만 삭제하기 메소드
// 		function removeChecked(){
			
		$(document).ready(function(){
			$('#btnD').click(function(){
		
				var checkRow = "";
				
				$("input[name='checkRow']:checked").each(function(){
					checkRow = checkRow + $(this).val() + ", ";
				});
				
				checkRow = checkRow.slice(0, -2); // 마지막에 추가된 ", " 제거
				console.log("checkRow : "+checkRow);
				console.log(checkRow);
				console.log(typeof checkRow); 
				//typeof : 변수의 데이타타입을 확인 => checkRow는 String 타입 
				
				if(checkRow == ""){
					alert("삭제할 목록이 없읍니다.");
					return false;
				}else{
		 			if(confirm("정말로 삭제하시겠읍니까?")){
		 				$.ajax({
		 					url : '/customer/remove/',
		 					type : 'post',
	// 						contentType : 'application/json', 
	// 						data : JSON.stringify(checkRow), 
		 					success : function(){
		 						alert('성공!');
		 						window.location.reload();
		 					},
		 					error : function(){
		 						alert('실패!');
		 					}//error
	 					});//ajax END
		 			}// confirm END
					
				}// else END
			
			});// #btnD END

		});// document.ready END
		
// 		}// removeChecked END
		
	
	</script>


</body>
<%@ include file="../includes/footer.jsp" %>