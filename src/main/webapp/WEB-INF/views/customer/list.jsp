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
			<input type="button" value="거래처삭제"  class="btn btn-success" onclick="location.href='/customer/remove';">
		</c:if>
		<!-- 영업팀이 아닐때 버튼 감추기 -->

		<!-- 거래처목록 테이블 -->
		<div class="table-responsive">
            <table class="table table-hover" style="text-align :center;">
              <thead>
                <tr>
                  <th><input type="checkbox" id="allCheckBox" onclick="allCheckBox();"></th>
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
                   <td><input type="checkbox" name="chk" class="chk" value="${vo.cust_id}"></td>
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
		
		//헤드의 체크버튼을 누르면 전체 체크박스 선택하기 
		function allCheckBox(target){
			//전체체크박스 선택
			const checkBox = document.getElementById('allCheckBox');
			
			//전체 체크박스 여부를 저장한 변수
			const isChecked = checkBox.checekd;
			
			//전체 체크박스를 제외한 모든 체크박스 체크하기 
			if(isChecked){
				chkAllChecked();
			}else{
				chkAllUnChecked();
			}
		}// allCheckBox END
		
		//자식 체크박스 클릭하기 
		function chkChicked(){
			
			//체크박스의 전체 갯수
			const allCount = document.querySelectorAll(".chk").length;
			
			//체크한 체크박스의 전체 갯수
			const query = "input[name='chk']:checked";
			const selectedElements = document.querySelectorAll(query);
			const selectedElementsCnt = selectedElements.length;
			
			//체크박스 전체갯수와 체크한 전체갯수가 같으면 전체 체크박스를 선택한다. 
			if(allCount == selectedElementsCnt){
				document.getElementById('allCheckBox').checked = true;
			}else{
				//만약 같지 않으면 전체 체크박스의 선택상태를 해제한다. 
				document.getElementById('allCheckBox').checked = false;
			}
		}// chkChicked END
		
		
		//체크박스를 전체 선택하는 메소드
		function chkAllChecked(){
			document.querySelectorAll(".chk").forEach(function(v,i){
				v.checked = true;
			});// querySelectorAll END
		}//chkAllChecked END
		
		//체크박스 전체체크 해제 매소드
		function chkAllUnChecked(){
			document.querySelectorAll(".chk").forEach(function(v, i){
				v.checked = false;
			});
		} // chkAllUnChecked END
		
		
		//체크박스로 글 삭제하기 메소드
		function checkedRemove(){
			
			//체크박스 중 체크한 항목들
			const query = "input[name='chk']:checked";
			const selectorElements = document.querySelectedAll(query);
			
			//체크박스 체크한 항복의 갯수
			const selectedElementsCnt = selectedElements.length;
			
			if(selectedElementsCnt == 0){
				//만약 체크한 항목이 없다면?
				alert("선택한 항목이 없읍니다.");
				return false;
			}else{
				//체크한 항목이 있다면? -> 물어보고 삭제한다. 
				if(confirm("정말로 삭제하시겠읍니까?")){
					//삭제할 배열 생성
					const arr = new Array(selectedElementsCnt);
					
					document.querySelectorAll("input[name='chk']:checked").forEach(function(v,i){
						arr[i] = v.value();
					});
					
					const form = document.createElement("form");
					form.setAttribute('method', 'post');
					form.setAttribute('action', '/remove');
					
					form.submit();
				}// confirm_if END
			}
		}//checkedRemove END
		
	
	</script>


</body>
<%@ include file="../includes/footer.jsp" %>