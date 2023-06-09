<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SOJU</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/chartist/chartist.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
  </head>
  <body>

    <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="navbar-brand-wrapper d-flex align-items-center">
          <a class="navbar-brand brand-logo" href="/main">
            <img src="${pageContext.request.contextPath}/resources/images/logo.svg" alt="logo" class="logo-dark" />
          </a>
          <a class="navbar-brand brand-logo-mini" href="index.html"><img src="${pageContext.request.contextPath}/resourcesimages/logo-mini.svg" alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center flex-grow-1">
          <h5 class="mb-0 font-weight-medium d-none d-lg-flex">좋은 아침입니다 관리자님! </h5>
          <ul class="navbar-nav navbar-nav-right ml-auto">
            <form class="search-form d-none d-md-block" action="#">
              <i class="icon-magnifier"></i>
              <input type="search" class="form-control" placeholder="Search Here" title="Search here">
            </form>
            <li class="nav-item"><a href="#" class="nav-link"><i class="icon-chart"></i></a></li>
            <li class="nav-item dropdown">
              <a class="nav-link count-indicator message-dropdown" id="messageDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                <i class="icon-speech"></i>
                <span class="count">7</span>
              </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0" aria-labelledby="messageDropdown">
                <a class="dropdown-item py-3">
                  <p class="mb-0 font-weight-medium float-left">You have 7 unread mails </p>
                  <span class="badge badge-pill badge-primary float-right">View all</span>
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <img src="${pageContext.request.contextPath}/resources/images/faces/face10.jpg" alt="image" class="img-sm profile-pic">
                  </div>
                  <div class="preview-item-content flex-grow py-2">
                    <p class="preview-subject ellipsis font-weight-medium text-dark">Marian Garner </p>
                    <p class="font-weight-light small-text"> The meeting is cancelled </p>
                  </div>
                </a>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <img src="${pageContext.request.contextPath}/resources/images/faces/face12.jpg" alt="image" class="img-sm profile-pic">
                  </div>
                  <div class="preview-item-content flex-grow py-2">
                    <p class="preview-subject ellipsis font-weight-medium text-dark">David Grey </p>
                    <p class="font-weight-light small-text"> The meeting is cancelled </p>
                  </div>
                </a>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <img src="${pageContext.request.contextPath}/resources/images/faces/face1.jpg" alt="image" class="img-sm profile-pic">
                  </div>
                  <div class="preview-item-content flex-grow py-2">
                    <p class="preview-subject ellipsis font-weight-medium text-dark">Travis Jenkins </p>
                    <p class="font-weight-light small-text"> The meeting is cancelled </p>
                  </div>
                </a>
              </div>
            </li>

            <li class="nav-item dropdown d-none d-xl-inline-flex user-dropdown">
              <a class="nav-link dropdown-toggle" id="UserDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                <img class="img-xs rounded-circle ml-2" src="${pageContext.request.contextPath}/resources/images/faces/face8.jpg" alt="Profile image"> <span class="font-weight-normal">임창희 </span></a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                <div class="dropdown-header text-center">
                  <img class="img-md rounded-circle" src="${pageContext.request.contextPath}/images/faces/face8.jpg" alt="Profile image">
                  <p class="mb-1 mt-3">관리자님</p>
                  <p class="font-weight-light text-muted mb-0">allenmoreno@gmail.com</p>
                </div>
                <a class="dropdown-item"><i class="dropdown-item-icon icon-user text-primary"></i> My Profile <span class="badge badge-pill badge-danger">1</span></a>
                <a class="dropdown-item"><i class="dropdown-item-icon icon-speech text-primary"></i> Messages</a>
                <a class="dropdown-item"><i class="dropdown-item-icon icon-energy text-primary"></i> Activity</a>
                <a class="dropdown-item"><i class="dropdown-item-icon icon-question text-primary"></i> FAQ</a>
                <a class="dropdown-item"><i class="dropdown-item-icon icon-power text-primary"></i>Sign Out</a>
              </div>
            </li>
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="icon-menu"></span>
          </button>
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile">
              <a href="#" class="nav-link">
                <div class="profile-image">
                  <img class="img-xs rounded-circle" src="${pageContext.request.contextPath}/resources/images/faces/face8.jpg" alt="profile image">
                  <div class="dot-indicator bg-success"></div>
                </div>
                <div class="text-wrapper">
                  <p class="profile-name">임창희</p>
                  <p class="designation">관리자</p>
                </div>
                <div class="icon-container">
                  <i class="icon-bubbles"></i>
                  <div class="dot-indicator bg-danger"></div>
                </div>
              </a>
            </li>
            <li class="nav-item nav-category"><span class="nav-link">Dashboard</span></li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">사원 관리</span>
                <i class="icon-user menu-icon"></i>
              </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">Buttons</a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">Typography</a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/pages/icons/simple-line-icons.html">
                <span class="menu-title">수주 관리</span>
                <i class="icon-globe menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="pages/forms/basic_elements.html">
                <span class="menu-title">자재 관리</span>
                <i class="icon-book-open menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="pages/charts/chartist.html">
                <span class="menu-title">생산 관리</span>
                <i class="icon-chart menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/resources/pages/tables/basic-table.html">
                <span class="menu-title">검수</span>
                <i class="icon-grid menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                <span class="menu-title">출고 관리</span>
                <i class="icon-doc menu-icon"></i>
              </a>
              <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html"> Login </a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/register.html"> Register </a></li>
                  <li class="nav-item"> <a class="nav-link" href="resources/pages/samples/error-404.html"> 404 </a></li>
                  <li class="nav-item"> <a class="nav-link" href="resources/pages/samples/error-500.html"> 500 </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/resources/pages/samples/blank-page.html"> Blank Page </a></li>
                </ul>
              </div>
            </li>
          </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
           
            <div class="row">
              <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Google Calendar(fixes)</h4>
                    <div class="aligner-wrapper">
                      <canvas id="sessionsDoughnutChart" height="210"></canvas>
                      <div class="wrapper d-flex flex-column justify-content-center absolute absolute-center">
                        <h2 class="text-center mb-0 font-weight-bold">8.234</h2>
                        <small class="d-block text-center text-muted  font-weight-semibold mb-0">Total Leads</small>
                      </div>
                    </div>
                    <div class="wrapper mt-4 d-flex flex-wrap align-items-cente">
                      <div class="d-flex">
                        <span class="square-indicator bg-danger ml-2"></span>
                        <p class="mb-0 ml-2">Assigned</p>
                      </div>
                      <div class="d-flex">
                        <span class="square-indicator bg-success ml-2"></span>
                        <p class="mb-0 ml-2">Not Assigned</p>
                      </div>
                      <div class="d-flex">
                        <span class="square-indicator bg-warning ml-2"></span>
                        <p class="mb-0 ml-2">Reassigned</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-8 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body performane-indicator-card">
                    <div class="d-sm-flex">
                      <h4 class="card-title flex-shrink-1">To Do Lists(fixes)</h4>
                      <p class="m-sm-0 ml-sm-auto flex-shrink-0">
                        <span class="data-time-range ml-0">7d</span>
                        <span class="data-time-range active">2w</span>
                        <span class="data-time-range">1m</span>
                        <span class="data-time-range">3m</span>
                        <span class="data-time-range">6m</span>
                      </p>
                    </div>
                    <div class="d-sm-flex flex-wrap">
                      <div class="d-flex align-items-center">
                        <span class="dot-indicator bg-primary ml-2"></span>
                        <p class="mb-0 ml-2 text-muted font-weight-semibold">Complaints (2098)</p>
                      </div>
                      <div class="d-flex align-items-center">
                        <span class="dot-indicator bg-info ml-2"></span>
                        <p class="mb-0 ml-2 text-muted font-weight-semibold"> Task Done (1123)</p>
                      </div>
                      <div class="d-flex align-items-center">
                        <span class="dot-indicator bg-danger ml-2"></span>
                        <p class="mb-0 ml-2 text-muted font-weight-semibold">Attends (876)</p>
                      </div>
                    </div>
                    <div id="performance-indicator-chart" class="ct-chart mt-4"></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="d-sm-flex align-items-baseline report-summary-header">
                          <h5 class="font-weight-semibold">이 달의 수주왕 (Fixes)</h5> <span class="ml-auto">Updated Report</span> <button class="btn btn-icons border-0 p-2"><i class="icon-refresh"></i></button>
                        </div>
                      </div>
                    </div>
                    <div class="row report-inner-cards-wrapper">
                      <div class=" col-md -6 col-xl report-inner-card">
                        <div class="inner-card-text">
                          <span class="report-title">EXPENSE</span>
                          <h4>$32123</h4>
                          <span class="report-count"> 2 Reports</span>
                        </div>
                        <div class="inner-card-icon bg-success">
                          <i class="icon-rocket"></i>
                        </div>
                      </div>
                      <div class="col-md-6 col-xl report-inner-card">
                        <div class="inner-card-text">
                          <span class="report-title">PURCHASE</span>
                          <h4>95,458</h4>
                          <span class="report-count"> 3 Reports</span>
                        </div>
                        <div class="inner-card-icon bg-danger">
                          <i class="icon-briefcase"></i>
                        </div>
                      </div>
                      <div class="col-md-6 col-xl report-inner-card">
                        <div class="inner-card-text">
                          <span class="report-title">QUANTITY</span>
                          <h4>2650</h4>
                          <span class="report-count"> 5 Reports</span>
                        </div>
                        <div class="inner-card-icon bg-warning">
                          <i class="icon-globe-alt"></i>
                        </div>
                      </div>
                      <div class="col-md-6 col-xl report-inner-card">
                        <div class="inner-card-text">
                          <span class="report-title">RETURN</span>
                          <h4>25,542</h4>
                          <span class="report-count"> 9 Reports</span>
                        </div>
                        <div class="inner-card-icon bg-primary">
                          <i class="icon-diamond"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <div class="row income-expense-summary-chart-text">
                      <div class="col-xl-4">
                        <h5>Income And Expenses Summary</h5>
                        <p class="small text-muted">A comparison of people who mark themselves of their ineterest from the date range given above. Learn more.</p>
                      </div>
                      <div class=" col-md-3 col-xl-2">
                        <p class="income-expense-summary-chart-legend"> <span style="border-color: #6469df"></span> Total Income </p>
                        <h3>$ 1,766.00</h3>
                      </div>
                      <div class="col-md-3 col-xl-2">
                        <p class="income-expense-summary-chart-legend"> <span style="border-color: #37ca32"></span> Total Expense </p>
                        <h3>$ 5,698.30</h3>
                      </div>
                      <div class="col-md-6 col-xl-4 d-flex align-items-center">
                        <div class="input-group" id="income-expense-summary-chart-daterange">
                          <div class="inpu-group-prepend input-group-text"><i class="icon-calendar"></i></div>
                          <input type="text" class="form-control">
                          <div class="input-group-prepend input-group-text"><i class="icon-arrow-down"></i></div>
                        </div>
                      </div>
                    </div>
                    <div class="row income-expense-summary-chart mt-3">
                      <div class="col-md-12">
                        <div class="ct-chart" id="income-expense-summary-chart"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="d-sm-flex align-items-center mb-4">
                      <h4 class="card-title mb-sm-0">Products Inventory</h4>
                      <a href="#" class="text-dark ml-auto mb-3 mb-sm-0"> View all Products</a>
                    </div>
                    <div class="table-responsive border rounded p-1">
                      <table class="table">
                        <thead>
                          <tr>
                            <th class="font-weight-bold">Store ID</th>
                            <th class="font-weight-bold">Amount</th>
                            <th class="font-weight-bold">Gateway</th>
                            <th class="font-weight-bold">Created at</th>
                            <th class="font-weight-bold">Paid at</th>
                            <th class="font-weight-bold">Status</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>
                              <img class="img-sm rounded-circle" src="${pageContext.request.contextPath}/resources/images/faces/face1.jpg" alt="profile image"> Katie Holmes
                            </td>
                            <td>$3621</td>
                            <td><img src="${pageContext.request.contextPath}/resources/images/dashboard/alipay.png" alt="alipay" class="gateway-icon mr-2"> alipay</td>
                            <td>04 Jun 2019</td>
                            <td>18 Jul 2019</td>
                            <td>
                              <div class="badge badge-success p-2">Paid</div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <img class="img-sm rounded-circle" src="${pageContext.request.contextPath}/resources/images/faces/face2.jpg" alt="profile image"> Minnie Copeland
                            </td>
                            <td>$6245</td>
                            <td><img src="${pageContext.request.contextPath}/resources/images/dashboard/paypal.png" alt="alipay" class="gateway-icon mr-2"> Paypal</td>
                            <td>25 Sep 2019</td>
                            <td>07 Oct 2019</td>
                            <td>
                              <div class="badge badge-danger p-2">Pending</div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <img class="img-sm rounded-circle" src="${pageContext.request.contextPath}/resources/images/faces/face3.jpg" alt="profile image"> Rodney Sims
                            </td>
                            <td>$9265</td>
                            <td><img src="${pageContext.request.contextPath}/resources/images/dashboard/alipay.png" alt="alipay" class="gateway-icon mr-2"> alipay</td>
                            <td>12 dec 2019</td>
                            <td>26 Aug 2019</td>
                            <td>
                              <div class="badge badge-warning p-2">Failed</div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <img class="img-sm rounded-circle" src="${pageContext.request.contextPath}/resources/images/faces/face4.jpg" alt="profile image"> Carolyn Barker
                            </td>
                            <td>$2263</td>
                            <td><img src="${pageContext.request.contextPath}/resources/images/dashboard/alipay.png" alt="alipay" class="gateway-icon mr-2"> alipay</td>
                            <td>30 Sep 2019</td>
                            <td>20 Oct 2019</td>
                            <td>
                              <div class="badge badge-success p-2">Paid</div>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    <div class="d-flex mt-4 flex-wrap">
                      <p class="text-muted">Showing 1 to 10 of 57 entries</p>
                      <nav class="ml-auto">
                        <ul class="pagination separated pagination-info">
                          <li class="page-item"><a href="#" class="page-link"><i class="icon-arrow-left"></i></a></li>
                          <li class="page-item active"><a href="#" class="page-link">1</a></li>
                          <li class="page-item"><a href="#" class="page-link">2</a></li>
                          <li class="page-item"><a href="#" class="page-link">3</a></li>
                          <li class="page-item"><a href="#" class="page-link">4</a></li>
                          <li class="page-item"><a href="#" class="page-link"><i class="icon-arrow-right"></i></a></li>
                        </ul>
                      </nav>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright Â© SOJU 2020</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> SOJU <a href="/main" target="_blank">SOJU admin</a> from SOJU.com</span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="${pageContext.request.contextPath}/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="${pageContext.request.contextPath}/resources/vendors/chart.js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendors/moment/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendors/daterangepicker/daterangepicker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendors/chartist/chartist.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="${pageContext.request.contextPath}/resources/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="${pageContext.request.contextPath}/resources/js/dashboard.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>