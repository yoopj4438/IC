<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="/WEB-INF/views/userincludes/header.jsp"%>
<style>
	.main-panel>.content {
		padding:78px 30px 30px 30px;
		min-height:calc(100vh-70px);
		height:100px;
	}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=47c77bec82edfee45bb2b7d5d9de36ff"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card card-plain">
              <div class="card-header">
                Google Maps
              </div>
              <div class="card-body">
                <div id="map" class="map">
                
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
<script>
   navigator.geolocation.getCurrentPosition(function(pos) {
   function getList(latitude,longitude,length){
	   console.log("getList");
	   $.ajax({
			type : 'GET',
			url : '/getList',
			data:"latitude="+latitude+"&longitude="+longitude+"&length="+length,
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				 $.each(data, function(idx, entry) { 
					
					var markerPosition = new kakao.maps.LatLng(entry.latitude*1, entry.longitude*1);
					var marker = new kakao.maps.Marker({
	        			position: markerPosition
				   });
					marker.setMap(map);
        		});
			}
		});
   }
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	    getList(latitude,longitude,0.3);
	   
	
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
		
		

   	function searchAddress(name, address){
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
	        		//인포윈도우(마우스 오버, 아웃)을 표시
	        		var iwContentOver = '<div style="padding:30px;">'
	        				+ '<div style="font-size:large; font-weight:bold">'+  name+'</div>'
	        				+ '<div>'+  address+'</div>'; 
	        				+ '</div>'
					
	        		
	        		// 인포윈도우(마우스 오버, 아웃)를 생성합니다 
	        		var infoWindowOver = new kakao.maps.InfoWindow({
	        		    content : iwContentOver
	        		});
	        				

	        		// 마커에 마우스오버 이벤트를 등록합니다
	        		kakao.maps.event.addListener(marker, 'mouseover', function() {
	        		  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
	       			    infoWindowOver.open(map, marker)
	        		});

	        		// 마커에 마우스아웃 이벤트를 등록합니다
	        		kakao.maps.event.addListener(marker, 'mouseout', function() {
	        		    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
	        		    infoWindowOver.close()
	        		   
	        		});
	        		
	        		//인포윈도우(마우스 클릭)을 표시
	        		var iwContentClick = '<div>Hello world</div>',
	        			iwRemoveable = true;
	        		
	        		// 인포윈도우(클릭)를 생성합니다
	        		var infoWindowClick = new kakao.maps.InfoWindow({
	        			content : iwContentClick,
	        			removable : iwRemoveable
	        		});
	        		
	        		// 마커에 클릭이벤트를 등록합니다
	        		kakao.maps.event.addListener(marker, 'click', function() {
	        		      // 마커 위에 인포윈도우를 표시합니다
	        		      infoWindowClick.open(map, marker)
	       				  infoWindowOver.close();
	        		      
	        		});
	        		
				}
			}, 	
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		}).done(function(data){console.log(data);});
	}

   	
	});

</script>
<%@ include file="/WEB-INF/views/userincludes/footer.jsp"%>