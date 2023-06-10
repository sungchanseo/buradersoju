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
    <div class="horizontal-menu">
      <nav class="navbar top-navbar col-lg-12 col-12 p-0">
        <div class="container-fluid">
          <div class="navbar-menu-wrapper d-flex align-items-center justify-content-between">
            <ul class="navbar-nav navbar-nav-left">

              <li class="nav-item dropdown">
                <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center" id="notificationDropdown" href="#" data-bs-toggle="dropdown">
                  <i class="mdi mdi-bell mx-0"></i>
                  <span class="count bg-success">2</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
                  <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                        <div class="preview-icon bg-success">
                          <i class="mdi mdi-information mx-0"></i>
                        </div>
                    </div>
                    <div class="preview-item-content">
                        <h6 class="preview-subject font-weight-normal">Application Error</h6>
                        <p class="font-weight-light small-text mb-0 text-muted">
                          Just now
                        </p>
                    </div>
                  </a>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                        <div class="preview-icon bg-warning">
                          <i class="mdi mdi-settings mx-0"></i>
                        </div>
                    </div>
                    <div class="preview-item-content">
                        <h6 class="preview-subject font-weight-normal">Settings</h6>
                        <p class="font-weight-light small-text mb-0 text-muted">
                          Private message
                        </p>
                    </div>
                  </a>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                        <div class="preview-icon bg-info">
                          <i class="mdi mdi-account-box mx-0"></i>
                        </div>
                    </div>
                    <div class="preview-item-content">
                        <h6 class="preview-subject font-weight-normal">New user registration</h6>
                        <p class="font-weight-light small-text mb-0 text-muted">
                          2 days ago
                        </p>
                    </div>
                  </a>
                </div>
              </li>
              <li class="nav-item dropdown">
       
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="messageDropdown">
                  <p class="mb-0 font-weight-normal float-left dropdown-header">Messages</p>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                        <img src="resources/images/faces/face4.jpg" alt="image" class="profile-pic">
                    </div>
                    <div class="preview-item-content flex-grow">
                        <h6 class="preview-subject ellipsis font-weight-normal">David Grey
                        </h6>
                        <p class="font-weight-light small-text text-muted mb-0">
                          The meeting is cancelled
                        </p>
                    </div>
                  </a>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                        <img src="resources/images/faces/face2.jpg" alt="image" class="profile-pic">
                    </div>
                    <div class="preview-item-content flex-grow">
                        <h6 class="preview-subject ellipsis font-weight-normal">Tim Cook
                        </h6>
                        <p class="font-weight-light small-text text-muted mb-0">
                          New product launch
                        </p>
                    </div>
                  </a>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                        <img src="resources/images/faces/face3.jpg" alt="image" class="profile-pic">
                    </div>
                    <div class="preview-item-content flex-grow">
                        <h6 class="preview-subject ellipsis font-weight-normal"> Johnson
                        </h6>
                        <p class="font-weight-light small-text text-muted mb-0">
                          Upcoming board meeting
                        </p>
                    </div>
                  </a>
                </div>
              </li>
              <li class="nav-item dropdown">
                <a href="#" class="nav-link count-indicator "><i class="mdi mdi-message-reply-text"></i></a>
              </li>
              <li class="nav-item nav-search d-none d-lg-block ms-3">
                <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="search">
                        <i class="mdi mdi-magnify"></i>
                      </span>
                    </div>
                    <input type="text" class="form-control" placeholder="search" aria-label="search" aria-describedby="search">
                </div>
              </li>	
            </ul>
            <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                <a class="navbar-brand brand-logo" href="/main"><img src="resources/images/logo.png" alt="logo"/></a>
                <a class="navbar-brand brand-logo-mini" href="/main"><img src="resources/images/logo-mini.png" alt="logo"/></a>
            </div>
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item dropdown  d-lg-flex d-none">
                  <button type="button" class="btn btn-inverse-primary btn-sm">Product </button>
                </li>
                <li class="nav-item dropdown d-lg-flex d-none">
                  <a class="dropdown-toggle show-dropdown-arrow btn btn-inverse-primary btn-sm" id="nreportDropdown" href="#" data-bs-toggle="dropdown">
                  Reports
                  </a>
                  <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="nreportDropdown">
                      <p class="mb-0 font-weight-medium float-left dropdown-header">Reports</p>
                      <a class="dropdown-item">
                        <i class="mdi mdi-file-pdf text-primary"></i>
                        Pdf
                      </a>
                      <a class="dropdown-item">
                        <i class="mdi mdi-file-excel text-primary"></i>
                        Exel
                      </a>
                  </div>
                </li>
                <li class="nav-item dropdown d-lg-flex d-none">
                  <button type="button" class="btn btn-inverse-primary btn-sm">Settings</button>
                </li>
                <li class="nav-item nav-profile dropdown">
                  <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" id="profileDropdown">
                    <span class="nav-profile-name">관리자</span>
                    <span class="online-status"></span>
                    <img src="resources/images/faces/face28.png" alt="profile"/>
                  </a>
                  <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                      <a class="dropdown-item">
                        <i class="mdi mdi-settings text-primary"></i>
                        Settings
                      </a>
                      <a href="member/logout" class="dropdown-item">
                        <i class="mdi mdi-logout text-primary"></i>
                        Logout
                      </a>
                  </div>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="horizontal-menu-toggle">
              <span class="mdi mdi-menu"></span>
            </button>
          </div>
        </div>
      </nav>
      <nav class="bottom-navbar">
        <div class="container">
            <ul class="nav page-navigation">
              <li class="nav-item">
                <a class="nav-link" href="index.html">
                  <i class="mdi mdi-account menu-icon"></i>
                  <span class="menu-title">사원 관리</span>
                </a>
                <div class="submenu">
                      <ul class="submenu-item">
                      	  <li class="nav-item"><a class="nav-link" href="member/insert">사원 조회</a></li>
                          <li class="nav-item"><a class="nav-link" href="member/insert">사원 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="member/insert">사원 수정</a></li>
                          <li class="nav-item"><a class="nav-link" href="member/insert">사원 삭제</a></li>
                      </ul>
                  </div>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="index.html">
                  <i class="mdi mdi-cube-outline menu-icon"></i>
                  <span class="menu-title">영업 관리</span>
                </a>
                <div class="submenu">
                      <ul class="submenu-item">
                          <li class="nav-item"><a class="nav-link" href="contract/list">수주 목록</a></li>
                          <li class="nav-item"><a class="nav-link" href="contract/list">수주 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="contract/list">수주 조회</a></li>
                          <li class="nav-item"><a class="nav-link" href="contract/list">수주 수정</a></li>
                          <li class="nav-item"><a class="nav-link" href="contract/list">수주 삭제</a></li>
                          <li class="nav-item"><a class="nav-link" href="contract/list">거래처 목록</a></li>
                          <li class="nav-item"><a class="nav-link" href="contract/list">거래처 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="contract/list">거래처 조회</a></li>
                          <li class="nav-item"><a class="nav-link" href="contract/list">거래처 수정</a></li>
                          <li class="nav-item"><a class="nav-link" href="contract/list">QR코드 생성</a></li>
                      </ul>
                  </div>
              </li>
              <li class="nav-item">
                  <a href="pages/forms/basic_elements.html" class="nav-link">
                    <i class="mdi mdi-chart-areaspline menu-icon"></i>
                    <span class="menu-title">구매 관리</span>
                    <i class="menu-arrow"></i>
                  </a>
                  <div class="submenu">
                      <ul>
                         <li class="nav-item"><a class="nav-link" href="product/insert">자재 등록</a></li>
                         <li class="nav-item"><a class="nav-link" href="product/insert">자재 수정</a></li>
                         <li class="nav-item"><a class="nav-link" href="product/insert">자재 삭제</a></li>
                         <li class="nav-item"><a class="nav-link" href="product/insert">자재 저장</a></li>
                         <li class="nav-item"><a class="nav-link" href="product/insert">자재 검색</a></li>
                         <li class="nav-item"><a class="nav-link" href="product/insert">재고 검색</a></li>
                         <li class="nav-item"><a class="nav-link" href="product/insert">현 재고량</a></li>
                         <li class="nav-item"><a class="nav-link" href="product/insert">발주 현황</a></li>
                         <li class="nav-item"><a class="nav-link" href="product/insert">발주 등록</a></li>
                         <li class="nav-item"><a class="nav-link" href="product/insert">입고 목록</a></li>
                         <li class="nav-item"><a class="nav-link" href="product/insert">미입고</a></li>
                         <li class="nav-item"><a class="nav-link" href="product/insert">입고 완료</a></li>
                         <li class="nav-item"><a class="nav-link" href="product/insert">출고 목록</a></li>
                         <li class="nav-item"><a class="nav-link" href="product/insert">출고 조회</a></li>
                         <li class="nav-item"><a class="nav-link" href="product/insert">출고 처리</a></li>
                      </ul>
                  </div>
              </li>
              <li class="nav-item">
                  <a href="pages/charts/chartjs.html" class="nav-link">
                    <i class="mdi mdi-finance menu-icon"></i>
                    <span class="menu-title">생산 관리</span>
                    <i class="menu-arrow"></i>
                  </a>
                  <div class="submenu">
                    <ul>
                          <li class="nav-item"><a class="nav-link" href="process/insert">작업 지시 목록</a></li>
                          <li class="nav-item"><a class="nav-link" href="process/insert">작업 지시 상세</a></li>
                          <li class="nav-item"><a class="nav-link" href="process/insert">작업 지시 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="process/insert">생산 목록</a></li>
                          <li class="nav-item"><a class="nav-link" href="process/insert">생산 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="process/insert">품질 관리 목록</a></li>
                          <li class="nav-item"><a class="nav-link" href="process/insert">검수 등록</a></li>
                      </ul>
                  </div>
              </li>
              <li class="nav-item">
                  <a href="pages/tables/basic-table.html" class="nav-link">
                    <i class="mdi mdi-grid menu-icon"></i>
                    <span class="menu-title">창고 관리</span>
                    <i class="menu-arrow"></i>
                  </a>
                  <div class="submenu">
                   	<ul>
                          <li class="nav-item"><a class="nav-link" href="warehouse/insert">창고 관리</a></li>
                          <li class="nav-item"><a class="nav-link" href="warehouse/insert">창고 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="warehouse/insert">창고 수정</a></li>
                          <li class="nav-item"><a class="nav-link" href="warehouse/insert">창고 삭제</a></li>
                          
                    </ul>
                  </div>
              </li>
            </ul>
        </div>
      </nav>
    </div>
    <!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-sm-6 mb-4 mb-xl-0">
							<div class="d-lg-flex align-items-center">
								<div>
									<h3 class="text-dark font-weight-bold mb-2">좋은 아침입니다 관리자님!</h3>
									<h6 class="font-weight-normal mb-2">Last login was 23 hours ago. View details</h6>
								</div>
								<div class="ms-lg-5 d-lg-flex d-none">
										<button type="button" class="btn bg-white btn-icon">
											<i class="mdi mdi-view-grid text-success"></i>
										</button>

								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="d-flex align-items-center justify-content-md-end">
								<div class="pe-1 mb-3 mb-xl-0">
										<button type="button" class="btn btn-outline-inverse-info btn-icon-text">
											Feedback
											<i class="mdi mdi-message-outline btn-icon-append"></i>                          
										</button>
								</div>
								<div class="pe-1 mb-3 mb-xl-0">
										<button type="button" class="btn btn-outline-inverse-info btn-icon-text">
											Help
											<i class="mdi mdi-help-circle-outline btn-icon-append"></i>                          
									</button>
								</div>
								<div class="pe-1 mb-3 mb-xl-0">
										<button type="button" class="btn btn-outline-inverse-info btn-icon-text">
											Print
											<i class="mdi mdi-printer btn-icon-append"></i>                          
										</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-4">
						<div class="col-lg-8 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-4">
											<h4 class="card-title">Sales Difference</h4>
											<canvas id="salesDifference"></canvas>
											<p class="mt-3 mb-4 mb-lg-0">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit.
											</p>
										</div>
										<div class="col-lg-5">
											<h4 class="card-title">Best Sellers</h4>
											<div class="row">
												<div class="col-sm-4">
													<ul class="graphl-legend-rectangle">
														<li><span class="bg-danger"></span>Automotive</li>
														<li><span class="bg-warning"></span>Books</li>
														<li><span class="bg-info"></span>Software</li>
														<li><span class="bg-success"></span>Video games</li>
													</ul>
												</div>
												<div class="col-sm-8 grid-margin">
													<canvas id="bestSellers"></canvas>
												</div>
											</div>
											<p class="mt-3 mb-4 mb-lg-0">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit.
											</p>
										</div>
										<div class="col-lg-3">
											<h4 class="card-title">Social Media Statistics</h4>
											<div class="row">
												<div class="col-sm-12">
													<div class="progress progress-lg grouped mb-2">
														<div class="progress-bar  bg-danger" role="progressbar" style="width: 40%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
														<div class="progress-bar bg-info" role="progressbar" style="width: 10%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
														<div class="progress-bar bg-warning" role="progressbar" style="width: 20%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
														<div class="progress-bar bg-success" role="progressbar" style="width: 30%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
												<div class="col-sm-12">
													<ul class="graphl-legend-rectangle">
														<li><span class="bg-danger"></span>Instagram (15%)</li>
														<li><span class="bg-warning"></span>Facebook (20%)</li>
														<li><span class="bg-info"></span>Website (25%)</li>
														<li><span class="bg-success"></span>Youtube (40%)</li>
													</ul>
												</div>
											</div>
											<p class="mb-0 mt-2">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit.
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 mb-3 mb-lg-0">
							<div class="card congratulation-bg text-center">
								<div class="card-body pb-0">
									<img src="resources/images/dashboard/face29.png" alt="" width="120px">  
									<h2 class="mt-3 text-white mb-3 font-weight-bold">이 달의 수주왕
									</h2>
									<p>You have done 57.6% more sales today. 
										Check your new badge in your profile.
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-8 flex-column d-flex stretch-card">
							<div class="row">
								
								
								
							</div>
							<div class="row">
								<div class="col-sm-12 grid-margin d-flex stretch-card">
									<div class="card">
										<div class="card-body">
											<div class="d-flex align-items-center justify-content-between">
												<h4 class="card-title mb-2">Sales Difference</h4>
												<div class="dropdown">
													<a href="#" class="text-success btn btn-link  px-1"><i class="mdi mdi-refresh"></i></a>
													<a href="#" class="text-success btn btn-link px-1 dropdown-toggle dropdown-arrow-none" data-bs-toggle="dropdown" id="settingsDropdownsales">
														<i class="mdi mdi-dots-horizontal"></i></a>
														<div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="settingsDropdownsales">
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
											<div>
												<ul class="nav nav-tabs tab-no-active-fill" role="tablist">
													<li class="nav-item">
														<a class="nav-link active ps-2 pe-2" id="revenue-for-last-month-tab" data-bs-toggle="tab" href="#revenue-for-last-month" role="tab" aria-controls="revenue-for-last-month" aria-selected="true">Revenue for last month</a>
													</li>
													<li class="nav-item">
														<a class="nav-link ps-2 pe-2" id="server-loading-tab" data-bs-toggle="tab" href="#server-loading" role="tab" aria-controls="server-loading" aria-selected="false">Server loading</a>
													</li>
													<li class="nav-item">
														<a class="nav-link ps-2 pe-2" id="data-managed-tab" data-bs-toggle="tab" href="#data-managed" role="tab" aria-controls="data-managed" aria-selected="false">Data managed</a>
													</li>
													<li class="nav-item">
														<a class="nav-link ps-2 pe-2" id="sales-by-traffic-tab" data-bs-toggle="tab" href="#sales-by-traffic" role="tab" aria-controls="sales-by-traffic" aria-selected="false">Sales by traffic</a>
													</li>
												</ul>
												<div class="tab-content tab-no-active-fill-tab-content">
													<div class="tab-pane fade show active" id="revenue-for-last-month" role="tabpanel" aria-labelledby="revenue-for-last-month-tab">
														<div class="d-lg-flex justify-content-between">
															<p class="mb-4">+5.2% vs last 7 days</p>
															<div id="revenuechart-legend" class="revenuechart-legend">f</div>
														</div>
														<canvas id="revenue-for-last-month-chart"></canvas>
													</div>
													<div class="tab-pane fade" id="server-loading" role="tabpanel" aria-labelledby="server-loading-tab">
														<div class="d-flex justify-content-between">
															<p class="mb-4">+5.2% vs last 7 days</p>
															<div id="serveLoading-legend" class="revenuechart-legend">f</div>
														</div>
														<canvas id="serveLoading"></canvas>
													</div>
													<div class="tab-pane fade" id="data-managed" role="tabpanel" aria-labelledby="data-managed-tab">
														<div class="d-flex justify-content-between">
															<p class="mb-4">+5.2% vs last 7 days</p>
															<div id="dataManaged-legend" class="revenuechart-legend">f</div>
														</div>
														<canvas id="dataManaged"></canvas>
													</div>
													<div class="tab-pane fade" id="sales-by-traffic" role="tabpanel" aria-labelledby="sales-by-traffic-tab">
														<div class="d-flex justify-content-between">
															<p class="mb-4">+5.2% vs last 7 days</p>
															<div id="salesTrafic-legend" class="revenuechart-legend">f</div>
														</div>
														<canvas id="salesTrafic"></canvas>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4 flex-column d-flex stretch-card">
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
												<div class="col-sm-12 mt-4 mt-lg-0">
													<div class="bg-primary text-white px-4 py-4 card">
														<div class="row">
															<div class="col-sm-6 pl-lg-5">
																<h2>$1635</h2>
																<p class="mb-0">Your Iincome</p>
															</div>
															<div class="col-sm-6 climate-info-border mt-lg-0 mt-2">
																<h2>$2650</h2>
																<p class="mb-0">Your Spending</p>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row pt-3 mt-md-1">
												<div class="col">
													<div class="d-flex purchase-detail-legend align-items-center">
														<div id="circleProgress1" class="p-2"></div>
														<div>
															<p class="font-weight-medium text-dark text-small">Sessions</p>
															<h3 class="font-weight-bold text-dark  mb-0">26.80%</h3>
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
														<h4 class="card-title mb-0">Visits Today</h4>
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
						<div class="col-lg-2 grid-margin stretch-card">
							<div class="card">
								<div class="card-body pb-0">
									<div class="d-flex align-items-center justify-content-between">
										<h2 class="text-success font-weight-bold">18390</h2>
										<i class="mdi mdi-account-outline mdi-18px text-dark"></i>
									</div>
								</div>
								<canvas id="newClient"></canvas>
								<div class="line-chart-row-title">MY NEW CLIENTS</div>
							</div>
						</div>
						<div class="col-lg-2 grid-margin stretch-card">
							<div class="card">
								<div class="card-body pb-0">
									<div class="d-flex align-items-center justify-content-between">
										<h2 class="text-danger font-weight-bold">839</h2>
										<i class="mdi mdi-refresh mdi-18px text-dark"></i>
									</div>
								</div>
								<canvas id="allProducts"></canvas>
								<div class="line-chart-row-title">All Products</div>
							</div>
						</div>
						<div class="col-lg-2 grid-margin stretch-card">
							<div class="card">
								<div class="card-body pb-0">
									<div class="d-flex align-items-center justify-content-between">
										<h2 class="text-info font-weight-bold">244</h2>
										<i class="mdi mdi-file-document-outline mdi-18px text-dark"></i>
									</div>
								</div>
								<canvas id="invoices"></canvas>
								<div class="line-chart-row-title">NEW INVOICES</div>
							</div>
						</div>
						<div class="col-lg-2 grid-margin stretch-card">
							<div class="card">
								<div class="card-body pb-0">
									<div class="d-flex align-items-center justify-content-between">
										<h2 class="text-warning font-weight-bold">3259</h2>
										<i class="mdi mdi-folder-outline mdi-18px text-dark"></i>
									</div>
								</div>
								<canvas id="projects"></canvas>
								<div class="line-chart-row-title">All PROJECTS</div>
							</div>
						</div>
						<div class="col-lg-2 grid-margin stretch-card">
							<div class="card">
								<div class="card-body pb-0">
									<div class="d-flex align-items-center justify-content-between">
										<h2 class="text-secondary font-weight-bold">586</h2>
										<i class="mdi mdi-cart-outline mdi-18px text-dark"></i>
									</div>
								</div>
								<canvas id="orderRecieved"></canvas>
								<div class="line-chart-row-title">Orders Received</div>
							</div>
						</div>
						<div class="col-lg-2 grid-margin stretch-card">
							<div class="card">
								<div class="card-body pb-0">
									<div class="d-flex align-items-center justify-content-between">
										<h2 class="text-dark font-weight-bold">7826</h2>
										<i class="mdi mdi-cash text-dark mdi-18px"></i>
									</div>
								</div>
								<canvas id="transactions"></canvas>
								<div class="line-chart-row-title">TRANSACTIONS</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 grid-margin grid-margin-md-0 stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="d-flex align-items-center justify-content-between">
										<h4 class="card-title">Support Tracker</h4>
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
										<h4 class="card-title">Product Orders</h4>
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
				<footer class="footer">
          <div class="footer-wrap">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © <a href="/main" target="_blank">Alcoholic.com </a>2021</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Only the best <a href="/main" target="_blank"> Alcoholic.com </a> templates</span>
            </div>
          </div>
        </footer>
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