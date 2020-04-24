<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="/WEB-INF/views/userincludes/header.jsp"%>
<style>
	.main-panel>.content {
  padding: 78px 30px 30px 30px;
  min-height: calc(100vh - 70px);
  height: 100px;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=47c77bec82edfee45bb2b7d5d9de36ff"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

	<div class="content">
		Google Maps
		<div id="map" class="map"></div>
	</div>

<script>
   $(function(){
   });
   
   navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	   
	
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(latitude, longitude),
			level: 4
		};

		var map = new kakao.maps.Map(container, options);
		
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		var imageSrc = '/resources/img/me.png';   
	    var imageSize = new kakao.maps.Size(24, 36); 
	    var imageOption = {offset: new kakao.maps.Point(10, 10)};		
		var markerPosition = new kakao.maps.LatLng(latitude,longitude);
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		var marker = new kakao.maps.Marker({
			position: markerPosition,
			image : markerImage
		});
		marker.setMap(map);
		
		<c:forEach items="${list}" var="list">
   			searchAddress("${list.address}");
  		</c:forEach>
   function searchAddress(address){
	    //ajax 시작
		$.ajax({
			url : 'https://dapi.kakao.com/v2/local/search/address.json',
			headers : { 'Authorization' : 'KakaoAK c7d25f7aa1a6a6dfeb6d6083c026821e'	},
			type: 'GET',
			data : { 'query' :address },
			success : function(data){
				//호출 성공하면 작성할 내용
	            if(data.documents.length != 0 ){ // 값이 있으면
	        		var markerPosition = new kakao.maps.LatLng(data.documents[0].y, data.documents[0].x);
	        		var marker = new kakao.maps.Marker({
	        			position: markerPosition,
	        		});
	        		marker.setMap(map);
				}
			}, 
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});	
	}
	});

  


	</script>
<%@ include file="/WEB-INF/views/userincludes/footer.jsp"%>