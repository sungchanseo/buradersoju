<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> <!-- 제이쿼리 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
     <h1 class="card-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${customerInfo.cust_name } </font></font></h4>

<!-- 탬플릿 적용 -->
<!-- 
<div class="card-body">
     <h4 class="card-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit; font-size:2em;">${customerInfo.cust_name } </font></font></h4>
     <form class="form-sample">
     
       <div class="row">
         <div class="col-md-3">
           <div class="form-group row">
             <label class="col-sm-4 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처유형</font></font></label>
             <div class="col-sm-6">
                <span class="form-control">${customerInfo.cust_type }</span>
             </div>
           </div>
         </div>
         <div class="col-md-3">
           <div class="form-group row">
             <label class="col-sm-4 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">대표자명</font></font></label>
             <div class="col-sm-6">
               <span class="form-control">${customerInfo.owner_name }</span>
             </div>
           </div>
         </div>
         <div class="col-md-3">
           <div class="form-group row">
             <label class="col-sm-4 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자이름</font></font></label>
             <div class="col-sm-6">
               <span class="form-control">${customerInfo.emp_id }</span>
             </div>
           </div>
         </div>
         <div class="col-md-3">
           <div class="form-group row">
             <label class="col-sm-2 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">기타</font></font></label>
             <div class="col-sm-6">
               <span class="form-control">${customerInfo.emp_id }</span>
             </div>
           </div>
         </div>
       </div>
       
       <div class="row">
         <div class="col-md-3">
           <div class="form-group row">
             <label class="col-sm-4 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처구분</font></font></label>
             <div class="col-sm-6">
                <span class="form-control">${customerInfo.cust_class }</span>
             </div>
           </div>
         </div>
         <div class="col-md-3">
           <div class="form-group row">
             <label class="col-sm-4 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">대표전화</font></font></label>
             <div class="col-sm-6">
               <span class="form-control">${customerInfo.main_phone }</span>
             </div>
           </div>
         </div>
         <div class="col-md-3">
           <div class="form-group row">
             <label class="col-sm-4 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자전화번호</font></font></label>
             <div class="col-sm-6">
               <span class="form-control">${customerInfo.emp_tel }</span>
             </div>
           </div>
         </div>
         <div class="col-md-3">
           <div class="form-group row">
             <div class="col-sm-6">
               <span class="form-control">${customerInfo.cust_etc }</span>
             </div>
           </div>
         </div>
       </div>       
       
       <div class="row">
         <div class="col-md-3">
           <div class="form-group row">
             <label class="col-sm-4 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처이름</font></font></label>
             <div class="col-sm-6">
                <span class="form-control">${customerInfo.cust_name }</span>
             </div>
           </div>
         </div>
         <div class="col-md-3">
           <div class="form-group row">
             <label class="col-sm-4 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">업태</font></font></label>
             <div class="col-sm-6">
               <span class="form-control">${customerInfo.cust_business }</span>
             </div>
           </div>
         </div>
         <div class="col-md-3">
           <div class="form-group row">
             <label class="col-sm-4 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자이메일</font></font></label>
             <div class="col-sm-6">
               <span class="form-control">${customerInfo.emp_email }</span>
             </div>
           </div>
         </div>
       </div>
       
       <div class="row">
         <div class="col-md-3">
           <div class="form-group row">
             <label class="col-sm-4 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">사업자등록번호</font></font></label>
             <div class="col-sm-6">
                <span class="form-control">${customerInfo.reg_num }</span>
             </div>
           </div>
         </div>
         <div class="col-md-3">
           <div class="form-group row">
             <label class="col-sm-4 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">종목</font></font></label>
             <div class="col-sm-6">
               <span class="form-control">${customerInfo.cust_event }</span>
             </div>
           </div>
         </div>
         <div class="col-md-3">
           <div class="form-group row">
             <label class="col-sm-4 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">FAX번호</font></font></label>
             <div class="col-sm-6">
               <span class="form-control">${customerInfo.cust_fax }</span>
             </div>
           </div>
         </div>
         <div class="col-md-3">
           <div class="form-group row">
             <label class="col-sm-4 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">홈페이지</font></font></label>
             <div class="col-sm-6">
               <span class="form-control">${customerInfo.cust_homepage }</span>
             </div>
           </div>
         </div>
       </div>              

       <div class="row">
         <div class="col-md-3">
           <div class="form-group row">
             <label class="col-sm-4 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">주소</font></font></label>
             <div class="col-sm-6">
                <span class="form-control">${customerInfo.cust_address }</span>
             </div>
           </div>
         </div>
       </div>      
     </form>
   </div>
   -->
<!-- 탬플릿 적용 -->
<table border="1">
<tr>
	<th>거래처유형</th>
	<td>${customerInfo.cust_type }</td>
	<th>대표자명</th>
	<td>${customerInfo.owner_name }</td>
	<th>담당자이름</th>
	<td>${customerInfo.emp_id }</td>
	<th rowspan="3">주소</th>
	<td rowspan="3">${customerInfo.cust_address }</td>
</tr>
<tr>
	<th>거래처구분</th>
	<td>${customerInfo.cust_class }</td>
	<th>대표전화</th>
	<td>${customerInfo.main_phone }</td>
	<th>담당자이메일</th>
	<td>${customerInfo.emp_email }</td>
</tr>
<tr>
	<th>거래처이름</th>
	<td>${customerInfo.cust_name }</td>
	<th>업태</th>
	<td>${customerInfo.cust_business }</td>
	<th>담당자이메일</th>
	<td>${customerInfo.emp_email }</td>
</tr>
<tr>
	<th>사업자등록번호</th>
	<td>${customerInfo.reg_num }</td>
	<th>종목</th>
	<td>${customerInfo.cust_event }</td>
	<th>FAX번호</th>
	<td>${customerInfo.cust_fax }</td>
	<th>홈페이지</th>
	<td>${customerInfo.cust_homepage }</td>
</tr>
<tr>
	<th>기타</th>
	<td colspan="7">${customerInfo.cust_etc }</td>
</tr>
</table>
<input type="button" class="btn btn-success" value="거래처수정" onclick="location.href='/customer/modify?cust_id=${customerInfo.cust_id }'">
<input type="button" class="btn btn-success" value="거래처삭제" onclick="deleteAction(${customerInfo.cust_id});">
<input type="button" class="btn btn-success" value="QR코드생성" onclick="">
<input type="button" class="btn btn-success" value="창닫기" onclick="window.close();">

<script type="text/javascript">
	function deleteAction(cust_id){
		if(confirm('삭제하시겠읍니까?')){
			$.ajax({
				url : '/customer/remove?cust_id='+cust_id, 
				type : 'POST', 
				success : function(json){ //가져올 데이타가 따로 없을 때는 json 타입을 넣는다. 있을 때는 data라고 적는다. 
					alert("거래처는 사라졌읍니다.");
					window.opener.location.reload();
					window.close();
				}
			});
		}else{
			return false;
		}
	}

</script>
</body>
</html>