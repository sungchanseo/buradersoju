<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<script type="text/javascript">
		//우편번호 자동입력 api 메소드
		function addr() {
			new daum.Postcode({
				    oncomplete : function(data) {
					document.getElementById("zipcode").value = data.zonecode; // 우편 번호 넣기
					document.getElementById("address").value = data.address; // 주소 넣기
				}
			}).open();
		};
		//우편번호 자동입력 api 메소드
		
		//작성완료를 눌렀을 때 ajax 메소드
		function sendForm() {
			//폼태그를 변수에 저장한다. 
			var formObject = $("form[role='form']").serializeArray();
			alert(formObject.length);

			$.ajax({
				url : '/contract/modify', 
				type : 'POST', 
				data : formObject, //form데이타의 객체형으로 값을 전달한다. 
				success : function(json) {
					alert("거래처 수정을 완료했다.");
					window.opener.location.reload();
					window.close();
				}
			});
		};
		//작성완료를 눌렀을 때 ajax 메소드
	</script>

<h1>거래처 수정하기 </h1>
<form action="" role="form" method="post">
<table border="1">
<tr>
	<th>거래처유형</th>
	<td><label><input type="radio" name="cust_type" value="사업자(국내)"
		<c:if test="${customerVO.cust_type =='사업자(국내)' }">
			checked
		</c:if>
		>사업자(국내)</label>
		<label><input type="radio" name="cust_type" value="사업자(국내)"
		<c:if test="${customerVO.cust_type =='사업자(해외)' }">
			checked
		</c:if>
		>사업자(해외)</label>
		<label><input type="radio" name="cust_type" value="개인"
		<c:if test="${customerVO.cust_type =='개인' }">
			checked
		</c:if>
		>개인</label>
	</td>
	<th>사업자등록번호</th>
	<td>
		<input type="text" name="reg_num" id="reg_num" value="${customerVO.reg_num }"><br>
		<span id="regCheckMsg"></span>
	</td>
</tr>
<tr>
	<th>거래처이름</th>
	<td><input type="text" name="cust_name" value="${customerVO.cust_name }"></td>
	<th>담당자이름</th>
	<td><input type="text" name="emp_id" value="${customerVO.emp_id }"></td>
</tr>
<tr>
	<th>대표자명</th>
	<td><input type="text" name="owner_name" value="${customerVO.owner_name }"></td>
	<th>담당자전화번호</th>
	<td><input type="text" name="emp_tel" value="${customerVO.emp_tel }"></td>
</tr>
<tr>
	<th>대표전화</th>
	<td><input type="text" name="main_phone" value="${customerVO.main_phone }"></td>
	<th>담당자이메일</th>
	<td><input type="text" name="emp_email" value="${customerVO.emp_email }"></td>
</tr>
<tr>
	<th>업태</th>
	<td>
		<select name="cust_business">
			<option value="도매업">도매업</option>
			<option value="소매업">소매업</option>
			<option value="서비스업">서비스업</option>
			<option value="제조업">제조업</option>
		</select>
	</td>
	<th>FAX번호</th>
	<td><input type="text" name="cust_fax" value="${customerVO.cust_fax }"></td>
</tr>
<tr>
	<th>종목</th>
	<td>
		<select name="cust_event">
			<option value="종목1" seleted>종목1</option>
			<option value="종목2">종목2</option>
			<option value="종목3">종목3</option>
		</select>
	</td>
	<th>주소</th>
	<td>
		<input type="text" id="zipcode" onclick="addr();" maxlength="200" size="15">
		<input type="button" value="우편번호찾기" onclick="addr();"><br>
		<input type="text" name="address" id="address" size="45" onclick="addr();"><br>
		<input type="text" name="cust_address" size="45" placeholder="상세주소를 입력해주세요."maxlength="45">
	</td>
</tr>
<tr>
	<th>기타</th>
	<td rowspan="2">
	<textarea name="cust_etc">${customerVO.cust_etc }</textarea>
	</td>
	<th>홈페이지</th>
	<td><input type="text" name="cust_hompage" value="${customerVO.cust_homepage }"></td>
</table>
<button type="submit" class="btn btn-success" onclick="sendForm();">수정완료</button>
<button type="button" class="btn btn-success" onclick="history.back();">뒤로가기</button>
<button type="button" class="btn btn-success" onclick="window.close();">창닫기</button>
<!-- <input type="submit" class="btn btn-success" value="수정완료" onclick="sendForm();"> -->
<!-- <input type="button" class="btn btn-success" value="뒤로가기" onclick="history.back();"> -->
<!-- <input type="button" value="창닫기" class="btn btn-success" onclick="window.close();"> -->
</form>
</body>
</html>