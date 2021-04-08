<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<jsp:useBean id="productDTO" class="com.koreait.product.productDTO"/>
<jsp:useBean id="productDAO" class="com.koreait.product.productDAO"/>
<jsp:useBean id="memberDAO" class="com.koreait.member.memberDAO"/>
<jsp:useBean id="memberDTO" class="com.koreait.member.memberDTO"/>
<jsp:useBean id="recentproductDAO" class="com.koreait.recentProduct.recentProductDAO"/>
<jsp:useBean id="recentproductDTO" class="com.koreait.recentProduct.recentProductDTO"/>
<html lang="en">
<%
	request.setCharacterEncoding("UTF-8");
	
	String username= null;
	String m_idx = null;
	if(session.getAttribute("username") != null){
		username= (String)session.getAttribute("username");
		m_idx = String.valueOf(session.getAttribute("idx"));
	}

	if(request.getParameter("searchText") == null || request.getParameter("searchText").equals("")){
%>
	<script>
		alert('잘못된 접근입니다.');
		location.href="./main.jsp";
	</script>
<%			
	}
	// 검색어 입력한 문자열
	String searchText = request.getParameter("searchText");
	String cLocation = request.getParameter("cLocation");

%>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색결과</title>
    <link rel="stylesheet" href="./css/title.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script src="./js/script.js"></script>
	<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac74ac399318a09b850aa4a15d457f1e&libraries=services"></script>
	
