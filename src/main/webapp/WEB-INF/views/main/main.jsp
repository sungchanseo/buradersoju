<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<body>
	<div class="container-scroller">
		<!--헤더 -->
		<%@ include file="../includes/header.jsp"%>
		<!--헤더 -->
		<!-- 본문시작 -->
		<div class="container-fluid page-body-wrapper">
			<div class="main-panel">
				<div class="content-wrapper">
					<!-- 1단 -->
					<div class="row">
						<!-- 날씨 시작 -->
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="row flex-grow">
								<div class="col-lg-12 grid-margin stretch-card">
									<div class="card"
										style="background-image: url(${pageContext.request.contextPath}/resources/images/dashboard/bb.png);
						                box-shadow: none;
						                -webkit-box-shadow: none;
						                -moz-box-shadow: none;
						                -ms-box-shadow: none;
						                border-radius: 16px 16px 18px 16px;
						                background-size: contain;
						                background-repeat: no-repeat;
						                border: 0;
						                box-shadow: none;
						                padding: 2.112rem 3.25rem;">
										<div class="card-body" style="color: D8D8D8;">
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
															<h4
																style="margin-bottom: 5px !important; font-weight: 550 !important;">부산시</h4>
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
						<!-- 달력 시작 -->
						<div class="col-lg-6 grid-margin stretch-card d-flex justify-content-center">
							<div class="row flex-grow">
								<div class="col-lg-12 grid-margin stretch-card">
									<div class="card">
										<div class="card-body d-flex justify-content-center">
											<div id="calendar"
												style="width: 100%; max-width: 700px; background-color: white; padding: 20px; border-radius: 25px; margin-left: 15px; height: 315px;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 달력 끝 -->
					</div>
					<!-- 1단 -->
					<!-- 2단 -->
					<div class="row">
						
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
														<input type="text" placeholder="할 일을 입력하고 엔터를 누르세요"
															class="form-control todo-list-input"
															style="background-color: #ebf1ff; width: 700px; padding-left: 10px;">
														<div style="margin-right: 20px;"></div>
														<!-- 띄워줄 공백 요소 -->
														<button id="submitBtn"
															class="btn btn-inverse-success btn-fw">할 일 추가</button>
														<!-- 수정된 버튼 -->
													</div>
													 <div id="maxToDoMessage"></div>
												</form>
												<ul class="toDoList" style="margin-top: 10px; width: 580px;"></ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 투두리스트 끝 -->
						<!-- 수주왕 시작-->
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="row flex-grow">
								<div class="col-lg-12 grid-margin stretch-card">
									<div class="card">
										<div class="card-body">
												<p class="card-title" style="margin-top: 10px;">이 달의 수주왕</p>
												<p class="font-weight-500">이 달의 수주왕으로 뽑힌 사원에게는 보너스를 드립니다!</p>
<!-- 												<div id="sales-legend" class="chartjs-render-monitor mt-4 mb-2"></div> -->
											<div >
												<div style="display: flex; flex-wrap: wrap;">
													<div style="width: 400px; height: 500px; display: inline-block; margin-right: 40px;">
														<canvas id="mainContractChart"
															style="width: 100%; height: 100%;"></canvas>
													</div>
													<div style="width: 400px; height: 500px; display: inline-block;">
														<canvas id="doughnutChart"
															style="width: 100%; height: 100%;"></canvas>
													</div>
												</div>
											</div>
										</div>
										</div>
									</div>
								</div>
							</div>
						
						<!-- 수주왕 끝-->
					</div>
					<!-- 2단 -->

					<!-- 3단 -->
					<div class="row" style="text-align: center;">
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
															<table class="table table-color" style="text-align: center;">
																<tr>
																	<th>번호</th>
																	<th>제목</th>
																	<th>작성일자</th>
																	<th>조회수</th>
																</tr>
															</table>
															<br>
															<button class="btn btn-inverse-success btn-fw"
																onclick="location.href='/notice/list'">공지 목록</button>
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
				<!-- 푸터 -->
				<%@ include file="../includes/footer.jsp"%>
				<!-- 푸터 -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- 날씨 ,달력 ,to do List,수주,공지사항 -->
	<script src="resources/main/weather.js"></script>
	<script src="resources/main/calendar.js"></script>
	<script src="resources/main/fullcalendar-5.11.4/lib/main.js"></script>
	<script src="resources/main/todoList.js"></script>
	<script>var emp_id = ${sessionScope.emp_id };</script>
	<script src="resources/main/contractchart.js"></script>
	<script src="resources/main/noticeList.js"></script>
	<!-- 날씨 ,달력 ,to do List,수주,공지사항 -->
</body>