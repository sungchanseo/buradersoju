<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->
<title>거래처 등록하기</title>
</head>
<body>
<div class="card-body">
                  <h4 class="card-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">가로 2열</font></font></h4>
                  <form class="form-sample">
                    <p class="card-description"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                      개인적인 정보
                    </font></font></p>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이름</font></font></label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">성</font></font></label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control">
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">성별</font></font></label>
                          <div class="col-sm-9">
                            <select class="form-control">
                              <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">남성</font></font></option>
                              <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">여성</font></font></option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">생일</font></font></label>
                          <div class="col-sm-9">
                            <input class="form-control" placeholder="dd/mm/yyyy">
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">범주</font></font></label>
                          <div class="col-sm-9">
                            <select class="form-control">
                              <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">카테고리1</font></font></option>
                              <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">카테고리2</font></font></option>
                              <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">카테고리3</font></font></option>
                              <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">카테고리4</font></font></option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">멤버십</font></font></label>
                          <div class="col-sm-4">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="membershipRadios" id="membershipRadios1" value="" checked=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                무료
                              </font></font><i class="input-helper"></i></label>
                            </div>
                          </div>
                          <div class="col-sm-5">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="membershipRadios" id="membershipRadios2" value="option2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                전문적인
                              </font></font><i class="input-helper"></i></label>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <p class="card-description"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                      주소
                    </font></font></p>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">주소 1</font></font></label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상태</font></font></label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control">
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">주소 2</font></font></label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">우편번호</font></font></label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control">
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">도시</font></font></label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">국가</font></font></label>
                          <div class="col-sm-9">
                            <select class="form-control">
                              <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">미국</font></font></option>
                              <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이탈리아</font></font></option>
                              <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">러시아</font></font></option>
                              <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">영국</font></font></option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>

	<h1>거래처 등록하기</h1>
	<form action="" role="form" method="post">
		<table border="1">
			<tr>
				<th>거래처유형</th>
				<td><label><input type="radio" name="cust_type" value="사업자(국내)" checked>사업자(국내)</label>
					<label><input type="radio" name="cust_type" value="사업자(해외)">사업자(해외)</label>
					<label><input type="radio" name="cust_type" value="개인">개인</label></td>
				<th>사업자등록번호</th>
				<td><input type="text" name="reg_num" id="reg_num" placeholder="사업자번호를 입력하세요">
				<br>
				<span id="regCheckMsg"></span>
				</td>
			</tr>
			<tr>
				<th>거래처이름</th>
				<td><input type="text" name="cust_name" placeholder="상호를 입력하세요."></td>
				<th>담당자이름</th>
				<td><input type="text" name="emp_id" placeholder="담당자이름을 입력하세요."></td>
			</tr>
			<tr>
				<th>대표자명</th>
				<td><input type="text" name="owner_name" placeholder="대표자명을 입력하세요."></td>
				<th>담당자전화번호</th>
				<td><input type="tel" name="emp_tel"placeholder="연락처를 입력하세요."></td>
			</tr>
			<tr>
				<th>대표전화</th>
				<td><input type="tel" name="main_phone" placeholder="대표번호를 입력하세요."></td>
				<th>담당자이메일</th>
				<td><input type="email" name="emp_email" placeholder="이메일을 입력하세요."></td>
			</tr>
			<tr>
				<th>업태</th>
				<td><select name="cust_business">
						<option value="wholesale" selected>도매업</option>
						<option value="retail">소매업</option>
						<option value="service">서비스업</option>
						<option value="manufacturing">제조업</option>
				</select></td>
				<th>FAX번호</th>
				<td><input type="tel" name="cust_fax" placeholder="팩스번호를 입력하세요(선택)."></td>
			</tr>
			<tr>
				<th>종목</th>
				<td>
					<select name="cust_event">
						<option value="종목1" selected>종목1</option>
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
				<td rowspan="2"><textarea name="cust_etc"></textarea></td>
				<th>홈페이지</th>
				<td><input type="text" name="cust_homepage" placeholder="홈페이지를 입력하세요(선택)."></td>
			</tr>
		</table>
		<input type="button" id="submit" value="작성완료" onclick="sendForm();">
	</form>
<!-- 	http://localhost:8088/customer/list -->
<!-- 	제이쿼리 -->
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
			//상단의 폼태그를 변수에 저장한다. 
			var formObject = $("form[role='form']").serializeArray();
			var status = true;
			alert(formObject.length);

			for (var i = 0; i < formObject.length; i++) {
				if (formObject[i].value=="") {
					alert("정보를 입력하세요!"+formObject[i].value);
					status = false;
					break;
				}
			}

			if(status){
				$.ajax({
					url : '/customer/insert', 
					type : 'POST', 
					data : formObject, //form데이타의 객체형으로 값을 전달한다. 
					success : function(json) {
						alert("수주등록이 완료되었습니다.");
						status = true;
						window.opener.location.reload();
						window.close();
					}
				});
			}
		};
		//작성완료를 눌렀을 때 ajax 메소드
		
		//사업자번호 중복확인 ajax 메소드
		$(document).ready(function(){
			
			  $('#reg_num').keyup(function(){
				 $.ajax({
					  url : "/customer/regCheck",
					  data: {"reg_num": $('#reg_num').val()}, 
					  dataType : "text", //String 타입 데이타를 전달하므로 text로 전달한다. 
					  success:function(data){ //콘츄롤러에 갔다가 온 값을 data에 저장한다. 
						  const result = $.trim(data);
							  if(result=="yes" && !$('#reg_num').val() == ""){
							
							  $('#regCheckMsg').css('color','green');
							  $('#regCheckMsg').text("사용가능한 번호다.");
							  $('#submit').removeAttr('disabled');
							  return;
						  }else if ( result=="no" && !$('#reg_num').val() == ""){

							  $('#regCheckMsg').css('color','red');
							  $('#regCheckMsg').text("이 세상 번호가 아닌 것 같다.");  
							  $('#submit').attr('disabled','disabled');
							  return;
						  }
					  }//success 
				  });// ajax
				  if($('#reg_num').val() == ""){
					  $('#regCheckMsg').css('color','red');
					  $('#regCheckMsg').text("사업자번호를 적어라.");  
					  $('#submit').attr('disabled','disabled'); 
					  return;
				  }
			  }); 
		});
		//사업자번호 중복확인 ajax 메소드
	</script>	
		

</body>
</html>