<style>
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
div {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
* {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>

</head>

<body>
	<script>
        function getLocation() {
            if (navigator.geolocation) { // GPS를 지원하면
                navigator.geolocation.getCurrentPosition(function (position) {
                	
                	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            		
            		mapOption = {
            			center : new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude), // 지도의 중심좌표
            			level : 1
            		// 지도의 확대 레벨
            		};

            		// 지도를 생성합니다    
            		var map = new kakao.maps.Map(mapContainer, mapOption);

            		// 주소-좌표 변환 객체를 생성합니다
            		var geocoder = new kakao.maps.services.Geocoder();

            		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
            		infowindow = new kakao.maps.InfoWindow({
            			zindex : 1
            		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

            		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
            		searchAddrFromCoords(map.getCenter(), displayCenterInfo);



            		function searchAddrFromCoords(coords, callback) {
            			// 좌표로 행정동 주소 정보를 요청합니다
            			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
            					callback);
            		}

            		function searchDetailAddrFromCoords(coords, callback) {
            			// 좌표로 법정동 상세 주소 정보를 요청합니다
            			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
            		}

            		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
            		function displayCenterInfo(result, status) {
            			if (status === kakao.maps.services.Status.OK) {
            				var infoDiv = document.getElementById('centerAddr');
							
            				for (var i = 0; i < result.length; i++) {
            					// 행정동의 region_type 값은 'H' 이므로
            					if (result[i].region_type === 'H') {
            						infoDiv.innerHTML = result[i].address_name;
            						// 주소 출력부분
            						const locationText = document.getElementsByClassName('container_sch02');
            						//locationText[0].setAttribute('value',result[i].address_name);
            						locationText[0].innerText = result[i].address_name;
            						//console.log(result[i].address_name);
            						
            						const cLocation = document.getElementById('cLocation');
            						cLocation.value = result[i].address_name;
            						break;
            					}
            				}
            			}
            		}
                }, function (error) {
                    console.error(error);
                }, {
                    enableHighAccuracy: false,
                    maximumAge: 0,
                    timeout: Infinity
                });
            } else {
                alert('GPS를 지원하지 않습니다');
            }
            
        }
	</script>
	<!-- 안보이는 지도 -->
	<div class="map_wrap" style="display: none">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
		<div class="hAddr">
			<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
		</div>
	</div>
	<script> getLocation(); </script>

	<div class="mainHeader">
			<div class="topHeader">
				<div class="headerBox">
					<div class="headerMenu">
						<a class="appDown" href="/splash"> <img
							src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxOSIgdmlld0JveD0iMCAwIDE2IDE5Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggc3Ryb2tlPSIjMjEyMTIxIiBkPSJNLTE2LjUtMTQuNWg0OXY0OWgtNDl6Ii8+CiAgICAgICAgPHBhdGggZmlsbD0iI0Y3MDAwMCIgZD0iTTExLjM3IDguOTI3TDYuNTIgMTQuMzhhLjI2OC4yNjggMCAwIDEtLjMzNC4wNTRjLS4xMS0uMDY0LS4xNjEtLjE3Mi0uMTIyLS4yOTVsMS4wOTktMy40MzVoLTEuOTJjLS4wODQgMC0uMTY0LS4wNjUtLjIxNS0uMTMzYS4zMDMuMzAzIDAgMCAxLS4wNDUtLjI1bDEuNDgyLTUuNDYzYS4yOC4yOCAwIDAgMSAuMjYtLjIxaDMuNTAxYy4wOSAwIC4xNzUuMDUuMjI1LjEyNi4wNS4wNzYuMDU5LjIwMi4wMjMuMjg2TDkuMDE5IDguNTI2aDIuMTVjLjEwNiAwIC4yMDMuMDM2LjI0Ni4xMzUuMDQzLjA5OC4wMjUuMTg2LS4wNDYuMjY2bTQuMDY3LTQuNzZMOC41MTIuMTNjLS4yOTUtLjE3Mi0uNzg0LS4xNzItMS4wNzkgMEwuNTMgNC4xNjdjLS4yOTUuMTcyLS41My41OTUtLjUzLjk0djguMDc2YzAgLjM0NS4yMzEuNzY4LjUyNi45NGw2LjkwNSA0LjAzOGMuMjk1LjE3Mi43NzUuMTcyIDEuMDcgMGw2LjkzNi00LjAzOGMuMjk1LS4xNzIuNTYzLS41OTUuNTYzLS45NFY1LjEwN2MwLS4zNDUtLjI3LS43NjgtLjU2NC0uOTQiLz4KICAgIDwvZz4KPC9zdmc+Cg=="
							width="16" height="19" alt="앱다운로드버튼 이미지">앱다운로드
						</a>
						<button class="bookmark">
							<img
								src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNSIgdmlld0JveD0iMCAwIDE2IDE1Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggc3Ryb2tlPSIjQ0NDIiBkPSJNLTE2LjUtMTYuNWg0OXY0OWgtNDl6Ii8+CiAgICAgICAgPHBhdGggZmlsbD0iI0U5QjQ1NyIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNOCAwbDIuNSA0LjkzNCA1LjUuNzktNCAzLjg0OC45IDUuNDI4TDggMTIuNDM0IDMuMSAxNSA0IDkuNTcyIDAgNS43MjRsNS41LS43OXoiLz4KICAgIDwvZz4KPC9zdmc+Cg=="
								width="16" height="15" alt="즐겨찾기버튼 이미지">즐겨찾기
						</button>
					</div>
					<div class="headerMenu">
					<%
						if (username == null) {
					%>
						<button class="loginOut">로그인</button>
						<div class="storeBox">
							<div class="storeBox2">
								<a class="storeNoBtn" href="#">내 상점</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="zeusTop">
				<div class="zeusBox1">
					<div class="zeusBox2">
						<a class="zeusLogo" href="./main.jsp"><img
							src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTI4IiBoZWlnaHQ9IjM1IiB2aWV3Qm94PSIwIDAgMTI4IDM1Ij4KICAgIDxkZWZzPgogICAgICAgIDxwYXRoIGlkPSJhIiBkPSJNMCAzNC4wMzZoMTQyVi4wOTJIMHoiLz4KICAgIDwvZGVmcz4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggc3Ryb2tlPSIjQ0NDIiBkPSJNLTEwLjUtNy41aDE0OXY0OWgtMTQ5eiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03KSI+CiAgICAgICAgICAgIDxwYXRoIGZpbGw9IiNGNzAwMDAiIGQ9Ik0yOS4wMjUgMTYuNzAxTDE5Ljk0IDI2Ljc5N2EuNTA1LjUwNSAwIDAgMS0uNjI3LjEuNDgzLjQ4MyAwIDAgMS0uMjMtLjU3NWwyLjA2MS02LjM5MWgtMy41OThhLjUyNi41MjYgMCAwIDEtLjQwMi0uMjE1LjUyNy41MjcgMCAwIDEtLjA4NS0uNDVsMi43NzYtMTAuMDYzYy4wNjItLjIxOC4yNi0uMzM4LjQ4OC0uMzM4aDYuNTYxYy4xNyAwIC4zMjkuMDQ5LjQyMi4xOS4wOTQuMTQyLjEwOS4zOC4wNDIuNTM1bC0yLjcyNiA2LjQyMmg0LjAzYy4xOTggMCAuMzguMDQuNDYuMjIzLjA4MS4xOC4wNDcuMzE3LS4wODYuNDY2bTcuMzI2LTguODEyTDIzLjUyNC40MTRjLS41NTItLjMyLTEuMzk2LS4zMi0xLjk0OCAwTDguNTA0IDcuODg5Yy0uNTUzLjMyLTEuMTI4IDEuMTAxLTEuMTI4IDEuNzRWMjQuNThjMCAuNjM4LjYwNSAxLjQyMSAxLjE1NyAxLjc0bDEzLjAyNiA3LjQ3NWMuNTUzLjMyIDEuNDk2LjMyIDIuMDQ4IDBsMTIuNzI1LTcuNDc1Yy41NTItLjMxOS43OC0xLjEwMi43OC0xLjc0VjkuNjI4YzAtLjYzOC0uMjA4LTEuNDItLjc2LTEuNzM5TTEwMy40NTMgMjYuOTQ5Yy0xLjc3NyAwLTMuMjIyLTEuMjAzLTMuMjIyLTIuNjggMC0xLjQ2MyAxLjQ0NS0yLjY1NSAzLjIyMi0yLjY1NSAxLjgzOCAwIDMuMjc2IDEuMTY4IDMuMjc2IDIuNjU1IDAgMS41MDMtMS40MzggMi42OC0zLjI3NiAyLjY4bTAtOC4xMzVjLTMuNjEgMC02LjY2MiAyLjQ5OC02LjY2MiA1LjQ1NSAwIDMuMDIyIDIuOTkgNS40OCA2LjY2MiA1LjQ4IDMuNzE4IDAgNi43NDItMi40NTggNi43NDItNS40OCAwLTMuMDA4LTMuMDI0LTUuNDU1LTYuNzQyLTUuNDU1Ii8+CiAgICAgICAgICAgIDxtYXNrIGlkPSJiIiBmaWxsPSIjZmZmIj4KICAgICAgICAgICAgICAgIDx1c2UgeGxpbms6aHJlZj0iI2EiLz4KICAgICAgICAgICAgPC9tYXNrPgogICAgICAgICAgICA8cGF0aCBmaWxsPSIjRjcwMDAwIiBkPSJNNDkuNTYxIDE2LjAxMmg1LjA3MnYtMy4yMjhINDkuNTZ2My4yMjh6bTguMy0yLjA3NWg0LjE1djguMjk5aDMuMjI2VjQuOTQ2SDYyLjAxdjYuMjI0aC00LjE1VjYuMWgtMy4yMjd2My45Mkg0OS41NnYtMy45MmgtMy4yMjd2MTIuNjc4SDU3Ljg2di00Ljg0ek02OC4wMDQgOS43ODhoNi40NTR2Mi4wMDJjMCAuOTQtLjExNCAxLjc2Ni0uMjYzIDIuNDU2LS4xNS42ODctLjQ4NCAxLjM1OC0uOTU4IDEuOTk0LS40NzUuNjM4LTEuMTg5IDEuMzE1LTIuMTA0IDIuMDEzLS45MTcuNy0yLjE2MyAxLjU0OS0zLjY5NiAyLjUyNGwtLjAyOS4wMTcgMS45NDggMi40ODQuMDIyLS4wMTZjMS43NjctMS4xNjQgMy4yMTEtMi4xODUgNC4yOTItMy4wMzQgMS4wODYtLjg1MSAxLjkzNy0xLjY4NiAyLjUzLTIuNDguNTkzLS43OTUuOTg2LTEuNjI3IDEuMTktMi40NzQuMjAzLS44NDUuMjk1LTEuODQ3LjI5NS0yLjk3NlY2Ljc5aC05LjY4MXYyLjk5OHpNOTguMzcyIDE0LjI4OGMuMDcuMTQzLjI2LjM0NC41NzguNjE0LjMzNy4yODYuNzk0LjYzMiAxLjM1NiAxLjAyOGE3OS4zOTIgNzkuMzkyIDAgMCAwIDMuMjcyIDIuMjA3bC4wMi4wMTUgMS44MTctMi4zNTgtLjAyNy0uMDE2YTU3Ljg5IDU3Ljg5IDAgMCAxLTMuNzctMi41NDQgNS44MTYgNS44MTYgMCAwIDEtLjg2LS43NDggNC4wMjMgNC4wMjMgMCAwIDEtLjUzLS43MWMtLjEzLS4yMy0uMjYtLjQ4LS4zMDMtLjc0My0uMDQ1LS4yNjUtLjExLS41NTYtLjExLS44NjRWOC44NjVoNC42MTFWNi4wOTlIOTEuNzQ4djIuNzY2aDQuODR2MS4zMDRjMCAuNjMxLS4xNzUgMS4xOTgtLjQyOCAxLjY4NS0uMjU1LjQ5LS42MzcuOTM2LTEuMDkzIDEuMzNhNDUuMjAyIDQ1LjIwMiAwIDAgMS00LjM5OCAzLjI2OWwtLjAzLjAxNyAyLjAwMSAyLjQzNS4wMjEtLjAxNWMuNjctLjQ0NyAxLjMwOS0uODk3IDEuOTAyLTEuMzM4LjU5NS0uNDQzIDEuMTgtLjg5MyAxLjczOS0xLjMzN2ExNi45OSAxNi45OSAwIDAgMCAxLjQ2NS0xLjIxYy4zMzYtLjMyLjUzNS0uNTU2LjYwNS0uNzE3TTEyOC40OTEgMTkuNjEyYy0xLjI1LjE2OC0yLjYxNy4zNDItNC4wNjIuNC0xLjQ0LjA2LTIuODE3LjE1LTQuMDkuMTVoLTEuODUxdi0zLjkyaDcuMzc3di0yLjc2NmgtNy4zNzdWOS41NTdoOC4yOThWNi43OWgtMTEuNzU1djE2LjEzN2g0LjUxYy44MzkgMCAxLjY3MS0uMDYgMi40Ny0uMDY4LjgzNy0uMDA4IDEuNjY0LS4wNTYgMi40Ni0uMDlhNjMuMzUgNjMuMzUgMCAwIDAgMi4zMjYtLjE1NGMuNzQtLjA2IDEuNDI5LS4xNDggMi4wNDgtLjI1bC4wMjktLjAwNi0uMzU0LTIuNzUtLjAyOS4wMDN6TTUzLjcxIDIwLjYyMmgtMy42ODhWMjkuMTUyaDE1LjQ0NXYtMi43NjdINTMuNzExek04NS4yOTMgNS4wODZ2Ny4yMzdoLTIuMDc0VjQuOTQ3SDc5Ljc2djIzLjEzOGwzLjQ1OS0uODJWMTUuMzE5aDIuMDc0djEyLjc2NmwzLjQ1Ny0uODJWNC45NDdoLTMuNDU3eiIgbWFzaz0idXJsKCNiKSIvPgogICAgICAgICAgICA8cGF0aCBmaWxsPSIjRjcwMDAwIiBkPSJNMTMwLjkzNiA0Ljk0N3Y4LjUyOWgtNC4xNVYxNi40NzRoNC4xNXYxMS42MTJsMy42ODktLjg3OVY0Ljk0N3pNMTEwLjQyIDQuOTQ3aC0zLjY4OXYxMy44MzFoMy42ODh2LTUuMzAxaDMuMjI3di0yLjc2OGgtMy4yMjd6IiBtYXNrPSJ1cmwoI2IpIi8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
							width="136" height="40" alt="번개장터 로고"></a>
						<div class="zeusSerach1">
							<form name="searchForm" id="searchForm" method="post" action="search.jsp">
								<div class="zeusSerach2">
									<!-- input text에 입력한 value값을 form 태그로 넘겨야함 -->
									<input type="text" placeholder="상품명, 지역명 입력" class="zeusTxt" value="" name="searchText">
									<a class="zeusSearchBtn"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAeZJREFUOBGVVD1PAkEQ3VlOjY0xIdGOI0BMxMSGytJE+RsWWomx8mfYWNBpZWltg1b2NCZaGBppFAzR1njsOO9gzHEfIJdws/vmvcft7OySiT2DQqUakDtipjoZ4xsyzGy6RNzy2F7mu53nmGRiKprRw7XaQm/wdU6OG2xMTvFoFPKQLTXX86tn1G7/RHM6thjArP/xeWscn8rUWqJLee/klhdW8MM4xCQHDrjQqEkivhfLF++FEvf80luvsLGXIIwB5MABF5o0HoU1M+5RkvK1Xn29+3KfRlQMpmyCOyzfM3Y7XlMbboDUjIiuZpnBFBwsH3WGVv9Io8VuYuLEUMFZUbmqjfJt2BqC5JZyT9HEtLFyVRvlhrscBeYaS4/G+VaQV4DD7+FWPJk1Vy4aPs6R+nILoBTzMJ7MmitXtVGexXFCC8j5OpzWgyoCxzEfQQOt4hot+gjHSZZOhoLraabIEQU3EEMT70HgHl44m3KcNqUm+2SCVt8vX6E1dDdRMyzTcSCXBhRSImc6o9HkW7589Pz3cpAD8CBL3oXKkj1Ze+00xxZh+DNUMHF9SQKdEL2+en7lmNmFRmmm6jVXhGl4SchF0fcrjbnEWeQ008SSs8RZuC5fjIbWW6xm8ebCYdovlg8g+gXwsu0wmCVGbgAAAABJRU5ErkJggg=="
									width="16" height="16" alt="검색 버튼 아이콘"></a>
								</div>
							</form>
							
						</div>
						<div class="rightMenu">
							<a class="myShopBtn1" href="#"><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAwCAYAAABuZUjcAAAAAXNSR0IArs4c6QAABCNJREFUaAXtWUtS20AQtWxXJSEbZ8XWuYH4rcEnwNzALg6Q5AQJy6yAE1icIOYEmDWf6AbRispSqwSqAOU91QwetUbWSAFjqpgq10z39OdNT89P9hqPVNbW1vowtY2fr36m5RAEf8cXFxdjs6Nu26urqPVWV1cHnud9Bd3VvJI6SpJk7/LyMiiRm9ldG/jGxoZ/f38/gnVGuE4Jm83m8OzsjDNRudQCrkCfwFunssesQgzwvTrgKwMvAR0jbQKkwinqmBjR7qC9iXoA0jbQWuArAfd9v9NqtX5ZAMQAxrw9QF9hwXr4jEFwPcgBxHd3dx/DMEwHW2jA6Gga7dImQO9DSDplrvbKQNM4ZSiLZkjaKAwIbTsX54gj2l0VbdN45UhRuWjmVNQj00FR2zniAM0pzhRM+06V6dXK1KGupnVt86H7ZO0MHIp9oRycn59PBM+ZVLqBUJA+RPeUdAK+vr6+BRWZ28dTM7Vb0kZH+So16AQcB40vLT3G0W2zYfMlfZN2Ao6dQEZ7YjNWk5exZfFlNdu2cisw/4ze7DeSise+1wiXhjdfKrjJif43cAV6K2d5FiOZ1enW55QqyLtYmJvmfNKQC0yIWsisztQWRC2+LAbcczwU2h3eWcjzmt4YVSz6Z5Gx0mkoGx1TGDkemnRR2ynitv0akflEo++G1xHSZa/IQY4P2VQHHdqGKWPzZfbrthNwJRxoJVUPdNSXdm8OksQrBU8ZylJf6Q6ULV0FulFWOwPHEX0kjSFiI947yH+/e/0NMj1EfyzlyGMfZdhHHepKOZsPKaNp50sWFfCu/IGqr5VVHeJy1JN3lr+jt93rxnX8YZjNf3XBOoGuL+yMcSDtCF4hWQk4nPKG+BPW0igbVmO0h7aT0JDhwDloRjqnj8GvYPCRKT+rXQk4DfEugUcDI2YrfAgfcme4vb2NKNBut7tICx9pwMXcJU8WppHrotS6lYFTUb3sczmqjVapMdBhnRd/LeAExl0BkWTOd0nXKBFmZqfOQ5m+WjUcpipXV1e/l5eXj5DzN2D4+L11tMVHxHfkNCMdOerkxGpH3LTEnQLR44ehTfC38MstPvAmSItTzFIgdyD0LU7hInZ9FCwO6lckxRGYmePMXezDXHhzLzgHsBSKPxBZgat9mgfGs4A2ohTyQLPt8xngam/mwfLcgA3saZNfyzJfdh+AK9A8yuVWJo08Fx0D/MOX3RR4CegYSMM5o+WM2wL4AD59LKu7sRTkhYlfYIM5g07dFfzToe/xK17Bhcl6x573AIru7ryYNXFMbwtA/AKbexgImbmQ3A6JBc5i0yEx8+nWF8zDWfunKTuPNrEA6KHw1be9OSdCaBHIHCYb8EUAmsGgX1Mm80UAR7pEJmi2XwRwCfoVuC0iT817TZWnjrC0/2Ij/g8RGqgJ9UrG3gAAAABJRU5ErkJggg=="
								width="23" height="24" alt="내상점버튼 이미지">내상점</a><a
								class="sellBtn1" href="#"><img
								src="data:image/png;base64,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"
								width="23" height="26" alt="판매하기버튼 이미지">판매하기</a>
						</div>
					</div>
					<div class="underMenu">
						<div class="categoryMenu">
							<div class="category_img_div" id="category_img_div">
							<img id="category_img"
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAgCAYAAABgrToAAAAAAXNSR0IArs4c6QAAAExJREFUWAnt1sEJACAMA0DrJt1/SAVXyKfI9V8Il0+qu88afHtwthdNwOkNyUeAAAECvwuUNRNWbM2EgN4JECBAgEAoYM2EgMuaSQUv1d0EPE4sEMMAAAAASUVORK5CYII="
								width="20" height="16" alt="메뉴 버튼 아이콘">
							</div>
							<div class="main_category">
								<!-- 대분류 -->
								<div class="category" id="big_category">
									<div class="big_category_top">
										전체 카테고리 <img
											src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAASCAYAAABvqT8MAAAAAXNSR0IArs4c6QAAAX9JREFUKBWdkz1LA0EQhmf2Ei6msBEb/4JgPi4fhYUpRIn4gYpY2ajYKbZa5S9YKzZWIgoqCIpFLKxyMQb0Z0hEQnIbcjfuLtyykmDEhbt7571ndvZm9wDE4MnMIU9mD6QeOLyUs9dOOCQvoXcHJTAIcEJDARy1U5lNHfcRzF6e3wHAc/mOhMCAjnk6u96HVRYqsFCI8EbzioAWZIyIXWC4Enup3CrKuDEFlMtde2x0TYCPMiaiCPjBhZfKThuskqpCaJLjxD0fH0TGpPQQoWUBzkRf3eeQURXCAKvVVsy25gRYlR4RxH2Au04672gmFOaTcrkR3gmexNLGlY/4wQin7Hrl/UcFM6lHR0ktvyeB8vlh3vHvw9lFI74sZs3arvsmJ/n/R1OxaHMfr3WHxBEDZEtmh3QFkhv32bwUy1hUptw4hNVYzb2RsTkYlUrMazTPNAzidCFs9INlInqJzIk4ElsqkK1nuD1Uc0/NWU3NgFFdGwz2f4M1J3+ev/5A37oEmInyqvw0AAAAAElFTkSuQmCC"
											width="6" height="9" alt="화살표 아이콘">
									</div>
									<div class="category_list">
										<a href="#" class="big_non_selected big_list">여성의류</a>
										<a href="#" class="big_non_selected big_list">패션잡화</a> 
										<a href="#" class="big_non_selected big_list">남성의류</a> 
										<a href="#" class="big_non_selected big_list">디지털/가전</a> 
										<a href="#" class="big_non_selected big_list">도서/티켓/취미/애완</a> 
										<a href="#" class="big_non_selected big_list">스타굿즈</a> 
										<a href="#" class="big_non_selected big_list">생활/문구/가구/식품</a> 
										<a href="#" class="big_non_selected big_list">스포츠/레저</a> 
										<a href="#" class="big_non_selected big_list">뷰티/미용</a> 
										<a href="#" class="big_non_selected big_list">유아동/출산</a> 
										<a href="#" class="big_non_selected big_list">차량/오토바이</a> 
										<a href="#" class="big_non_selected big_list">기타</a> 
										<a href="#" class="big_non_selected big_list">재능</a> 
										<a href="#" class="big_non_selected big_list">구인구직</a> 
										<a href="#" class="big_non_selected big_list">번개나눔</a> 
										<a href="#" class="big_non_selected big_list">지역 서비스</a> 
										<a href="#" class="big_non_selected big_list">원룸/함께살아요</a> 
										<a href="#" class="big_non_selected big_list">커뮤니티</a>
									</div>
								</div>
								<!-- 중분류 -->
								<div class="category" id="middle_category">
									<div class="middle_category_top" id="middle_top">
										<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAASCAYAAABvqT8MAAAAAXNSR0IArs4c6QAAAX9JREFUKBWdkz1LA0EQhmf2Ei6msBEb/4JgPi4fhYUpRIn4gYpY2ajYKbZa5S9YKzZWIgoqCIpFLKxyMQb0Z0hEQnIbcjfuLtyykmDEhbt7571ndvZm9wDE4MnMIU9mD6QeOLyUs9dOOCQvoXcHJTAIcEJDARy1U5lNHfcRzF6e3wHAc/mOhMCAjnk6u96HVRYqsFCI8EbzioAWZIyIXWC4Enup3CrKuDEFlMtde2x0TYCPMiaiCPjBhZfKThuskqpCaJLjxD0fH0TGpPQQoWUBzkRf3eeQURXCAKvVVsy25gRYlR4RxH2Au04672gmFOaTcrkR3gmexNLGlY/4wQin7Hrl/UcFM6lHR0ktvyeB8vlh3vHvw9lFI74sZs3arvsmJ/n/R1OxaHMfr3WHxBEDZEtmh3QFkhv32bwUy1hUptw4hNVYzb2RsTkYlUrMazTPNAzidCFs9INlInqJzIk4ElsqkK1nuD1Uc0/NWU3NgFFdGwz2f4M1J3+ev/5A37oEmInyqvw0AAAAAElFTkSuQmCC"
											width="6" height="9" alt="화살표 아이콘">
									</div>
									<!-- 대분류 "여성의류"에 대한 중분류 -->
									<div class="category_list">
									</div>
								</div>
								<!-- 소분류 -->
								<div class="category" id="small_category">
									<div class="small_category_top" id="small_top"></div>
									<!-- 여성의류 -> 원피스 -->
									<div class="category_list">
									</div>
								</div>
							</div>
							<a href="https://m.bunjang.co.kr/seller" target="_blank"
								class="sellerCenter"><b>번개장터 판매자센터</b><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAASCAYAAABvqT8MAAAAAXNSR0IArs4c6QAAAfZJREFUKBVtkstq21AQhi3pqCpWUllWkippCjY2WcWbLPoahS76Bl2XkscIhe7zAllkVbrMY8S0pGCwsWIS2U6ELFRfJPUbg4ubeGA0M2f+fy7nSKvX679KpVKEXmqaFsRx/D0MwwnxRtE5DYuieARcxndM06zWarUKvuSeieG6bh/wTzIf0BMIb3VdP/I874bu88FgkK+zlGEYAYA/s9lMxpCqVTpmFPEnk4lJHKIZuiRqOC9Qs9Fo7C8Wi10KfCKuQFpAGmG/lcvlsN1uPwpJ8Zmhc6XUXZZlAhoS63me70onChxMp1ODs6ngpMNKZBzd930XcoVd3hPvUeAEYsLZV+xImCspcHLmTknObds+JDYBvYNk072Nr9Y7rIhitWazuc1FHEI+B+hzNkazjXctBHQpgGmgSXeRQpZ+KobjOK8AfmThN9iXAIZcwhnE0TpBuhk8lryDy8yvAbjokDjmEm4hDVet9Var5SRJskPyM7rDY1rYCOI5e9x3Op2AgnPFclYURWaapvtU2OOwim4DHlNdFh1AlrdJ0UKROGZmj0pfSGxxeI3+Jr4gHvd6veXtCBgtKaoeYGVWGyv3PsKXV7/rdrvy28t/9E9k6VNACdV+4N/zG1xZlhX3+/2Y+L8/VVhC8Kgoo8WQHvgBH4IgSCS5Sf4Cbfj85T5s+hEAAAAASUVORK5CYII="
								width="6" height="9" alt="화살표 아이콘"></a>
						</div>
						<!-- 변경부분 끝 -->
					</div>
	
				</div>
			</div>
			
			<div class="zzimSideBox1">
				<div class="zzimSideBox2">
					<div class="zzim1">
						<div class="zzim1Txt">찜한상품</div>
						<div class="zzim1Num"><!--img src 경로 수정(20210405)-->
							<a class="zzim1Btn1" href="#"><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAAAXNSR0IArs4c6QAAAX1JREFUOBGdk7FLw0AUxnPXFhdHRdBdVJBCGgedBP8GoYJQHMRBRNBF1EGnTkopXcRBBEFB/A+cnNuIhEBHQcFBnHRolsTfqwZiWmLSg8t733vf++7d5U4Zv8NxnDHP846Ai8xxpdRDEAT7lmU5YKPZbE5hlonPYfPknrB18m9YQ8nHtu0l3/dvcEcER8ZnLpcrUzTLPGYORXLifmity6Zp3ivXdYc7nU4b0kSMlArS4Tu1MxqR7UFFZCVqRxE71DjzqZZOJi1o1CaTOamy0xraSypqAoldPcvWHhM4aVO2LhQKNbb3lbYizqPWI1bVxWLxla4O4oQMeI9L2ZYzMnDqXKxqhuIuVWpKpVJNQPdmhwI8gxP8nRD/Y09pYDfk/BGSYKvVarDVzZDQz3IuDTrZiuZ6hBBRvL0z7HqUGPqInPO2NrBBGBPbIyRBEaOzC9yK4Mi4pJO1uIjk+wpJAjGN2BXuimDGNSKriPg/MMMXsTw/4BbBO/EzlA5O/QbfD5IxtG4t8AAAAABJRU5ErkJggg=="
								width="9" height="9" alt="찜 아이콘">0</a>
						</div>
					</div>
					<div class="zzimSideBox3">
						<div class="zzim2Txt">최근본상품</div>
						<div class="zzim2NumBox">
							<div class="zzim2Num"></div>
						</div>
						<div class="zzimnobox"> <!--img src 경로 수정(20210405), div class명 변경 및 삭제-->
							<img width="28" height="16" src="data:image/png;base64,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"
								alt="빈 최근본상품 아이콘"> 
								<div>최근 본 상품이 없습니다.</div>
						</div>
					</div>
				</div>
				<div class="zzimTop"> <!--화살표 div 삭제-->
					<a href="#" class="zzimTopBtn">TOP</a>
				</div>
			</div>
		</div>
		</div>
						<%
					}else{	
						memberDAO.lastlogin(m_idx);
						%>
						<button class="logOut">로그아웃</button>
						
						<div class="storeBox1">
							<div class="storeBox2">
								<a class="storeBtn" href="./myshop1.jsp">내 상점</a>
								<div class="storeView">
									<a class="storeclick" href="./myshop1.jsp">내 상품</a><a
										class="storeclick" href="./myshop3.jsp">찜한상품</a><a
										class="storeclick" href="./AccountSet.jsp">계정설정</a><a
										class="storeclick" href="./notice.jsp">고객센터</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="zeusTop">
				<div class="zeusBox1">
					<div class="zeusBox2">
						<a class="zeusLogo" href="./main.jsp"><img
							src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTI4IiBoZWlnaHQ9IjM1IiB2aWV3Qm94PSIwIDAgMTI4IDM1Ij4KICAgIDxkZWZzPgogICAgICAgIDxwYXRoIGlkPSJhIiBkPSJNMCAzNC4wMzZoMTQyVi4wOTJIMHoiLz4KICAgIDwvZGVmcz4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggc3Ryb2tlPSIjQ0NDIiBkPSJNLTEwLjUtNy41aDE0OXY0OWgtMTQ5eiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03KSI+CiAgICAgICAgICAgIDxwYXRoIGZpbGw9IiNGNzAwMDAiIGQ9Ik0yOS4wMjUgMTYuNzAxTDE5Ljk0IDI2Ljc5N2EuNTA1LjUwNSAwIDAgMS0uNjI3LjEuNDgzLjQ4MyAwIDAgMS0uMjMtLjU3NWwyLjA2MS02LjM5MWgtMy41OThhLjUyNi41MjYgMCAwIDEtLjQwMi0uMjE1LjUyNy41MjcgMCAwIDEtLjA4NS0uNDVsMi43NzYtMTAuMDYzYy4wNjItLjIxOC4yNi0uMzM4LjQ4OC0uMzM4aDYuNTYxYy4xNyAwIC4zMjkuMDQ5LjQyMi4xOS4wOTQuMTQyLjEwOS4zOC4wNDIuNTM1bC0yLjcyNiA2LjQyMmg0LjAzYy4xOTggMCAuMzguMDQuNDYuMjIzLjA4MS4xOC4wNDcuMzE3LS4wODYuNDY2bTcuMzI2LTguODEyTDIzLjUyNC40MTRjLS41NTItLjMyLTEuMzk2LS4zMi0xLjk0OCAwTDguNTA0IDcuODg5Yy0uNTUzLjMyLTEuMTI4IDEuMTAxLTEuMTI4IDEuNzRWMjQuNThjMCAuNjM4LjYwNSAxLjQyMSAxLjE1NyAxLjc0bDEzLjAyNiA3LjQ3NWMuNTUzLjMyIDEuNDk2LjMyIDIuMDQ4IDBsMTIuNzI1LTcuNDc1Yy41NTItLjMxOS43OC0xLjEwMi43OC0xLjc0VjkuNjI4YzAtLjYzOC0uMjA4LTEuNDItLjc2LTEuNzM5TTEwMy40NTMgMjYuOTQ5Yy0xLjc3NyAwLTMuMjIyLTEuMjAzLTMuMjIyLTIuNjggMC0xLjQ2MyAxLjQ0NS0yLjY1NSAzLjIyMi0yLjY1NSAxLjgzOCAwIDMuMjc2IDEuMTY4IDMuMjc2IDIuNjU1IDAgMS41MDMtMS40MzggMi42OC0zLjI3NiAyLjY4bTAtOC4xMzVjLTMuNjEgMC02LjY2MiAyLjQ5OC02LjY2MiA1LjQ1NSAwIDMuMDIyIDIuOTkgNS40OCA2LjY2MiA1LjQ4IDMuNzE4IDAgNi43NDItMi40NTggNi43NDItNS40OCAwLTMuMDA4LTMuMDI0LTUuNDU1LTYuNzQyLTUuNDU1Ii8+CiAgICAgICAgICAgIDxtYXNrIGlkPSJiIiBmaWxsPSIjZmZmIj4KICAgICAgICAgICAgICAgIDx1c2UgeGxpbms6aHJlZj0iI2EiLz4KICAgICAgICAgICAgPC9tYXNrPgogICAgICAgICAgICA8cGF0aCBmaWxsPSIjRjcwMDAwIiBkPSJNNDkuNTYxIDE2LjAxMmg1LjA3MnYtMy4yMjhINDkuNTZ2My4yMjh6bTguMy0yLjA3NWg0LjE1djguMjk5aDMuMjI2VjQuOTQ2SDYyLjAxdjYuMjI0aC00LjE1VjYuMWgtMy4yMjd2My45Mkg0OS41NnYtMy45MmgtMy4yMjd2MTIuNjc4SDU3Ljg2di00Ljg0ek02OC4wMDQgOS43ODhoNi40NTR2Mi4wMDJjMCAuOTQtLjExNCAxLjc2Ni0uMjYzIDIuNDU2LS4xNS42ODctLjQ4NCAxLjM1OC0uOTU4IDEuOTk0LS40NzUuNjM4LTEuMTg5IDEuMzE1LTIuMTA0IDIuMDEzLS45MTcuNy0yLjE2MyAxLjU0OS0zLjY5NiAyLjUyNGwtLjAyOS4wMTcgMS45NDggMi40ODQuMDIyLS4wMTZjMS43NjctMS4xNjQgMy4yMTEtMi4xODUgNC4yOTItMy4wMzQgMS4wODYtLjg1MSAxLjkzNy0xLjY4NiAyLjUzLTIuNDguNTkzLS43OTUuOTg2LTEuNjI3IDEuMTktMi40NzQuMjAzLS44NDUuMjk1LTEuODQ3LjI5NS0yLjk3NlY2Ljc5aC05LjY4MXYyLjk5OHpNOTguMzcyIDE0LjI4OGMuMDcuMTQzLjI2LjM0NC41NzguNjE0LjMzNy4yODYuNzk0LjYzMiAxLjM1NiAxLjAyOGE3OS4zOTIgNzkuMzkyIDAgMCAwIDMuMjcyIDIuMjA3bC4wMi4wMTUgMS44MTctMi4zNTgtLjAyNy0uMDE2YTU3Ljg5IDU3Ljg5IDAgMCAxLTMuNzctMi41NDQgNS44MTYgNS44MTYgMCAwIDEtLjg2LS43NDggNC4wMjMgNC4wMjMgMCAwIDEtLjUzLS43MWMtLjEzLS4yMy0uMjYtLjQ4LS4zMDMtLjc0My0uMDQ1LS4yNjUtLjExLS41NTYtLjExLS44NjRWOC44NjVoNC42MTFWNi4wOTlIOTEuNzQ4djIuNzY2aDQuODR2MS4zMDRjMCAuNjMxLS4xNzUgMS4xOTgtLjQyOCAxLjY4NS0uMjU1LjQ5LS42MzcuOTM2LTEuMDkzIDEuMzNhNDUuMjAyIDQ1LjIwMiAwIDAgMS00LjM5OCAzLjI2OWwtLjAzLjAxNyAyLjAwMSAyLjQzNS4wMjEtLjAxNWMuNjctLjQ0NyAxLjMwOS0uODk3IDEuOTAyLTEuMzM4LjU5NS0uNDQzIDEuMTgtLjg5MyAxLjczOS0xLjMzN2ExNi45OSAxNi45OSAwIDAgMCAxLjQ2NS0xLjIxYy4zMzYtLjMyLjUzNS0uNTU2LjYwNS0uNzE3TTEyOC40OTEgMTkuNjEyYy0xLjI1LjE2OC0yLjYxNy4zNDItNC4wNjIuNC0xLjQ0LjA2LTIuODE3LjE1LTQuMDkuMTVoLTEuODUxdi0zLjkyaDcuMzc3di0yLjc2NmgtNy4zNzdWOS41NTdoOC4yOThWNi43OWgtMTEuNzU1djE2LjEzN2g0LjUxYy44MzkgMCAxLjY3MS0uMDYgMi40Ny0uMDY4LjgzNy0uMDA4IDEuNjY0LS4wNTYgMi40Ni0uMDlhNjMuMzUgNjMuMzUgMCAwIDAgMi4zMjYtLjE1NGMuNzQtLjA2IDEuNDI5LS4xNDggMi4wNDgtLjI1bC4wMjktLjAwNi0uMzU0LTIuNzUtLjAyOS4wMDN6TTUzLjcxIDIwLjYyMmgtMy42ODhWMjkuMTUyaDE1LjQ0NXYtMi43NjdINTMuNzExek04NS4yOTMgNS4wODZ2Ny4yMzdoLTIuMDc0VjQuOTQ3SDc5Ljc2djIzLjEzOGwzLjQ1OS0uODJWMTUuMzE5aDIuMDc0djEyLjc2NmwzLjQ1Ny0uODJWNC45NDdoLTMuNDU3eiIgbWFzaz0idXJsKCNiKSIvPgogICAgICAgICAgICA8cGF0aCBmaWxsPSIjRjcwMDAwIiBkPSJNMTMwLjkzNiA0Ljk0N3Y4LjUyOWgtNC4xNVYxNi40NzRoNC4xNXYxMS42MTJsMy42ODktLjg3OVY0Ljk0N3pNMTEwLjQyIDQuOTQ3aC0zLjY4OXYxMy44MzFoMy42ODh2LTUuMzAxaDMuMjI3di0yLjc2OGgtMy4yMjd6IiBtYXNrPSJ1cmwoI2IpIi8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
							width="136" height="40" alt="번개장터 로고"></a>
						<div class="zeusSerach1">
							<form name="searchForm" id="searchForm" method="post" action="search.jsp">
								<div class="zeusSerach2">
									<!-- input text에 입력한 value값을 form 태그로 넘겨야함 -->
									<input type="text" placeholder="상품명, 지역명 입력" class="zeusTxt" value="" name="searchText">
									<a class="zeusSearchBtn"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAeZJREFUOBGVVD1PAkEQ3VlOjY0xIdGOI0BMxMSGytJE+RsWWomx8mfYWNBpZWltg1b2NCZaGBppFAzR1njsOO9gzHEfIJdws/vmvcft7OySiT2DQqUakDtipjoZ4xsyzGy6RNzy2F7mu53nmGRiKprRw7XaQm/wdU6OG2xMTvFoFPKQLTXX86tn1G7/RHM6thjArP/xeWscn8rUWqJLee/klhdW8MM4xCQHDrjQqEkivhfLF++FEvf80luvsLGXIIwB5MABF5o0HoU1M+5RkvK1Xn29+3KfRlQMpmyCOyzfM3Y7XlMbboDUjIiuZpnBFBwsH3WGVv9Io8VuYuLEUMFZUbmqjfJt2BqC5JZyT9HEtLFyVRvlhrscBeYaS4/G+VaQV4DD7+FWPJk1Vy4aPs6R+nILoBTzMJ7MmitXtVGexXFCC8j5OpzWgyoCxzEfQQOt4hot+gjHSZZOhoLraabIEQU3EEMT70HgHl44m3KcNqUm+2SCVt8vX6E1dDdRMyzTcSCXBhRSImc6o9HkW7589Pz3cpAD8CBL3oXKkj1Ze+00xxZh+DNUMHF9SQKdEL2+en7lmNmFRmmm6jVXhGl4SchF0fcrjbnEWeQ008SSs8RZuC5fjIbWW6xm8ebCYdovlg8g+gXwsu0wmCVGbgAAAABJRU5ErkJggg=="
									width="16" height="16" alt="검색 버튼 아이콘"></a>
								</div>
							</form>
						</div>
						<div class="rightMenu">
							<a class="myShopBtn" href="./myshop1.jsp"><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAwCAYAAABuZUjcAAAAAXNSR0IArs4c6QAABCNJREFUaAXtWUtS20AQtWxXJSEbZ8XWuYH4rcEnwNzALg6Q5AQJy6yAE1icIOYEmDWf6AbRispSqwSqAOU91QwetUbWSAFjqpgq10z39OdNT89P9hqPVNbW1vowtY2fr36m5RAEf8cXFxdjs6Nu26urqPVWV1cHnud9Bd3VvJI6SpJk7/LyMiiRm9ldG/jGxoZ/f38/gnVGuE4Jm83m8OzsjDNRudQCrkCfwFunssesQgzwvTrgKwMvAR0jbQKkwinqmBjR7qC9iXoA0jbQWuArAfd9v9NqtX5ZAMQAxrw9QF9hwXr4jEFwPcgBxHd3dx/DMEwHW2jA6Gga7dImQO9DSDplrvbKQNM4ZSiLZkjaKAwIbTsX54gj2l0VbdN45UhRuWjmVNQj00FR2zniAM0pzhRM+06V6dXK1KGupnVt86H7ZO0MHIp9oRycn59PBM+ZVLqBUJA+RPeUdAK+vr6+BRWZ28dTM7Vb0kZH+So16AQcB40vLT3G0W2zYfMlfZN2Ao6dQEZ7YjNWk5exZfFlNdu2cisw/4ze7DeSise+1wiXhjdfKrjJif43cAV6K2d5FiOZ1enW55QqyLtYmJvmfNKQC0yIWsisztQWRC2+LAbcczwU2h3eWcjzmt4YVSz6Z5Gx0mkoGx1TGDkemnRR2ynitv0akflEo++G1xHSZa/IQY4P2VQHHdqGKWPzZfbrthNwJRxoJVUPdNSXdm8OksQrBU8ZylJf6Q6ULV0FulFWOwPHEX0kjSFiI947yH+/e/0NMj1EfyzlyGMfZdhHHepKOZsPKaNp50sWFfCu/IGqr5VVHeJy1JN3lr+jt93rxnX8YZjNf3XBOoGuL+yMcSDtCF4hWQk4nPKG+BPW0igbVmO0h7aT0JDhwDloRjqnj8GvYPCRKT+rXQk4DfEugUcDI2YrfAgfcme4vb2NKNBut7tICx9pwMXcJU8WppHrotS6lYFTUb3sczmqjVapMdBhnRd/LeAExl0BkWTOd0nXKBFmZqfOQ5m+WjUcpipXV1e/l5eXj5DzN2D4+L11tMVHxHfkNCMdOerkxGpH3LTEnQLR44ehTfC38MstPvAmSItTzFIgdyD0LU7hInZ9FCwO6lckxRGYmePMXezDXHhzLzgHsBSKPxBZgat9mgfGs4A2ohTyQLPt8xngam/mwfLcgA3saZNfyzJfdh+AK9A8yuVWJo08Fx0D/MOX3RR4CegYSMM5o+WM2wL4AD59LKu7sRTkhYlfYIM5g07dFfzToe/xK17Bhcl6x573AIru7ryYNXFMbwtA/AKbexgImbmQ3A6JBc5i0yEx8+nWF8zDWfunKTuPNrEA6KHw1be9OSdCaBHIHCYb8EUAmsGgX1Mm80UAR7pEJmi2XwRwCfoVuC0iT817TZWnjrC0/2Ij/g8RGqgJ9UrG3gAAAABJRU5ErkJggg=="
								width="23" height="24" alt="내상점버튼 이미지">내상점</a><a
								class="sellBtn" href="./product.jsp"><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAA0CAYAAAD19ArKAAAAAXNSR0IArs4c6QAABsBJREFUaAXVWTtz20YQPkCKpdgp6EYaSYWRLp3pV5HKcJdOVJfOoKt0kctUsn9BpCpVQqpKafoXGO6c0QvqkspII7kzM5NxZMci8n3gHbQ4AiIgyRzlZsB93N7e3t53d+DBUZe03L1710doy0mSkKqdnZ1bpKY4hrlM9Pbt24HjOB0Z0/Hx8ZdRFMVG5xrmMtHBYBDa8biu60vdpQxcZzaWgWIGlqU8LYWz8s1m02NG4Pw+fHh4fDxlJURFDOzuI7M9Of2yAXz1YLMqdC3BqzNjHME2ECyx+BAOm9JpTZ6D2MAguhhE37S9c+cOA31mZE1XsEh75GtDhdmF087U1NRbBP0jfJwnaMbg0Q/90S/9U4nFGJLKAjvOaFpqBY4t6gk6eI2WwbD5hf8G9M9+dPYj2QNmhrOQlkpQuXfvXhNT2UGL07LbR32IrOyT4lHb29spJa/3ZbI+ArhJiqeBp6xEqIjxtKQB4Hlra2srGhu43lMJibJOQtRtGOzJTsbxGsdcI7ngTmuHQT/e3d1dPzXwooNAOA2Bw3bZriDsxrLENSDC5FQZQIgkPSgNHEGv6sVnd9yHon2WDNuObJlwQkYJSc+ukzISdn1KKgyvM/2TkQVllr/e29uLhO7C2IODg3h+fn4TOP4KTvkUFiT0j5GM64W4V9Ciiyy3C/SfRMWtEY6DEufdXMZ5qGA0L2DcsBpMNGj2fXh4+HxxcdED26RsFS+3j09PT6/BwLOMepPMtOxb99uTOs1HWeCECBbGqmUUc+ewdBMVdf+x7pSvB9wYHmRQWVhY+BWVnjZICWCzgj3zd6mbNP/mzZujpaWlfcTyJweBjeEVY3D4o/fR1+RFGYvrd7/MJMYejh983j4KjUz67ueZVfTA/VklTtK91v6Qm723HdWYSWbesp4FNiuwKYLG0ED8plABtr8XupTF6J7autqyox6aNk7ieIY39Iq64hsetF81aLZJAwduAgqi8BUzFnIZW2rzT2fWQ6OiHUH6WjYCsl0p08be1S8/DaPQ9Lkll4mxqRioQc5HMjh5k9M2I4PALLRMe9CqfaZNmHE/5U5++li1vROxIjdw84E5yoZfQ3r6u/MZ7Y2uFkzoxwVM7kuH4ENLLhcT1S+q1EF5dh0Xo9G5ys3wXxcm9MGMe2RMwe7A9+lKJVHFtjIoOIqNs1k1yywPS5Kb6VowoYORwKELWXGukmSvp/0kcTZtX9bCrQ0T+qv8L5/TnMsYGmNB3sDmO4zLHdxAQD6UXqISb6hUkaYpgX4ZNopU6KO0nVDY54GoylgHb2FJJoHhQSL/cpk6Osd6eGHkT0mvPnqvs1HeC6HyvyyVoYLR4QXHeZobJeCBvTjQuhgYiHDEt1I5UT2zeB0nWctshovV13IIny81X4tUDhy4i+H5ifQO+BDPgdbFiZv0MZBUdFzn8dVhG4V3Gu7p3ApjbH2xsQG/ce3R+55uX4sQKrHVwrfkUlEPxtQ3xEkYWnVmkTaFjfqgPoSmcV06EjgW4M26TrR9E5RZVQhuU+tswvrUBrDqXW8XH2B2oyLZxS5iY8wvMqyjO3KPetK+CMeOcmofOtInMx5KBfiGvqix1KViKGuA226VTNqDkz6q8K7es/uWsTwgrKqx4mgm3UGUa3VOmNAXM86Sm1rIgbk1TWur/8RFfwbw7pJLzHlhwnDSwHEBs2HHhisxs/faVXnZEce6M5IAYxsbhvS8MKGP4aYLBrjmce7jyUrZ8Z8ZgOFeDsJHHamjqAzf5n3kWB33v2j/m4cOG9csWeD63o7By8LriVvyS4GsnATPSyr2Y8dgMG7usrtWMOYW1VJPTuQtLi/77Z0uu1dhKLhwfAm8fwd2VoTW5FUYr8SEbiIsgu2gowAP4/kW9yuNubm533jXkmUcFel0ANcr5K0SaCeW+tOJIuisE5zqq8i+T0Uu41Twqhe3Wn9hAN9QFiXNPGeFIxb6C2WJaWSWV9yB7RiB82tEl/qRwKkELF6V3JQ2ASVO2T4HSNuLLLy/RMKewaedNHbTRdA/mP6yXcUoJC2aLlHf5W1XxYsj0WyU1VeAPDeC0dpUM3IdeGrgbDLmOxBNusjSZtHfPVaeVvRHBL6rB2V2Gh7rdv3YwNmg4rcZHuv8jL0POEUfP37EZJx8KSZ2cUfJz478IHsftj4eD09ZiWHXLktIpcDpWXe8hsBWy3q6KD0CXsfACUMmo7BUDty0roBHY3oWWnnd1A7cRMMB8HoaM9CCzjP6M1BCoocMb9RZ6GcOXAaoP8O0MAj+7Wvi8WS9xceQIwTLrww9ft626iuJ/wHuL5qh8rb07wAAAABJRU5ErkJggg=="
								width="23" height="26" alt="판매하기버튼 이미지">판매하기</a>
						</div>
					</div>
					<div class="underMenu">
						<div class="categoryMenu">
							<div class="category_img_div" id="category_img_div">
							<img id="category_img"
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAgCAYAAABgrToAAAAAAXNSR0IArs4c6QAAAExJREFUWAnt1sEJACAMA0DrJt1/SAVXyKfI9V8Il0+qu88afHtwthdNwOkNyUeAAAECvwuUNRNWbM2EgN4JECBAgEAoYM2EgMuaSQUv1d0EPE4sEMMAAAAASUVORK5CYII="
								width="20" height="16" alt="메뉴 버튼 아이콘">
							</div>
							<div class="main_category">
								<!-- 대분류 -->
								<div class="category" id="big_category">
									<div class="big_category_top">
										전체 카테고리 <img
											src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAASCAYAAABvqT8MAAAAAXNSR0IArs4c6QAAAX9JREFUKBWdkz1LA0EQhmf2Ei6msBEb/4JgPi4fhYUpRIn4gYpY2ajYKbZa5S9YKzZWIgoqCIpFLKxyMQb0Z0hEQnIbcjfuLtyykmDEhbt7571ndvZm9wDE4MnMIU9mD6QeOLyUs9dOOCQvoXcHJTAIcEJDARy1U5lNHfcRzF6e3wHAc/mOhMCAjnk6u96HVRYqsFCI8EbzioAWZIyIXWC4Enup3CrKuDEFlMtde2x0TYCPMiaiCPjBhZfKThuskqpCaJLjxD0fH0TGpPQQoWUBzkRf3eeQURXCAKvVVsy25gRYlR4RxH2Au04672gmFOaTcrkR3gmexNLGlY/4wQin7Hrl/UcFM6lHR0ktvyeB8vlh3vHvw9lFI74sZs3arvsmJ/n/R1OxaHMfr3WHxBEDZEtmh3QFkhv32bwUy1hUptw4hNVYzb2RsTkYlUrMazTPNAzidCFs9INlInqJzIk4ElsqkK1nuD1Uc0/NWU3NgFFdGwz2f4M1J3+ev/5A37oEmInyqvw0AAAAAElFTkSuQmCC"
											width="6" height="9" alt="화살표 아이콘">
									</div>
									<div class="category_list">
										<a href="#" class="big_non_selected big_list">여성의류</a>
										<a href="#" class="big_non_selected big_list">패션잡화</a> 
										<a href="#" class="big_non_selected big_list">남성의류</a> 
										<a href="#" class="big_non_selected big_list">디지털/가전</a> 
										<a href="#" class="big_non_selected big_list">도서/티켓/취미/애완</a> 
										<a href="#" class="big_non_selected big_list">스타굿즈</a> 
										<a href="#" class="big_non_selected big_list">생활/문구/가구/식품</a> 
										<a href="#" class="big_non_selected big_list">스포츠/레저</a> 
										<a href="#" class="big_non_selected big_list">뷰티/미용</a> 
										<a href="#" class="big_non_selected big_list">유아동/출산</a> 
										<a href="#" class="big_non_selected big_list">차량/오토바이</a> 
										<a href="#" class="big_non_selected big_list">기타</a> 
										<a href="#" class="big_non_selected big_list">재능</a> 
										<a href="#" class="big_non_selected big_list">구인구직</a> 
										<a href="#" class="big_non_selected big_list">번개나눔</a> 
										<a href="#" class="big_non_selected big_list">지역 서비스</a> 
										<a href="#" class="big_non_selected big_list">원룸/함께살아요</a> 
										<a href="#" class="big_non_selected big_list">커뮤니티</a>
									</div>
								</div>
								<!-- 중분류 -->
								<div class="category" id="middle_category">
									<div class="middle_category_top" id="middle_top">
										<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAASCAYAAABvqT8MAAAAAXNSR0IArs4c6QAAAX9JREFUKBWdkz1LA0EQhmf2Ei6msBEb/4JgPi4fhYUpRIn4gYpY2ajYKbZa5S9YKzZWIgoqCIpFLKxyMQb0Z0hEQnIbcjfuLtyykmDEhbt7571ndvZm9wDE4MnMIU9mD6QeOLyUs9dOOCQvoXcHJTAIcEJDARy1U5lNHfcRzF6e3wHAc/mOhMCAjnk6u96HVRYqsFCI8EbzioAWZIyIXWC4Enup3CrKuDEFlMtde2x0TYCPMiaiCPjBhZfKThuskqpCaJLjxD0fH0TGpPQQoWUBzkRf3eeQURXCAKvVVsy25gRYlR4RxH2Au04672gmFOaTcrkR3gmexNLGlY/4wQin7Hrl/UcFM6lHR0ktvyeB8vlh3vHvw9lFI74sZs3arvsmJ/n/R1OxaHMfr3WHxBEDZEtmh3QFkhv32bwUy1hUptw4hNVYzb2RsTkYlUrMazTPNAzidCFs9INlInqJzIk4ElsqkK1nuD1Uc0/NWU3NgFFdGwz2f4M1J3+ev/5A37oEmInyqvw0AAAAAElFTkSuQmCC"
											width="6" height="9" alt="화살표 아이콘">
									</div>
									<!-- 대분류 "여성의류"에 대한 중분류 -->
									<div class="category_list">
									</div>
								</div>
								<!-- 소분류 -->
								<div class="category" id="small_category">
									<div class="small_category_top" id="small_top"></div>
									<!-- 여성의류 -> 원피스 -->
									<div class="category_list">
									</div>
								</div>
							</div>
							<a href="https://m.bunjang.co.kr/seller" target="_blank"
								class="sellerCenter"><b>번개장터 판매자센터</b><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAASCAYAAABvqT8MAAAAAXNSR0IArs4c6QAAAfZJREFUKBVtkstq21AQhi3pqCpWUllWkippCjY2WcWbLPoahS76Bl2XkscIhe7zAllkVbrMY8S0pGCwsWIS2U6ELFRfJPUbg4ubeGA0M2f+fy7nSKvX679KpVKEXmqaFsRx/D0MwwnxRtE5DYuieARcxndM06zWarUKvuSeieG6bh/wTzIf0BMIb3VdP/I874bu88FgkK+zlGEYAYA/s9lMxpCqVTpmFPEnk4lJHKIZuiRqOC9Qs9Fo7C8Wi10KfCKuQFpAGmG/lcvlsN1uPwpJ8Zmhc6XUXZZlAhoS63me70onChxMp1ODs6ngpMNKZBzd930XcoVd3hPvUeAEYsLZV+xImCspcHLmTknObds+JDYBvYNk072Nr9Y7rIhitWazuc1FHEI+B+hzNkazjXctBHQpgGmgSXeRQpZ+KobjOK8AfmThN9iXAIZcwhnE0TpBuhk8lryDy8yvAbjokDjmEm4hDVet9Var5SRJskPyM7rDY1rYCOI5e9x3Op2AgnPFclYURWaapvtU2OOwim4DHlNdFh1AlrdJ0UKROGZmj0pfSGxxeI3+Jr4gHvd6veXtCBgtKaoeYGVWGyv3PsKXV7/rdrvy28t/9E9k6VNACdV+4N/zG1xZlhX3+/2Y+L8/VVhC8Kgoo8WQHvgBH4IgSCS5Sf4Cbfj85T5s+hEAAAAASUVORK5CYII="
								width="6" height="9" alt="화살표 아이콘"></a>
						</div>
						<!-- 변경부분 끝 -->
					</div>
	
				</div>
			</div>
			<div class="zzimSideBox1">
				<div class="zzimSideBox2">
					<div class="zzim1">
						<div class="zzim1Txt">찜한상품</div>
						<%
		memberDTO.setIdx(Integer.parseInt(String.valueOf(session.getAttribute("idx"))));
		String zzimCnt = memberDAO.zzimcnt(m_idx);;
		if(zzimCnt != null){
			String[] zzimArr = zzimCnt.split(" ");
	
	%>
						<div class="zzim1Num">
							<a class="zzim1Btn" href="./myshop3.jsp"><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAAEhyb7BAAAAAXNSR0IArs4c6QAAAhBJREFUOBGdVL9v01AQvjs7cRp1QiDBhFClqFsS7AwBIVWABJWYGCohRsTA1LFTgYkBCdQFxMDE1KlCqH9BJyBOkyxIpWLq0IEfGRroC2193Nn1i5sQQfsGv/u+++587+7ZAJmFplKbZ46WLLdb9lkBmnKwAcifXAYuAUPJSlA0a4KuWEb1CkzZP5BoUnui00Rk3z9n9vE5OrlFjPbuamicXhW6YmliJs84j1URXY9pZpZSg6cKkGdmJk13ZycJEAJxXwTuAMMXMt3eZkronhUkGKaSmiv+T2YoZsWpjTmcjkUpYQtTAuH+RLv5OvWBqQavpAM/uHrpvJL9sr8gRb/lev2UYjl8sC2VnFXwt1Uo5ovSkPECDer/+r060rXhbIww/U8RAj4hx3Hrw9EWI3wrtMMXlF//8J4I71jHoSG96UsLziiMX+e1wmUieJgVFjrNQhZbW9rx5khDDz3JFajWrgFHy3LzTtsINRC2yYEbHMFl8T0bHR1uOUS3862PIe5Wgscy+UdHEhwTyLkWdXLfZTDxGI8ZP5BLN0nO1howJ7OQMSTP5VkZ4OeTpdCPBppe6cIte73NxdpNiKJ30tDc/ySVwB4hXc23Gw3V20RpsKn6D2RKL1M8vMtne4CEc956YyXrG0mUOk3FX5Lq5lOsOyEueO0w/jFkebXHJlKn/ETcfre3IqKvXie8p9y49QcxxqrZMCDi2QAAAABJRU5ErkJggg=="
								width="9" height="9" alt="찜 아이콘"><%=zzimArr.length%></a>
						</div>
						<%
							}else{
						%>
					<div class="zzim1Num">
						<a class="zzim1Btn2" href="./main.jsp"><img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAAAXNSR0IArs4c6QAAAX1JREFUOBGdk7FLw0AUxnPXFhdHRdBdVJBCGgedBP8GoYJQHMRBRNBF1EGnTkopXcRBBEFB/A+cnNuIhEBHQcFBnHRolsTfqwZiWmLSg8t733vf++7d5U4Zv8NxnDHP846Ai8xxpdRDEAT7lmU5YKPZbE5hlonPYfPknrB18m9YQ8nHtu0l3/dvcEcER8ZnLpcrUzTLPGYORXLifmity6Zp3ivXdYc7nU4b0kSMlArS4Tu1MxqR7UFFZCVqRxE71DjzqZZOJi1o1CaTOamy0xraSypqAoldPcvWHhM4aVO2LhQKNbb3lbYizqPWI1bVxWLxla4O4oQMeI9L2ZYzMnDqXKxqhuIuVWpKpVJNQPdmhwI8gxP8nRD/Y09pYDfk/BGSYKvVarDVzZDQz3IuDTrZiuZ6hBBRvL0z7HqUGPqInPO2NrBBGBPbIyRBEaOzC9yK4Mi4pJO1uIjk+wpJAjGN2BXuimDGNSKriPg/MMMXsTw/4BbBO/EzlA5O/QbfD5IxtG4t8AAAAABJRU5ErkJggg=="
							width="9" height="9" alt="찜 아이콘">0</a>
					</div>
					<%
							}
					%>
				</div>
					<div class="zzimSideBox3">
						<div class="zzim2Txt">최근본상품</div>
						<!-- 페이징 및 카운팅 하면 변경 및 수정
						<div class="zzim2NumBox">
							<div class="zzim2Num">3</div>
						</div>
						 -->
						<%
			int rcp_memidx = (Integer.parseInt(String.valueOf(session.getAttribute("idx"))));
			List<String> recentIdx = recentproductDAO.recentIdx(rcp_memidx);
	
			if(recentIdx.size() == 0){
				%>
				<div class="zzimSideBox1">
				<div class="zzimSideBox2">
					<div class="zzim1">
						<div class="zzim1Txt">찜한상품</div>
						<div class="zzim1Num"><!--img src 경로 수정(20210405)-->
							<a class="zzim1Btn1" href="#"><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAAAXNSR0IArs4c6QAAAX1JREFUOBGdk7FLw0AUxnPXFhdHRdBdVJBCGgedBP8GoYJQHMRBRNBF1EGnTkopXcRBBEFB/A+cnNuIhEBHQcFBnHRolsTfqwZiWmLSg8t733vf++7d5U4Zv8NxnDHP846Ai8xxpdRDEAT7lmU5YKPZbE5hlonPYfPknrB18m9YQ8nHtu0l3/dvcEcER8ZnLpcrUzTLPGYORXLifmity6Zp3ivXdYc7nU4b0kSMlArS4Tu1MxqR7UFFZCVqRxE71DjzqZZOJi1o1CaTOamy0xraSypqAoldPcvWHhM4aVO2LhQKNbb3lbYizqPWI1bVxWLxla4O4oQMeI9L2ZYzMnDqXKxqhuIuVWpKpVJNQPdmhwI8gxP8nRD/Y09pYDfk/BGSYKvVarDVzZDQz3IuDTrZiuZ6hBBRvL0z7HqUGPqInPO2NrBBGBPbIyRBEaOzC9yK4Mi4pJO1uIjk+wpJAjGN2BXuimDGNSKriPg/MMMXsTw/4BbBO/EzlA5O/QbfD5IxtG4t8AAAAABJRU5ErkJggg=="
								width="9" height="9" alt="찜 아이콘">0</a>
						</div>
					</div>
					<div class="zzimSideBox3">
						<div class="zzim2Txt">최근본상품</div>
						<div class="zzim2NumBox">
							<div class="zzim2Num"></div>
						</div>
						<div class="zzimnobox"> <!--img src 경로 수정(20210405), div class명 변경 및 삭제-->
							<img width="28" height="16" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADgAAAAgCAYAAABHA7voAAAAAXNSR0IArs4c6QAACJ9JREFUWAntmXlQVlUYxvk+EEEWrcyQhhBzY7HNHCedNKfFsrTV1DKX0abFcsk0p7SsnLIsHdsmm7JxTG3RctosS8XJZrLFphBBBBU0xUYWWQQBod/zdS7dLvcC+tF/nZnDe877Pud5z3v2++ELacN08ODByMrKytRTp0719fl8fevr61ORXRoaGmKRHSVxV0v5OOXjyDLqB5AZ1DPatWuX0atXr31t2KUQX7Bkubm5CTU1NTfRwRFwDUVGBMl5iIA/V46MjNyclJRUHQzfGQVIEGFZWVm3M0PTcD7QrQN0sAH9t8hPwP+QkpKSQblO2Pz8/LNOnDjRn/aDqI7H3k16l1Tp9/vXYF+Wmpqa6WJvUXVaAWZmZkbD+DB5Kk7Pt7EfpPPx6EKlo7w6NDT02T59+uyxYVyLtPEzWDcQ7GIAyQLRvgBRji1VdSV0mwl2cXJy8td/a1r3t1UB4shHJ8YhF5HjjcMq5Hocr6Rz91O+nXIheTKz9WXr3P+DYvDCqT1Bni9/pOnkHylPQTcaqcFVoBsZvJmtGbwAXn+aS9nZ2RdxaLyJgysM7ihOFkZERKzq3r17OR1bjX4Muv0cEtcEe0jAdxe+VsKn1XAPS3O1WTkaRAVvHVTLOnToMD+phT3a7Azu2rXrXhy9AmkEsgYHy8LDwxf27NlTp1/I7t27H2T2XsdWGBYWdnnv3r3/kD7YhN+xcKyBtxzeZIuXQOPQP0+eQJ/U999YtqNYMXspuybXAAsLC6OKioo0a+PUCkefImYxmrkWC8F1xZ5FPYZ8LbYtlq0tJMG8Af8D+F4H9yg7J7YB1F/H3k+DQHkKmA/tGKvstwqW1Al37NixdBNcHQT30/hmcmNwwmJfTNbd9ia2Ng1O/LGxsbPwfQT+O9gmQ6WzEv52UB6IfQX2GPIHDPgcy26X/5rBPXv2dK6rq/uGBpfQuJjNfAebeau9gcoahIqKikKKDSyhC60l5MSpbvbPE3DeAmc3VCco/8TSeoml9S11z0SnZ7AFltJuDUHd7QaE/xH0Gmwo/fPhXGjHNQZogtsKMA1AVvv27Uew1/LsYKusvUn5LRyvwvF4S++UjPwgDqj34OzmtJn623BMhUP7u0k6fPhwh5KSkiLan+rcufN5cXFxlU1AKBiI4WDWkvViega+pyxcYIliCGPm1iEVXHZUVNRAr+DUEJIxhuBzI5sIM2Afw9kN/E5Ww/UxMTFnU+4JWKOuzk5Rh5o0Nor4+HjN9jaqUcXFxTd54XQtwT8crpPgnyTgxkEPBIjiJQxDIChhmkdy9JZ6kUkPNnABR0dHf+OFq62tfRlbF3I6HRigCzoxMbGE0c1NS0vTsruSXAPXbAajvxcPmMAyBpfihZGerfQ9YrLKYJcT02Uq+1nDunemU9aB0uyRqwZ79+5tD64L+bg6LJ0z7d+/X9dK4ORjZO+jXOfEEOiv6F7Dt5/BmOi02+oFpnyBTedahHM1vp6GM4L8ic4KP4X5QjNz0wFsdm1pU/KwTqCN9q4OGdd08uTJRDCRODvCzOW4glDiM93YPGcHzFGDaTFA4YhhAX613S4oLy8f6afS0RB4XpbG/p8J+tB42Hk5MYPqZXbq640iXAG+oQoEH+Xk5AQeu060vc5LRg9rfSnoVeGaOIHzwVTB2ZU3bC9XEEqugKuMLdsLIw7Z4DvkhbHr2XKP0+ZO8BXM/iY/S+g5KhtRdmQvfMEeO9fewFnmdNVJ9afwYPUubJI4pKqxfyQD18RyymFOEB25FN1D+NZgvee0W3XadjflFp+BHCy3gl0oPMFN5HDL1wzWcxrqEs2DLIn9s0EHiUBeiTaZsjEgV3theHjPwvYn+Soc72Amh2nTE1gP7tGZ+PqOrC+I5eyb7V486IfJBtZzlmXnJL6YFbEKHN3zPc/ErZc+cE3oNER5M7kI3UAOkk26xwTwSB9ID+FwD3sIr5tjvHJug/MATi9jJr9i0xdT1l5fQo7CJp7ZXhwMyjnYBpFruUP1HnZN4K5gsPWdKM4NzNw8CxgIUBVGMZNpHUpRy28wDXYw2o0fnFYDI9dBpNfH2OaWtLmb9PvMIrDZyGqkBnMLvm7D5xhyheFsIhhAzXQo+E1eVxKrYzy4rTQ+j7ye4LT/rEOm6W8yOmgIbgvEcQDLyHfR6Aund5bZWnRjyC9ycT/mtAdb18CxkvbRj2j6MIqBWGfnRK87XJ9OgUc2A7aWZTke7L/u3MYZtBrzwZrF/hkE8FdIYsmfEszSvLw86zoJQPngFXEluBnNvUQs3tOR+PQR3LvIaNqlO4PTJDBzm7DNwb9e2S8Q3DhncPLZJEAp9VXO17I+R3QCCjOjqqoqB9LJph7So0cPXRcLqIfzjv3Q7Bc1DzrBpa+PGyGq5Vp60CI0h9QrBP879qvxX0xwI1lhcyk3LksLL9niBcvsjaXxMgit6+Nnnl+zGbF0dGEE/ZVxlon+OvbdYbuD0y3DN4899Wygcz7fNGbvVf3eWlZWpnemnmFnG86tBDeJ4PKb89FigGrM27ITP/NptqZSte40HRrvENR6Tkh9qgygno/TCQS/rTmnbjZtgerq6qXwTDL2uZzCm+FWYGPRB7aIfFB/1Lls3Tila1WAVmM2dQqOnsHJLchQo69Fbkc3WDqkLu4V7OPnWvMDFG3aMWujaaNf7M43nFr+pdT7mrrEUQbvVa6LJQkJCVU2fbPF0wrQYqJDiTjXb6NT0J1l6e3SBKq7aQN5B0tpF7rACcdAaZlpxofAMYEcZ29rL4PZSdYWeZ9Zc/0wtuOd5TMK0CLRF3dpael1OB+BTl/Vnh212rQkCQaahl+Qn4H9jKD0WXXGKagA7V7plI/roh97Rr909aWu5ZWGtA4FO9wqa0bzwWcog5XczmwfsQDByjYL0KsjdDq0oKAglv86xbKHOhKAvuLLOnXqdNzrNxYvrv/1LiPwFxZNaeYJHMFzAAAAAElFTkSuQmCC"
								alt="빈 최근본상품 아이콘"> 
								<div>최근 본 상품이 없습니다.</div>
						</div>
					</div>
				</div>
				<div class="zzimTop"> <!--화살표 div 삭제-->
					<a href="#" class="zzimTopBtn">TOP</a>
				</div>
			</div>
		</div>
		</div>
			<%
			}else{
			for(String rct : recentIdx){
	
				HashMap<String,String> rctList = recentproductDAO.recentphoto(rct);
	
	%>
	
						<div class="zzim3Box1">
							<a class="zzim3Btn" href="productDetail.jsp?p_idx=<%=rct%>">
							<%
							out.print("<img src='./uploads/" + rctList.get("p_picture") + "' alt='상품이미지'>"); // 상대경로. 얘만됨
							%>	
								<div class="zzim3Box2"></div>
						</div>
						</a>
						<%
							}
						%>
					</div>

				</div>
				<div class="zzimTop">
					<a href="#" class="zzimTopBtn">TOP</a>
				</div>
				<%
			}
				%>
			</div>
		</div>
		</div>
						<%
					}
						%>

	
	
    <div class="searchContainer">
        <div class="con_kate">
            <div class="kate">
                <%
                	// 검색한 텍스트와 현재 지역으로 리스트 가져오기
                	List<HashMap<String,String>> LocSearchList = productDAO.searchProductArea(searchText, cLocation);
                	int LocSearchSize = LocSearchList.size();
                %>
				<div class="container_text">
					<div class="container_sc">
						<form method="post" action="search.jsp">
							<div class="container_sch">
								<input type="hidden" name="searchText" value=<%=searchText%>>
								<input type="hidden" id="cLocation" name="cLocation">
								<span class="container_sch01"> 우리동네 </span> 
								<span class="container_sch02"></span> <!-- 현재 위치 지역 (도 시 동) -->
								<button type="submit" class="container_scmap"></button>
	
							</div>
						</form>
					</div>
				</div>

				<div class="container_main">
				<%
					for(HashMap product : LocSearchList){
				%>
                    <div class="item_box">
                        <a href="productDetail.jsp?p_idx=<%=product.get("p_idx") %>" class="item">
                            <div class="item_img">
	                            <%
									out.print("<img src='./uploads/"+product.get("p_picture")+"' alt='상품이미지'>"); // 상대경로. 얘만됨
								%>
                                <!-- <img src="img/번개장터이미지/댓글.png"> -->
                            </div>
                            <div class="item_text">
                                <div class = "text_top">
                                    <%=product.get("p_name")%>
                                </div>
                                <div class="text_bottom">
                                    <div class="text_bottom1">
                                        <%=product.get("p_price")%>
                                    </div>
                                    <div class="text_bottom2">
                                        <%=(String.valueOf(product.get("p_regdate"))).substring(0,10)%>
                                    </div>
                                </div>
        
                            </div>
                        </a>
                    </div>
				<%
					}
				%>

                    
                    
                </div>
                
				<!-- 검색 결과 -->
				<!-- product 테이블에서 검색한 문자열을 포함하는 p_name의 정보 가져와야함 -->
                <%
                	List<HashMap<String,String>> searchList = productDAO.searchProduct(searchText);
                	int searchCnt = searchList.size();
                %>
                <div class = "container_text">
                    <div class="container_sc">
                        <div class="container_sch"><span class="container_sch1"><%=searchText%></span>의 검색결과 <span class="container_sch2"><%=searchCnt%>개</span>
                            </div>
                            <%-- <div class="sch_chk">
                                <span class="container_sch1"><%=searchText%>&nbsp;</span>
                                <span class="container_sch2">키워드 알림 받기</span>
                                <button class="openBtn"> <input type="checkbox" id="chk1"><label for="chk1"><span>키워드</span></label></span></button>
                    </div>
                    <div class="sch_menu">
                        <a href="#" class="sch_menu1">정확도순</a>
                        <a href="#" class="sch_menu1">최신순</a>
                        <a href="#" class="sch_menu1">저가순</a>
                        <a href="#" class="sch_menu1">고가순</a>
                    </div> --%>
                    </div>
                </div>
                
                
                <div class="container_main">
                <% 
                	for(HashMap product : searchList){
                %>
	                <div class="item_box">
                        <a href="productDetail.jsp?p_idx=<%=product.get("p_idx") %>" class="item">
                            <div class="item_img">
                                <!-- <img src="img/번개장터이미지/댓글.png"> -->
							<%
								out.print("<img src='./uploads/"+product.get("p_picture")+"' alt='상품이미지'>"); // 상대경로. 얘만됨
								
								// 절대경로 1
								//out.print("<img src='C:\\CODE\\zeus_uploads\\"+product.get("p_picture")+"' alt='상품이미지'>");
								// 절대경로 2
								//out.print("<img src='C:/CODE/zeus_uploads/"+product.get("p_picture")+"' alt='상품이미지'>");
							%>
                            </div>
                            <div class="item_text">
                                <div class = "text_top">
                                    <%=product.get("p_name")%>
                                </div>
                                <div class="text_bottom">
                                    <div class="text_bottom1">
                                        <%=product.get("p_price")%>
                                    </div>
                                    <div class="text_bottom2">
                                        <%=(String.valueOf(product.get("p_regdate"))).substring(0,10)%>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                <%
                	}
                %>            
                </div>
            </div>
            
        </div>
        
    </div>
<div class="modal hidden">
        <div class="bg"></div>
        <div class="modalBox">
            <h2>모니터</h2>
            <button class="closeBtn"><img src="./img/번개장터이미지/exit.png"></button>
            <h4>하루 1회 알림</h4>
            <div>
                <p class="leftAlign font14">매일 오후 4시 이후 한번에 알림을 보내드릴게요.<br>상품이 등록될 때마다 알림을 받고 싶다면 이 옵션을<br>해제하세요.</p>
                <p class="rightAlign"><input type="checkbox" id="custom" name="normal" class="image_checkbox"><label
                    for="custom" class="image_checkbox"></label></p>
            </div>
            <table>
                <tr>
                    <td>카테고리</td>
                    <td>모니터</td>
                    <td><button class="categoryBtn"><img src="./img/번개장터이미지/arrowRight.png"></button></td>
                </tr>
                <tr>
                    <td>선호거래지역</td>
                    <td>역삼1동</td>
                    <td><button class="areaBtn"><img src="./img/번개장터이미지/arrowRight.png"></button></td>
                </tr>
            </table>
            <h4>가격 제한</h4>
            <p class="key_price"><input type="text" placeholder="최저가 "> ~ <input type="text" placeholder="최고가 "></p>
            <p><button class="closeBtn2">확인</p>
        </div>
    </div>
    <div class="modal2 hidden">
        <div class="bg"></div>
        <div class="modalBox">
            <button class="backBtn"><img src="./img/번개장터이미지/back.png"></button>
            <h2>카테고리</h2>
            <button class="trashBtn"><img src="./img/번개장터이미지/trash.png"></button>
            <div class="key_category1">
                <h4>&nbsp&nbsp전체 카테고리</h4>
                <table>
                    <tr>
                        <th><button class="cateBtn1">&nbsp&nbsp&nbsp&nbsp디지털/가전</th>
                        <td>13,964</button></td>
                    </tr>
                    <tr>
                        <th>&nbsp&nbsp&nbsp&nbsp기타</th>
                        <td>330</td>
                    </tr>
                    <tr>
                        <th>&nbsp&nbsp&nbsp&nbsp패션잡화</th>
                        <td>149</td>
                    </tr>
                    <tr>
                        <th>&nbsp&nbsp&nbsp&nbsp생활/문구/가구/식품</th>
                        <td>65</td>
                    </tr>
                    <tr>
                        <th>&nbsp&nbsp&nbsp&nbsp도서/티켓/취미/애완</th>
                        <td>31</td>
                    </tr>
                </table>
            </div>
            <div class="key_category2 hidden">
                <h4>&nbsp&nbsp디지털/가전</h4>
                <table>
                    <tr>
                        <th><button class="cateBtn2">&nbsp&nbsp&nbsp&nbsp모바일</th>
                        <td>12,155</button></td>
                    </tr>
                    <tr>
                        <th>&nbsp&nbsp&nbsp&nbsp노트북/넷북</th>
                        <td>1,042</td>
                    </tr>
                    <tr>
                        <th>&nbsp&nbsp&nbsp&nbspPC/모니터/주변기기</th>
                        <td>472</td>
                    </tr>
                    <tr>
                        <th>&nbsp&nbsp&nbsp&nbsp가전제품</th>
                        <td>221</td>
                    </tr>
                    <tr>
                        <th>&nbsp&nbsp&nbsp&nbsp음반/영상/관련기기</th>
                        <td>29</td>
                    </tr>
                </table>
            </div>
            <div class="key_category3 hidden">
                <h4>&nbsp&nbsp디지털/가전>모바일</h4>
                <table>
                    <tr>
                        <th><button class="cateBtn3">&nbsp&nbsp&nbsp&nbsp태블릿</th>
                        <td>10,530</button></td>
                    </tr>
                    <tr>
                        <th>&nbsp&nbsp&nbsp&nbsp케이스/범퍼</th>
                        <td>693</td>
                    </tr>
                    <tr>
                        <th>&nbsp&nbsp&nbsp&nbsp스마트폰</th>
                        <td>499</td>
                    </tr>
                    <tr>
                        <th>&nbsp&nbsp&nbsp&nbsp보호필름/액세서리</th>
                        <td>196</td>
                    </tr>
                    <tr>
                        <th>&nbsp&nbsp&nbsp&nbsp케이블/거치대/주변기기</th>
                        <td>140</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="modal3 hidden">
        <div class="bg"></div>
        <div class="modalBox">
            <button class="backBtn2"><img src="./img/번개장터이미지/back.png"></button>
            <h2>지역설정</h2>
            <button class="okBtn"><img src="./img/번개장터이미지/ok.png"></button>
            <hr/>
            <div class="key_location">
                <h4>주소검색</h4>
                <p>원하는 선호거래 지역을 검색하세요</p>
                <button class="myloca">내 위치</button>
                <button class="srchloca">주소 검색</button>
                <hr>
                <h4 class="key_h4">선택된 지역</h4>
                <p>1개의 지역만 설정 가능합니다</p>
                <p><img src="./img/번개장터이미지/minus.png">서울특별시 강남구 역삼1동</p>
                <hr>
                <h4 class="key_h4">이용한 지역</h4>
                <p><img src="./img/번개장터이미지/plus.png">서울특별시 강남구 역삼동</p>
            </div>
        </div>
    </div>

	<!-- 모달창 처리 -->
	<div class="black_bg"></div>
	<div class="modal_wrap">
		<div class="popup" id="pop1">
			<div class="modal_close">
				<a href="#a"><img src="./img/번개장터이미지/close.png"></a>
			</div>
			<div class="popmain">
				<img src="./img/번개장터이미지/번개장터.png">
			</div>
			<div class="poptext">번개장터로 중고거래 시작하기</div>
			<div class="poptext1">간편하게 가입하고 상품을 확인하세요</div>
			<ul class="login_list">
				<li class="kakao"><a href="javascript:kakaoLogin();">카카오로 이용하기</a></li>
				<form method="post" name="kkoEmail" action="kakaoLogin_ok.jsp">
					<input type="hidden" name="kakaoemail" id="kkoEmail" value="">
				</form>
                <script>
                // ba91c3548db43f3e70c8abf19b404787
                window.Kakao.init("ba91c3548db43f3e70c8abf19b404787");
                function kakaoLogin() {
                    window.Kakao.Auth.login({
                        scope:'profile, account_email, gender',
                        success: function(authObj){
                            console.log(authObj);
                            window.Kakao.API.request({
                                url:'/v2/user/me',
                                success: res => {
                             	   const kakao_account = document.getElementById("kkoEmail")
                                    kakao_account.value = res.kakao_account.email;
                                    console.log(kakao_account);
                                    document.kkoEmail.submit();
                                }
                            });
                        }
                    });
                }
                </script>
				<li class="naver" id="naverIdLogin"><a id="naverIdLogin_loginButton" href="#">네이버로 이용하기</a></li>
				<form method="post" name="naverForm" action="naverLogin_ok2.jsp">
					<input type="hidden" name="naverEmail" id="naverEmail" value="">
				</form>
				<script type="text/javascript"> 
	var naverLogin = new naver.LoginWithNaverId({ 
    clientId: "RAkcajQ6qKE9eoL2H2UK", 
    callbackUrl: "http://localhost:9090/ZeusMarket/naverLogin_ok2.jsp", 
    isPopup: false, 
    /* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */ }); 
    /* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */ 
    naverLogin.init(); 
    /* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */ 
    window.addEventListener('load', function () {
        naverLogin.getLoginStatus(function (status) {
            if (status) { 
                /* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */ 
                console.log(naverLogin.accessToken.accessToken)
				var email = document.getElementById("naverEmail")
                email.value = naverLogin.user.getEmail(); 
                var profileImage = naverLogin.user.getProfileImage(); 
                var name = naverLogin.user.getName(); 
                var uniqId = naverLogin.user.getId(); 
                console.log(email)
                naverForm.submit();
                if (email == undefined || email == null) { 
                    alert("이메일은 필수정보입니다. 정보제공을 동의해주세요."); 
                    /* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */ 
                    naverLogin.reprompt(); 
                    return; 
                } else if (name == undefined || name == null) { 
                    alert("회원이름은 필수정보입니다. 정보제공을 동의해주세요."); 
                    naverLogin.reprompt(); return; 
                } 

                } else { 
                	console.log("callback 처리에 실패하였습니다."); 

                } 
                }); 
            });
        </script>
				<li class="email"><a href="./login.jsp">본인인증으로 이용하기</a></li>
			</ul>
			<div class="popfoot">
				<div class="popter">
					도움이 필요하면 <a href="#" class="popter_a">이메일</a> 또는 고객센터<a href="#">1670-2910</a>로
					문의 부탁드립니다.
				</div>
				<div class="popter">고객센터 운영시간: 09~18시 (점심시간 12~13시, 주말/공휴일 제외)</div>
			</div>
		</div>

	</div>
	</div>
	
	
		<div class="Aclogoutpage">
            <div class="Aclogoutpage_top">
            <h2 class="logoutTxt">로그아웃</h2>
            <p class="Aclogoutpage_center">로그아웃 시 6개월 이상 경과된 번개톡
            대화 내용이 모두 삭제됩니다.
            계속하시겠습니까?
            </p>
            <div class="Aclogoutpage_bottom">
            	<button type="button" class="Aclogoutpage_btn2" onclick="window.location.href='logout.jsp'">확인</button>
                <button type="button" class="Aclogoutpage_btn1">취소</button>
            </div>
        </div>
        </div>

    <footer>
		<div class="footer1">
			<div class="footer11">
				<a class="footerA" href="/customer/notice">공지사항</a>
				<a class="footerA" href="/customer/faq/1">자주묻는질문</a>
				<a href="https://terms.bunjang.co.kr/terms/service-policy.html" 
				target="_blank" class="footerB">운영정책</a>
				<a class="footerA" href="/qna">1:1문의하기</a>
				<a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1138645836"
				target="_blank" class="footerB">사업자정보확인</a>
				<a href="https://terms.bunjang.co.kr/terms/service.html"
				target="_blank" class="footerB">이용약관</a>
				<a href="https://terms.bunjang.co.kr/terms/privacy.html"
				target="_blank" class="footerB"><b>개인정보처리방침</b></a>
				<a href="https://terms.bunjang.co.kr/terms/youth-policy.html"
				target="_blank" class="footerB">청소년보호정책</a>
				<a href="https://terms.bunjang.co.kr/terms/location.html"
				target="_blank" class="footerB">위치기반서비스 이용약관</a>
			</div>
		</div>
        <div class="footer_center">
            <div class="footer_center1">
                <span class="footer_logo"><img src="./img/번개장터이미지/번개장터로고.png"></span>
                <span class="footer_logo2"><img src="./img/번개장터이미지/푸터쪽.png">&nbsp;회사소개</span>
            </div>
            <p class="footer_center2">누구나, 무엇이든 쉽고 편하고 안전하게 거래하는 세상을 꿈꾸고 있습니다.</p>
            <p class="footer_center3">
                <a href="#"><img src="./img/번개장터이미지/페이스북.png"></a>
                <a href="#"><img src="./img/번개장터이미지/블로그.png"></a>
                <a href="#"><img src="./img/번개장터이미지/인스타.png"></a>
            </p>
        </div>
        <div class="footer_bottom">
            <p>대표이사: 이재후 | 개인정보보호담당자: 이동주 | 사업자등록정보: 113-86-45836 | 통신판매업신고: 2019-서울서초-1126</p>
            <p>주소: 서울특별시 서초구 서초대로38길 12 마제스타시티 타워2 지하1층</p>
            <p>고객센터 대표번호: 1670-2910 | FAX: 02-598-8241</p>
            <p>고객센터 운영시간:전화문의 : 9시~18시(주말.공휴일 제외) | 1:1문의 : 9시~18시</p>
            <p class="footer_bottom1">※점심시간 12~13시</p>
            <p>고객센터 문의 help@bunjang.co.kr | 제휴문의 partner@bunjang.co.kr</p>
            <p>호스팅서비스 제공자: Amazon Web Services (AWS)</p>
            <br>
            <p>“번개장터_컨시어지” 상점의 판매상품을 제외한 모든 상품들에 대하여, 번개장터㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래 당사자가 아니며, 입점판매자가 등록한 상품정보 및 거래에
                대해 책임을 지지 않습니다.</p>
            <br>
            <p class="footer_bottom2"><b>우리은행 채무지급보증 안내</b></p>
            <p>번개장터(주)는 “번개장터_컨시어지” 상점이 판매한 상품에 한해, 고객님이 현금 결제한 금액에 대해 우리은행과 채무지급보증 계약을 체결하여 안전거래를 보장하고 있습니다.</p>
            <p class="footer_bottom3"><a href="#">서비스 가입사실 확인</a></p>
            <br>
            <p>Copyright ⓒ Bungaejangter Inc. All rights reserved.</p>
        </div>
    </footer>



</body>

</html>