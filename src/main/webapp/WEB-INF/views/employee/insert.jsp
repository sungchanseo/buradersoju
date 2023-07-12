<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert창 링크 -->
<title>사원 등록</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
</head>
<body>
	<form action="" role="form" id="fr" method="post" enctype="multipart/form-data">
		<div class="container">
			<h1 style="display: inline;">사원 등록</h1>
			
			<div class="btn_btn">
				 <input type="submit" class="btn btn-info" value="사원등록">
				 <input type="reset" class="btn btn-success" value="초기화">
				 <input type="button" class="btn btn-success" value="창닫기" onclick="window.close();">
			</div>
			
			<div class="btn_table">
				<table border="1">
					<tr>
						<th>사원사진</th>
						<th>사번</th>
						<td><input type="text" name="emp_id" readonly value="사번자동생성"><input type="hidden" name="emp_hidden" value="1"></td>
						<th>비밀번호</th>
						<td><input type="password" name="emp_pw" id="emp_pw" maxlength="30" placeholder="비밀번호를 입력하세요."></td>
						<th>이름</th>
						<td><input type="text" name="emp_name" id="emp_name" maxlength="25" placeholder="이름을 입력하세요."></td>
					</tr>
					<tr>
						<td rowspan="5" ><input type="file" class="form-control" name="file1" accept="image/*" ></td>
						<th>생년월일</th>
						<td><input type="text" name="emp_birth" id="emp_birth" maxlength="10" placeholder="생년월일을 입력하세요."></td>
						<th>연락처</th>
						<td><input type="text" name="emp_phone" id="emp_phone" maxlength="11" placeholder="연락처를 입력하세요."></td>
						<th>이메일</th>
						<td>
							<input type="text" name="emp_email" id="emp_email" maxlength="30" placeholder="이메일을 입력하세요.">
							<span id="emsg"></span>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="5">
							<input type="text" name="emp_address" id="emp_address" size="45" onclick="addr();">
							<input type="button" class="btn_add" value="주소찾기" onclick="addr();"><br>
							<input type="text" name="emp_address_detail" id="emp_address_detail" placeholder="상세주소를 입력하세요." size="55" maxlength="55">
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<label><input type="radio" name="emp_gender" value="남">남</label>
							<label><input type="radio" name="emp_gender" value="여">여</label>
						</td>			
						<th>부서</th>
						<td><select name="emp_department">
								<option value="전산팀">전산팀</option>
								<option value="인사팀">인사팀</option>
								<option value="생산팀">생산팀</option>
								<option value="구매팀">구매팀</option>
								<option value="영업팀">영업팀</option>
						</select></td>
						<th>직급</th>
						<td><select name="emp_position">
								<option value="사원">사원</option>
								<option value="주임">주임</option>
								<option value="대리">대리</option>
								<option value="과장">과장</option>
								<option value="차장">차장</option>
								<option value="부장">부장</option>
								<option value="임원">임원</option>
						</select></td>
					</tr>
					<tr>
						<th>내선번호</th>
						<td><input type="text" name="emp_tel" id="emp_tel" maxlength="12" placeholder="내선번호를 입력하세요."></td>			
						<th>재직구분</th>
						<td><select name="emp_status">
								<option value="재직">재직</option>
								<option value="휴직">휴직</option>
								<option value="퇴직">퇴직</option>
						</select></td>
						<th>입사일</th>
						<td><input type="text" name="join_date" id="join_date" maxlength="10" placeholder="입사일을 입력하세요."></td>
					</tr>
					<tr>
						<th>휴직일</th>
						<td><input type="text" name="absence_date" maxlength="10" placeholder="휴직시 휴직일을 입력하세요."></td>			
						<th>복직일</th>
						<td><input type="text" name="rehabi_date" maxlength="10" placeholder="복직시 복직일을 입력하세요."></td>
						<th>퇴사일</th>
						<td><input type="text" name="resign_date" maxlength="10" placeholder="퇴사시 퇴사일을 입력하세요."></td>
					</tr>
				</table>
			</div>
		</div>
	</form>	
	<script>
		// 주소 자동입력 api 메소드
		function addr() {
			new daum.Postcode({
				    oncomplete : function(data) {
					document.getElementById("emp_address").value = data.address; // 주소 넣기
				}
			}).open();
		};
		// 주소 자동입력 api 메소드	
	
		// 중복체크와 입력값 확인
		$(document).ready(function () {
		
			$('#fr').submit(function() {
				var status = true;
		
				if ($('#emp_pw').val() == ""){
					Swal.fire({
			            icon: 'warning',				// Alert 타입
			            title: '비밀번호를 입력하세요',	// Alert 제목
			            text: '필수입력란 입니다.',		// Alert 내용
			            confirmButtonText: '확인',		// Alert 버튼내용
			        });
					$('#emp_pw').focus();
					status = false;
					return false;
				}//비밀번호 입력 제어
		
				if ($('#emp_name').val() == ""){
					Swal.fire({
			            icon: 'warning',					
			            title: '이름을 입력하세요',	
			            text: '필수입력란 입니다.',	
			            confirmButtonText: '확인',
			        });
					$('#emp_name').focus();
					status = false;
					return false;
				}//이름 입력 제어
		
				if ($('#emp_birth').val() == ""){
					Swal.fire({
			            icon: 'warning',					
			            title: '생년월일을 입력하세요',	
			            text: '필수입력란 입니다.',	
			            confirmButtonText: '확인',
			        });
					$('#emp_birth').focus();
					status = false;
					return false;
				}//생년월일 입력 제어
		
				if ($('#emp_phone').val() == ""){
					Swal.fire({
			            icon: 'warning',					
			            title: '연락처를 입력하세요',	
			            text: '필수입력란 입니다.',	
			            confirmButtonText: '확인',
			        });
					$('#emp_phone').focus();
					status = false;
					return false;
				}//연락처 입력 제어
		
				if ($('#emp_email').val() == ""){
					Swal.fire({
			            icon: 'warning',					
			            title: '이메일을 입력하세요',	
			            text: '필수입력란 입니다.',	
			            confirmButtonText: '확인',
			        });
					$('#emp_email').focus();
					status = false;
					return false;
				}//이메일 입력 제어
				
				if ($('#emp_address').val() == ""){
					Swal.fire({
			            icon: 'warning',					
			            title: '주소를 입력하세요',	
			            text: '필수입력란 입니다.',	
			            confirmButtonText: '확인',
			        });
					$('#emp_address').focus();
					status = false;
					return false;
				}//주소 입력 제어
				
				if ($('#emp_address_detail').val() == ""){
					Swal.fire({
			            icon: 'warning',					
			            title: '상세주소를 입력하세요',	
			            text: '필수입력란 입니다.',	
			            confirmButtonText: '확인',
			        });
					$('#emp_address_detail').focus();
					status = false;
					return false;
				}//상세주소 입력 제어
				
				if($('input[name="emp_gender"]:checked').length === 0){
					Swal.fire({
			            icon: 'warning',					
			            title: '성별을 체크하세요',	
			            text: '필수입력란 입니다.',	
			            confirmButtonText: '확인',
			        });
				    $('input[name="emp_gender"]').eq(0).focus(); // 첫 번째 라디오 버튼에 포커스를 줌
				    return false;
				}//성별 입력 제어
				
				if ($('#emp_tel').val() == ""){
					Swal.fire({
			            icon: 'warning',					
			            title: '내선번호를 입력하세요',	
			            text: '필수입력란 입니다.',	
			            confirmButtonText: '확인',
			        });
					$('#emp_tel').focus();
					status = false;
					return false;
				}//내선번호 입력 제어
		
				if ($('#join_date').val() == ""){
					Swal.fire({
			            icon: 'warning',					
			            title: '입사일을 입력하세요',	
			            text: '필수입력란 입니다.',	
			            confirmButtonText: '확인',
			        });
					$('#join_date').focus();
					status = false;
					return false;
				}//입사일 입력 제어
				
				if (status) {
					sendForm();
				}
		
				return false; // 폼 제출 막기
			}); // submit function
		
			function sendForm() {
			    Swal.fire({
			        title: '사원정보를 등록하시겠습니까?',
			        text: '한번 더 확인해주세요.',
			        icon: 'warning',
			        showCancelButton: true,
			        confirmButtonColor: '#0ddbb9',
			        cancelButtonColor: '#d33',
			        confirmButtonText: '등록',
			        cancelButtonText: '취소'
			    }).then((result) => {
			        if (result.isConfirmed) {
			            $.ajax({
			                url: '/employee/insert',
			                type: 'POST',
			                data: new FormData($("form[role='form']")[0]),
			                enctype: 'multipart/form-data',
			                processData: false,
			                contentType: false,
			                cache: false,
			                success: function(json) {
			                    Swal.fire({
			                        title: '사원등록이 완료되었습니다.',
			                        text: '확인을 누르면 창을 닫습니다.',
			                        icon: 'success',
			                        confirmButtonText: '확인'
			                    }).then(() => {
			                        window.opener.location.reload();
			                        window.close();
			                    });
			                } // json
			            }); // ajax
			        } // isConfirmed
			    }); // then(result)
			} // sendForm
		}); // document
	</script>
</body>
</html>