<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- alert창 링크 -->
<title>사원 정보 수정</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/burader.css">

<style type="text/css">

/* 테이블 css */
table {margin-bottom: 1em;}

table, th {border: none;}

th {background-color: #04AA6D;
	color: #fff;
	text-align: center;
	padding: 10px 8px;}

td {border:1px solid #04AA6D;
	padding: 10px 6px;}

#tb-btns {margin-left: 0.5em;}

.btn{
	display: inline-block;
	font-weight: 600;
	line-height: 1;
	color: #6C7293;
	text-align: center;
	text-decoration: none;
	vertical-align: middle;
	cursor: pointer;
	user-select: none;
	background-color: transparent;
	border: 1px solid transparent;
	padding: 0.625rem 1.125rem;
	font-size: 0.875rem;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;}
    
.btn-success {
	color: #000;
	background-color: #0ddbb9;
	border-color: #0ddbb9;}

.btn-info {
	color: #000;
	background-color: #2fddf8;
	border-color: #23dbf8;}
	
.btn_add{
	color: #ffffff;
	background-color: #04AA6D;
	border-color: #0ddbb9;}
	
.container {
	position: relative;}

.btn_btn {
	position: absolute;
	top: 0;
	right: 0;}

.btn_table table {
	width: 100%;}
/* 테이블 css */

</style>
</head>
<body>
	<form action="" role="form" id="fr" method="post" enctype="multipart/form-data">
		<div class="container">
			<h1 style="display: inline; font-family: 'NanumSquareRoundBold'; ">사원 수정</h1>
			
			<div class="btn_btn">
				<input type="submit" class="btn btn-info" value="사원수정" onclick="sendForm();">
				<input type="reset" class="btn btn-success" value="초기화">
				<input type="button" class="btn btn-success" value="창닫기" onclick="window.close();">
			</div>
			
			<div class="btn_table">	
				<table border="1">
					<tr>
						<th>사원사진</th>
						<th>사번</th>
						<td><input type="text" name="emp_id" value="${resultVO.emp_id }" readonly></td>
						<th>비밀번호</th>
						<td><input type="password" name="emp_pw" id="emp_pw" placeholder="비밀번호를 입력하세요"></td>				
						<th>이름</th>
						<td><input type="text" name="emp_name" id="emp_name" value="${resultVO.emp_name }"></td>
					</tr>
					<tr>
						<td rowspan="4"><img src="/employee/imgDown?fileName=${resultVO.emp_image }"></td>
						<th>생년월일</th>
						<td><input type="text" name="emp_birth" id="emp_birth" value="${resultVO.emp_birth }"></td>
						<th>휴대전화</th>
						<td><input type="text" name="emp_phone" id="emp_phone" value="${resultVO.emp_phone }"></td>
						<th>이메일</th>
						<td><input type="text" name="emp_email" id="emp_email" value="${resultVO.emp_email }"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="5">
							<input type="text" name="emp_address" id="emp_address" size="45" value="${resultVO.emp_address }" onclick="addr();">
							<input type="button" class="btn_add" value="주소찾기" onclick="addr();"><br>
							<input type="text" name="emp_address_detail" id="emp_address_detail" size="55" maxlength="55" value="${resultVO.emp_address_detail }">
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<label><input type="radio" name="emp_gender" value="남" ${resultVO.emp_gender == '남' ? 'checked' : ''}>남</label>
							<label><input type="radio" name="emp_gender" value="여" ${resultVO.emp_gender == '여' ? 'checked' : ''}>여</label>
						</td>			
						<th>부서</th>
						<td><select name="emp_department">
								<option value="전산팀" ${resultVO.emp_department == '전산팀' ? 'selected' : ''}>전산팀</option>
								<option value="인사팀" ${resultVO.emp_department == '인사팀' ? 'selected' : ''}>인사팀</option>
								<option value="생산팀" ${resultVO.emp_department == '생산팀' ? 'selected' : ''}>생산팀</option>
								<option value="구매팀" ${resultVO.emp_department == '구매팀' ? 'selected' : ''}>구매팀</option>
								<option value="영업팀" ${resultVO.emp_department == '영업팀' ? 'selected' : ''}>영업팀</option>
						</select></td>
						<th>직급</th>
						<td><select name="emp_position">
								<option value="임원" ${resultVO.emp_position == '임원' ? 'selected' : ''}>임원</option>
								<option value="부장" ${resultVO.emp_position == '부장' ? 'selected' : ''}>부장</option>
								<option value="차장" ${resultVO.emp_position == '차장' ? 'selected' : ''}>차장</option>
								<option value="과장" ${resultVO.emp_position == '과장' ? 'selected' : ''}>과장</option>
								<option value="대리" ${resultVO.emp_position == '대리' ? 'selected' : ''}>대리</option>
								<option value="주임" ${resultVO.emp_position == '주임' ? 'selected' : ''}>주임</option>
								<option value="사원" ${resultVO.emp_position == '사원' ? 'selected' : ''}>사원</option>
						</select></td>
					</tr>
					<tr>
						<th>내선번호</th>
						<td><input type="text" name="emp_tel" id="emp_tel" value="${resultVO.emp_tel }"></td>			
						<th>재직구분</th>
						<td><select name="emp_status">
								<option value="재직" ${resultVO.emp_status == '재직' ? 'selected' : ''}>재직</option>
								<option value="휴직" ${resultVO.emp_status == '휴직' ? 'selected' : ''}>휴직</option>
								<option value="복직" ${resultVO.emp_status == '복직' ? 'selected' : ''}>복직</option>
								<option value="퇴직" ${resultVO.emp_status == '퇴직' ? 'selected' : ''}>퇴직</option>
						</select></td>
						<th>입사일</th>
						<td><input type="text" name="join_date" id="join_date" value="${resultVO.join_date }"></td>
					</tr>
					<tr>
						<td><input type="file" class="form-control" name="file1" accept="image/*" ></td>
						<th>휴직일</th>
						<td><input type="text" name="absence_date" value="${resultVO.absence_date }"></td>			
						<th>복직일</th>
						<td><input type="text" name="rehabi_date" value="${resultVO.rehabi_date }"></td>
						<th>퇴사일</th>
						<td><input type="text" name="resign_date" value="${resultVO.resign_date }"></td>
					</tr>
					
				</table>
			</div>
		</div>
	</form>
	<!-- 팝업창 처리 -->
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
			        title: '사원정보를 수정하시겠습니까?',
			        text: '선택하라 인간',
			        icon: 'warning',
			        showCancelButton: true,
			        confirmButtonColor: '#0ddbb9',
			        cancelButtonColor: '#d33',
			        confirmButtonText: '수정',
			        cancelButtonText: '취소'
			    }).then((result) => {
			        if (result.isConfirmed) {
			            $.ajax({
			                url: '/employee/modify',
			                type: 'POST',
			                data: new FormData($("form[role='form']")[0]),
			                enctype: 'multipart/form-data',
			                processData: false,
			                contentType: false,
			                cache: false,
			                success: function(json) {
			                    Swal.fire({
			                        title: '사원수정이 완료되었습니다.',
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
	<!-- 팝업창 처리 -->
</body>
</html>