<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <div class="horizontal-menu">
      <nav class="navbar top-navbar col-lg-12 col-12 p-0">
        <div class="container-fluid">
          <div class="navbar-menu-wrapper d-flex align-items-center justify-content-between">
            <ul class="navbar-nav navbar-nav-left">

              <li class="nav-item dropdown">
                <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center" id="notificationDropdown" href="#" data-bs-toggle="dropdown">
                  <i class="mdi mdi-message-reply-text"></i>
                  <span class="count bg-success"></span>
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
                    
                  </a>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                        <div class="preview-icon bg-info">
                          <i class="mdi mdi-account-box mx-0"></i>
                        </div>
                    </div>
                   
                  </a>
                </div>
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
                <a class="navbar-brand brand-logo-mini" href="/main"><img src="resources/images/logo-mini.png" alt="logo" height="100px" width="100px"/></a>
            </div>
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item dropdown d-lg-flex d-none">
                  <a class="dropdown-toggle show-dropdown-arrow btn btn-inverse-success btn-sm" id="nreportDropdown" href="#" data-bs-toggle="dropdown">
                  	Good Morning
                  </a>
                  <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="nreportDropdown">
                      <p class="mb-0 font-weight-medium float-left dropdown-header">관리자님</p>
                      <a class="dropdown-item">
                        <i class="mdi mdi-file-pdf text-primary"></i>
                         	Info
                      </a>
                      <a class="dropdown-item">
                        <i class="mdi mdi-file-excel text-primary"></i>
                        LogOut
                      </a>
                  </div>
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
                        Info
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
                <a class="nav-link" href="" >
                  <i class="mdi mdi-account menu-icon"></i>
                  <span class="menu-title">사원 관리</span>
                </a>
                <div class="submenu">
                      <ul class="submenu-item">
                      	  <li class="nav-item"><a class="nav-link" href="/employee/info">사원 조회</a></li>
                          <li class="nav-item"><a class="nav-link" href="/employee/insert">사원 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="/employee/modify">사원 수정</a></li>
                          <li class="nav-item"><a class="nav-link" href="/employee/delete">사원 삭제</a></li>
                      </ul>
                  </div>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="">
                  <i class="mdi mdi-cube-outline menu-icon"></i>
                  <span class="menu-title">영업 관리</span>
                </a>
                <div class="submenu">
                      <ul class="submenu-item">
                          <li class="nav-item"><a class="nav-link" href="">수주 목록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">수주 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">수주 조회</a></li>
                          <li class="nav-item"><a class="nav-link" href="">수주 수정</a></li>
                          <li class="nav-item"><a class="nav-link" href="">수주 삭제</a></li>
                          <li class="nav-item"><a class="nav-link" href="">거래처 목록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">거래처 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">거래처 조회</a></li>
                          <li class="nav-item"><a class="nav-link" href="">거래처 수정</a></li>
                          <li class="nav-item"><a class="nav-link" href="">QR코드 생성</a></li>
                      </ul>
                  </div>
              </li>
              <li class="nav-item">
                  <a href="" class="nav-link">
                    <i class="mdi mdi-chart-areaspline menu-icon"></i>
                    <span class="menu-title">구매 관리</span>
                    <i class="menu-arrow"></i>
                  </a>
                  <div class="submenu">
                      <ul>
                         <li class="nav-item"><a class="nav-link" href="">자재 등록</a></li>
                         <li class="nav-item"><a class="nav-link" href="">자재 수정</a></li>
                         <li class="nav-item"><a class="nav-link" href="">자재 삭제</a></li>
                         <li class="nav-item"><a class="nav-link" href="">자재 저장</a></li>
                         <li class="nav-item"><a class="nav-link" href="">자재 검색</a></li>
                         <li class="nav-item"><a class="nav-link" href="">재고 검색</a></li>
                         <li class="nav-item"><a class="nav-link" href="">현 재고량</a></li>
                         <li class="nav-item"><a class="nav-link" href="">발주 현황</a></li>
                         <li class="nav-item"><a class="nav-link" href="">발주 등록</a></li>
                         <li class="nav-item"><a class="nav-link" href="">입고 목록</a></li>
                         <li class="nav-item"><a class="nav-link" href="">미입고</a></li>
                         <li class="nav-item"><a class="nav-link" href="">입고 완료</a></li>
                         <li class="nav-item"><a class="nav-link" href="">출고 목록</a></li>
                         <li class="nav-item"><a class="nav-link" href="">출고 조회</a></li>
                         <li class="nav-item"><a class="nav-link" href="">출고 처리</a></li>
                      </ul>
                  </div>
              </li>
              <li class="nav-item">
                  <a href="" class="nav-link">
                    <i class="mdi mdi-finance menu-icon"></i>
                    <span class="menu-title">생산 관리</span>
                    <i class="menu-arrow"></i>
                  </a>
                  <div class="submenu">
                    <ul>
                          <li class="nav-item"><a class="nav-link" href="">작업 지시 목록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">작업 지시 상세</a></li>
                          <li class="nav-item"><a class="nav-link" href="">작업 지시 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">생산 목록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">생산 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">품질 관리 목록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">검수 등록</a></li>
                      </ul>
                  </div>
              </li>
              <li class="nav-item">
                  <a href="" class="nav-link">
                    <i class="mdi mdi-grid menu-icon"></i>
                    <span class="menu-title">창고 관리</span>
                    <i class="menu-arrow"></i>
                  </a>
                  <div class="submenu">
                   	<ul>
                          <li class="nav-item"><a class="nav-link" href="">창고 관리</a></li>
                          <li class="nav-item"><a class="nav-link" href="">창고 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">창고 수정</a></li>
                          <li class="nav-item"><a class="nav-link" href="">창고 삭제</a></li>
                          
                    </ul>
                  </div>
              </li>
            </ul>
        </div>
      </nav>
    </div>