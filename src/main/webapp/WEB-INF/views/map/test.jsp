<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function searchAddress(){
	var q = "부산 동래구 안남로 36"; //검색 내용
    //ajax 시작
	$.ajax({
		url : 'https://dapi.kakao.com/v2/local/search/address.json',
		headers : { 'Authorization' : 'KakaoAK c7d25f7aa1a6a6dfeb6d6083c026821e'	},
		type: 'GET',
		data : { 'query' : q },
		success : function(data){
			//호출 성공하면 작성할 내용
            if(data.documents.length != 0 ){ // 값이 있으면
				alert("!!!!!!!");
				alert(data.documents[0].x + "/////////////////" + data.documents[0].y);
			}
		}, 
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	}).done(function(data){console.log(data);});	
}
</script>
<title>Insert title here</title>
</head>
<body>
	<button onclick="searchAddress()">test</button>
</body>
</html>