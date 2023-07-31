<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

<head>
  <!-- 필수 메타 태그 -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>BURADER</title>
  <!-- base:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- 이 페이지에 대한 플러그인 CSS -->
  <!-- 이 페이지에 대한 플러그인 CSS 끝 -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth lock-full-bg">
        <div class="row w-100">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-transparent text-left p-5 text-center" style="text-align: center;">
               <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="로고" style="width: 100%;">
             
             
             	 <form class="pt-5" action="/login" method="post">
			                  <div class="form-group">
			                    <input type="text" class="form-control form-control-lg" name="username" id="emp_id" placeholder="사번을 입력하세요 :)" value="${cookie.emp_id}" style="color: #D8D8D8;">
			                  </div>
			                  <div class="form-group">
			                    <input type="password" class="form-control form-control-lg" name="password" id="emp_pw" placeholder="비밀번호를 입력하세요 :)">
			                  </div>
			                   <div class="form-check-label">
			                      <label class="form-check-label text-muted">
			                        <input type="checkbox" class="form-check-input" id="rememberId" onclick="toggleRememberId()">
			                        	아이디 기억하기
			                      </label>
			                    </div>
			                	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			                  <div class="mt-3" style="text-align: center;">
			                    <button class="btn btn-block btn-success btn-lg font-weight-medium auth-form-btn" type="submit">로그인</button>
			                  </div>
			                  <div class="my-2 d-flex justify-content-between align-items-center">
			                  </div>
                </form>
                
                
            </div>
          </div>
        </div>
      </div>
      <!-- 콘텐츠 래퍼 끝 -->
    </div>
    <!-- 페이지 바디 래퍼 끝 -->
  </div>
  <!-- 컨테이너 스크롤러 -->
  <!-- base:js -->
  <script src="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/template.js"></script>
  <!-- endinject -->
  <!-- inject:js -->

  <!-- endinject -->
<script type="text/javascript">
  function saveId() {
    var empId = document.getElementById("emp_id").value;
    var rememberIdCheckbox = document.getElementById("rememberId");
    var expires = new Date();
    
    if (rememberIdCheckbox.checked) {
      expires.setDate(expires.getDate() + 7); // 쿠키 만료일 설정 (7일 후)
      document.cookie = "emp_id=" + empId + "; expires=" + expires.toUTCString() + "; path=/"; // 쿠키 저장
    } else {
      expires.setDate(expires.getDate() - 1); // 쿠키 삭제를 위해 만료일을 현재 시간보다 이전으로 설정
      document.cookie = "emp_id=; expires=" + expires.toUTCString() + "; path=/"; // 쿠키 삭제
    }
  }
  function getCookie(name) {
    var cookieArr = document.cookie.split(";");

    for (var i = 0; i < cookieArr.length; i++) {
      var cookiePair = cookieArr[i].split("=");

      if (name.trim() === cookiePair[0].trim()) {
        return decodeURIComponent(cookiePair[1]);
      }
    }

    return null;
  }

  window.onload = function () {
    var savedEmpId = getCookie("emp_id");

    if (savedEmpId !== null) {
      document.getElementById("emp_id").value = savedEmpId;
      document.getElementById("rememberId").checked = true;
    }
  };
</script>
</body>

</html>