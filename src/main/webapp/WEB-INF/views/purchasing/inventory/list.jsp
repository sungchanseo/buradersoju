<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

   function getToday() {
      var date = new Date();
      
      var year = date.getFullYear();
      console.log(year);
      var month = ("0" + (1 + date.getMonth())).slice(-2);
      console.log(month);
      var day = ("0" + date.getDate()).slice(-2);
      console.log(day);
      return year + "-" + month + "-" + day;
   }

   $(function() {
      
      //// 글쓰기 ////////////////////////////////////////////////////////////
      
      $('.writeForm').click(function() {
    
         console.log("글쓰기 등록함");
         
         let regdate = getToday();
         console.log(regdate);
         if($(this).hasClass('true')) {
        
            let tbl = "<tr>";
            tbl += " <td>";
            tbl += "<input type='text' name='ma_name' id='ma_name'>";
            tbl += "</td>"; 
            tbl += " <td>";
            tbl += "<input type='text' name='ma_id' id='ma_id'>";
            tbl += "</td>";
            tbl += " <td>";
            tbl += "<input type='text' name='whs_num' id='whs_num'>";
            tbl += "</td>";
            tbl += " <td>";
            tbl += "<input type='text' name='ma_qty' id='ma_qty'>";
            tbl += "</td>";
            tbl += "<td>";
            tbl += regdate;
            tbl += "</td>";
            tbl += "</tr>";
            
            $('table').append(tbl);
            
            
            $(this).removeClass('writeForm').addClass('write');
            $(this).removeClass('true');
            $(this).text("등록");
         
         }
         
         
         
         $('.write').click(function() {
//             e.stopPropagation();
            console.log("글쓰기 등록함");
            
            var ma_id = $('#ma_id').val();
            var ma_name = $('#ma_name').val();
            var whs_num = $('#whs_num').val();
            console.log(ma_id);
            console.log(ma_name);
            console.log(whs_num);
            console.log(ma_id==="" || ma_name==="");

            
            if(ma_id==="" || ma_name==="") {
               alert("빈칸을 입력하세요");
            } else {
               $.ajax({
                  url: "list",
                  type: "post",
                  data: {ma_id:ma_id, ma_name:ma_name, whs_num:whs_num},
                 success: function() {
                	 location.href="/purchasing/inventory/list"
                     alert("등록완료");
                  },
                  error: function() {
                     alert("error");
                  }
               }); //ajax
            } //if-else
            
         }); //write click
      
      }); //writeForm click
    /*   $('.update').click(function(){
    	 console.log("실사량 수정하기");
    	 var ma_qty = $('#ma_qty').val();
    	 var ma_id = $('#ma_id').val();
    	 alert(ma_qty);
    	 alert(ma_id);
    	 
    	$.ajax({
    			 url:"list",
    			 type:"post",
    			 data:{ma_qty:ma_qty},
    			 success:function(){
    				 location.href="/purchasing/inventory/list"
    				 alert("수정완료!");
    			 },
    			 error:function(){
    				 alert("error");
    			 }
    		 }); //ajax
    	 // if- else
    	 
      }); // 업데이트하기 click
      */
   }); //jQuery
   /*  data-bt_date="${in.bt_date}" */
</script>

</head>
<body>

    <button class="writeForm true">행추가</button>
   <fmt:formatDate value=""/>
   <div class="inventory" > 
   <table border="1" id="#bodyContents">
   <thead>
      <tr>
         <th>품목명</th>
         <th>품목코드</th>
         <th>현재고</th>
         <th>단위?</th>
         <th>날짜</th>
         <th>실사량</th>
         <th>수정</th>
      </tr>
    </thead>
    <tbody>  
      <c:forEach var="in" items="${inventoryList}">
         <tr>
            <td>${in.ma_name}</td>
            <td>${in.ma_id}<input type="hidden" name="ma_id" value="${in.ma_id}"></td>
            <td>${in.ma_qty}</td>
            <td>${in.unit}</td>	
            <td><fmt:formatDate value="${in.ma_regdate}" pattern="yyyy-MM-dd"/></td>
            <td><input type="text" class="ma_qty" ></td>
            <td><input type="button" class="update" value="수정" data-ma_id="${in.ma_id}"></td>
         <!-- 날짜 포맷팅 표현식 OOOO년-OO월-OO일  -->	
         </tr>
      </c:forEach>
      </tbody>
   </table>
   </div>
 <script>
    /*실사량 수정 버튼 동작  */
 $(document).ready(function() {
	  $(".update").click(function() {
	    var ma_id = $(this).data("ma_id");
	    var ma_qty = $(this).closest("tr").find(".ma_qty").val();
	    alert(ma_id);
	    alert(ma_qty);
	    // form 태그 동적 생성
	    const form = $('<form>', {
	      method: 'post',
	      action: 'modify',
	      'accept-charset': 'utf-8'
	    });
	
	    // 파라미터 전달용 hidden 추가
	    form.append($('<input>', {
	      type: 'hidden',
	      name: 'ma_id',
	      value: ma_id
	    }));
	
	    form.append($('<input>', {
	      type: 'hidden',
	      name: 'ma_qty',
	      value: ma_qty
	    }));
	
	    // form태그 body에 추가 후 전송
	    $('tbody').append(form);
	    form.submit();
	  });
	});
 </script>
</body>
</html>