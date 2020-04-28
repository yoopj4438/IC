<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<style>
	#search{height:40.5px; margin-top:22px;}
</style>
<div></div>
<div class="content">
	<div class="row">
		<div class="col-md-8">
			<div class="card">
				<div class="card-header">
					<h5 class="title">회원가입</h5>
				</div>
				<div class="card-body">
					<form action="/store/registSubmit" method="post" name="frm"	id="frm">
						<div class="row">
							<div class="col-md-5 pr-md-1">
								<div class="form-group">
									<label>매장 번호 </label> 
									<input  type="text" 
											class="form-control"
											placeholder="Username"
											id="snum"
											name="snum" value="19911025"
											onKeyUp="javascript:fnChkByte(this,'50')">
								</div>
							</div>
								<button class="btn btn-fill btn-info" type="button"
										id="search" 
										name="search">
										조회
								</button>
						</div>
					 	<div class="row">
							<div class="col-md-5 pr-md-1">
								<div class="form-group">
									<label>매장 비밀번호</label>
									<input type="password"
										class="form-control"
										placeholder="password" 
										id="password"
										name="password"
										onKeyUp="javascript:fnChkByte(this,'30')">
								</div>
							</div>
						</div>
							<div class="row">
								<div class="col-md-5 pr-md-1">
									<div class="form-group">
										<label>매장이름</label> 
										<input type="text" class="form-control"
											placeholder="Company"
											id="sname"
											name="sname"
											readonly="readonly">
									</div>
								</div>
							</div>
						<div class="row">
							<div class="col-md-5 pr-md-1">
								<div class="form-group">
									<label>주소</label>
									 <input type="text"
									 	    class="form-control"
									 	    placeholder="Address"
									 	    id="address" 
									 	    name="address"
									 	    readonly="readonly">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-5 pr-md-1">
								<div class="form-group">
									<label>전화번호</label>
									 <input type="text"
									 	    class="form-control"
									 	    placeholder="phone"
									 	    id="phone" 
									 	    name="phone">
								</div>
							</div>
						</div>
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<label>카테고리</label> 
							<select id="cate" name="cate">
								<c:forEach items="${cateList}" var="cateList">
									<option value="${cateList.CODE}">${cateList.NAME}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<input type="hidden" id="longitude" name="longitude" />
				<input type="hidden" id="latitude" name="latitude" />
				
				</form>
				</div>
			</div>
			<button type="button" class="btn btn-fill btn-info" onclick="save();">저장</button>
			<button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>
		</div>
	</div>
</div>



<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
					rbyte += 3; //한글2Byte
				} else {
					rbyte++; //영문 등 나머지 1Byte
				}

				if (rbyte <= maxByte) {
					rlen = i + 1; //return할 문자열 갯수
				}
			}
			var length = (Math.floor(maxByte/3));
			if (rbyte > maxByte) {
				// alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
				alert("한글" + length + " 자 / 영문 " +maxByte+ "자를 초과 입력할 수 없습니다.");
				str2 = str.substr(0, rlen); //문자열 자르기
				obj.value = str2;
				fnChkByte(obj, maxByte);
			} 
		}
		function save() {
			/* if ($("#sname").val() == "") {
				alert("빈칸을 넣어주세요");
				$("#sname").focus();
				return;
			}
			 */

			if ($("#snum").val() == "") {
				alert("빈칸을 넣어주세요");
				$("#sname").focus();
				return;
			}
			

			if ($("#password").val() == "") {
				alert("빈칸을 넣어주세요");
				$("#sname").focus();
				return;
			}
			

		/* 	if ($("#address").val() == "") {
				alert("빈칸을 넣어주세요");
				$("#sname").focus();
				return;
			} */
			$("#frm").submit();
		}
	
		$(function() {
			var result = '<c:out value="${result}"/>';
			if (result != '') {
				if (result == 1) {
					alert("성공적으로 등록되었습니다. ");
				} else {
					alert("등록에 실패하였습니다. " + result);
				}
				
			}
			 $("#search").on("click",function(e){
				e.preventDefault();
				var storeNum = $("#snum").val();
				 
				$.ajax({
					url: 'http://data.sbiz.or.kr/api/open/sdsc/storeOne',
					data : "ServiceKey=Ft+j2ZR5d37+DfQMya7x0O9uu92JRY3ZhbCUeL02TgwsefhuQ9bts0Ef8waZd2xIgEY2OjjvQoAZM+8EzN9GPQ==&key="+storeNum ,
					type : 'GET',
					dataType : 'XML',
					success:  function(xml){
						$(xml).find('item').each(function(){  
				        var sname = $(this).find("bizesNm").text();
				        var address = $(this).find("rdnmAdr").text(); 
				        var longitude = $(this).find("lon").text(); 
				        var latitude = $(this).find("lat").text(); 
				        
				        $("#sname").val(sname);
				        $("#address").val(address);
				        $("#latitude").val(latitude);
				        $("#longitude").val(longitude);
				 
				    });
					},				
				    error: function (request, textStatus, errorThrown) {
				        alert('Error');
				        console.log(request.status);
				        console.log(request.statusText);
				        console.log(request.readyState);
				        console.log(textStatus);
				        console.log(errorThrown);
				    }
				});
			
				console.log("click");
				if($("#snum").val()==""){
					alert("빈칸을 넣어주세요");
					$("#snum").focus();
					return;
				}  
			 });  
		});
		
		function callback(data) {
			alert(data);
		}

	</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>