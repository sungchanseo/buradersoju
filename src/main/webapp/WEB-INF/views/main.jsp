<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Alcoholic</title>
    <!-- base:css -->
    <link rel="stylesheet" href="resources/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="resources/vendors/base/vendor.bundle.base.css">
    <link rel="stylesheet" href="resources/main/fullcalendar-5.11.4/lib/main.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="resources/css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="resources/images/favicon.png" />
  </head>
  <body>
    <div class="container-scroller">
		<!-- partial:partials/_horizontal-navbar.html -->
		<%@ include file="./includes/header.jsp" %>

<!-- 본문시작 -->
		<div class="container-fluid page-body-wrapper">
			<div class="main-panel">
				<div class="content-wrapper">
				
<!-- 1단 -->
					<div class="row">
<!-- 날씨시작 -->
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="row flex-grow">
								<div class="col-lg-12 grid-margin stretch-card">
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="weather-info">
								                    <div class="d-flex">
								                      
								                      
								                      <div>
								                        <h1 class="mb-0 font-weight-normal">
								                        <span id="todaysTemp" style="margin-right: 5px;"></span>
								                        
								                        <span class="weather-icon mr-3" id="todaysWeather"></span>
								                        </h1>
								                      </div>
								                      <div class="ml-2">
								                        <h4 style="margin-bottom: 5px !important; font-weight: 550 !important;">부산시</h4>
								                        <h6>부산 진구</h6>
								                      </div>
								                    </div>
								                  </div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
<!-- 날씨 끝 -->
<!-- 투두리스트 시작-->
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="row flex-grow">
								<div class="col-lg-12 grid-margin stretch-card">
									<div class="card">
										<div class="card-body">
											<h4 class="card-title" style="margin-top: 10px;">To Do
												Lists</h4>
											<div class="list-wrapper pt-2">
												<form class="toDoForm">
													<div class="add-items d-flex mb-0 mt-2">
														<input type="text" placeholder="할 일을 입력하세요"
															class="form-control todo-list-input"
															style="background-color: #ebf1ff; width: 580px; padding-left: 10px;">
													</div>
												</form>
												<ul class="toDoList" style="margin-top: 10px; width: 580px;"></ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
<!-- 투두리스트 끝 -->
					</div>
					
<!-- 2단 -->
					<div class="row">
						<!-- 달력 시작 -->
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="row flex-grow">
								<div class="col-lg-12 grid-margin stretch-card">
									<div class="card">
										<div id="calendar"
											style="width: 780px; background-color: white; padding: 20px; border-radius: 25px; margin-left: 15px; height: 630px !important;"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- 달력 끝 -->
						<!-- 수주왕 시작-->
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<p class="card-title" style="margin-top: 10px;">이 달의 수주왕</p>
									</div>
									<p class="font-weight-500">이 달의 수주왕으로 뽑힌 사원에게는 보너스를 드립니다 !
									</p>
									<div id="sales-legend" class="chartjs-legend mt-4 mb-2"></div>
									<canvas id="mainContractChart" height="400px" width="600px"></canvas>
								</div>
							</div>
						</div>
						<!-- 수주왕 끝-->   
					</div>
<!-- 2단 -->

<!-- 3단 -->
					<div class="row">
<!--공지 시작 -->
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="row flex-grow">
								<div class="col-lg-12 grid-margin stretch-card">
									<div class="card">
										<div class="card-body">

											<div class="row">
												<div class="col-12">
													<div class="table-responsive">
														<p class="card-title">공지사항</p>
														<div id="resultContainer"></div>
														<div id="table_content">
															<table class="table table-color">
															<tr><th>번호</th><th>제목</th><th>작성일자</th></tr>
															</table>
															<button class="btn btn-success btn-fw" onclick="location.href='/notice/list'">공지 목록</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
<!--공지 끝 -->
					</div>
<!-- 3단 -->
					
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<%@ include file="./includes/footer.jsp" %>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
    </div>
		<!-- container-scroller -->
    <!-- base:js -->
    <script src="resources/vendors/base/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page-->
    <!-- End plugin js for this page-->
    <!-- inject:js -->
    <script src="resources/js/template.js"></script>
    <!-- endinject -->
    <!-- plugin js for this page -->
    <!-- End plugin js for this page -->
    <script src="resources/vendors/chart.js/Chart.min.js"></script>
    <script src="resources/vendors/progressbar.js/progressbar.min.js"></script>
		<script src="resources/vendors/chartjs-plugin-datalabels/chartjs-plugin-datalabels.js"></script>
		<script src="resources/vendors/justgage/raphael-2.1.4.min.js"></script>
		<script src="resources/vendors/justgage/justgage.js"></script>
    <script src="resources/js/jquery.cookie.js" type="text/javascript"></script>
    <!-- Custom js for this page-->
    <script src="resources/js/dashboard.js"></script>
    
     <!-- 날씨 -->
  	 <script src="resources/main/weather.js"></script>

	 <!-- 달력 -->
	 <script src="resources/main/calendar.js"></script>
	 <script src="resources/main/fullcalendar-5.11.4/lib/main.js"></script>
	  
	  <!-- to do List -->
	  <script src="resources/main/todoList.js"></script>
	  <script>
		 let emp_id = ${sessionScope.emp_id };
	  </script>
	  <!-- 수주 -->
   	  <script src="resources/main/contractchart.js"></script>
	  <!-- 공지사항 -->
   	  <script src="resources/main/noticeList.js"></script>
    <!-- End custom js for this page-->
  </body>
  

</html>