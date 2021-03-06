<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="/resource/img/apple-icon.png">
    <link rel="icon" type="image/png" href="/resources/img/favicon.png">
    <title>Black Dashboard by Creative Tim</title>
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <!-- Nucleo Icons -->
    <link href="/resources/css/nucleo-icons.css" rel="stylesheet" />
    <!-- CSS Files -->
    <link href="/resources/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="/resources/demo/demo.css" rel="stylesheet" />
    <style>
        .btnlogin {
            background-color: rgba(0, 0, 0, 0);
            border-radius: 5px;
            border: 1px solid #8f9194;
        }
    </style>
</head>

<body class="white-content">
    <div class="wrapper">
        <div class="main-panel" data="blue">
            <nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <div class="navbar-toggle d-inline">
                            <button type="button" class="navbar-toggler">
                                <span class="navbar-toggler-bar bar1"></span> <span
                                    class="navbar-toggler-bar bar2"></span> <span
                                    class="navbar-toggler-bar bar3"></span>
                            </button>
                        </div>
                        <a class="navbar-brand" href="javascript:void(0)">Maps</a>
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navigation">
                        <ul class="navbar-nav ml-auto">
                            <li class="search-bar input-group">
                                <button class="btn btn-link" id="search-button" data-toggle="modal"
                                    data-target="#searchModal">
                                    <i class="tim-icons icon-zoom-split"></i>
                                    <span class="d-lg-none d-md-block">Search</span>
                                </button>
                            </li>
                            <li class="dropdown nav-item">
                                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                                    <div class="photo">
                                        <img src="/resources/img/anime3.png" alt="Profile Photo" />
                                    </div>
                                    <b class="caret d-none d-lg-block d-xl-block"></b>

                                </a>
                                <ul class="dropdown-menu dropdown-navbar">
                                    <form action="/login" method="post" id="frm">
                                        <li>
                                            <label>매장 아이디</label> <input type="text" class="form-control"
                                                placeholder="Company" id="snum" name="snum"
                                                onKeyUp="javascript:fnChkByte(this,'30')" />
                                        </li>
                                        <li><label>매장 비밀번호</label> <input type="password" class="form-control"
                                                placeholder="password" id="password" name="password"
                                                onKeyUp="javascript:fnChkByte(this,'30')" />
                                        </li>
                                        <input type="hidden" id="<c:out value="${id}"/>">
                                        <div style="height: 50px; text-align: center; padding-top: 10px;">
                                            <button class="btnlogin" type="button" onclick="login();">로그인</button>
                                            <button class="btnlogin" type="button"
                                                onclick="location.href='/store/regist' ">회원가입</button>
                                        </div>
                                    </form>
                                </ul>
                            </li>
                            <li class="separator d-lg-none"></li>
                        </ul>
                    </div>
                </div>

            </nav>
            <div class="modal modal-search fade" id="searchModal" tabindex="-1" role="dialog"
                aria-labelledby="searchModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="SEARCH">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <i class="tim-icons icon-simple-remove"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function login() {
                    if ($("#snum").val() == "") {
                        alert("아이디를 입력하세요.");
                        $("#snum").focus();
                        return;
                    }
                    if ($("#password").val() == "") {
                        alert("비밀번호를 입력하세요.");
                        $("#password").focus();
                        return;
                    }
                    
                    $("#frm").submit();
                }
            </script>