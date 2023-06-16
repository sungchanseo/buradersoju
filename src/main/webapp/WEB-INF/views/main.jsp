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

    <!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row mt-4">
						<div class="col-lg-8 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">수주 차트</h4>
                  <p class="card-description">
                    Add class <code>.table-striped</code>
                  </p>
                  <div class="table-responsive">
                    <table class="table table-striped">
											<thead>
												<tr>
													<th>User</th>
													<th>First name</th>
													<th>Progress</th>
													<th>Amount</th>
													<th>Deadline</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="py-1"><img
														src="resources/images/faces/face1.jpg" alt="image" /></td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-success" role="progressbar"
																style="width: 25%" aria-valuenow="25" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 77.99</td>
													<td>May 15, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="resources/images/faces/face2.jpg" alt="image" /></td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-danger" role="progressbar"
																style="width: 75%" aria-valuenow="75" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$245.30</td>
													<td>July 1, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="resources/images/faces/face3.jpg" alt="image" /></td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-warning" role="progressbar"
																style="width: 90%" aria-valuenow="90" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$138.00</td>
													<td>Apr 12, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="resources/images/faces/face4.jpg" alt="image" /></td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-primary" role="progressbar"
																style="width: 50%" aria-valuenow="50" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 77.99</td>
													<td>May 15, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="resources/images/faces/face5.jpg" alt="image" /></td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-danger" role="progressbar"
																style="width: 35%" aria-valuenow="35" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 160.25</td>
													<td>May 03, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="resources/images/faces/face6.jpg" alt="image" /></td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-info" role="progressbar"
																style="width: 65%" aria-valuenow="65" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 123.21</td>
													<td>April 05, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="resources/images/faces/face7.jpg" alt="image" /></td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-warning" role="progressbar"
																style="width: 20%" aria-valuenow="20" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 150.00</td>
													<td>June 16, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="resources/images/faces/face7.jpg" alt="image" /></td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-warning" role="progressbar"
																style="width: 20%" aria-valuenow="20" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 150.00</td>
													<td>June 16, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="resources/images/faces/face7.jpg" alt="image" /></td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-warning" role="progressbar"
																style="width: 20%" aria-valuenow="20" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 150.00</td>
													<td>June 16, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="resources/images/faces/face7.jpg" alt="image" /></td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-warning" role="progressbar"
																style="width: 20%" aria-valuenow="20" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 150.00</td>
													<td>June 16, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="resources/images/faces/face7.jpg" alt="image" /></td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-warning" role="progressbar"
																style="width: 20%" aria-valuenow="20" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 150.00</td>
													<td>June 16, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="resources/images/faces/face7.jpg" alt="image" /></td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-warning" role="progressbar"
																style="width: 20%" aria-valuenow="20" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 150.00</td>
													<td>June 16, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="resources/images/faces/face7.jpg" alt="image" /></td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-warning" role="progressbar"
																style="width: 20%" aria-valuenow="20" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 150.00</td>
													<td>June 16, 2015</td>
												</tr>

											</tbody>
										</table>
                  </div>
                </div>
              </div>
            </div>
						<div class="col-lg-4 mb-3 mb-lg-0">
							<div class="row flex-grow">
								<div class="col-sm-12 grid-margin stretch-card">
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col-lg-8">
													<h3 class="font-weight-bold text-dark">부산, 부산 진구</h3>
													<p class="text-dark">월요일 3.00 PM</p>
													<div class="d-lg-flex align-items-baseline mb-3">
														<h1 class="text-dark font-weight-bold">23<sup class="font-weight-light"><small>o</small><small class="font-weight-medium">c</small></sup></h1>
														<p class="text-muted ms-3">맑음</p>
													</div>
												</div>
												<div class="col-lg-4">
													<div class="position-relative">
														<img src="resources/images/dashboard/live.png" class="w-100" alt="">
														<div class="live-info badge badge-success">Live</div>
													</div>
												</div>
											</div>
											<div class="row">
												
											</div>
											<div class="row pt-3 mt-md-1">
												<div class="col">
													<div class="d-flex purchase-detail-legend align-items-center">
														<div id="circleProgress1" class="p-2"></div>
														<div>
															<p class="font-weight-medium text-dark text-small">Sessions</p>
															<h3 class="font-weight-bold text-dark  mb-0">70.80%</h3>
														</div>
													</div>
												</div>
												<div class="col">
													<div class="d-flex purchase-detail-legend align-items-center">
														<div id="circleProgress2" class="p-2"></div>
														<div>
															<p class="font-weight-medium text-dark text-small">Users</p>
															<h3 class="font-weight-bold text-dark  mb-0">56.80%</h3>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-12 grid-margin stretch-card">
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col-sm-12">
													<div class="d-flex align-items-center justify-content-between">
														<h4 class="card-title mb-0">To Do Lists</h4>
														<div class="dropdown">
															<a href="#" class="text-success btn btn-link  px-1"><i class="mdi mdi-refresh"></i></a>
															<a href="#" class="text-success btn btn-link px-1 dropdown-toggle dropdown-arrow-none" data-bs-toggle="dropdown" id="profileDropdownvisittoday"><i class="mdi mdi-dots-horizontal"></i></a>
															<div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdownvisittoday">
																<a class="dropdown-item">
																	<i class="mdi mdi-grease-pencil text-primary"></i>
																	Edit
																</a>
																<a class="dropdown-item">
																	<i class="mdi mdi-delete text-primary"></i>
																	Delete
																</a>
															</div>
														</div>
													</div>
													<p class="mt-1">Calculated in last 30 days</p>
													<div class="d-lg-flex align-items-center justify-content-between">
														<h1 class="font-weight-bold text-dark">4332</h1>
														<div class="mb-3">
															<button type="button" class="btn btn-outline-light text-dark font-weight-normal">Day</button>
															<button type="button" class="btn btn-outline-light text-dark font-weight-normal">Month</button>
														</div>
													</div>
													<canvas id="visitorsToday"></canvas>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 grid-margin grid-margin-md-0 stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="d-flex align-items-center justify-content-between">
										<h4 class="card-title">Calendar</h4>
										<h4 class="text-success font-weight-bold">Tickets<span class="text-dark ms-3">163</span></h4>
									</div>
									<div id="support-tracker-legend" class="support-tracker-legend"></div>
									<canvas id="supportTracker"></canvas>
								</div>
							</div>
						</div>
						<div class="col-sm-6 grid-margin grid-margin-md-0 stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="d-lg-flex align-items-center justify-content-between mb-4">
										<h4 class="card-title">Company Notice</h4>
										<p class="text-dark">+5.2% vs last 7 days</p>
									</div>
									<div class="product-order-wrap padding-reduced">
										<div id="productorder-gage" class="gauge productorder-gage"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
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
    <!-- End custom js for this page-->
  </body>
</html>