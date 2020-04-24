<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="/resources/img/apple-icon.png">
<link rel="icon" type="image/png" href="/resources/img/favicon.png">
<title>IC 회원가입</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800"
	rel="stylesheet" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<!-- Nucleo Icons -->
<link href="/resources/css/nucleo-icons.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="/resources/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/resources/demo/demo.css" rel="stylesheet" />
</head>

<body class="">
	<div class="wrapper">
		<div class="sidebar">
			<!--        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red"    -->
			<div class="sidebar-wrapper">
				<div class="logo"></div>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<div class="navbar-toggle d-inline">
							<button type="button" class="navbar-toggler">
								<span class="navbar-toggler-bar bar1"></span> <span
									class="navbar-toggler-bar bar2"></span> <span
									class="navbar-toggler-bar bar3"></span>
							</button>
						</div>
						<a class="navbar-brand" href="/Store/Regist">IC 회원가입</a>
					</div>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navigation" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span>
					</button>

				</div>
			</nav>
			<!-- End Navbar -->
			<div class="content">
				<div class="row">
					<div class="col-md-8">
						<div class="card">
							<div class="card-header">
								<h5 class="title">회원가입</h5>
							</div>
							<div class="card-body">
								<form action="/Store/RegistSubmit" method="post" name="frm"	id="frm">
									<div class="row">
										<div class="col-md-11 pr-md-1">
											<div class="form-group">
												<label>매장이름 </label> 
												<input type="text" class="form-control"												
													placeholder="Username" value="DS동성직업전문" id="sname"
													name="sname" onKeyUp="javascript:fnChkByte(this,'50')">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 pr-md-1">
											<div class="form-group">
												<label>매장 아이디</label> <input type="text"
													class="form-control" placeholder="Company" value="매장아이디"
													id="sid" name="sid" onKeyUp="javascript:fnChkByte(this,'30')">
											</div>
										</div>
										<div class="col-md-6 pl-md-1">
											<div class="form-group">
												<label>매장 비밀번호</label> <input type="password"
													class="form-control" placeholder="password"
													value="password" id="password" name="password" onKeyUp="javascript:fnChkByte(this,'30')">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>주소</label> <input type="text" class="form-control"
													placeholder="Address" value="부산광역시 부산진구 888 ****"
													id="address" name="address" onKeyUp="javascript:fnChkByte(this,'100')">
											</div>
										</div>
									</div>
							</div>
							<div class="row">
								<div class="col-md-8">
									<div class="form-group">
										<label>카테고리</label> <select id="cate" name="cate">
											<c:forEach items="${cateList}" var="cateList">
												<option value="${cateList.CODE}">${cateList.NAME}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							</form>
						</div>
						<button type="button" class="btn btn-fill btn-primary"
							onclick="save();">저장</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		function fnChkByte(obj, maxByte) {
			var str = obj.value;
			var str_len = str.length;
			var rbyte = 0;
			var rlen = 0;
			var one_char = "";
			var str2 = "";

			for (var i = 0; i < str_len; i++) {
				one_char = str.charAt(i);
				if (escape(one_char).length > 4) {
					rbyte += 2; //한글2Byte
				} else {
					rbyte++; //영문 등 나머지 1Byte
				}

				if (rbyte <= maxByte) {
					rlen = i + 1; //return할 문자열 갯수
				}
			}

			if (rbyte > maxByte) {
				// alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
				alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
				str2 = str.substr(0, rlen); //문자열 자르기
				obj.value = str2;
				fnChkByte(obj, maxByte);
			} 
		}
		
	
	</script>


	<script>
		function save() {
			if ($("#sname").val() == "") {
				alert("빈칸을 넣어주세요");
				$("#sname").focus();
				return;
			}
			;

			if ($("#sid").val() == "") {
				alert("빈칸을 넣어주세요");
				$("#sname").focus();
				return;
			}
			;

			if ($("#password").val() == "") {
				alert("빈칸을 넣어주세요");
				$("#sname").focus();
				return;
			}
			;

			if ($("#address").val() == "") {
				alert("빈칸을 넣어주세요");
				$("#sname").focus();
				return;
			};

			$("#frm").submit();
		}
	</script>
	<script>
		$(function() {
			var result = '<c:out value="${result}"/>';
			if (result != '') {
				if (result == 1) {
					alert("성공적으로 등록되었습니다. ");
				} else {
					alert("등록에 실패하였습니다. " + result);
				}
			}

			$sidebar = $('.sidebar');
			$navbar = $('.navbar');
			$main_panel = $('.main-panel');

			$full_page = $('.full-page');

			$sidebar_responsive = $('body > .navbar-collapse');
			sidebar_mini_active = true;
			white_color = false;

			window_width = $(window).width();

			fixed_plugin_open = $(
					'.sidebar .sidebar-wrapper .nav li.active a p').html();

			$('.fixed-plugin a').click(function(event) {
				if ($(this).hasClass('switch-trigger')) {
					if (event.stopPropagation) {
						event.stopPropagation();
					} else if (window.event) {
						window.event.cancelBubble = true;
					}
				}
			});

			$('.fixed-plugin .background-color span').click(function() {
				$(this).siblings().removeClass('active');
				$(this).addClass('active');

				var new_color = $(this).data('color');

				if ($sidebar.length != 0) {
					$sidebar.attr('data', new_color);
				}

				if ($main_panel.length != 0) {
					$main_panel.attr('data', new_color);
				}

				if ($full_page.length != 0) {
					$full_page.attr('filter-color', new_color);
				}

				if ($sidebar_responsive.length != 0) {
					$sidebar_responsive.attr('data', new_color);
				}
			});

			$('.switch-sidebar-mini input')
					.on(
							"switchChange.bootstrapSwitch",
							function() {
								var $btn = $(this);

								if (sidebar_mini_active == true) {
									$('body').removeClass('sidebar-mini');
									sidebar_mini_active = false;
									blackDashboard
											.showSidebarMessage('Sidebar mini deactivated...');
								} else {
									$('body').addClass('sidebar-mini');
									sidebar_mini_active = true;
									blackDashboard
											.showSidebarMessage('Sidebar mini activated...');
								}

								// we simulate the window Resize so the charts will get updated in realtime.
								var simulateWindowResize = setInterval(
										function() {
											window.dispatchEvent(new Event(
													'resize'));
										}, 180);

								// we stop the simulation of Window Resize after the animations are completed
								setTimeout(function() {
									clearInterval(simulateWindowResize);
								}, 1000);
							});

			$('.switch-change-color input').on("switchChange.bootstrapSwitch",
					function() {
						var $btn = $(this);

						if (white_color == true) {

							$('body').addClass('change-background');
							setTimeout(function() {
								$('body').removeClass('change-background');
								$('body').removeClass('white-content');
							}, 900);
							white_color = false;
						} else {

							$('body').addClass('change-background');
							setTimeout(function() {
								$('body').removeClass('change-background');
								$('body').addClass('white-content');
							}, 900);

							white_color = true;
						}

					});

			$('.light-badge').click(function() {
				$('body').addClass('white-content');
			});

			$('.dark-badge').click(function() {
				$('body').removeClass('white-content');
			});
		});
	</script>

	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "black-dashboard-free"
		});
	</script>
</body>

</html>