<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>사원 등록</title>
  <!-- base:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="main-panel">
        <div class="content-wrapper d-flex align-items-center auth px-0">
          <div class="row w-100 mx-0">
            <div class="col-lg-4 mx-auto">
              <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                <div class="brand-logo">
                  <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo">
                </div>
                <h4>사원 등록</h4>
                <h6 class="font-weight-light">사원을 등록해주세요</h6>
	                <form class="pt-3" action="" method="post">
		 				   <div class="form-group" >
		                    <input type="text" class="form-control form-control-lg" id="userid" name="userid" placeholder="사번">
		                  </div>
		                  <div class="form-group">
		                    <input type="text" class="form-control form-control-lg" id="userpw" name="userpw" placeholder="비밀번호">
		                  </div>
		                   <div class="form-group">
		                    <input type="text" class="form-control form-control-lg" id="username" name="username" placeholder="이름">
		                  </div>
		                  <div class="form-group">
		                    <input type="text" class="form-control form-control-lg" id="useremail" name="useremail" placeholder="이메일">
		                  </div>
		                  <div class="mb-4">
		                  </div>
		                  <div class="mt-3">
		                      <button class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit">등록</button>
		                  </div>
	                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- base:js -->
  <script src="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/resources/js/template.js"></script>
  <!-- endinject -->
</body>

</html>