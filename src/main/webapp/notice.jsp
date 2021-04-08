<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%
	request.setCharacterEncoding("UTF-8");

	String username= null;
	String idx = null;
	if(session.getAttribute("username") != null){
		username= (String)session.getAttribute("username");
	}
%>
<!DOCTYPE html>
<jsp:useBean id="productDTO" class="com.koreait.product.productDTO"/>
<jsp:useBean id="productDAO" class="com.koreait.product.productDAO"/>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="./css/title.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="./js/script.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
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
						<div class="zuesViewBox1">
							<div class="zuesViewBox2">
								<div class="zuesViewBox3">
									<a class="lastSearch srchClick">최근검색어</a>
									<a class="popularSearch">인기검색어</a>
								</div>
								<div class="searchBox1">
									<div class="searchBox2">
										<div class="searchBox3">
											<div class="searchBox4">
												<div class="serachOne">
													<button type="button">아이폰</button>
													<button type="button" class="serachRemove">
													<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
															width="10" height="12" alt="최근검색어 삭제 버튼 아이콘">
													</button>
												</div>
												<div class="serachOne">
													<button type="button">파워뱅크</button>
													<button type="button" class="serachRemove">
														<img
															src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
															width="10" height="12" alt="최근검색어 삭제 버튼 아이콘">
													</button>
												</div>
												<div class="serachOne">
													<button type="button">캠핑카</button>
													<button type="button" class="serachRemove">
														<img
															src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
															width="10" height="12" alt="최근검색어 삭제 버튼 아이콘">
													</button>
												</div>
												<div class="serachOne">
													<button type="button">ㅁ</button>
													<button type="button" class="serachRemove">
														<img
															src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
															width="10" height="12" alt="최근검색어 삭제 버튼 아이콘">
													</button>
												</div>
											</div>
											<div class="searchNo">
												<img
													src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGgAAABaCAYAAABUrhMHAAAAAXNSR0IArs4c6QAADUFJREFUeAHtnbtvHMcdx+94Jz7E90NPSxTk2EEAB4akyBZkBIhdxEAQFyliwYghF0mVNGkCBC6CuDMSIP9BgCBJEUeBO1dq7MZ6WILkIi5sGbBIUVYomRRFkeJDPDKfz/j2fKZOFI+83TvqdoAfZ252dn6z3+/+Zn47O7PMXrhw4SctLS2Dy8vLv89mszszmcwgkkPSUD0CBU6ZWFlZuQmmfwLTsfv3759/4YUX5qqv6usz8pJDhQOQkyerBclutLL0vIBdi1iKKdjOdnZ2iumGQ17L4extVHrAGNlUhRtuyeNxotj1I10Q9BtkpFAonOf37EYvL1/s1qy4lQpX+D1GWlNNQ/UI5IBwDxi2Ig4VM0tLS5saLuzWrMigaY6h4LVcLidJaagSAaxlHxi+w2n7EC1pOp/Pb6pHkqByhguSc+TIkRHy01AlApcuXcowZES9j7iWY1tlbV8X3xS7G9KYnlQVAilBVcGVfOGUoOQxr0pjSlBVcCVfOCUoecyr0pgSVBVcyRdOCUoe86o0pgRVBVfyhVOCkse8Ko0pQVXBlXzhlKDkMa9Ko3NxNQ9MuObOnz+/p7W1ddNzUTVv3BoVLi4uFo4dO3aDCc9oPm2N0skcioUgyWEW9x0mDp3V3TKBNo/R9tdocMPM5sdCkJZTJMeXgFsqNJrVp2NQg98+sViQfbndRYNfe6Xmjdn2SgfqlRcLQQ609uWN1l08CuTISXhUuSSPx0JQ0QvaihaUJPbr0pWOQeuCqX6FUoLqh/26NKcErQum+hVKCaof9uvSnBK0LpjqVygWLy6di6sdobEQlM7FNThB6Vxc7QhKx6DaYRlLTbF0celcXO24ioWgdC6uwQlK5+JqR1A6BtUOy1hqSgmKBdbaVZoSVDssY6kpJSgWWGtXaUpQ7bCMpaZY3OxGnYuLXmk/at0b7c+ePXu23W8czM/Pty8sLLQMDQ3lSWfdtd3R0ZG5c+dO+J5EV1dXgRVMKzMzM/fZROz3Jmp608dCUKPOxa1n3dvFixe30f6O9vb25/hKyADnHGVjdc+9e/eGMZF20n3k59ra2twVDyeFO+TPbd++/YrHkV6kZiEWghp5Lq7SQpbIYrAE8QgfoiB2Td+AMUT0UGaYL4e0Fa0kR5pDmWUkEESZRcp4fglT64XQ9i+++KL94MGDCxxbQaoKpcqqOusxK3z16tU2LOV5Lms3QJ8kvaO48NKPe2gVsuFXWTicDcuZBV8YiLuNyI8WaXaYXwwSemRqamrw/fffv/TSSy/NRwfWG8dCUAPPxX1r3dtbb73V8sorr3QznnQB2H5A3kusxfj9op1YSY50JhJBNV0eKBcwJN6GSFhJKOeXXJ6A2GW6xBG6z5n33nvvLnq1vHWFLCeVm90IjfrRZj9kQSMbcvF8uZNAG7Mff/xxL9i9Tno/aP0c6SPdA6gtdoWETHd3dwaLyugY2K2ZNhS7uAx1+vGKzNzcXAYHInP37t0MVpNhnJIoiZhEpij/H+Jr1P2vQ4cO3SEux51DlUMsFoRyV2eOVVZZ/1wtB3J6ANLP4OwHvP2AvIt2d0mK4ENQxnQUYwEh32OUC2kICGkJkpzoPAnyGPktyBDpNmQYyfb09AzQpWZowzTySEuKxYLqT8HaLbhy5UoP3drrlBpGfgFw/YArOdmBgYFACkAGgiKLkRRDFIcf/OHckIxiyVEYd4J13b59298rEDVDwSnO/zfxKPKPo0eP6mCsGWrqs6+pqTEOZvWoAMzPhfnho/DRI8jphojstm3bAjnlsVahSMxqcrykKD8qV36u1udv61YHZfuRoBeL6z5z5kwH7fj2oLYKp1i6uFU6GuYnnlQbd/RhwNFlfhVwdtG4Lq1k165dgRzHnAjsjTbc8/v7+8PYZNfoODU+Pm432InOn0LSONb6X8qN0t35PbmHendNRRDdVw6QdgPOHoDqA6huuzUJiu52fle0lGrJkiTqDxbkuerQWrDebrq7RY7vIXsRgtbkYM2D1Taqkct/8sknrUzZDAHOr2inrnQvIJXGHC2nVuREOEgQ00VhTNKKlImJCYnqRt6g3Ehvb+852rb4zDPPLEbnlcdNMQbhLek2+8DZiewAuPDhXO9yxwgluuPLwalFWpJW66Fen6+cpRhCOm2bbaykr2JmpYJbOe/ll19uw2v7AXft8wDjIL0DUJxPy/T19WW4iwOIcV2jBKnHcUmd6qYtOxGfv47z7PS8baykvykIclYaMAYUQGhFGBLyYVwQPCXuEOmJ9HKTOGXkt0317PrpfivuiI+/ZXFf+TrqBxTvzsMQdJi4TbAcc+IYd9Zqjnp5PRHENMS0MSY+pzAb3rwWxDSMrwZ6AKUHAE0Hh6DWTsFa5Hisgl4NxDb1MA5WNJaKmVb2OAVetNmVPM01PY0Vmc5wxwYxnVRQl16dYpq2+J1yZzOGed9k+oHQFG42lpMFDL04JTBiF6MkHVbpLbXLNlZqS1MQxBgkEz6Y9hE3TBdHe0K7aNOdYhsf4Cj5W+iBJiSWoWtb8pTsYpSkQwW9GslDDaVpCAIYX4eWpvchqzQTnSRJqwgq3SEP6+KahiBI8B2VEkK9CFql13cVQXC1K77AawqC6N8LADOlAIjpMD/mexvTSQV1MVkbpKhXq/Yd0RSzCyXrLm/PQ/u+8kJbPV28O53SVwIj5IXXAUlf2yq98LQS2tXUFkT/vsRd6nqAaxCy5N3Lc0eQ4p2cCE8V9N5H8VXyrxKbfiA0RRfHAg67j+miLAuU3Vs9urhVekO7uHGmi21sToKwlgWs6IICOQt2MyzVDZIUSd4U6nXVj+Jv2wI5FxTb+AA7ZDTFGMQUv47Bba7XeS9XgBYYrMPq0GhMcF4uzqCeyHqM+a1HuQg5LsuatI2V9DdFF3f69OkFZq4/AoCzAOJYdJO3mwWm+MPqG94VxeowSI46XOnDvGAGvQXbYFu4Uc5x/IJtrESQFhQx5y2Ug919/iepxykASBZC/M+Mg4ASbkrSgRQXGJIX0sZKLUO5HnVJFkGLniC+xSPADNYzxxvVh7rZFrTRvtDyH+T5td6INLK3fvCVtis/CeFNpjHX6YdvM5OTk+GVN88hIY5mmmtx1ZKjtygx6ikjSIflbxwfoWv96mHrEWyDd9VNYv9NZxfilPeW+pSyF1FN4BpLxQXQ8cA8F3QY/I0zsemZbslXJMW6fUClblSG554ZdHyJ3hsQt6Yx5GHwz1Tkq+BfIy5icPtFU4xNXGfwpgTPdWt0N44PwZJcPyBR1QZJl5jp6elAjqt4rL9oPXqTH3F8lHrPsk5h/PDhwxXHnkivWyrGYHK2eNI90i5HjdelibTXP5YBl0C5Xs7Vpo5VoVXGenaRd6eVGaI4/OCPhBiiuGgpJcuRGK3S45zrEuBQHKKWIE/rWXOuKevyUxdVUEkvnk7LzZs3wxY/a3lcg04DK3lW8Kj6AOwNgHsCAF3x2aXVKK6+kZxojbZvYM3XyiKSBF1CBH12djYQEe1u0BLNVyLywFNCdKu/pK7fcmyM9ChrtCvOInCsef9vN6CF7SfcmG+Aw37kZ4jbT3ohoLT9RIIkhS2RgSCdifKgpUnC6u0n5DvgOBmqQ6CVeKJmaNpx/4/IKFZ0GRd8/sSJExXHom9GTEo3W8C1bTl58mQ3d30XRP2Q698LqL8E1Go2cAXYOC9YijGE+ZxzC5kg/U8KOCH6fcQFkz9GdMo+I3Z4eRNLvfHpp59OVCKpqQkCoBBYVN/OgH0EMHdLEJk7EL1Zt0C6pdHX5D4zilc0PkdjRxhHKGesxejPO0Nwnfgr5O90Z/OMRc+S56rWE4jj3Qzx/5A30TtGl/vZU0895XlRvZzaxF1cuPpv/rgtpY1nlrz7SXlucsfDMYBzW/1zFOsF0O8Qu+hEj1fnQm9CUpxCmqecnpnd2UXSk4xN56hjhjonGduXIaiD+nZBll3bfup7lti9rZeJR+ki/0DZcVaY6qiVSGqKuTgAeFRYOXjwoN1QxoXsgKXV7EbuIjsRCRKrDgCWBHfOLRH7GuM2x8oJGiF/knJjzhCwnTS4hadOnZofHh72AVnHwPh7xI5L7rRY5qbYibO29MEHH+h2W3cIaRcXIVEWA1jpQxY8SHYw4LccOHDADcHZW7duhS5OL1DHACsp4ECsXLt2reBbUba4zOHRLR8/flzSSpZg9XSlebpSu869WNjbHH+C9B7E56PT/B7Biv5y/fr10niUWhDorA5FYMPcEMdmVx/f6O8XX3yx8OGHH05ARh4ytSTXjGupWtJepIDDMMTNoAd4m3YspxYEKkkGrfPzzz9vxbX+LkTt4/fbRZKC40BbTvF7lC7vr8wyTDnYpSFBBLTOy5cvL0HAOGq/VMjzuYgoqyU5J9pJ9xm4SS0IROoRcBpyjGPtg4OD7rpwz9LvED+G8a4OBsfeffLJJ++mFlQPdtDpQynk6OHdQK4ho5Bj/BXxFG55mLRLLQhE6hn8uhYzGTl2mfuthize4KyeIQ7FLBb1LS+wnu1set1YjTsdHjCY/wOqy8W+K5QksgAAAABJRU5ErkJggg=="
													width="52" height="45" alt="검색어 없음 이미지">
												<div>최근 검색어가 없습니다.</div>
											</div>
										</div>
									</div>
									<div class="starSearch1">
										<div class="starSearch2">
											<div class="starRank">
												<a class="starBtn"><span class="starNum">1</span>냉장고</a><a
													class="starBtn"><span class="starNum">2</span>그래픽카드</a><a
													class="starBtn"><span class="starNum">3</span>아크테릭스</a><a
													class="starBtn"><span class="starNum">4</span>노트10</a><a
													class="starBtn"><span class="starNum">5</span>방탄</a><a
													class="starBtn"><span class="starNum">6</span>pcx</a><a
													class="starBtn"><span class="starNum">7</span>자전거</a><a
													class="starBtn"><span class="starNum">8</span>로드자전거</a><a
													class="starBtn"><span class="starNum">9</span>스쿠터</a><a
													class="starBtn"><span class="starNum">10</span>루프탑텐트</a>
											</div>
											<div class="starRank">
												<a class="starBtn"><span class="starNum">11</span>나이키</a><a
													class="starBtn"><span class="starNum">12</span>스톤아일랜드</a><a
													class="starBtn"><span class="starNum">13</span>주술회전</a><a
													class="starBtn"><span class="starNum">14</span>캠핑카</a><a
													class="starBtn"><span class="starNum">15</span>pxg</a><a
													class="starBtn"><span class="starNum">16</span>골프백</a><a
													class="starBtn"><span class="starNum">17</span>mcm</a><a
													class="starBtn"><span class="starNum">18</span>아이폰</a><a
													class="starBtn"><span class="starNum">19</span>tv</a><a
													class="starBtn"><span class="starNum">20</span>에어팟프로</a>
											</div>
										</div>
									</div>
									<div class="storeSrch1">
										<div class="storeSrch2">
											<div class="storeSrch3"></div>
											<a class="storeSrch"><img
												src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAcCAYAAAAJKR1YAAAAAXNSR0IArs4c6QAAAZdJREFUSA3tVktuwjAQTRz2LFlWYlWpu8IBULvhIPlcoTfoGfLpBXKBXoCKDazoortKnCCsoyR9Y2WQEzWJkLAVJCzBjGfMzPObsY1tKSOKol1VVQvFpFUVQiw9z9urSYQ6ueu3wIDNIMMwfIf+xnNTEn00Rx/9cr5zD9m2/cpGw/JFzTehCdiZQjzjcwyC4IFsukeSJOuiKD5xqomID84nGQJtKzgcsPTFDt0SYLbIUeLTYEgCKsuSjRvdQDg+KnGCfgARM9x/T2yXgLh/II0BIgBckbpsEpOI43gGAyE8ua77La2GvpgASK6QRQzxZAsH1dTYcBxHVgSErNI0dSixUOha47RVYMzIW0bvZp7nx3r30yzL6JQ3GJI+AHysF+kWjTxMzMT3/Tll5pceZfvRjaSOT3kW7RefemhUQ97UXYiYtS6/urtL1nbFI/ttMcQ7UZkgWx8bl6zl+KocHUN3QGp5/tN7Txn/AP8GdrjFeWrhEjvr11ZGV7JehnCLL6/NwFC88TPU7pehHbF/qK/acbvWj46hP8RApehW+HAaAAAAAElFTkSuQmCC"
												width="18" height="14" alt="추천 상점 아이콘">상점검색 &gt;<span
												class="storeSrchTxt"></span><span class="storeSrchGo">상점명으로
													검색</span></a>
										</div>
										<div class="storeSrchEx">
											<a class="srchExGo"><span class="srchTxt">마이비 교통카드</span></a>
											<a class="srchExGo"><span class="srchTxt">마이비 교통카드</span></a>
											<a class="srchExGo"><span class="srchTxt">마이비 교통카드</span></a>
											<a class="srchExGo"><span class="srchTxt">마이비 교통카드</span></a>
											<a class="srchExGo"><span class="srchTxt">마이비 교통카드</span></a>
										</div>
									</div>
								</div>
							</div>
							<div class="closeBox">
								<a class="closeBtn">닫기</a><a class="removeBtn"><img
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAeCAYAAAAy2w7YAAAAAXNSR0IArs4c6QAAAOBJREFUSA3tVgEOwyAInEsf0Yf4lX2jj+k39hX/0f5i41xHWiI2rNY0iyYmciJwQILupqwQwoOuRtq9oiLhmYDBe/+UF5DvKXDBLE7wBAHhTXJ1SfQDRiYUocvo8BVl4EWCyj7HiI2UOLgfamH1G2sHR1OOstWqoj+jRqZaKIZU+Fu7ajX6P0fVmgGpG2ijBc9asb3ZOLpj6RDGjhykves0g4xsT9aycB1GWoRWvDGyZoz1W+o4FdZDS501Y6yf+9dFJfmv25PZsjhUq9GaEQZUX3ImkT0eqGtGpSftZrK+AWoUS5rz8CTIAAAAAElFTkSuQmCC"
									width="13" height="15" alt="쓰레기통 아이콘">검색어 전체삭제</a>
							</div>
						</div>
					</div>
					<div class="rightMenu">
						<button class="zeusTalk1">
							<img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAwCAYAAABuZUjcAAAAAXNSR0IArs4c6QAAA59JREFUaAXtmU1S2zAUxyWnDaawSJfAJj1BzddMl2TXpblBQg9QOAFwAth2QZ0bQJddkWVn+GiOQDfADnemfIROrP6fx8o4Tkw86AnSTjWTSHqSpZ/+fnpyHCmS5HletVQqbaLq41PR9jHKm91ud7vdbp8Rk6SvhYWFupRyB8VxBCZEnUKl1Mbp6WlTJkp/R8u4Q/fgofx8aW5ujpR+p61/Qe46jlORi4uLKgNLvrQBXwoz9meppvZePQ0wAA7o1+MCrUEBX0HguNJ1yp10hcrjBp3HNACeXci41v+DF7kzt4FbpU+RvqP6PJniv4KXHg6P/cnG3dkoqCLtL4p0Mu1zu+fWAR3gdK6ZjqWvt6749Z67paQKMGELarf0xKa5NcWvAlEpi/KOVKpOkFC7YQqbvt4KOEFPqIlDTOTFk0mxy+XbGp4dnDahoxyC1g9tYUd0tvWEXDkr+HVQ9qWS5M8aWgglWq50vVuyJqkruuF043db1x+Ts4Hf7E2sA5KeNPuTFD4iip8ynuFXwGqq/qgiCziUDgBdL0DQ6sjO6uuGCAv0fbCLMThOwpUoEj+UELEfS6HeQtG0wjEAQmJzqnHPFlmMwZPY3NLy3HyOo4muxjn8vvFqrdPsMxpWjMHT89PmhMuspGxhJKPa9JrZRkyN1yuynZwUu6FsenO24c9vTKNHjzRTYAMvR+46xq7S+OTPgK5xbEIab1hicRV6VEXI+xhPoMTG1Nr97rDJOG0s4JGINiVCCZReBfQBJ2DeWMbgFA6hthdvQsPTMA9ymN0YXESi2nHs+rMV8MkPd81hA9u2sUUV26DZ8f8dcHprlF3dc9eHMQ0ojlddO8M6Phd88votfSLHKPTucB8lnwGseXJyMvLpb2lpicIn/UIySQd4Y+vEj6MmoyTX1kmEp7hbxOwcHR21ocBIpQouzIerHdqEJ1Zijn2c/prAKuYBx3Fce5bgyT3miZVElPRlkpaXl70oishns9EoxEQ1Usdk/LxrB6JKXsc8e3zbAIj2LGCFFkQLy7vWxG6suJ48CVukfBa090+Z7suRs4ETzAPwgjaV9k8O8BLHIHqMy8vLu4uLi0+zs7NV2PqUx7tDf2Zm5ifav+n+JjkruAYB3Jcc+Pf4e7Jyfn7+Vfd9bG68OfMmplMUKm9n2+EyfXci2160bg2cAI6Pj7cYD7e+NVkFp5loQ9qAtw6u4eE2FOtDqnOkJwEnULhNi05SFFng/wBaR0Y/O/3CZQAAAABJRU5ErkJggg=="
								width="23" height="24" alt="번개톡버튼 이미지">번개톡
						</button>
						<a class="myShopBtn1" href="#"><img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAwCAYAAABuZUjcAAAAAXNSR0IArs4c6QAABCNJREFUaAXtWUtS20AQtWxXJSEbZ8XWuYH4rcEnwNzALg6Q5AQJy6yAE1icIOYEmDWf6AbRispSqwSqAOU91QwetUbWSAFjqpgq10z39OdNT89P9hqPVNbW1vowtY2fr36m5RAEf8cXFxdjs6Nu26urqPVWV1cHnud9Bd3VvJI6SpJk7/LyMiiRm9ldG/jGxoZ/f38/gnVGuE4Jm83m8OzsjDNRudQCrkCfwFunssesQgzwvTrgKwMvAR0jbQKkwinqmBjR7qC9iXoA0jbQWuArAfd9v9NqtX5ZAMQAxrw9QF9hwXr4jEFwPcgBxHd3dx/DMEwHW2jA6Gga7dImQO9DSDplrvbKQNM4ZSiLZkjaKAwIbTsX54gj2l0VbdN45UhRuWjmVNQj00FR2zniAM0pzhRM+06V6dXK1KGupnVt86H7ZO0MHIp9oRycn59PBM+ZVLqBUJA+RPeUdAK+vr6+BRWZ28dTM7Vb0kZH+So16AQcB40vLT3G0W2zYfMlfZN2Ao6dQEZ7YjNWk5exZfFlNdu2cisw/4ze7DeSise+1wiXhjdfKrjJif43cAV6K2d5FiOZ1enW55QqyLtYmJvmfNKQC0yIWsisztQWRC2+LAbcczwU2h3eWcjzmt4YVSz6Z5Gx0mkoGx1TGDkemnRR2ynitv0akflEo++G1xHSZa/IQY4P2VQHHdqGKWPzZfbrthNwJRxoJVUPdNSXdm8OksQrBU8ZylJf6Q6ULV0FulFWOwPHEX0kjSFiI947yH+/e/0NMj1EfyzlyGMfZdhHHepKOZsPKaNp50sWFfCu/IGqr5VVHeJy1JN3lr+jt93rxnX8YZjNf3XBOoGuL+yMcSDtCF4hWQk4nPKG+BPW0igbVmO0h7aT0JDhwDloRjqnj8GvYPCRKT+rXQk4DfEugUcDI2YrfAgfcme4vb2NKNBut7tICx9pwMXcJU8WppHrotS6lYFTUb3sczmqjVapMdBhnRd/LeAExl0BkWTOd0nXKBFmZqfOQ5m+WjUcpipXV1e/l5eXj5DzN2D4+L11tMVHxHfkNCMdOerkxGpH3LTEnQLR44ehTfC38MstPvAmSItTzFIgdyD0LU7hInZ9FCwO6lckxRGYmePMXezDXHhzLzgHsBSKPxBZgat9mgfGs4A2ohTyQLPt8xngam/mwfLcgA3saZNfyzJfdh+AK9A8yuVWJo08Fx0D/MOX3RR4CegYSMM5o+WM2wL4AD59LKu7sRTkhYlfYIM5g07dFfzToe/xK17Bhcl6x573AIru7ryYNXFMbwtA/AKbexgImbmQ3A6JBc5i0yEx8+nWF8zDWfunKTuPNrEA6KHw1be9OSdCaBHIHCYb8EUAmsGgX1Mm80UAR7pEJmi2XwRwCfoVuC0iT817TZWnjrC0/2Ij/g8RGqgJ9UrG3gAAAABJRU5ErkJggg=="
							width="23" height="24" alt="내상점버튼 이미지">내상점</a><a
							class="sellBtn1" href="#"><img
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
									전체 카테고리 
									<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAASCAYAAABvqT8MAAAAAXNSR0IArs4c6QAAAX9JREFUKBWdkz1LA0EQhmf2Ei6msBEb/4JgPi4fhYUpRIn4gYpY2ajYKbZa5S9YKzZWIgoqCIpFLKxyMQb0Z0hEQnIbcjfuLtyykmDEhbt7571ndvZm9wDE4MnMIU9mD6QeOLyUs9dOOCQvoXcHJTAIcEJDARy1U5lNHfcRzF6e3wHAc/mOhMCAjnk6u96HVRYqsFCI8EbzioAWZIyIXWC4Enup3CrKuDEFlMtde2x0TYCPMiaiCPjBhZfKThuskqpCaJLjxD0fH0TGpPQQoWUBzkRf3eeQURXCAKvVVsy25gRYlR4RxH2Au04672gmFOaTcrkR3gmexNLGlY/4wQin7Hrl/UcFM6lHR0ktvyeB8vlh3vHvw9lFI74sZs3arvsmJ/n/R1OxaHMfr3WHxBEDZEtmh3QFkhv32bwUy1hUptw4hNVYzb2RsTkYlUrMazTPNAzidCFs9INlInqJzIk4ElsqkK1nuD1Uc0/NWU3NgFFdGwz2f4M1J3+ev/5A37oEmInyqvw0AAAAAElFTkSuQmCC"
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
					<div class="zzim1Num">
						<a class="zzim1Btn1" href="#"><img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAAEhyb7BAAAAAXNSR0IArs4c6QAAAhBJREFUOBGdVL9v01AQvjs7cRp1QiDBhFClqFsS7AwBIVWABJWYGCohRsTA1LFTgYkBCdQFxMDE1KlCqH9BJyBOkyxIpWLq0IEfGRroC2193Nn1i5sQQfsGv/u+++587+7ZAJmFplKbZ46WLLdb9lkBmnKwAcifXAYuAUPJSlA0a4KuWEb1CkzZP5BoUnui00Rk3z9n9vE5OrlFjPbuamicXhW6YmliJs84j1URXY9pZpZSg6cKkGdmJk13ZycJEAJxXwTuAMMXMt3eZkronhUkGKaSmiv+T2YoZsWpjTmcjkUpYQtTAuH+RLv5OvWBqQavpAM/uHrpvJL9sr8gRb/lev2UYjl8sC2VnFXwt1Uo5ovSkPECDer/+r060rXhbIww/U8RAj4hx3Hrw9EWI3wrtMMXlF//8J4I71jHoSG96UsLziiMX+e1wmUieJgVFjrNQhZbW9rx5khDDz3JFajWrgFHy3LzTtsINRC2yYEbHMFl8T0bHR1uOUS3862PIe5Wgscy+UdHEhwTyLkWdXLfZTDxGI8ZP5BLN0nO1howJ7OQMSTP5VkZ4OeTpdCPBppe6cIte73NxdpNiKJ30tDc/ySVwB4hXc23Gw3V20RpsKn6D2RKL1M8vMtne4CEc956YyXrG0mUOk3FX5Lq5lOsOyEueO0w/jFkebXHJlKn/ETcfre3IqKvXie8p9y49QcxxqrZMCDi2QAAAABJRU5ErkJggg=="
							width="9" height="9" alt="찜 아이콘">15</a>
					</div>
				</div>
				<div class="zzimSideBox3">
					<div class="zzim2Txt">최근본상품</div>
					<div class="zzim2NumBox">
						<div class="zzim2Num">3</div>
					</div>
					<div class="zzim3Box1">
						<a class="zzim3Btn"
							href="/products/149157703?content_position=0&amp;content_owner=7918163"><img
							src="https://media.bunjang.co.kr/product/149157703_1_1616050689_w140.jpg"
							alt="상품 이미지">
							<div class="zzim3Box2"></div>
							<div class="zzim3Box3">
								<button class="zzim3Box3Btn">
									<img
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
										width="10" height="12" alt="삭제 버튼 이미지">
								</button>
								<div class="zzim3Box3Txt">갤럭시폴더2판매합니다</div>
								<div class="zzim3Box3P">80,000원</div>
							</div>
					</div>
					</a>
				</div>
				<div class="zzim4Box">
					<button disabled="" class="zzim4BoxBtn1">
						<img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAASCAYAAAEVsH/dAAAAAXNSR0IArs4c6QAAAWZJREFUKBVjYACChoaG7SBiIYgDBo2NjftgbGQaqOgkiM8EFZRDloSwZ86cycXQ3t6ugCnV2dnJiyIKtObG/v37WcCCIFf09PSIoKgACn5FEYBxgNawAiWvgviMMEEQDbRaiYWF5SVcrLu7Wwxo0Qa4AMgZQIEjcIFVq1axwcyCCwJVvIBzoAwmRkbGCU1NTZboEgxA1TOANqtgk9jS1tYmDJJAcSfQwtNCQkI2KILI2oHOlPn+/fthoNix+vr6WAyFQPsEf/78eQDoqJeCgoK+eXl5P1Gs6evr4/z8+fP2////83JwcDhVVFR8RLaBEehx5mvXrq0CChpwcnLalpeXP0NWAGOzXL9+PQ3I8WFmZvbFpQikGO5GoO86gfw0VlZW++rq6ksgSWQAVwgSBLqPCRiAS4FMC2DU2dTU1DyFKUZRCBOcP38+x6NHj3YA+VxAjzkDnfQZq0KYBlAM/P79eynQ9HgA91p/71jKrhEAAAAASUVORK5CYII="
							width="5" height="9" alt="화살표 아이콘">
					</button>
					<div class="zzim4Txt">1/1</div>
					<button disabled="" class="zzim4BoxBtn2">
						<img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAASCAYAAAEVsH/dAAAAAXNSR0IArs4c6QAAAVhJREFUKBVtUC1Pw0AYvtJ2mRkYRAVYkhrAkjASxPYDCFTjZhBYmjb9TGiTOhAoSkKCWAIa12SC4HB0CQqNwC0touW5pnespSfu3ufj3i/iOM4tYQfgmeA6YUT7tW37k3IrtfDQNJRlKXAmiqL1ypfn+QbxPO+YS0jzzcFyEMdxH+Ib5f4yAaCpu16v51Zm13XPQBxWgF4AIw7qgJYewrnTFggK3Pu+v9klJEEQrFGhXf1dVdVdNjapB13VNO2Hp/k3FdpacJUGcOQNAkBAj+fI54uiODYM46VtYJh3hCxXIDV82DdN84MZ2MuNlEiSRJrNZk8It2RZHuq6/tVpZGQYhoMsyxLgTFGU8WQyWTQyMiN9p9OpmKbpI8JtSZL2Oo1YwzUMGsofoPycfmwYsQG9KIoLZBhhA6/UwI5EAxhOsaIbQRCOMP2AicuvBOESprllWf1loR3/AksYejyOGFk5AAAAAElFTkSuQmCC"
							width="5" height="9" alt="화살표 아이콘">
					</button>
				</div>
			</div>
			<div class="zzimTop">
				<button class="zzimTopBtn">TOP</button>
			</div>
		</div>
	</div>
	</div>
					<%
				}else{					
					%>
					<button class="logOut">로그아웃</button>
					<div class="noticeBox1">
						<div class="noticeBox2">
							<a class="noticeBtn">알림</a>
							<div class="noticeBox3">
								<div class="noticeView">
									<img
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAuCAYAAABap1twAAAAAXNSR0IArs4c6QAABSBJREFUWAnVmVtoXEUYx/eSaLZsYyVKRI2y0lhDJCHZGFBbvDwU9KExFArF10q9UaEX34S0AcE++CIRvBQVpIUqiIg+WEEwfZFmNxeKGKK1GDWNoHU11LoJWX//dM422Zw9M2fPijow+c7MfN9//vN9c93EY3VIuVzucWCGSqXSZuR0PB4/lM1mP6oDdCweFWR8fPy+5eXlUcglPCwIFhsaGrLd3d1nvbpaZRm0VgDI7TPkhvv6+uAWH6F8zdLS0oFaMVfbRSYImX4BNjY2vmWAR4y838hIIjJBer9VDLq6umYlIfyNJOn2KyLa33oQbBQFQrskSZgXJRVmyagp0iKZmJjoZ659aUhcgOT1EJunfJup64Dw11FI1kRwcnJyC8RehczDDp2fSCQSB3t7e39y0F2nEppgPp/fCbHjJoSX8drHoJ6i/EMymbzIqm6lLkN5gPptSPVRgOQOSH6xjoGlIhRBNuRddHgczCQk3m5qajrQ2dn5a7U+5OnFxcVjtGtFXyYPEPJPq+n71TsTnJqauoPOJiGYhtyTnBSv+QFW1qGfwOuaDntp+wVPdoUJt/MqLhaLxwy5F13JiSyDWYbQ03x+SG4B403VuyYngjrOAHyQfK65ufmIK7inJ5J8P0X+A4KP4NE+r80mnQgy8Z8TEB0dbW9v/8sG6tfO3JvD/hW1QfKgn45fnZUgYEmNGvAix9lJP5AQdSvHIXiPkhtc7KwECW8PQBvJeY6ziy6g1XSYuzoGtXFvdA2zlSAjzZoO89U6DlNPJM5IH1wN3JqsBAG80aD8aEVzU/jWqHm4gVZWgoy0xSAUApEcG8HzpskNLiYuBNMCwpM6CeqRLhmQDS5gVoKArFyn2GpWrlMuoBadleuYh2vRjVkJ4rkmA+KN3IYZ2M5R5+2jdfPgdabHes3B34THwDcFjsQ0Wj3IpL7JAF5wAbTpgPez0bnZpqt2K0F0MlLkDD4vGTWlUqnzwoCo7oxJG14gQV2xAFCIv+MM/t0G5tKu+yPh1Z6a4pS622YTSJD73w4BAPiJDShMO577TPrsDDttdoEEAdotAAhGvSSs4QHe+wZ3N30EcqjayGH+ACD9gH3V09MzuqaHiAWeCrr2z0FuM2HeFQTnSxDDOHlYhhAcJpeCQMK2MQ+LYB6VHWE+PDMzc201DF+CjOpZCG7DKI/36hpejwj4r/P9PfnOQqEw5NVXynUEebl1MKqXGOEyu/5eyUqjepS5YV/imbrHYB3CKff44a4hODs7m2Jk76IoOcJjZ8zPqF51ROcUWHpEJXHKO4S6uRK7TBBCyfn5+RMo9OK1My0tLc9XKv8T5dbW1n30l6P/DkL9HnLNU6BMkFU7AoEB8hyuH8xkMvW6XgWOq62t7U9+7HwMJR2l2w2Pss3Kw31sbOwINS+Ua//lDzx6mPfLkGgkWBT6+C+RI8qlZ/DklUNCLF0TntaLbAs5yyoM9YjCthe7HHka27uQTqk8B520Y7HTRm/QUX+1mmfjYaxuq/odlqC3ae9n32qvilrRYHT3m2oPo0LLvxiKIKHRGSoPbNC+xVyx3uekI13ZyNZg8OmWQhE0kE8gC3R8LxN5NMiTapOOdGXDTyd73Ghd1XL+ffCqSSzGhH+I8gdkXWb1mHpZ5XQ6PYOMLSwsKPyacwqrPKf3zCDe+xwZKtVEUD1AUivxDfJWlQPSaXmO/zpNB+hUbaqZoIcI0e186063lQ32FtUTUl3pNVdPhp1zsv9fpb8BJA31DAFoy+sAAAAASUVORK5CYII="
										width="20" height="23" alt="빈 알림 이미지">최근 알림이 없습니다.
								</div>
							</div>
						</div>
					</div>
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
						<div class="zuesViewBox1">
							<div class="zuesViewBox2">
								<div class="zuesViewBox3">
									<a class="lastSearch srchClick">최근검색어</a>
									<a class="popularSearch">인기검색어</a>
								</div>
								<div class="searchBox1">
									<div class="searchBox2">
										<div class="searchBox3">
											<div class="searchBox4">
												<div class="serachOne">
													<button type="button">아이폰</button>
													<button type="button" class="serachRemove">
													<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
															width="10" height="12" alt="최근검색어 삭제 버튼 아이콘">
													</button>
												</div>
												<div class="serachOne">
													<button type="button">파워뱅크</button>
													<button type="button" class="serachRemove">
														<img
															src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
															width="10" height="12" alt="최근검색어 삭제 버튼 아이콘">
													</button>
												</div>
												<div class="serachOne">
													<button type="button">캠핑카</button>
													<button type="button" class="serachRemove">
														<img
															src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
															width="10" height="12" alt="최근검색어 삭제 버튼 아이콘">
													</button>
												</div>
												<div class="serachOne">
													<button type="button">ㅁ</button>
													<button type="button" class="serachRemove">
														<img
															src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
															width="10" height="12" alt="최근검색어 삭제 버튼 아이콘">
													</button>
												</div>
											</div>
											<div class="searchNo">
												<img
													src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGgAAABaCAYAAABUrhMHAAAAAXNSR0IArs4c6QAADUFJREFUeAHtnbtvHMcdx+94Jz7E90NPSxTk2EEAB4akyBZkBIhdxEAQFyliwYghF0mVNGkCBC6CuDMSIP9BgCBJEUeBO1dq7MZ6WILkIi5sGbBIUVYomRRFkeJDPDKfz/j2fKZOFI+83TvqdoAfZ252dn6z3+/+Zn47O7PMXrhw4SctLS2Dy8vLv89mszszmcwgkkPSUD0CBU6ZWFlZuQmmfwLTsfv3759/4YUX5qqv6usz8pJDhQOQkyerBclutLL0vIBdi1iKKdjOdnZ2iumGQ17L4extVHrAGNlUhRtuyeNxotj1I10Q9BtkpFAonOf37EYvL1/s1qy4lQpX+D1GWlNNQ/UI5IBwDxi2Ig4VM0tLS5saLuzWrMigaY6h4LVcLidJaagSAaxlHxi+w2n7EC1pOp/Pb6pHkqByhguSc+TIkRHy01AlApcuXcowZES9j7iWY1tlbV8X3xS7G9KYnlQVAilBVcGVfOGUoOQxr0pjSlBVcCVfOCUoecyr0pgSVBVcyRdOCUoe86o0pgRVBVfyhVOCkse8Ko0pQVXBlXzhlKDkMa9Ko3NxNQ9MuObOnz+/p7W1ddNzUTVv3BoVLi4uFo4dO3aDCc9oPm2N0skcioUgyWEW9x0mDp3V3TKBNo/R9tdocMPM5sdCkJZTJMeXgFsqNJrVp2NQg98+sViQfbndRYNfe6Xmjdn2SgfqlRcLQQ609uWN1l08CuTISXhUuSSPx0JQ0QvaihaUJPbr0pWOQeuCqX6FUoLqh/26NKcErQum+hVKCaof9uvSnBK0LpjqVygWLy6di6sdobEQlM7FNThB6Vxc7QhKx6DaYRlLTbF0celcXO24ioWgdC6uwQlK5+JqR1A6BtUOy1hqSgmKBdbaVZoSVDssY6kpJSgWWGtXaUpQ7bCMpaZY3OxGnYuLXmk/at0b7c+ePXu23W8czM/Pty8sLLQMDQ3lSWfdtd3R0ZG5c+dO+J5EV1dXgRVMKzMzM/fZROz3Jmp608dCUKPOxa1n3dvFixe30f6O9vb25/hKyADnHGVjdc+9e/eGMZF20n3k59ra2twVDyeFO+TPbd++/YrHkV6kZiEWghp5Lq7SQpbIYrAE8QgfoiB2Td+AMUT0UGaYL4e0Fa0kR5pDmWUkEESZRcp4fglT64XQ9i+++KL94MGDCxxbQaoKpcqqOusxK3z16tU2LOV5Lms3QJ8kvaO48NKPe2gVsuFXWTicDcuZBV8YiLuNyI8WaXaYXwwSemRqamrw/fffv/TSSy/NRwfWG8dCUAPPxX1r3dtbb73V8sorr3QznnQB2H5A3kusxfj9op1YSY50JhJBNV0eKBcwJN6GSFhJKOeXXJ6A2GW6xBG6z5n33nvvLnq1vHWFLCeVm90IjfrRZj9kQSMbcvF8uZNAG7Mff/xxL9i9Tno/aP0c6SPdA6gtdoWETHd3dwaLyugY2K2ZNhS7uAx1+vGKzNzcXAYHInP37t0MVpNhnJIoiZhEpij/H+Jr1P2vQ4cO3SEux51DlUMsFoRyV2eOVVZZ/1wtB3J6ANLP4OwHvP2AvIt2d0mK4ENQxnQUYwEh32OUC2kICGkJkpzoPAnyGPktyBDpNmQYyfb09AzQpWZowzTySEuKxYLqT8HaLbhy5UoP3drrlBpGfgFw/YArOdmBgYFACkAGgiKLkRRDFIcf/OHckIxiyVEYd4J13b59298rEDVDwSnO/zfxKPKPo0eP6mCsGWrqs6+pqTEOZvWoAMzPhfnho/DRI8jphojstm3bAjnlsVahSMxqcrykKD8qV36u1udv61YHZfuRoBeL6z5z5kwH7fj2oLYKp1i6uFU6GuYnnlQbd/RhwNFlfhVwdtG4Lq1k165dgRzHnAjsjTbc8/v7+8PYZNfoODU+Pm432InOn0LSONb6X8qN0t35PbmHendNRRDdVw6QdgPOHoDqA6huuzUJiu52fle0lGrJkiTqDxbkuerQWrDebrq7RY7vIXsRgtbkYM2D1Taqkct/8sknrUzZDAHOr2inrnQvIJXGHC2nVuREOEgQ00VhTNKKlImJCYnqRt6g3Ehvb+852rb4zDPPLEbnlcdNMQbhLek2+8DZiewAuPDhXO9yxwgluuPLwalFWpJW66Fen6+cpRhCOm2bbaykr2JmpYJbOe/ll19uw2v7AXft8wDjIL0DUJxPy/T19WW4iwOIcV2jBKnHcUmd6qYtOxGfv47z7PS8baykvykIclYaMAYUQGhFGBLyYVwQPCXuEOmJ9HKTOGXkt0317PrpfivuiI+/ZXFf+TrqBxTvzsMQdJi4TbAcc+IYd9Zqjnp5PRHENMS0MSY+pzAb3rwWxDSMrwZ6AKUHAE0Hh6DWTsFa5Hisgl4NxDb1MA5WNJaKmVb2OAVetNmVPM01PY0Vmc5wxwYxnVRQl16dYpq2+J1yZzOGed9k+oHQFG42lpMFDL04JTBiF6MkHVbpLbXLNlZqS1MQxBgkEz6Y9hE3TBdHe0K7aNOdYhsf4Cj5W+iBJiSWoWtb8pTsYpSkQwW9GslDDaVpCAIYX4eWpvchqzQTnSRJqwgq3SEP6+KahiBI8B2VEkK9CFql13cVQXC1K77AawqC6N8LADOlAIjpMD/mexvTSQV1MVkbpKhXq/Yd0RSzCyXrLm/PQ/u+8kJbPV28O53SVwIj5IXXAUlf2yq98LQS2tXUFkT/vsRd6nqAaxCy5N3Lc0eQ4p2cCE8V9N5H8VXyrxKbfiA0RRfHAg67j+miLAuU3Vs9urhVekO7uHGmi21sToKwlgWs6IICOQt2MyzVDZIUSd4U6nXVj+Jv2wI5FxTb+AA7ZDTFGMQUv47Bba7XeS9XgBYYrMPq0GhMcF4uzqCeyHqM+a1HuQg5LsuatI2V9DdFF3f69OkFZq4/AoCzAOJYdJO3mwWm+MPqG94VxeowSI46XOnDvGAGvQXbYFu4Uc5x/IJtrESQFhQx5y2Ug919/iepxykASBZC/M+Mg4ASbkrSgRQXGJIX0sZKLUO5HnVJFkGLniC+xSPADNYzxxvVh7rZFrTRvtDyH+T5td6INLK3fvCVtis/CeFNpjHX6YdvM5OTk+GVN88hIY5mmmtx1ZKjtygx6ikjSIflbxwfoWv96mHrEWyDd9VNYv9NZxfilPeW+pSyF1FN4BpLxQXQ8cA8F3QY/I0zsemZbslXJMW6fUClblSG554ZdHyJ3hsQt6Yx5GHwz1Tkq+BfIy5icPtFU4xNXGfwpgTPdWt0N44PwZJcPyBR1QZJl5jp6elAjqt4rL9oPXqTH3F8lHrPsk5h/PDhwxXHnkivWyrGYHK2eNI90i5HjdelibTXP5YBl0C5Xs7Vpo5VoVXGenaRd6eVGaI4/OCPhBiiuGgpJcuRGK3S45zrEuBQHKKWIE/rWXOuKevyUxdVUEkvnk7LzZs3wxY/a3lcg04DK3lW8Kj6AOwNgHsCAF3x2aXVKK6+kZxojbZvYM3XyiKSBF1CBH12djYQEe1u0BLNVyLywFNCdKu/pK7fcmyM9ChrtCvOInCsef9vN6CF7SfcmG+Aw37kZ4jbT3ohoLT9RIIkhS2RgSCdifKgpUnC6u0n5DvgOBmqQ6CVeKJmaNpx/4/IKFZ0GRd8/sSJExXHom9GTEo3W8C1bTl58mQ3d30XRP2Q698LqL8E1Go2cAXYOC9YijGE+ZxzC5kg/U8KOCH6fcQFkz9GdMo+I3Z4eRNLvfHpp59OVCKpqQkCoBBYVN/OgH0EMHdLEJk7EL1Zt0C6pdHX5D4zilc0PkdjRxhHKGesxejPO0Nwnfgr5O90Z/OMRc+S56rWE4jj3Qzx/5A30TtGl/vZU0895XlRvZzaxF1cuPpv/rgtpY1nlrz7SXlucsfDMYBzW/1zFOsF0O8Qu+hEj1fnQm9CUpxCmqecnpnd2UXSk4xN56hjhjonGduXIaiD+nZBll3bfup7lti9rZeJR+ki/0DZcVaY6qiVSGqKuTgAeFRYOXjwoN1QxoXsgKXV7EbuIjsRCRKrDgCWBHfOLRH7GuM2x8oJGiF/knJjzhCwnTS4hadOnZofHh72AVnHwPh7xI5L7rRY5qbYibO29MEHH+h2W3cIaRcXIVEWA1jpQxY8SHYw4LccOHDADcHZW7duhS5OL1DHACsp4ECsXLt2reBbUba4zOHRLR8/flzSSpZg9XSlebpSu869WNjbHH+C9B7E56PT/B7Biv5y/fr10niUWhDorA5FYMPcEMdmVx/f6O8XX3yx8OGHH05ARh4ytSTXjGupWtJepIDDMMTNoAd4m3YspxYEKkkGrfPzzz9vxbX+LkTt4/fbRZKC40BbTvF7lC7vr8wyTDnYpSFBBLTOy5cvL0HAOGq/VMjzuYgoqyU5J9pJ9xm4SS0IROoRcBpyjGPtg4OD7rpwz9LvED+G8a4OBsfeffLJJ++mFlQPdtDpQynk6OHdQK4ho5Bj/BXxFG55mLRLLQhE6hn8uhYzGTl2mfuthize4KyeIQ7FLBb1LS+wnu1set1YjTsdHjCY/wOqy8W+K5QksgAAAABJRU5ErkJggg=="
													width="52" height="45" alt="검색어 없음 이미지">
												<div>최근 검색어가 없습니다.</div>
											</div>
										</div>
									</div>
									<div class="starSearch1">
										<div class="starSearch2">
											<div class="starRank">
												<a class="starBtn"><span class="starNum">1</span>냉장고</a><a
													class="starBtn"><span class="starNum">2</span>그래픽카드</a><a
													class="starBtn"><span class="starNum">3</span>아크테릭스</a><a
													class="starBtn"><span class="starNum">4</span>노트10</a><a
													class="starBtn"><span class="starNum">5</span>방탄</a><a
													class="starBtn"><span class="starNum">6</span>pcx</a><a
													class="starBtn"><span class="starNum">7</span>자전거</a><a
													class="starBtn"><span class="starNum">8</span>로드자전거</a><a
													class="starBtn"><span class="starNum">9</span>스쿠터</a><a
													class="starBtn"><span class="starNum">10</span>루프탑텐트</a>
											</div>
											<div class="starRank">
												<a class="starBtn"><span class="starNum">11</span>나이키</a><a
													class="starBtn"><span class="starNum">12</span>스톤아일랜드</a><a
													class="starBtn"><span class="starNum">13</span>주술회전</a><a
													class="starBtn"><span class="starNum">14</span>캠핑카</a><a
													class="starBtn"><span class="starNum">15</span>pxg</a><a
													class="starBtn"><span class="starNum">16</span>골프백</a><a
													class="starBtn"><span class="starNum">17</span>mcm</a><a
													class="starBtn"><span class="starNum">18</span>아이폰</a><a
													class="starBtn"><span class="starNum">19</span>tv</a><a
													class="starBtn"><span class="starNum">20</span>에어팟프로</a>
											</div>
										</div>
									</div>
									<div class="storeSrch1">
										<div class="storeSrch2">
											<div class="storeSrch3"></div>
											<a class="storeSrch"><img
												src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAcCAYAAAAJKR1YAAAAAXNSR0IArs4c6QAAAZdJREFUSA3tVktuwjAQTRz2LFlWYlWpu8IBULvhIPlcoTfoGfLpBXKBXoCKDazoortKnCCsoyR9Y2WQEzWJkLAVJCzBjGfMzPObsY1tKSOKol1VVQvFpFUVQiw9z9urSYQ6ueu3wIDNIMMwfIf+xnNTEn00Rx/9cr5zD9m2/cpGw/JFzTehCdiZQjzjcwyC4IFsukeSJOuiKD5xqomID84nGQJtKzgcsPTFDt0SYLbIUeLTYEgCKsuSjRvdQDg+KnGCfgARM9x/T2yXgLh/II0BIgBckbpsEpOI43gGAyE8ua77La2GvpgASK6QRQzxZAsH1dTYcBxHVgSErNI0dSixUOha47RVYMzIW0bvZp7nx3r30yzL6JQ3GJI+AHysF+kWjTxMzMT3/Tll5pceZfvRjaSOT3kW7RefemhUQ97UXYiYtS6/urtL1nbFI/ttMcQ7UZkgWx8bl6zl+KocHUN3QGp5/tN7Txn/AP8GdrjFeWrhEjvr11ZGV7JehnCLL6/NwFC88TPU7pehHbF/qK/acbvWj46hP8RApehW+HAaAAAAAElFTkSuQmCC"
												width="18" height="14" alt="추천 상점 아이콘">상점검색 &gt;<span
												class="storeSrchTxt"></span><span class="storeSrchGo">상점명으로
													검색</span></a>
										</div>
										<div class="storeSrchEx">
											<a class="srchExGo"><span class="srchTxt">마이비 교통카드</span></a>
											<a class="srchExGo"><span class="srchTxt">마이비 교통카드</span></a>
											<a class="srchExGo"><span class="srchTxt">마이비 교통카드</span></a>
											<a class="srchExGo"><span class="srchTxt">마이비 교통카드</span></a>
											<a class="srchExGo"><span class="srchTxt">마이비 교통카드</span></a>
										</div>
									</div>
								</div>
							</div>
							<div class="closeBox">
								<a class="closeBtn">닫기</a><a class="removeBtn"><img
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAeCAYAAAAy2w7YAAAAAXNSR0IArs4c6QAAAOBJREFUSA3tVgEOwyAInEsf0Yf4lX2jj+k39hX/0f5i41xHWiI2rNY0iyYmciJwQILupqwQwoOuRtq9oiLhmYDBe/+UF5DvKXDBLE7wBAHhTXJ1SfQDRiYUocvo8BVl4EWCyj7HiI2UOLgfamH1G2sHR1OOstWqoj+jRqZaKIZU+Fu7ajX6P0fVmgGpG2ijBc9asb3ZOLpj6RDGjhykves0g4xsT9aycB1GWoRWvDGyZoz1W+o4FdZDS501Y6yf+9dFJfmv25PZsjhUq9GaEQZUX3ImkT0eqGtGpSftZrK+AWoUS5rz8CTIAAAAAElFTkSuQmCC"
									width="13" height="15" alt="쓰레기통 아이콘">검색어 전체삭제</a>
							</div>
						</div>
					</div>
					<div class="rightMenu">
						<button class="zeusTalk">
							<img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAwCAYAAABuZUjcAAAAAXNSR0IArs4c6QAAA59JREFUaAXtmU1S2zAUxyWnDaawSJfAJj1BzddMl2TXpblBQg9QOAFwAth2QZ0bQJddkWVn+GiOQDfADnemfIROrP6fx8o4Tkw86AnSTjWTSHqSpZ/+fnpyHCmS5HletVQqbaLq41PR9jHKm91ud7vdbp8Rk6SvhYWFupRyB8VxBCZEnUKl1Mbp6WlTJkp/R8u4Q/fgofx8aW5ujpR+p61/Qe46jlORi4uLKgNLvrQBXwoz9meppvZePQ0wAA7o1+MCrUEBX0HguNJ1yp10hcrjBp3HNACeXci41v+DF7kzt4FbpU+RvqP6PJniv4KXHg6P/cnG3dkoqCLtL4p0Mu1zu+fWAR3gdK6ZjqWvt6749Z67paQKMGELarf0xKa5NcWvAlEpi/KOVKpOkFC7YQqbvt4KOEFPqIlDTOTFk0mxy+XbGp4dnDahoxyC1g9tYUd0tvWEXDkr+HVQ9qWS5M8aWgglWq50vVuyJqkruuF043db1x+Ts4Hf7E2sA5KeNPuTFD4iip8ynuFXwGqq/qgiCziUDgBdL0DQ6sjO6uuGCAv0fbCLMThOwpUoEj+UELEfS6HeQtG0wjEAQmJzqnHPFlmMwZPY3NLy3HyOo4muxjn8vvFqrdPsMxpWjMHT89PmhMuspGxhJKPa9JrZRkyN1yuynZwUu6FsenO24c9vTKNHjzRTYAMvR+46xq7S+OTPgK5xbEIab1hicRV6VEXI+xhPoMTG1Nr97rDJOG0s4JGINiVCCZReBfQBJ2DeWMbgFA6hthdvQsPTMA9ymN0YXESi2nHs+rMV8MkPd81hA9u2sUUV26DZ8f8dcHprlF3dc9eHMQ0ojlddO8M6Phd88votfSLHKPTucB8lnwGseXJyMvLpb2lpicIn/UIySQd4Y+vEj6MmoyTX1kmEp7hbxOwcHR21ocBIpQouzIerHdqEJ1Zijn2c/prAKuYBx3Fce5bgyT3miZVElPRlkpaXl70oishns9EoxEQ1Usdk/LxrB6JKXsc8e3zbAIj2LGCFFkQLy7vWxG6suJ48CVukfBa090+Z7suRs4ETzAPwgjaV9k8O8BLHIHqMy8vLu4uLi0+zs7NV2PqUx7tDf2Zm5ifav+n+JjkruAYB3Jcc+Pf4e7Jyfn7+Vfd9bG68OfMmplMUKm9n2+EyfXci2160bg2cAI6Pj7cYD7e+NVkFp5loQ9qAtw6u4eE2FOtDqnOkJwEnULhNi05SFFng/wBaR0Y/O/3CZQAAAABJRU5ErkJggg=="
								width="23" height="24" alt="번개톡버튼 이미지">번개톡
						</button>
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
									전체 카테고리 
									<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAASCAYAAABvqT8MAAAAAXNSR0IArs4c6QAAAX9JREFUKBWdkz1LA0EQhmf2Ei6msBEb/4JgPi4fhYUpRIn4gYpY2ajYKbZa5S9YKzZWIgoqCIpFLKxyMQb0Z0hEQnIbcjfuLtyykmDEhbt7571ndvZm9wDE4MnMIU9mD6QeOLyUs9dOOCQvoXcHJTAIcEJDARy1U5lNHfcRzF6e3wHAc/mOhMCAjnk6u96HVRYqsFCI8EbzioAWZIyIXWC4Enup3CrKuDEFlMtde2x0TYCPMiaiCPjBhZfKThuskqpCaJLjxD0fH0TGpPQQoWUBzkRf3eeQURXCAKvVVsy25gRYlR4RxH2Au04672gmFOaTcrkR3gmexNLGlY/4wQin7Hrl/UcFM6lHR0ktvyeB8vlh3vHvw9lFI74sZs3arvsmJ/n/R1OxaHMfr3WHxBEDZEtmh3QFkhv32bwUy1hUptw4hNVYzb2RsTkYlUrMazTPNAzidCFs9INlInqJzIk4ElsqkK1nuD1Uc0/NWU3NgFFdGwz2f4M1J3+ev/5A37oEmInyqvw0AAAAAElFTkSuQmCC"
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
					<div class="zzim1Num">
						<a class="zzim1Btn" href="./myshop3.jsp"><img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAAEhyb7BAAAAAXNSR0IArs4c6QAAAhBJREFUOBGdVL9v01AQvjs7cRp1QiDBhFClqFsS7AwBIVWABJWYGCohRsTA1LFTgYkBCdQFxMDE1KlCqH9BJyBOkyxIpWLq0IEfGRroC2193Nn1i5sQQfsGv/u+++587+7ZAJmFplKbZ46WLLdb9lkBmnKwAcifXAYuAUPJSlA0a4KuWEb1CkzZP5BoUnui00Rk3z9n9vE5OrlFjPbuamicXhW6YmliJs84j1URXY9pZpZSg6cKkGdmJk13ZycJEAJxXwTuAMMXMt3eZkronhUkGKaSmiv+T2YoZsWpjTmcjkUpYQtTAuH+RLv5OvWBqQavpAM/uHrpvJL9sr8gRb/lev2UYjl8sC2VnFXwt1Uo5ovSkPECDer/+r060rXhbIww/U8RAj4hx3Hrw9EWI3wrtMMXlF//8J4I71jHoSG96UsLziiMX+e1wmUieJgVFjrNQhZbW9rx5khDDz3JFajWrgFHy3LzTtsINRC2yYEbHMFl8T0bHR1uOUS3862PIe5Wgscy+UdHEhwTyLkWdXLfZTDxGI8ZP5BLN0nO1howJ7OQMSTP5VkZ4OeTpdCPBppe6cIte73NxdpNiKJ30tDc/ySVwB4hXc23Gw3V20RpsKn6D2RKL1M8vMtne4CEc956YyXrG0mUOk3FX5Lq5lOsOyEueO0w/jFkebXHJlKn/ETcfre3IqKvXie8p9y49QcxxqrZMCDi2QAAAABJRU5ErkJggg=="
							width="9" height="9" alt="찜 아이콘">15</a>
					</div>
				</div>
				<div class="zzimSideBox3">
					<div class="zzim2Txt">최근본상품</div>
					<div class="zzim2NumBox">
						<div class="zzim2Num">3</div>
					</div>
					<div class="zzim3Box1">
						<a class="zzim3Btn"
							href="/products/149157703?content_position=0&amp;content_owner=7918163"><img
							src="https://media.bunjang.co.kr/product/149157703_1_1616050689_w140.jpg"
							alt="상품 이미지">
							<div class="zzim3Box2"></div>
							<div class="zzim3Box3">
								<button class="zzim3Box3Btn">
									<img
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
										width="10" height="12" alt="삭제 버튼 이미지">
								</button>
								<div class="zzim3Box3Txt">갤럭시폴더2판매합니다</div>
								<div class="zzim3Box3P">80,000원</div>
							</div>
					</div>
					</a>
				</div>
				<div class="zzim4Box">
					<button disabled="" class="zzim4BoxBtn1">
						<img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAASCAYAAAEVsH/dAAAAAXNSR0IArs4c6QAAAWZJREFUKBVjYACChoaG7SBiIYgDBo2NjftgbGQaqOgkiM8EFZRDloSwZ86cycXQ3t6ugCnV2dnJiyIKtObG/v37WcCCIFf09PSIoKgACn5FEYBxgNawAiWvgviMMEEQDbRaiYWF5SVcrLu7Wwxo0Qa4AMgZQIEjcIFVq1axwcyCCwJVvIBzoAwmRkbGCU1NTZboEgxA1TOANqtgk9jS1tYmDJJAcSfQwtNCQkI2KILI2oHOlPn+/fthoNix+vr6WAyFQPsEf/78eQDoqJeCgoK+eXl5P1Gs6evr4/z8+fP2////83JwcDhVVFR8RLaBEehx5mvXrq0CChpwcnLalpeXP0NWAGOzXL9+PQ3I8WFmZvbFpQikGO5GoO86gfw0VlZW++rq6ksgSWQAVwgSBLqPCRiAS4FMC2DU2dTU1DyFKUZRCBOcP38+x6NHj3YA+VxAjzkDnfQZq0KYBlAM/P79eynQ9HgA91p/71jKrhEAAAAASUVORK5CYII="
							width="5" height="9" alt="화살표 아이콘">
					</button>
					<div class="zzim4Txt">1/1</div>
					<button disabled="" class="zzim4BoxBtn2">
						<img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAASCAYAAAEVsH/dAAAAAXNSR0IArs4c6QAAAVhJREFUKBVtUC1Pw0AYvtJ2mRkYRAVYkhrAkjASxPYDCFTjZhBYmjb9TGiTOhAoSkKCWAIa12SC4HB0CQqNwC0touW5pnespSfu3ufj3i/iOM4tYQfgmeA6YUT7tW37k3IrtfDQNJRlKXAmiqL1ypfn+QbxPO+YS0jzzcFyEMdxH+Ib5f4yAaCpu16v51Zm13XPQBxWgF4AIw7qgJYewrnTFggK3Pu+v9klJEEQrFGhXf1dVdVdNjapB13VNO2Hp/k3FdpacJUGcOQNAkBAj+fI54uiODYM46VtYJh3hCxXIDV82DdN84MZ2MuNlEiSRJrNZk8It2RZHuq6/tVpZGQYhoMsyxLgTFGU8WQyWTQyMiN9p9OpmKbpI8JtSZL2Oo1YwzUMGsofoPycfmwYsQG9KIoLZBhhA6/UwI5EAxhOsaIbQRCOMP2AicuvBOESprllWf1loR3/AksYejyOGFk5AAAAAElFTkSuQmCC"
							width="5" height="9" alt="화살표 아이콘">
					</button>
				</div>
			</div>
			<div class="zzimTop">
				<button class="zzimTopBtn">TOP</button>
			</div>
		</div>
	</div>
	</div>
					<%
				}
					%>

    <div class="noticecontainer">
        <div class="tab_cont">
            <div class="box_inner">
                <div class="tab_content">
                    <input type="radio" name="tabmenu" id="tab01" checked>
                    <label for="tab01">공지사항</label>
                    <input type="radio" name="tabmenu" id="tab02">
                    <label for="tab02">운영정책</label>
                    <input type="radio" name="tabmenu" id="tab03">
                    <label for="tab03">자주묻는 질문</label>

                    <div class="conbox con1 accordion">
                        <input type="checkbox" id="answer01" checked>
                        <label for="answer01">
                            <p class="acco_text1">번개장터 운영정책 개정 안내</p>
                            <p class="acco_text2">2021/02/22</p><em></em>
                        </label>
                        <div>
                            <p>여기에 추가되는 부분이 자주 묻는 질문의 컨텐츠</p>
                        </div>
                        <input type="checkbox" id="answer02">
                        <label for="answer02">
                            <p class="acco_text1">번개장터 개인정보처리방침 개정 안내</p>
                            <p class="acco_text2">2021/03/02</p><em></em>
                        </label>
                        <div>
                            <p>여기에 추가되는 부분이 자주 묻는 질문의 컨텐츠</p>
                        </div>
                        <input type="checkbox" id="answer03">
                        <label for="answer03">
                            <p class="acco_text1">[공지] 식품의약품/의료기기 중고거래 시 유의사항</p>
                            <p class="acco_text2">2021/02/16</p><em></em>
                        </label>
                        <div>
                            <p>여기에 추가되는 부분이 자주 묻는 질문의 컨텐츠</p>
                        </div>
                        <input type="checkbox" id="answer04">
                        <label for="answer04">
                            <p class="acco_text1">[공지] 상점후기 정책 변경 안내</p>
                            <p class="acco_text2">2021/02/16</p><em></em>
                        </label>
                        <div>
                            <p>여기에 추가되는 부분이 자주 묻는 질문의 컨텐츠</p>
                        </div>
                        <input type="checkbox" id="answer05">
                        <label for="answer05">
                            <p class="acco_text1">[공지] 경찰청 사이버범죄 신고 시스템</p>
                            <p class="acco_text2">2021/02/16</p><em></em>
                        </label>
                        <div>
                            <p>여기에 추가되는 부분이 자주 묻는 질문의 컨텐츠</p>
                        </div>
                        <input type="checkbox" id="answer06">
                        <label for="answer06">
                            <p class="acco_text1">
                                <설 연휴 택배 서비스 안내>
                            </p>
                            <p class="acco_text2">2021/02/02</p><em></em>
                        </label>
                        <div>
                            <p>여기에 추가되는 부분이 자주 묻는 질문의 컨텐츠</p>
                        </div>
                        <input type="checkbox" id="answer07">
                        <label for="answer07">
                            <p class="acco_text1">[공지] 타 사이트 대리결제 거래 시 제재 정책 강화 안내</p>
                            <p class="acco_text2">2021/01/15</p><em></em>
                        </label>
                        <div>
                            <p>여기에 추가되는 부분이 자주 묻는 질문의 컨텐츠</p>
                        </div>
                        <input type="checkbox" id="answer08">
                        <label for="answer08">
                            <p class="acco_text1">번개장터 개인정보처리방침 개정 안내</p>
                            <p class="acco_text2">2020/12/02</p><em></em>
                        </label>
                        <div>
                            <p>여기에 추가되는 부분이 자주 묻는 질문의 컨텐츠</p>
                        </div>
                        <input type="checkbox" id="answer09">
                        <label for="answer09">
                            <p class="acco_text1">번개장터 개인정보처리방침 개정 안내</p>
                            <p class="acco_text2">2020/12/02</p><em></em>
                        </label>
                        <div>
                            <p>여기에 추가되는 부분이 자주 묻는 질문의 컨텐츠</p>
                        </div>
                        <input type="checkbox" id="answer10">
                        <label for="answer10">
                            <p class="acco_text1">번개장터 개인정보처리방침 개정 안내</p>
                            <p class="acco_text2">2020/12/02</p><em></em>
                        </label>
                        <div>
                            <p>여기에 추가되는 부분이 자주 묻는 질문의 컨텐츠</p>
                        </div>
                        <input type="checkbox" id="answer11">
                        <label for="answer11">
                            <p class="acco_text1">번개장터 개인정보처리방침 개정 안내</p>
                            <p class="acco_text2">2020/12/02</p><em></em>
                        </label>
                        <div>
                            <p>여기에 추가되는 부분이 자주 묻는 질문의 컨텐츠</p>
                        </div>
                    </div>
                    <div class="conbox con2">
                        <div class="sc-gKLXLV eKLrem">
                            <div class="sc-bvCTgw hJFUSM">
                                <div class="sc-fjdPjP fgZWCw">
                                    <h2><small>이용 제재 / 3아웃 정책</small>번개장터 운영정책</h2>
                                </div>
                                <div class="sc-fObBmV cwEAFk">
                                    <ul>
                                        <li>
                                            <div class="sc-ePAWwb cJqQgg">금지 품목 거래 시, 제재 받을 수 있어요<a
                                                    href="/customer/faq/2?id=220">금지품목 보기</a></div>
                                        </li>
                                        <li>
                                            <div class="sc-ePAWwb dMikFd">적절하지 않은 상품명, 이미지, 가격 등록 시에 제재 받을 수 있어요</div>
                                        </li>
                                        <li>
                                            <div class="sc-ePAWwb bSYhsv">외부 채널로의 연락 유도, 타 사이트로의 결제 유도 시 제재 받을 수 있어요
                                            </div>
                                        </li>
                                        <li>
                                            <div class="sc-ePAWwb iZUvRo">욕설, 성희롱 등 비매너 행위는 타인을 불쾌하게 해요</div>
                                        </li>
                                        <li>
                                            <div class="sc-ePAWwb ePVfwV">상품, 댓글, 번개톡에 도배는 안돼요</div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sc-gCKARq cyYyBe">
                                <div class="sc-fjdPjP fgZWCw">
                                    <h3>서비스 이용제한</h3>
                                </div>
                                <div class="sc-fObBmV cwEAFk">
                                    <div class="sc-ePAWwb fQdcAh">위의 약속을 위배하는 경우 3아웃 정책으로 이용을 제한합니다.</div>
                                    <div class="sc-ldcLGC jDXGbZ">
                                        <div class="sc-hXhGGG fjIbIi">
                                            <div>3아웃 정책</div>
                                            <div>제재 내용</div>
                                        </div>
                                        <div class="sc-hTQSVH kgkfvc">
                                            <div class="sc-dWcDbm cWuimj">
                                                <div><b>1차</b></div>
                                                <div>물품삭제 /&nbsp;<b>3</b>일 이용제한</div>
                                            </div>
                                            <div class="sc-dWcDbm cWuimj">
                                                <div><b>2차</b></div>
                                                <div>물품삭제 /&nbsp;<b>15</b>일 이용제한</div>
                                            </div>
                                            <div class="sc-dWcDbm cWuimj">
                                                <div><b>3차</b></div>
                                                <div>물품삭제 /&nbsp;<b>30</b>일 이용제한</div>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="sc-esExBO RtVEB">항목에 따라 사전 안내 없이 영구적으로 제한될 수 있습니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="conbox con3" id="qaBoxList">
                        <div class="concon">
                            <div class="oftenBox">
                                <a class="oftenQes" href="#">상점/상품</a>
                                <a class="oftenQes" href="#">거래</a>
                                <a class="oftenQes" href="#">번개페이</a>
                                <a class="oftenQes" href="#">회원정보(계정)</a>
                                <a class="oftenQes" href="#">택배서비스</a>
                                <a class="oftenQes" href="#">제재정책</a>
                                <a class="oftenQes" href="#">광고서비스(UP하기)</a>
                                <a class="oftenQes" href="#">똑똑한 판매팁</a>
                                <a class="oftenQes" href="#">안전한 구매팁</a>
                                <a class="oftenQes" href="#">분쟁해결기준</a>
                                <a class="oftenQes" href="#">내폰시세/판매</a>
                                <a class="oftenQes" href="#">번개장터 포장택배</a>
                            </div>
                        </div>
                        <ul class="qaBox">
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>팔로우 숫자가 갑자기 줄었어요.</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                    <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>[내상점을 팔로우한 상점이 휴면계정 처리 되었을
                                                때]</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p>개인정보보호법에 따라 번개장터는 정기적으로 휴면계정을 정리하고 있습니다.&nbsp;</p>
                                    <p>최근 1년동안 로그인하지 않는 상점은 휴면계정 전환 및 탈퇴처리 됩니다.</p>
                                    <p>따라서 내 상점을 팔로우한 상점이 휴면계정이라면&nbsp; 팔로워 수에 영향을 줄 수 있는 점 참고해 주세요.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>통신판매업자이면 상품 판매에 필요한 절차가 있나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><strong>통신판매업자는 물품 판매를 위해 다음의 필수 기재사항을 제출해야 합니다.</strong></p>
                                    <p>&nbsp;</p>
                                    <p>1. 업체명</p>
                                    <p>2. 사업장 소재지</p>
                                    <p>3. 연락처</p>
                                    <p>4. 이메일 주소</p>
                                    <p>5. 통신판매업신고번호</p>
                                    <p>6. 사업자등록증</p>
                                    <p>&nbsp;</p>
                                    <p>등록해주신 정보는 판매자님의 물품을 열람하는 구매자에게 제공됩니다.</p>
                                    <p><em><a href="https://docs.google.com/forms/d/e/1FAIpQLK7u1pCxeOO42B9Lag0sQLCUkaK-_cJjSq1DAFAg/viewform"
                                                target="_blank">판매자 신원정보 제출하기 &gt;</a></em></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>상품 판매는 어떻게 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>[상품 판매 등록 방법]</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p>* 앱 &gt; 하단의 '+' 버튼 선택 후 상품등록하기</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>상품 수정/삭제는 어떻게 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>상품 수정/ 상품 삭제 방법</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p>- 내상점 &gt; 판매상품&gt; 설정 &gt; 상품수정 또는 삭제</p>
                                    <p><span
                                            style="font-family: 'Malgun Gothic'; font-size: 15px; white-space: pre-wrap; text-decoration-skip-ink: none;">&nbsp;</span>
                                    </p>
                                    </p>
                                    </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>내 상품이 판매완료 / 삭제 처리 됐어요.</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>[상품 삭제 및 판매완료 처리 기준] </strong></span></p>
                                    <p>&nbsp;</p>
                                    <p><strong>1. 상품 삭제 기준</strong></p>
                                    <p>- 거래금지품목(술,전자담배,계정,의약품 등)을 판매 등록한 경우</p>
                                    <p>- 타 사이트 홍보 및 외부 url이 있는 경우</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p><strong>2. 상품 판매 완료 기준 </strong></p>
                                    <p>- 운영정책 위반으로 상점이 차단된 경우 판매중인 상품은 판매완료로 변경</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>상점 주소는 어떻게 설정하나요? </h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><strong><span style="color: #ff0000;">[상점 주소 설정 방법] </span></strong></p>
                                    <p>&nbsp;</p>
                                    <p>내상점 &gt; 설정 &gt; 상점설정 &gt; 상점 주소 설정</p>
                                    <p>- 상점주소 설정 후 주소 변경만 가능하며, 상점 주소 삭제는 불가합니다.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>찜은 무엇이고, 어떻게 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><strong>1. 찜이란</strong></p>
                                    <p>- 관심 상품을 확인할 수 있도록 보관하는 기능으로서 상품페이지 &gt; 찜하기 가능</p>
                                    <p>&nbsp;</p>
                                    <p><strong>2. 찜한 상품을 보는 방법</strong></p>
                                    <p>-앱 &gt; 우측 상단의 하트 아이콘 &gt; 찜리스트 확인 가능</p>
                                    <p>&nbsp;</p>
                                    <p><strong> 3. 찜 취소 방법 </strong></p>
                                    <p>- 찜한 상품의 상세페이지 &gt; 찜 버튼을 한번 더 눌러 찜 해제 가능</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>무료UP이란 무엇인가요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong><span
                                                    style="font-family: 'Malgun Gothic'; font-size: 15px; white-space: pre-wrap;">무료UP:
                                                    내 상품을
                                                    최신으로 끌어올릴 수 있는 기능</span></strong></span></p>
                                    <p>&nbsp;</p>
                                    <p><span
                                            style="font-family: 'Malgun Gothic'; font-size: 15px; white-space: pre-wrap;">제공
                                            개수: 상점마다 1일 10개씩
                                            제공되며 자정 12시에 초기화 됩니다.(상품마다 1회 UP적용 가능) <br><br>[Tip!]</span></p>
                                    <p><span
                                            style="font-family: 'Malgun Gothic'; font-size: 15px; white-space: pre-wrap;">"UP하기"
                                            아이템을 구매하면 1일
                                            1회 제한없이 UP을 사용할 수 있습니다. <br>"UP하기"에 대한 자세한 내용은 자주묻는질문 &gt; UP하기 메뉴를
                                            참고해주세요.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>[탈퇴]탈퇴는 어떻게 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p>안녕하세요. 번개장터 입니다.</p>
                                    <p>&nbsp;</p>
                                    <p>웹사이트 또는 앱에서 계정 설정을 통해 탈퇴하실 수 있습니다.</p>
                                    <p>&nbsp;</p>
                                    <p>감사합니다.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>사진 업로드 시 최적 사이즈는 어떻게 되나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong><span style="color: #ff0000;">[사진 업로드 시 최적
                                                    사이즈]</span></strong></span></p>
                                    <p><span style="color: #000000;">- 640*640 사이즈로 사진 등록 시 보다 깨끗한 사진 등록이 가능합니다.</span>
                                    </p>
                                    </p>
                                    </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>[찜]찜 취소는 어떻게 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p>찜하신 것을 취소하고 싶으신가요?</p>
                                    <p>찜 취소는 찜한 상품을 들어가 찜을 한 번 더 눌러주면 찜하신 것이 해제됩니다.</p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>기기 버전과 호환이 안되어 번개장터 앱 설치/업데이트 안되요.</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>번개장터 앱 최소 지원 OS버전&nbsp;</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p><strong>- 안드로이드버전: 5 </strong></p>
                                    <p><strong>- IOS버전: 11</strong></p>
                                    <p>디바이스별 최소 OS버전까지만 번개장터 앱의 최신버전 업데이트가 가능합니다.&nbsp;</p>
                                    <p>OS 업데이트가 불가능하여 번개장터 앱 이용이 어려운 경우,&nbsp; 번개장터 웹사이트를 통해서만 번개장터 서비스 이용이 가능한 점 양해
                                        부탁드립니다.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>특정공간에서 앱 접속이 안되요. 어떻게 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><strong><span style="color: #ff0000;">이동 중이거나 건물 지하와 같은 특정 공간에서는 네트워 연결이 원할하지 않을
                                                수 있습니다. </span></strong>
                                    </p>
                                    <p>&nbsp;</p>
                                    <p>만약 지속적으로 오류가 발생한다면 '내상점 &gt; 1:1문의'로 접수 부탁드립니다.</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p><strong>문의 TIP</strong></p>
                                    <p>- 포털 사이트 &gt; '내 IP' 검색시 조회되는 IP를 기재하여 문의하시면 원할한 상담이 가능합니다.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>상점명 정책은 어떻게되나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p data-renderer-start-pos="783"><strong>1. 상점명 등록 제한 수: 최소 2자, 최대 10자 (가입시 기본으로
                                            생성되는 상점명 제외) </strong></p>
                                    <p data-renderer-start-pos="783">&nbsp;</p>
                                    <p data-renderer-start-pos="783"><strong>2. 상점명 입력 가능 문자: 한글, 영문, 숫자만 가능 (특수기호 및
                                            띄어쓰기 불가)</strong></p>
                                    <p data-renderer-start-pos="783">&nbsp;</p>
                                    <p data-renderer-start-pos="783">&nbsp;</p>
                                    <p data-renderer-start-pos="783"><strong> 3.상점명 등록 불가 금지어 </strong></p>
                                    <p data-renderer-start-pos="783">- 번개장터 관리자 상점으로 오인할 수 있는 단어 예) 번개장터, 번장, sellit,
                                        셀잇, bunjang 등</p>
                                    <p data-renderer-start-pos="783">- 욕설, 음담패설 등의 비속어</p>
                                    <p data-renderer-start-pos="783">- 거래금지품목 관련 단어</p>
                                    <p data-renderer-start-pos="783">- 사용 불가 형식: 번개장터 기본 생성 상점명 형식</p>
                                    <p data-renderer-start-pos="783">예) 상점12345호 등과 같이 상점 + 숫자 + 호 의 형식</p>
                                    </p>
                                </div>
                            </li>
                        </ul>
                        <ul class="qaBox">
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>거래를 하면 안 되는 것들은 어떤 것이 있나요? </h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p>&nbsp;</p>
                                    <p><strong><span style="color: #ff0000;">거래금지품목은 이용약관 및 현행 법률에 따라 즉시 삭제 및 계정
                                                차단</span>이 될 수 있으므로 운영정책을 참고하셔서
                                            이용 부탁 드립니다.&nbsp;&nbsp;</strong></p>
                                    <p>&nbsp;</p>
                                    <p><strong>개인정보</strong>&nbsp;: 개인정보를 사고파는 행위와 면허증, 허가증, 등록증 등을 위, 변조하는 행위는 형법에 따라
                                        처벌받을 수 있습니다.</p>
                                    <p><span style="color: #0000ff;"><em>예시) 주민등록증, 여권, 학생증, 수험표, 운전면허증, 대포통장, 듀얼폰, 듀얼넘버
                                                등&nbsp;</em></span></p>
                                    <p>&nbsp;</p>
                                    <p><strong>온라인 개인 계정</strong>&nbsp;: 개인 계정 및 인증번호를 통해 각종 피해가 발생되고 있어 번개장터 운영정책에 따라
                                        제재 됩니다.<br><span style="color: #0000ff;"><em>예시) 카톡계정, 인스타 계정, 페이스북 계정, 네이버
                                                계정,&nbsp;카카오톡, 네이버, 페이스북 인증번호
                                                등</em></span></p>
                                    <p><br><br><strong>불법현금융통</strong>&nbsp;: 정보통신망 이용촉진 및 정보보호등의 관한 법률 제 72조 통신과금을 이용해
                                        매입하는 행위는 불법현금융통으로 제재
                                        됩니다.&nbsp;<br><em>예시) 불법 현금융통을 목적으로 한 모든 상품 (불법대출, 돈구해요, 개인돈빌려요,
                                            리니지M등)<br><br></em><br><strong>허위매물</strong>&nbsp;: 실물을 확보하지 않은 판매하는 행위는
                                        번개장터 운영정책에 따라 제재
                                        됩니다.&nbsp;&nbsp;(※ 자동차 허위매물의 경우 증빙 시 해제 가능합니다.)<br><em>예시) 백화점/문화 상품권 예약판매, 타
                                            사이트 대리구매(배송지변경), 알바를 통한 상품
                                            대리판매, 자동차&nbsp;</em></p>
                                    <p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br>&nbsp;<br><strong>사행성</strong>&nbsp;: 불법 도박
                                        및 사행성 상품은 번개장터 운영정책에 따라
                                        제재 됩니다.<br><em><span style="color: #0000ff;" data-mce-mark="1">예시)토토, 카지노, 바카라,
                                                화투, 포커, 한게임, 섯다, 바둑이,
                                                홀덤, 세븐등 머니쿠폰, 전용장비, 라이브스코어인증 등</span><br><br><br></em></p>
                                    <p><strong>성인용품</strong>&nbsp;: 방송통신심의위원회의 정보통신에 관한 심의 규정에 따라 음란물로 구분되는 상품은 인터넷으로
                                        유통이 불가합니다.<br><em><span style="color: #0000ff;">예시) 각종 성인용품, 낙태유도제, 임신테스트기,
                                                배란테스트기, 콘돔 등&nbsp;</span><br><br><br></em>
                                    </p>
                                    <p><strong>청소년유해상품&nbsp;</strong>: 청소년유해 매체물/약품/물건은 청소년 보호법에 따라 제재 됩니다.<br><em><span
                                                style="color: #0000ff;">예시) 청소년불가 등급 및 선정적 매체 (잡지, DVD, 음반, 서적등),
                                                레이져포인터, 캠핑용 나이프, 눈알젤리, 가스건
                                                등</span></em></p>
                                    <p>&nbsp;<br>&nbsp;<br><strong>반려동물/야생 동, 식물</strong>&nbsp;: 반려동,식물은 번개장터 운영정책에 따라
                                        제재 됩니다.<br><span style="color: #0000ff;"><em>예시) 반려동물 판매/구매, 반려동물 무료나눔
                                                불가</em></span></p>
                                    <p><span style="color: #0000ff;">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><br><span
                                            style="color: #0000ff;">&nbsp;</span><br><span
                                            style="color: #000000;"><strong>주류&nbsp;</strong>:
                                            주세법에 따라 주류소매업 및 의제주류판매업 면허를 받은 자는 허가된 장소에서만 주류를 판매하여야 하고, 통신판매는 할 수 없도록 규정되어
                                            있습니다.</span><br><span style="color: #0000ff;"><em>예시) 양주, 맥주, 소주, 와인, 사케,
                                                막걸리, 위스키, 보드카, 무알콜 맥주, 무알콜 칵테일 등</em></span></p>
                                    <p><br><br><strong>담배(전자담배용품)</strong>&nbsp;: 담배사업법에 따라 담배의 온라인 판매는 금지되어 있으며, 담뱃잎을
                                        사용하지 않았다 하더라도 그 유사한 형태의
                                        끽연용 제품은 담배와 동일하게 판매를 규제하고 있습니다.<br><span style="color: #0000ff;"><em>예시) 담배,
                                                전자담배</em></span></p>
                                    <p><br>&nbsp;<br><strong>군용품/군복류</strong>&nbsp;: 군복 및 군용장구의 단속에 관한 법률에 따라&nbsp;임의로
                                        제조 및 판매할 경우 1년 이하의 징역 또는
                                        1천만원 이하의 벌금에 처하도록 규정하고 있습니다. (※구형의 경우 증빙 시 해제 가능합니다.)<br><em><span
                                                style="color: #0000ff;">예시) 총기, 총포,
                                                권총집, 수통, 야전삽, 천막류, 모포, 방탄모, 방탄복, 야전배낭, 전투복, 전투모, 전투화, 계급장, 야전복, 방한복,
                                                비행복, 특전복, 유사군복(외국군복)
                                                등</span>&nbsp;<br><br><br></em></p>
                                    <p><strong>게임 계정/ 아이템/ 대리육성</strong>&nbsp;: 게임산업 진흥에 관한 법률 제32조 불법게임물 등의 유통금지 조항에 따라
                                        제재 됩니다. <br><span style="color: #0000ff;"><em>예시) 오버워치계정, 피파계정, 롤계정,&nbsp;동물의 숲,
                                                게임아이템(롤스킨, 피파귀속거래, 발로란트, 배틀그라운드), 별풍선
                                                삽니다/팝니다 등</em></span></p>
                                    <p><br><span style="color: #0000ff;">&nbsp;</span><br><span
                                            style="color: #0000ff;">&nbsp;</span><br><span
                                            style="color: #000000;"><strong>의약품&nbsp;</strong>: 모든 의약품(동물용 의약품 포함)은 약사법에
                                            의거 약국 개설자(해당 약국에 근무하는
                                            약사 또는 한약사 포함)만이 판매 가능하며,</span>&nbsp;약국 개설자의 경우에도 지방자치단체장의 승인을 얻은 경우를 제외하고는
                                        인터넷을 통한 판매가 불가합니다.</p>
                                    <p><em style="color: #0000ff;">예시) 감기약, 알러지약, 진통제, 두통약, 수면제, 마취제, 프로포폴, 식욕억제제, 구충제,
                                            펜벤다졸, 파나쿠어, 시알리스, 비아그라 등
                                            의약성분이 포함된 다이어트 식품</em></p>
                                    <p>&nbsp; &nbsp; &nbsp;
                                        &nbsp;&nbsp;<br>&nbsp;<br><strong>콘택트렌즈/시력보정용안경&nbsp;</strong>: 의료기사 등에 관한 법률 제
                                        12조
                                        5항에 의거 온라인 판매가 불가합니다.<br><span style="color: #0000ff;"><em>예시) 각종 렌즈(콘텍트, 써클,
                                                컬러, 미용렌즈), 시력보정용안경,
                                                도수안경</em></span></p>
                                    <p>&nbsp; &nbsp; &nbsp; &nbsp;<br>&nbsp;<br><strong>불법시술&nbsp;</strong>: 현행 의료법령에 따라
                                        의료인만 반영구화장과 같은 문신 시술을 할
                                        수 있고 가정용 의료기기도 피부관리실에서 사용 불가합니다.<br><span style="color: #0000ff;"><em>예시) 타투, 출장
                                                시술 등</em></span></p>
                                    <p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
                                    <p><br><strong>상품권</strong>&nbsp;: 재난기본소득은 부정한 방법으로 지급받은 경우 지역 조례에 따라 환수 조치 될 수 있으며,
                                        선불카드/지역화폐를&nbsp;거래하는 경우
                                        접근 매체를 넘겨주거나 받는 행위로 판매자, 구매자 모두 처벌 받을 수 있습니다. (전자금융거래법 제49조 4항 1호)<br><em
                                            style="color: #0000ff;">예시)
                                            문화누리카드, 온누리상품권, 지역사랑상품권, 지역화폐, 티머니 교통카드 할인판매, 네이버페이 포인트 할인판매
                                            등<br><br><br></em></p>
                                    <p><strong>불법상품(위조상품/이미테이션)</strong>&nbsp;: 상표법, 부정경쟁방지 및 영업비밀보호에 관한 법률에 따라 판매가
                                        불가합니다. <br><span style="color: #0000ff;"><em>예시) 가품, 개인차 렌트,개통불가휴대폰, 불법소프트웨어복제품,
                                                신용불량자(미납연체자)대상 휴대폰 개통 및 판매,&nbsp;
                                                상표권/저작권 침해 물품, 안전인증표시 없는 안전인증 대상 제품, 적합성 평가를 받지 않은 불법방송통신기자재 등 법률을 위반하는
                                                모든 상품</em></span></p>
                                    <p><em>&nbsp; &nbsp; &nbsp;
                                            &nbsp;&nbsp;</em><br><em>&nbsp;</em><br><strong>화장품&nbsp;</strong>: 원 상품을
                                        판매의
                                        목적으로 의도적 소분하여 판매하는 경우 번개장터 운영 정책에 따라 제재 됩니다.<br><span
                                            style="color: #0000ff;"><em>예시) 화장품샘플, 증정품, 비매품,
                                                화장품 소분 판매 등</em></span></p>
                                    <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>&nbsp;<br><strong>개인정보활용</strong> : 개인정보를
                                        활용한 상품 판매는 번개장터 운영정책에 따라
                                        제재 됩니다.<br><span style="color: #0000ff;"><em>예시) 유투브 프리미엄 이용권, 넷플릭스 공유 계정,
                                                멜론이용권, 나이키 인증번호, 조건부
                                                무료나눔(개인정보 및 라스인증 요구), 가입유도 후 추천코드 등록요청&nbsp;</em>&nbsp;</span></p>
                                    <p>&nbsp; &nbsp;<br>&nbsp;<br><strong>유해화학물질</strong>&nbsp;: 유독물, 관찰물질, 취급 제한 금지물질,
                                        사고대비물질, 그 밖에 유해성 또는 위해성이
                                        있거나 그러한 우려가 있는 화학물질은 거래 불가합니다.<br><span style="color: #0000ff;"><em>예시) 농약, 독극물,
                                                이산화질소, 벤젠, 파라벤, 트리클로산,
                                                포름알데히드, 라돈</em>&nbsp;</span>&nbsp;</p>
                                    <p>&nbsp; &nbsp; &nbsp;&nbsp;<br>&nbsp;<br><strong>총포류</strong>&nbsp;: 총포소지 허가증 발급이
                                        필요한 상품으로 판매 불가 합니다.
                                        <br><em><span style="color: #0000ff;">예시) 총포, 도검, 화약류, 분사기, 전기충격기, 석궁, 총구에
                                                컬러파츠(색깔 표시) 없는 비비탄
                                                총</span><br><br><br></em>
                                    </p>
                                    <p><strong>혈액(헌혈증)</strong>&nbsp;: 혈액관리법에서는 금전·재산상의 이익이나 기타 대가적 급부를 주거나 받음으로써 혈액 또는
                                        헌혈증서를 매매하는 행위를
                                        금지합니다.<br><br><br></p>
                                    <p><strong>개인 사용 목적으로 해외 직구한 전자제품 </strong>:<strong><br></strong>적합성 평가 면제조건에 해당하는
                                        “개인이 사용할 목적의 제품”을 해외직구로
                                        구입하여 사용하다가 중고판매를 하고자 하는 경우<br>판매하려는 경우에는 적합성 평가 면제요건에 부합하지 아니하므로, 「전파법」 제58조의2에
                                        따라 적합성 평가를 받아야 하며,<br>받지
                                        않고 게시한 경우 적합성 평가를 받지 않은 불법방송통신기자재 게시로 인해 처벌받을 수 있습니다.</p>
                                    <p>&nbsp;<br>&nbsp;<br><strong>기타</strong> : 응모권, 비매품, 랜덤박스, 목적 불분명한 알바등 영리목적으로
                                        제3자에게 자료 및 정보 제공 하는 경우 번개장터
                                        운영정책에 따라 제재 됩니다.</p>
                                    <div>&nbsp;</div>
                                    <div>&nbsp;</div>
                                    <div><strong>위 거래금지품목 이외&nbsp;&nbsp;전자상거래 또는 통신판매로 유통/판매가 금지되어 있거나, 사회통념상 매매에 부적합하다고
                                            '회사'가 판단하는 경우 운영정책에 따라
                                            제재 됩니다.&nbsp;</strong></div>
                                    </p>
                                    </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>사기거래 피해 발생 시 수사기관 신고는 어떻게 하나요? </h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>경찰청 사이버범죄 신고 시스템을 통해&nbsp;온라인 접수
                                                가능</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p><strong>[수사기관 접수 채널 및 신고 방법]</strong><br>1. 상대방과 거래한 내용에 대해 증거자료 수집 (대화내용, 입금내역)
                                    </p>
                                    <p><br>2. 경찰청 사이버안전지킴이 신고(온라인 접수):<a href="https://ecrm.cyber.go.kr/minwon/main"
                                            rel="noopener noreferrer" target="_blank"
                                            data-stringify-link="https://ecrm.cyber.go.kr/minwon/main"
                                            data-sk="tooltip_parent">&nbsp;https://ecrm.cyber.go.kr/minwon/main</a><br>&nbsp;&nbsp;&nbsp;※다중
                                        피해
                                        사건의 피해자 중 1명이라도 신고한 사실이 있다면, 다른 피해자들은 온라인 신고만으로 정식 수사 진행이 가능합니다.</p>
                                    <p>&nbsp;</p>
                                    <p>3. 경찰청 민원실 신고(내방 접수)<br>① 경찰서 민원봉사실 방문<br>② 고소장 작성<br>③ 사건사실확인서 발급 요청<br>④ 계좌를 통해
                                        인출된 경우 은행 방문하여 계좌지급정지
                                        신청(사건사실확인서 제출)</p>
                                    <p>&nbsp;</p>
                                    <p>4. 추가 필요자료 : 피해자 인적사항, 피해일시, 해당사이트, ID 또는 상점명,
                                        거래내역<br>&nbsp;&nbsp;&nbsp;※개인정보보호법에 따라 상대방의 개인정보는 신고인에게 직접
                                        제공은 불가하며, 수사기관 공문을 통해 전달이 가능한 점 양해 부탁드립니다.</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>

                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>교환이나 환불은 어떻게 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;단순변심 교환/반품은 판매자와 협의 필요\n\n중고상품은 개인간의 거래이므로 전자상거래, 상거래법, 소비자보호법등이 적용되지 않습니다. \n물품 수령 후 단순변심 또는 판매자로부터 전달받지 못한 하자가 확인된다면 판매자에게 \n해당 사항을 전달하여 협의를 통해 진행이 가능합니다.\n\n또한, 단순변심 환불로 판매자와 협의된 경우 배송비는 구매자 부담이 될 수 있습니다. &quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:22}"><span
                                                style="color: #ff0000;"
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;단순변심 교환/반품은 판매자와 협의 필요\n\n중고상품은 개인간의 거래이므로 전자상거래, 상거래법, 소비자보호법등이 적용되지 않습니다. \n물품 수령 후 단순변심 또는 판매자로부터 전달받지 못한 하자가 확인된다면 판매자에게 \n해당 사항을 전달하여 협의를 통해 진행이 가능합니다.\n\n또한, 단순변심 환불로 판매자와 협의된 경우 배송비는 구매자 부담이 될 수 있습니다. &quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:22}"><strong>교환/반품은
                                                    판매자와 협의 필요</strong></span><br><br>중고상품은 개인간의 거래이므로 전자상거래법, 소비자보호법등이
                                            적용되지 않습니다.<br>물품을 받으신 후
                                            단순변심 또는 전달 받지 못한 하자가 확인되어 교환/반품을 원하실 경우, 판매자와 협의를 통해 진행 해 주시기
                                            바랍니다.&nbsp;<br><br>단순변심 환불로 판매자와 협의된
                                            경우 배송비는 구매자 부담이 될 수 있습니다.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>농수산물을 판매하고 싶은데 어떤 서류가 필요한가요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><strong><span style="color: #ff0000;">농수산물을 판매하실 때&nbsp;통신판매허가증 / 사업자 등록증 / 신분증
                                                필요</span></strong></p>
                                    <p>&nbsp;</p>
                                    <p>※ 생물의 특성상 정확한 제품명 / 구성 / 수량 / 원산지 / 생산자 / 포장상태 / 포장일 / 보관방법 / 해당인증사항 / 유지기한 필히 작성
                                    </p>
                                    <p>※ 수입품 : 수입자, 판매자정보 / 제품관련 정보필요 (연락처 및 주소)</p>
                                    <p>&nbsp;</p>

                                    </p>
                                    </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>현금융통(카드깡)은 어떤 처벌을 받나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>카드깡은 그 행위 자체가 신용카드를 이용한 불법적인
                                                현금융통행위</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p>신용카드를 이용한 현금융통(카드깡)이란 실제로는 물품의 판매 또는 용역의 제공 없이 신용카드에 의한 거래를 가장하여 허위의 매출을 발생시키고,
                                    </p>
                                    <p>이를 현금으로 융통하여 주는 행위입니다.&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>현금융통을 한 상점은 여신전문금융업법 제70조에 의하여 3년 이하의 징역 또는 2천만원 이하의 벌금에 처하게 되며</p>
                                    <p>현금융통을 받은 경우 적발 시 금융질서 문란자로 등록되어 최대 12년간 금융거래 이용에 제재를 받을 수 있습니다.</p>
                                    <p>번개장터에서는 불법 현금융통을 유도하는 상품을 등록할 경우 서비스 이용의 제재 및 관련 법에 의해 처벌 받을 수 있음에 유의하시기 바랍니다.
                                    </p>
                                    <p>이러한 상점과는 거래를 하지 않도록 해주시고, 동 업체의 불법행위에 대해서는</p>
                                    <p>관할 경찰서 등 수사기관 또는 금융감독원에 설치된 &lt;신용카드불법거래감시단; 02-3771-5950∼2&gt;으로 신고하여 주시기 바랍니다.
                                    </p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>수제(음식,화장품)을 판매하고 싶은데 어떤 서류가 필요한가요? </h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>수제(음식,화장품)을 판매하실 통신판매 허기증, 사업자등록증, 신분증
                                                필요</strong> </span></p>
                                    <p>&nbsp;</p>
                                    <p>수제 음식 : 통신 판매 허가증/사업자 등록증/신분증</p>
                                    <p>수제 화장품(비누) : 식약청 허가증/통신 판매 허가증/사업자 등록증/신분증</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>반드시 체크해야할 거래사기 유형</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;" data-mce-mark="1"><strong><span
                                                    data-mce-mark="1"><span
                                                        data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\&quot;[최신 사기 수법 안내]\n \n안녕하세요. 번개장터입니다.\n최근 급증하는 카카오톡 피싱 사기를 예방하기 위해 사기 수법과 대응 방법을 안내해 드립니다.\n보다 안전한 거래를 위해 아래 내용을 꼭 참고해주세요.\n \n \n사기거래 패턴1. “ㅋr톡으로 문의 주세요” \n \n피싱 사기 범죄의 99%는 번개페이가 불가능한 외부 채널(ex. 카카오톡, 문자)에서 발생합니다.\n번개톡 대화 중 카카오톡 등 외부 채널로 유도하거나 상품 상세정보에 \n아래와 같은 피싱 문구가 기재되어 있을 땐, 거래를 즉시 중단하세요. \n사기 거래일 확률이 매우 높습니다. \n \n▶ 피싱 문구: 업무 중이라 번개톡 확인 어려워요. 번개톡은 알람이 느려서요. ㅋr톡, ㅋㅏ@톡, 카톡, 문자, a b c 1 2 3 으로 문의 주세요.\n \n번개톡을 이용하시면 판매자가 피싱 사이트 주소 또는 수상한 계좌번호 입력 시, \n이를 자동 감지하고 경고문을 보내드리며, 사기 피해를 보신 경우에도 남아있는 거래내역을 통해 더욱 더 빠른 지원이 가능합니다.\n거래 하실 땐 안전한 번개톡! 꼭 잊지 마세요!\n \n \n사기거래 패턴2. “안전 거래 링크 전달”\n \n판매자가 ‘링크’ 형태로 전달하는 안전거래(네이버페이, 번개페이 등)는 모두 피싱 사이트입니다.\n최근 사기범들이 즐겨 쓰는 수법은 카카오톡을 통해 안전거래 사칭 링크를 보내고 결제를 유도하는 것입니다. \n아래 사칭 링크 예시를 참고하시고, 절대 클릭하지 마세요!\n \n \n▶번개페이 사칭 링크: pay.bunjang123 등의 형태\n ※ 번개페이 정상 거래 시 예금주 명은 '번개장터 주식회사' 입니다. (그 외 예금주는 모두 사칭 입니다.)\n \n\n \n수사기거래 패턴3. “이미지로 된 계좌번호 및 개인정보” \n\n판매자가 자신의 개인정보(계좌번호, 카카오톡 ID, 연락처 등)를 이미지 형태로 보내는 것은 번개톡의 사기 위험 자동 감지를 피하기 위함입니다.\n번개톡은 사기 위험을 자동으로 감지하고 경고 메시지를 보냅니다.\n판매자가 자신의 개인정보를 문자가 아닌 이미지로 보냈다면, 이를 피하기 위한 시도로 의심할 수 있습니다.\n이 경우 번개톡 상단 > 신고 조회 메뉴를 통해 신고 이력을 꼭 확인하시기 바라며, 혹 신고 이력이 없더라도 반드시 주의하여 거래하시기 바랍니다.\n \n \n수사기거래 패턴4. “안전거래 화면 이미지 전달”\n \n판매자가 안전거래 이미지를 보내며 입금을 요구한다면, 100% 사기입니다. \n사기범들의 또 다른 수법 중 하나는 안전 거래 화면(번개페이/네이버 안전거래)을 조작한 이미지를 보낸 뒤, \n이미지에 나온 계좌번호로 입금을 요구하는 방식입니다. 만약 판매자가 이런 행동을 보인다면, 즉시 거래를 중지하세요!\n \n번개페이는 번개장터에서 구매자가 [구매하기] 버튼을 눌러야만 이용 가능합니다. \n \n \n \n수사기거래 패턴5 “번개장터 고객센터 사칭 입금 요구”\n \n번개장터 고객센터는 입금을 요구하지 않으며,입금을 요구하는 카카오톡 대화, 문의 답변은 100% 사기입니다. \n최근 고객센터를 사칭하여 수수료 미입금, 환불 등을 이유로 추가 입금을 요구하는 범죄 사례가 적발되었습니다. \n만약 번개장터 고객센터에서 입금을 요구받으셨다면, 즉시 대화를 중단하시고 신고해주세요. \n번개장터 고객센터는 어떤 이유에서건 입금을 요구하지 않습니다. \n \n \n \n사기거래 패턴6. “수수료 미입금 에러 등을 이유로 재차 입금 요구” \n \n“수수료 미입금으로 인해 입금 확인이 안된다”\n“환불해드리려면 일정 금액이 채워져야 하니 입금해달라”\n “불법자금 세탁으로 인지되어 보증금을 입금해야 환불 가능하다\&quot;\&quot;\n \n판매자가 이런 말을 하거나, 결제 화면에서 이런 메시지가 뜬다면 피싱 사이트를 이용한 사기일 확률이 매우 높습니다.  \n패턴 2를 참고하셔서 판매자가 보낸 안전 거래 링크를 누르지 마시고, 만약 위 메시지를 받으셨다면 추가 입금하지 마시고 바로 신고해주세요.\n \n \n앞으로도 번개장터는 안전한 거래 문화 조성과 사기 피해 예방을 위해 지속적으로 노력하겠습니다.\n \n감사합니다.\&quot;&quot;}"
                                                        data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                                        data-mce-mark="1">[최신 사기 수법 안내]</span></span></strong></span>
                                    </p>
                                    <p data-renderer-start-pos="2878"><span
                                            data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\&quot;[최신 사기 수법 안내]\n \n안녕하세요. 번개장터입니다.\n최근 급증하는 카카오톡 피싱 사기를 예방하기 위해 사기 수법과 대응 방법을 안내해 드립니다.\n보다 안전한 거래를 위해 아래 내용을 꼭 참고해주세요.\n \n \n사기거래 패턴1. “ㅋr톡으로 문의 주세요” \n \n피싱 사기 범죄의 99%는 번개페이가 불가능한 외부 채널(ex. 카카오톡, 문자)에서 발생합니다.\n번개톡 대화 중 카카오톡 등 외부 채널로 유도하거나 상품 상세정보에 \n아래와 같은 피싱 문구가 기재되어 있을 땐, 거래를 즉시 중단하세요. \n사기 거래일 확률이 매우 높습니다. \n \n▶ 피싱 문구: 업무 중이라 번개톡 확인 어려워요. 번개톡은 알람이 느려서요. ㅋr톡, ㅋㅏ@톡, 카톡, 문자, a b c 1 2 3 으로 문의 주세요.\n \n번개톡을 이용하시면 판매자가 피싱 사이트 주소 또는 수상한 계좌번호 입력 시, \n이를 자동 감지하고 경고문을 보내드리며, 사기 피해를 보신 경우에도 남아있는 거래내역을 통해 더욱 더 빠른 지원이 가능합니다.\n거래 하실 땐 안전한 번개톡! 꼭 잊지 마세요!\n \n \n사기거래 패턴2. “안전 거래 링크 전달”\n \n판매자가 ‘링크’ 형태로 전달하는 안전거래(네이버페이, 번개페이 등)는 모두 피싱 사이트입니다.\n최근 사기범들이 즐겨 쓰는 수법은 카카오톡을 통해 안전거래 사칭 링크를 보내고 결제를 유도하는 것입니다. \n아래 사칭 링크 예시를 참고하시고, 절대 클릭하지 마세요!\n \n \n▶번개페이 사칭 링크: pay.bunjang123 등의 형태\n ※ 번개페이 정상 거래 시 예금주 명은 '번개장터 주식회사' 입니다. (그 외 예금주는 모두 사칭 입니다.)\n \n\n \n수사기거래 패턴3. “이미지로 된 계좌번호 및 개인정보” \n\n판매자가 자신의 개인정보(계좌번호, 카카오톡 ID, 연락처 등)를 이미지 형태로 보내는 것은 번개톡의 사기 위험 자동 감지를 피하기 위함입니다.\n번개톡은 사기 위험을 자동으로 감지하고 경고 메시지를 보냅니다.\n판매자가 자신의 개인정보를 문자가 아닌 이미지로 보냈다면, 이를 피하기 위한 시도로 의심할 수 있습니다.\n이 경우 번개톡 상단 > 신고 조회 메뉴를 통해 신고 이력을 꼭 확인하시기 바라며, 혹 신고 이력이 없더라도 반드시 주의하여 거래하시기 바랍니다.\n \n \n수사기거래 패턴4. “안전거래 화면 이미지 전달”\n \n판매자가 안전거래 이미지를 보내며 입금을 요구한다면, 100% 사기입니다. \n사기범들의 또 다른 수법 중 하나는 안전 거래 화면(번개페이/네이버 안전거래)을 조작한 이미지를 보낸 뒤, \n이미지에 나온 계좌번호로 입금을 요구하는 방식입니다. 만약 판매자가 이런 행동을 보인다면, 즉시 거래를 중지하세요!\n \n번개페이는 번개장터에서 구매자가 [구매하기] 버튼을 눌러야만 이용 가능합니다. \n \n \n \n수사기거래 패턴5 “번개장터 고객센터 사칭 입금 요구”\n \n번개장터 고객센터는 입금을 요구하지 않으며,입금을 요구하는 카카오톡 대화, 문의 답변은 100% 사기입니다. \n최근 고객센터를 사칭하여 수수료 미입금, 환불 등을 이유로 추가 입금을 요구하는 범죄 사례가 적발되었습니다. \n만약 번개장터 고객센터에서 입금을 요구받으셨다면, 즉시 대화를 중단하시고 신고해주세요. \n번개장터 고객센터는 어떤 이유에서건 입금을 요구하지 않습니다. \n \n \n \n사기거래 패턴6. “수수료 미입금 에러 등을 이유로 재차 입금 요구” \n \n“수수료 미입금으로 인해 입금 확인이 안된다”\n“환불해드리려면 일정 금액이 채워져야 하니 입금해달라”\n “불법자금 세탁으로 인지되어 보증금을 입금해야 환불 가능하다\&quot;\&quot;\n \n판매자가 이런 말을 하거나, 결제 화면에서 이런 메시지가 뜬다면 피싱 사이트를 이용한 사기일 확률이 매우 높습니다.  \n패턴 2를 참고하셔서 판매자가 보낸 안전 거래 링크를 누르지 마시고, 만약 위 메시지를 받으셨다면 추가 입금하지 마시고 바로 신고해주세요.\n \n \n앞으로도 번개장터는 안전한 거래 문화 조성과 사기 피해 예방을 위해 지속적으로 노력하겠습니다.\n \n감사합니다.\&quot;&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-mce-mark="1"><br>최근 급증하는 카카오톡 피싱 사기를 예방하기 위해 사기 수법과 대응 방법을 안내해
                                            드립니다.<br>보다 안전한 거래를 위해 아래 내용을 꼭
                                            참고해주세요.<br><br><br><strong>사기거래 패턴1. “ㅋr톡으로 문의 주세요”</strong><br>피싱 사기 범죄의
                                            99%는 번개페이가 불가능한 외부 채널(ex.
                                            카카오톡, 문자)에서 발생합니다.<br>번개톡 대화 중 카카오톡 등 외부 채널로 유도하거나 상품 상세정보에<br>아래와 같은 피싱 문구가
                                            기재되어 있을 땐, 거래를 즉시
                                            중단하세요.<br>사기 거래일 확률이 매우 높습니다.<br>▶ 피싱 문구: 업무 중이라 번개톡 확인 어려워요. 번개톡은 알람이 느려서요.
                                            ㅋr톡, ㅋㅏ@톡, 카톡, 문자, a b
                                            c 1 2 3 으로 문의 주세요.<br><br>번개톡을 이용하시면 판매자가 피싱 사이트 주소 또는 수상한 계좌번호 입력 시,<br>이를
                                            자동 감지하고 경고문을 보내드리며, 사기
                                            피해를 보신 경우에도 남아있는 거래내역을 통해 더욱 더 빠른 지원이 가능합니다.<br>거래 하실 땐 안전한 번개톡! 꼭 잊지
                                            마세요!<br><br><br><strong>사기거래
                                                패턴2. “안전 거래 링크 전달”</strong><br>판매자가 ‘링크’ 형태로 전달하는 안전거래(네이버페이, 번개페이 등)는
                                            모두 피싱 사이트입니다.<br>최근 사기범들이
                                            즐겨 쓰는 수법은 카카오톡을 통해 안전거래 사칭 링크를 보내고 결제를 유도하는 것입니다.<br>아래 사칭 링크 예시를 참고하시고, 절대
                                            클릭하지 마세요!<br><br>▶번개페이
                                            사칭 링크: pay.bunjang123 등의 형태<br>※ 번개페이 정상 거래 시 예금주 명은 '번개장터 주식회사' 입니다. (그 외
                                            예금주는 모두 사칭 입니다.)</span>
                                    </p>
                                    <p data-renderer-start-pos="2878"><span
                                            data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\&quot;[최신 사기 수법 안내]\n \n안녕하세요. 번개장터입니다.\n최근 급증하는 카카오톡 피싱 사기를 예방하기 위해 사기 수법과 대응 방법을 안내해 드립니다.\n보다 안전한 거래를 위해 아래 내용을 꼭 참고해주세요.\n \n \n사기거래 패턴1. “ㅋr톡으로 문의 주세요” \n \n피싱 사기 범죄의 99%는 번개페이가 불가능한 외부 채널(ex. 카카오톡, 문자)에서 발생합니다.\n번개톡 대화 중 카카오톡 등 외부 채널로 유도하거나 상품 상세정보에 \n아래와 같은 피싱 문구가 기재되어 있을 땐, 거래를 즉시 중단하세요. \n사기 거래일 확률이 매우 높습니다. \n \n▶ 피싱 문구: 업무 중이라 번개톡 확인 어려워요. 번개톡은 알람이 느려서요. ㅋr톡, ㅋㅏ@톡, 카톡, 문자, a b c 1 2 3 으로 문의 주세요.\n \n번개톡을 이용하시면 판매자가 피싱 사이트 주소 또는 수상한 계좌번호 입력 시, \n이를 자동 감지하고 경고문을 보내드리며, 사기 피해를 보신 경우에도 남아있는 거래내역을 통해 더욱 더 빠른 지원이 가능합니다.\n거래 하실 땐 안전한 번개톡! 꼭 잊지 마세요!\n \n \n사기거래 패턴2. “안전 거래 링크 전달”\n \n판매자가 ‘링크’ 형태로 전달하는 안전거래(네이버페이, 번개페이 등)는 모두 피싱 사이트입니다.\n최근 사기범들이 즐겨 쓰는 수법은 카카오톡을 통해 안전거래 사칭 링크를 보내고 결제를 유도하는 것입니다. \n아래 사칭 링크 예시를 참고하시고, 절대 클릭하지 마세요!\n \n \n▶번개페이 사칭 링크: pay.bunjang123 등의 형태\n ※ 번개페이 정상 거래 시 예금주 명은 '번개장터 주식회사' 입니다. (그 외 예금주는 모두 사칭 입니다.)\n \n\n \n수사기거래 패턴3. “이미지로 된 계좌번호 및 개인정보” \n\n판매자가 자신의 개인정보(계좌번호, 카카오톡 ID, 연락처 등)를 이미지 형태로 보내는 것은 번개톡의 사기 위험 자동 감지를 피하기 위함입니다.\n번개톡은 사기 위험을 자동으로 감지하고 경고 메시지를 보냅니다.\n판매자가 자신의 개인정보를 문자가 아닌 이미지로 보냈다면, 이를 피하기 위한 시도로 의심할 수 있습니다.\n이 경우 번개톡 상단 > 신고 조회 메뉴를 통해 신고 이력을 꼭 확인하시기 바라며, 혹 신고 이력이 없더라도 반드시 주의하여 거래하시기 바랍니다.\n \n \n수사기거래 패턴4. “안전거래 화면 이미지 전달”\n \n판매자가 안전거래 이미지를 보내며 입금을 요구한다면, 100% 사기입니다. \n사기범들의 또 다른 수법 중 하나는 안전 거래 화면(번개페이/네이버 안전거래)을 조작한 이미지를 보낸 뒤, \n이미지에 나온 계좌번호로 입금을 요구하는 방식입니다. 만약 판매자가 이런 행동을 보인다면, 즉시 거래를 중지하세요!\n \n번개페이는 번개장터에서 구매자가 [구매하기] 버튼을 눌러야만 이용 가능합니다. \n \n \n \n수사기거래 패턴5 “번개장터 고객센터 사칭 입금 요구”\n \n번개장터 고객센터는 입금을 요구하지 않으며,입금을 요구하는 카카오톡 대화, 문의 답변은 100% 사기입니다. \n최근 고객센터를 사칭하여 수수료 미입금, 환불 등을 이유로 추가 입금을 요구하는 범죄 사례가 적발되었습니다. \n만약 번개장터 고객센터에서 입금을 요구받으셨다면, 즉시 대화를 중단하시고 신고해주세요. \n번개장터 고객센터는 어떤 이유에서건 입금을 요구하지 않습니다. \n \n \n \n사기거래 패턴6. “수수료 미입금 에러 등을 이유로 재차 입금 요구” \n \n“수수료 미입금으로 인해 입금 확인이 안된다”\n“환불해드리려면 일정 금액이 채워져야 하니 입금해달라”\n “불법자금 세탁으로 인지되어 보증금을 입금해야 환불 가능하다\&quot;\&quot;\n \n판매자가 이런 말을 하거나, 결제 화면에서 이런 메시지가 뜬다면 피싱 사이트를 이용한 사기일 확률이 매우 높습니다.  \n패턴 2를 참고하셔서 판매자가 보낸 안전 거래 링크를 누르지 마시고, 만약 위 메시지를 받으셨다면 추가 입금하지 마시고 바로 신고해주세요.\n \n \n앞으로도 번개장터는 안전한 거래 문화 조성과 사기 피해 예방을 위해 지속적으로 노력하겠습니다.\n \n감사합니다.\&quot;&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"><br><br><strong>사기거래
                                                패턴3. “이미지로 된 계좌번호 및 개인정보”</strong><br>판매자가 자신의 개인정보(계좌번호, 카카오톡 ID, 연락처
                                            등)를 이미지 형태로 보내는 것은 번개톡의
                                            사기 위험 자동 감지를 피하기 위함입니다.<br>번개톡은 사기 위험을 자동으로 감지하고 경고 메시지를 보냅니다.<br>판매자가 자신의
                                            개인정보를 문자가 아닌 이미지로 보냈다면,
                                            이를 피하기 위한 시도로 의심할 수 있습니다.<br>이 경우 번개톡 상단 &gt; 신고 조회 메뉴를 통해 신고 이력을 꼭 확인하시기
                                            바라며, 혹 신고 이력이 없더라도 반드시
                                            주의하여 거래하시기 바랍니다.<br><br><br><strong>사기거래 패턴4. “안전거래 화면 이미지
                                                전달”</strong><br>판매자가 안전거래 이미지를 보내며 입금을
                                            요구한다면, 100% 사기입니다.<br>사기범들의 또 다른 수법 중 하나는 안전 거래 화면(번개페이/네이버 안전거래)을 조작한 이미지를
                                            보낸 뒤,<br>이미지에 나온 계좌번호로
                                            입금을 요구하는 방식입니다. 만약 판매자가 이런 행동을 보인다면, 즉시 거래를 중지하세요!<br>번개페이는 번개장터에서 구매자가
                                            [구매하기] 버튼을 눌러야만 이용
                                            가능합니다.<br><br><br><br><strong>사기거래 패턴5 “번개장터 고객센터 사칭 입금 요구”</strong><br>번개장터
                                            고객센터는 입금을 요구하지 않으며,입금을
                                            요구하는 카카오톡 대화, 문의 답변은 100% 사기입니다.<br>최근 고객센터를 사칭하여 수수료 미입금, 환불 등을 이유로 추가 입금을
                                            요구하는 범죄 사례가
                                            적발되었습니다.<br>만약 번개장터 고객센터에서 입금을 요구받으셨다면, 즉시 대화를 중단하시고 신고해주세요.<br>번개장터 고객센터는
                                            어떤 이유에서건 입금을 요구하지
                                            않습니다.<br><br><br><br><strong>사기거래 패턴6. “수수료 미입금, 에러 등을 이유로 재차 입금
                                                요구”</strong><br>“수수료 미입금으로 인해 입금
                                            확인이 안된다”<br>“환불해드리려면 일정 금액이 채워져야 하니 입금해달라”<br>“불법자금 세탁으로 인지되어 보증금을 입금해야 환불
                                            가능하다""<br><br>판매자가 이런 말을
                                            하거나, 결제 화면에서 이런 메시지가 뜬다면 피싱 사이트를 이용한 사기일 확률이 매우 높습니다.<br>패턴 2를 참고하셔서 판매자가 보낸
                                            안전 거래 링크를 누르지 마시고, 만약 위
                                            메시지를 받으셨다면 추가 입금하지 마시고 바로 신고해주세요.<br><br><br>앞으로도 번개장터는 안전한 거래 문화 조성과 사기 피해
                                            예방을 위해 지속적으로
                                            노력하겠습니다.<br>감사합니다.</span></p>

                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>적합성 평가 없이 거래 할 수 있는 전자제품은 무엇인가요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>적합성평가 대상에서 제외하는 기자재</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p>1. 전기기기 및 전동기기류, 조명기기류, 또는 멀티미디어기기류의 기자재 중 USB 또는 건전지(충전지 포함) 전원으로 동작하는 것으로서</p>
                                    <p>&nbsp; &nbsp;학교 등 교육기관에서 과학 실습용으로 사용되는 조립용품 세트(키트)</p>
                                    <p>&nbsp;</p>
                                    <p>2. 디지털장치류에 해당하는 기자재 중 다음 각 호에 해당하는 기자재</p>
                                    <p>&nbsp; 1) 능동 전자회로의 증폭기가 없는 헤드폰과 확성기(스피커)</p>
                                    <p>&nbsp; 2) 적외선 통신방식의 원격제어기기(예 : TV 리모콘 등)</p>
                                    <p>&nbsp; 3) 카메라 렌즈</p>
                                    <p>&nbsp; 4) 배터리(보조배터리, 전자담배배터리 포함)</p>
                                    <p>&nbsp; 5) 케이블, 케이블연결기, 케이블액세서리</p>
                                    <p>&nbsp;</p>
                                    <p>3. 전기기기 및 전동기기류, 조명기기류, 또는 디지털장치류에 해당하는 기자재로 USB 또는 건전지(충전지 포함) 전원으로 동작하는 기자재 중
                                        다음 각 호에 해당하는 기자재</p>
                                    <p>&nbsp; 1) 단순 계산이나 계측용으로 사용하는 휴대용 전자계산기, 디지털체중계, 디지털온습도계, 디지털체온계, 디지털혈당계, 디지털수평계,
                                        디지털멀티미터 또는 이와 유사한 기기</p>
                                    <p>&nbsp; 2) 단순 시계기능만을 가진 전자시계</p>
                                    <p>&nbsp; 3) 불을 붙이기 위해 사용되는 전기라이터</p>
                                    <p>&nbsp; 4) 전동기(모터)를 사용하지 않으며, 일시적(2분미만)으로 빛과 소리만 나거나 빛 또는 소리만 나는 완구류 (어린이용 장난감)
                                    </p>
                                    <p>&nbsp; 5) 단순 On/Off 및 점멸 기능만 있는 LED 랜턴 또는 이와 유사한 기자재</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>후기작성 기준이 궁금해요!</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p>안녕하세요 번개장터입니다.&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>거래를 완료한 시점에 판매자, 구매자 모두 상대방 상점에 대한 후기 작성이 가능합니다.&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>상점 후기를 작성하는 방법은 아래와 같습니다.&nbsp;&nbsp;</p>
                                    <p><strong><br>1) 후기 작성 방법</strong>&nbsp;</p>
                                    <p><img src=""></p>
                                    <p><strong>※</strong>&nbsp;상대방이 등록한 후기에 [답글쓰기] 버튼을 통해서도 작성 가능합니다.</p>
                                    <p>&nbsp;</p>
                                    <p><strong>※ 거래 없이도 작성 가능했던 일반후기 서비스는 2월 말로 서비스 종료 되었으며, 현재는 거래완료 이후에만 상점후기 작성이
                                            가능합니다.&nbsp;</strong></p>
                                    <p><span style="color: #0000ff;"><a title="상점후기 정책 변경 안내 바로가기"
                                                href="https://m.bunjang.co.kr/customer/notice/643" target="_blank"><span
                                                    style="color: #0000ff;"><strong>상점후기 정책 변경 안내
                                                        바로가기</strong></span></a></span></p>
                                    </p>
                                </div>
                            </li>
                        </ul>
                        <ul class="qaBox">
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>'번개페이'란 무엇인가요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>안전한 거래를 위해 택배거래와 직거래 모두 안전하게 번개페이로
                                                구매하세요!</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p>거래가 완료될 때까지 번개페이가 결제대금을 안전하게 보관합니다.</p>
                                    <p>1. 번개페이는 신용카드를 포함한 모든 결제수단을 지원합니다. 사기 걱정 없이 번개페이로 안전하게 결제하고, 할부·적립 등 카드사 혜택도 누릴 수
                                        있어요.</p>
                                    <p>2.구매확정' 후 즉시 결제 대금이 판매자에게 즉시 입금되어 정산 소요 기간이 짧아졌습니다.</p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>번개페이 ‘안전결제 환영’으로 판매 시 주의해야 하는 점은 무엇이 있나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><strong><span style="color: #ff0000;">안전결제 환영 적용 후 아래의 내용으로 신고가 접수될 경우 제재를 받을 수
                                                있습니다.</span></strong>
                                        <br>안전하고 깨끗한 거래 환경이 유지될 수 있도록 협조 부탁 드립니다.
                                    </p>
                                    <p>&nbsp;</p>
                                    <p><strong>[제재 대상]</strong></p>
                                    <p>&nbsp;- 안전결제 환영 적용 후 안전결제를 거부하는 경우</p>
                                    <p>&nbsp;- 안전결제 판매를 조건으로 추가 금액 결제를 요구하는 경우</p>
                                    <p>&nbsp;- 안전결제 판매를 조건으로 상품 발송 전 선 구매확정을 요구하는 경우</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>택배거래는 택배 운송장번호만 등록 가능한가요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>택배거래시 택배 운송장번호 등록만 가능</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p>택배 발송 후, 운송장번호를 입력하면 배송중 상태로 변경되며 배송 완료 후 배송완료 상태로 변경됩니다.</p>
                                    <p>* 우편, 등기 등 택배 배송 외 다른 방법으로 상품을 전달한 경우 [운송장 입력] - [배송없음/직접전달]을 선택하여 배송완료로 변경
                                        가능합니다.</p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1> 택배결제로 구매 했는데 직거래로 변경하고 싶어요.</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>택배거래로 결제 후 직거래로 변경 불가</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p>택배결제는 택배 발송 후 '운송장 번호’를 입력해야 합니다.</p>
                                    <p>만약 구매자와 직거래를 하는 경우라면 [운송장 입력] 화면에서 ‘배송없음/직접전달’을 선택하여 배송 완료 처리해 주시면 됩니다.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>번개페이 수수료는 어떻게 되나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><strong>번개페이 수수료는 구매자 부담이며 모든 결제수단에 동일하게 상품 금액의 3.5% 수수료가 적용됩니다.</strong></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>물건을 판매했는데 언제 구매확정이 되나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>거래방법에 따라 구매확정기간 상이</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p><strong>[구매확정 기간]</strong></p>
                                    <p>택배 거래: 배송완료 시점으로부터 7일 후 자동 구매확정완료 (7일 이전에 구매자가 구매확정 가능)</p>
                                    <p>직거래: 구매자의 구매확정 필요</p>
                                    <p>&nbsp;</p>
                                    <div id="gtx-trans">&nbsp;</div>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>무통장입금의 가상계좌가 만료되었어요.</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>가상계좌 유효기간: 발급 후 24시간</strong></span></p>
                                    <p>가상계좌 발급 후 24시간이 지나면 가상계좌가 만료되어 거래가 취소됩니다.</p>
                                    <p>따라서 거래 진행을 위해 24시간 이내 발급된 가상계좌로 입금해 주세요.</p>
                                    <p>가상계좌가 만료될 경우 다시 가상계좌를 발급받을 수 있습니다.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>[번개페이] 번개페이는 택배거래만 가능한가요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><strong><span style="color: #ff0000;">택배거래 및 직거래 모두 번개페이 결제 가능 </span></strong>
                                    </p>
                                    <p>직거래도 안전하게 번개페이로 거래할 수 있습니다.</p>
                                    <p>'직거래'로 미리 결제 하면, 판매자와 직접 만나 상품을 수령할 때까지 결제대금은 번개페이가 안전하게 보관합니다.</p>
                                    <p>상품 전달 받은 후 구매확정을 해주세요!</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>판매한 상품은 언제 정산 되나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p class="MsoNormal"><span style="color: #ff0000;"><strong>구매확정 시 즉시 정산(최대 1시간 이내)
                                            </strong></span></p>
                                    <p>&nbsp;</p>
                                    <p>구매확정 시 등록된 정산 계좌로 판매 금액이 즉시 입금됩니다. (최대 1시간 이내)</p>
                                    <p>단, 운영 정책에 따라 추가 정산기간이 발생할 수 있습니다.</p>
                                    <p>&nbsp;</p>
                                    <p><strong>[당일 정산 불가 CASE]</strong></p>
                                    <p class="MsoNormal">&nbsp;<img
                                            src="https://lh4.googleusercontent.com/l08kHJd6ONsz96y4QeU1NGCLZYBHXTqkYGQhxIAJeJzb0Nha041MJksgj5vBVkeIGaAXaxKGG-Or2Nd5eym0VDeaLiprLeogF20Tr9McdZyAZtkaS-AzC0vstXBzJFkkxFM4dEcU-              alt="" width="
                                            477px;" height="143px;"></p>
                                    <p><strong>[구매확정 기간] </strong></p>
                                    <p>- 택배거래: 구매자의 구매확정 시 or 배송완료 시점으로부터 최대 7일 후 자동으로 구매확정 됩니다.</p>
                                    <p>- 직거래: 구매자의 구매확정 처리 후 완료됩니다.&nbsp;</p>
                                    <p><span style="color: #0000ff;"><strong><a
                                                    href="https://pay2.bunjang.co.kr/bank-accounts"><span
                                                        style="color: #0000ff;">정산 계좌
                                                        등록하기&gt;</span></a></strong></span></p>
                                    <p>이 외에 운영정책 위반 시 정산이 보류될 수 있으며 자세한 사항은 고객센터 &gt; 1:1로 문의 접수를 부탁드립니다.</p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>구매자가 결제한 상품을 거래취소하고 싶어요.</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>배송 전 상태에서 거래취소 가능 </strong></span></p>
                                    <p>&nbsp;</p>
                                    <p>배송전 거래 취소를 원하시는 경우 번개페이 주문서 &gt;'판매 거절'을 누르면 거래가 취소됩니다.</p>
                                    <p>구매자도 판매자의 판매승인 전까지는 자유롭게 결제취소 가능합니다.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>결제한 상품을 구매취소하고 싶어요.</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>1. 번개페이 결제 후, 판매자의 판매승인 전까지 자유롭게 결제취소 가능
                                            </strong></span></p>
                                    <p>- 결제취소 방법: 내상점 &gt; 판매/거래내역 &gt; 결제상품 &gt; '결제취소하기' 클릭</p>
                                    <p>&nbsp;</p>
                                    <p><span style="color: #ff0000;"><strong> 2. 판매자의 판매승인 이후에는 판매자가 상품 배송을 준비하고 있기에
                                                취소요청만 가능 </strong></span>
                                    </p>
                                    <p>- 취소요청 방법: 내상점 &gt; 판매/거래내역 &gt; 결제상품 &gt; '취소요청' 클릭</p>
                                    <p>- 취소요청 후 판매자의 응답이 없는 경우, 3일 후 자동 환불처리 됩니다.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>실수로 배송완료 전에 구매확정을 먼저 눌렀어요.</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>구매확정 후 구매확정 취소 불가</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p><span style="text-decoration: underline;"> 구매확정후 에는 상품 금액이 판매자에게 즉시 입금됩니다.
                                        </span></p>
                                    <p>따라서 배송완료 이전에 판매자가 구매확정을 요청하는 경우 사기 위험에 노출될 수 있으므로 반드시 상품 확인 후에 구매확정을 해주세요.</p>
                                    <p>* 불법 금융대출 목적으로 번개페이를 이용할 경우 금융거래에 불이익을 받을 수 있습니다.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>거래를 취소했어요. 언제 환불 되나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>&nbsp;환불이 완료되는 기간은 결제 수단에 따라
                                                상이</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p>- 차이결제: 차이앱 &gt;차이머니를 통해 당일 환불</p>
                                    <p>- 간편계좌결제: 즉시 환불</p>
                                    <p>- 카카오페이(머니): 즉시 환불</p>
                                    <p>- 카카오페이(카드): 카드사 통해 영업일 기준 최대 5일 이내 환불</p>
                                    <p>- 카드결제: 카드사 통해 영업일 기준 최대 5일 이내 환불</p>
                                    <p>- 무통장입금(가상계좌): 영업일 기준 최대 5일 이내 환불</p>
                                    <p>&gt; 무통장입금(가상계좌)은 환불 계좌를 입력 해야합니다.</p>
                                    <p>미리 환불계좌를 등록해주세요.&nbsp;</p>
                                    <p class="MsoNormal">&nbsp;&nbsp;<a
                                            href="https://pay2.bunjang.co.kr/bank-accounts">환불 계좌 등록하기&gt;</a></p>
                                    <div id="gtx-trans" style="position: absolute; left: 439px; top: 157px;">&nbsp;
                                    </div>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>판매자가 거래를 취소했어요.</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong> 판매자가 발송 전 거래취소 가능</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p>판매자가 판매승인 없이, 거래를 취소할 수 있습니다.</p>
                                    <p>따라서 결제 전 반드시 판매자와 '번개페이' 사용 여부에 대해 협의해 주세요.</p>
                                    <p>무통장입금(가상계좌) 주문취소건은 '환불계좌'를 입력해야 환불이 가능합니다.</p>
                                    <p>미리 환불계좌를 입력하면 취소 시 바로 환불계좌가 적용됩니다. </p>
                                    <p>&nbsp;</p>
                                    <p><a href="https://pay2.bunjang.co.kr/bank-accounts">환불 계좌 등록하기&gt;</a></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>결제했는데 판매자가 상품을 발송하지 않아요.</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>번개톡을 통해 판매자에게 배송예정일 문의 필요</strong></span>
                                    </p>
                                    <p>&nbsp;</p>
                                    <p>연락두절 등의 사유로 판매자가 상품을 발송하지 않는 경우 결제취소 또는 취소요청을 해주세요.</p>
                                    <p>[거래취소 방법]</p>
                                    <p>- 내상점 &gt; 구매/거래내역 &gt; 거래상품 &gt; '결제취소' 또는 '취소 요청'</p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>신용카드로 판매가 제한되었어요. 어떻게 해지할 수 있나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p>번개장터는 신용카드를 이용한 불법현금융통을 막기 위해 노력하고 있습니다.</p>
                                    <p>신용카드 판매 한도를 초과하여 거래할 경우 구매자는 카드로 결제를 할 수 없습니다.</p>
                                    <p>신용카드 판매 한도를 초과하여 거래하기 원하실 경우 아래의 작성 사항 및 첨부 파일을 이메일(help@bunjang.co.kr)로 보내주세요.
                                    </p>
                                    <p>&nbsp;</p>
                                    <p>- 이메일 제목: 신용카드 판매 한도 제한 해지 요청</p>
                                    <p>- 작성 항목</p>
                                    <p>&nbsp;1.상점명</p>
                                    <p>&nbsp;2. 제한 해지 요청 사유</p>
                                    <p>&nbsp;3. 한도제한 해지 요청 일자(월/일)</p>
                                    <p>&nbsp;4. 첨부 파일 (직거래 자료만 제출)</p>
                                    <p>&nbsp;</p>
                                    <p>-&nbsp; 첨부 파일 항목</p>
                                    <p>1) 구매자와 장소 및 거래 방법에 대해 협의한 대화내용 첨부(ex. 대화 스크린샷 이미지, 통화 내용 녹음 파일 등)</p>
                                    <p>2) 판매한 상품을 촬영한 사진 파일 원본 첨부</p>
                                    <p>3) 상품 상태 확인 및 거래 완료 여부를 구매자가 확인한 대화내용 스크린 샷</p>
                                    <p>&nbsp;</p>
                                    <p>요청 자료 검토 후 한도 해지가 가능한 상점인 경우 신용카드 판매 한도 제한을 해지해드립니다.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>[번개페이] 배송완료된 상품을 반품하고 싶어요.</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>반품요청 전 판매자와 사전협의 필요</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p>반품 요청은 '배송중' 또는 '배송완료' 상태에서 가능합니다.</p>
                                    <p>반품 요청 후 판매자가 반품요청승인을 해야 반품진행이 가능합니다.</p>
                                    <p>* 반품요청 방법 - 내상점 &gt; 구매/거래내역 &gt; 결제상품 &gt; '반품요청' 클릭 판매자의 반품요청승인 후, 반송 운송장번호를
                                        등록해주세요.</p>
                                    <p>반품 상품을 판매자가 확인 후 최종 환불이 진행됩니다.</p>
                                    <p>*판매자의 동의 없이 판매자에게 상품을 반송하는 경우 환불이 어려울 수 있습니다.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>[편의점 결제] 편의점에서 결제/환불 방법이 궁금해요</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><strong>1.&nbsp;편의점에서 결제는 이렇게 진행해주세요</strong></p>
                                    <p>① 계산대 직원에게 바코드를 보여주세요</p>
                                    <p>② 현금 결제하고 구매 영수증을 받습니다</p>
                                    <p>③ 결제가 완료되었는지 주문서를 확인해주세요</p>
                                    <p>&nbsp;</p>
                                    <p><strong>2. 편의점에서 환불은 이렇게 진행해주세요</strong></p>
                                    <p>① 계산대 직원에게 구매 영수증과 바코드를 보여주세요</p>
                                    <p>② 환불이 완료되었는지 주문서를 확인해주세요</p>
                                    <p>&nbsp;</p>
                                    <p><strong>3. 점원이 결제 방법을 모른다면 이렇게 알려주세요</strong></p>
                                    <p>① POS에서 서비스 판매 &gt; 쇼핑몰)편의점 결제 선택</p>
                                    <p>② 바코드 스캔 (인식이 안되면 수납번호 직접입력)</p>
                                    <p>&nbsp;</p>
                                    <p
                                        data-pm-slice="1 1 [&quot;table&quot;,null,&quot;tableRow&quot;,null,&quot;tableCell&quot;,null,&quot;panel&quot;,null]">
                                        <strong>4. 점원이 환불 방법을 모른다면 이렇게 알려주세요</strong>
                                    </p>
                                    <div data-panel-type="success"
                                        data-pm-slice="2 2 [&quot;table&quot;,null,&quot;tableRow&quot;,null,&quot;tableCell&quot;,null]">
                                        <p>① POS에서 서비스 판매 &gt; 쇼핑몰)편의점 결제 선택</p>
                                        <p>② 바코드 스캔 (인식이 안되면 수납번호 직접입력)</p>
                                        <p>&nbsp;</p>
                                        <p><strong>5. 결제/환불이 완료되지 않으면 아래를 확인해주세요</strong></p>
                                        <p>① 결제완료 실패 : 판매자가 상품금액, 판매상태를 변경했는지 확인해주세요</p>
                                        <p>② 환불완료 실패 : 판매자와 거래취소가 완료되었는지 확인해주세요</p>
                                        <p>** 확인 후에도 문제가 발생하면 고객센터로 문의해주세요</p>
                                    </div>
                                    </p>
                                </div>
                            </li>
                        </ul>
                        <ul class="qaBox">
                            <li class="qaBox1">
                                <article class="joqDct"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>개인정보 설정은 어떻게 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong><span
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;내상점 > 설정 > 계정설정'에서 개인정보 설정 가능\n*계정설정에서 연락처 공개로 설정 시, 다른 상점이 내 연락처로 연락을 할 수 있습니다.&quot;,&quot;6&quot;:1}"
                                                    data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:0,&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:9}"
                                                    data-sheets-textstyleruns="">내상점 &gt; 설정 &gt; 계정설정'에서 개인정보 설정
                                                    가능</span></strong></span></p>
                                    <p>&nbsp;</p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;내상점 > 설정 > 계정설정'에서 개인정보 설정 가능\n*계정설정에서 연락처 공개로 설정 시, 다른 상점이 내 연락처로 연락을 할 수 있습니다.&quot;,&quot;6&quot;:1}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:0,&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns=""><br>계정설정에서 연락처 공개로 설정 시, 다른 상점이 내 연락처로 연락을 할 수
                                            있습니다.</span></p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>내 상점 소개는 어떻게 설정 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong><span
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;내상점 > 설정 > 상점설정'에서 상점소개 등록 및 수정 가능\n상점소개 설정 시 다른 상점이 내 상점을 방문할 때 내 상점 소개를 확인할 수 있습니다.&quot;,&quot;6&quot;:1}"
                                                    data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:0,&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:9}"
                                                    data-sheets-textstyleruns="">내상점 &gt; 설정 &gt; 상점설정'에서 상점소개 등록 및 수정
                                                    가능</span></strong></span></p>
                                    <p>&nbsp;</p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;내상점 > 설정 > 상점설정'에서 상점소개 등록 및 수정 가능\n상점소개 설정 시 다른 상점이 내 상점을 방문할 때 내 상점 소개를 확인할 수 있습니다.&quot;,&quot;6&quot;:1}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:0,&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns=""><br>상점소개 설정 시 다른 상점이 내 상점을 방문할 때 내 상점 소개를 확인할
                                            수 있습니다.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>상점명을 변경하고 싶어요. </h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong><span
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;내상점 > 설정 > 상점설정'에서 상점명 변경 가능\n상점명은 마지막 변경일로부터  30일 후 다시 변경이 가능합니다.&quot;,&quot;6&quot;:1}"
                                                    data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:0,&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:9}"
                                                    data-sheets-textstyleruns="">내상점 &gt; 설정 &gt; 상점설정'에서 상점명 변경
                                                    가능</span></strong></span></p>
                                    <p>&nbsp;</p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;내상점 > 설정 > 상점설정'에서 상점명 변경 가능\n상점명은 마지막 변경일로부터  30일 후 다시 변경이 가능합니다.&quot;,&quot;6&quot;:1}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:0,&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns=""><br>상점명은 마지막 변경일로부터 30일 후 다시 변경이 가능합니다.</span>
                                    </p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>번개톡 대화내역을 삭제했어요 다시 복구해주세요.</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;삭제된 번개톡 대화방은 복구가 불가\n\n-개인정보 보호법에 따라 삭제된 대화방은 복구가 어렵습니다.\n거래 분쟁으로 인해 대화내역 확인이 필요하시다면 1:1문의로 접수 바랍니다.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:0,&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns=""><span style="color: #ff0000;"><strong>삭제된 번개톡
                                                    대화방은 복구가
                                                    불가</strong></span></span></p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;삭제된 번개톡 대화방은 복구가 불가\n\n-개인정보 보호법에 따라 삭제된 대화방은 복구가 어렵습니다.\n거래 분쟁으로 인해 대화내역 확인이 필요하시다면 1:1문의로 접수 바랍니다.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:0,&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns=""><br><br>-개인정보 보호법에 따라 삭제된 대화방은 복구가
                                            어렵습니다.<br>거래 분쟁으로 인해 대화내역 확인이
                                            필요하시다면 1:1문의로 접수 바랍니다.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>탈퇴 후 재가입은 언제 할 수 있나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;탈퇴시점으로부터 7일 후 재가입이 가능\n\n- 탈퇴 후 재가입이 가능한 기간은 7일로서, 탈퇴 시점으로부터 7일 후 재가입이 가능합니다.\n재가입시, 기존에 상점을 이용하셨던 내역은 모두 삭제되어 복구가 불가능한 점  참고해주세요!&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:0,&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns=""><span style="color: #ff0000;"
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;탈퇴시점으로부터 7일 후 재가입이 가능\n\n- 탈퇴 후 재가입이 가능한 기간은 7일로서, 탈퇴 시점으로부터 7일 후 재가입이 가능합니다.\n재가입시, 기존에 상점을 이용하셨던 내역은 모두 삭제되어 복구가 불가능한 점  참고해주세요!&quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:0,&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns=""><strong>탈퇴시점으로부터 7일 후 재가입이
                                                    가능</strong></span><br><br>탈퇴 후 재가입이 가능한
                                            기간은 7일로서, 탈퇴 시점으로부터 7일 후 재가입이 가능합니다.<br>재가입시, 기존에 상점을 이용하셨던 내역은 모두 삭제되어 복구가
                                            불가능한 점 참고해주세요!</span>
                                    </p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>본인인증 시 인증번호가 안와요.</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;본인인증 시 인증번호 메세지를 지속적으로 받지 못하시는 경우, \n본인인증 서비스를 제공하는 기관에서 확인이 필요하니 아래와 같이 진행 부탁드립니다.\n\n회원가입 또는 로그인 화면에서  본인인증을 시도하는 경우\n- 다날 고객센터 문의 (1566-3355)\n\n로그인 후  본인인증을 시도하는 경우(내상점,상품 등록시 등)\n- 나이스 신용정보 고객센터 문의  (02-2122-4000)\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:0,&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:9}">본인인증
                                            시 인증번호 메세지를 지속적으로 받지 못하시는 경우,<br>본인인증 서비스를 제공하는 기관에서 확인이 필요하니 아래와 같이 진행
                                            부탁드립니다.<br><br>회원가입 또는 로그인
                                            화면에서 본인인증을 시도하는 경우<br>- 다날 고객센터 문의 (1566-3355)<br><br>로그인 후 본인인증을 시도하는
                                            경우(내상점,상품 등록시
                                            등)<br></span><span
                                            data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;본인인증 시 인증번호 메세지를 지속적으로 받지 못하시는 경우, \n본인인증 서비스를 제공하는 기관에서 확인이 필요하니 아래와 같이 진행 부탁드립니다.\n\n회원가입 또는 로그인 화면에서  본인인증을 시도하는 경우\n- 다날 고객센터 문의 (1566-3355)\n\n로그인 후  본인인증을 시도하는 경우(내상점,상품 등록시 등)\n- 나이스 신용정보 고객센터 문의  (02-2122-4000)\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:0,&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:9}">-
                                            나이스 신용정보 고객센터 문의 (02-2122-4000)</span><span
                                            style="font-size: 9pt; font-family: Arial;"
                                            data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;본인인증 시 인증번호 메세지를 지속적으로 받지 못하시는 경우, \n본인인증 서비스를 제공하는 기관에서 확인이 필요하니 아래와 같이 진행 부탁드립니다.\n\n회원가입 또는 로그인 화면에서  본인인증을 시도하는 경우\n- 다날 고객센터 문의 (1566-3355)\n\n로그인 후  본인인증을 시도하는 경우(내상점,상품 등록시 등)\n- 나이스 신용정보 고객센터 문의  (02-2122-4000)\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:0,&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:9}"><br></span>
                                    </p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>통신사별 가입 사실 확인서는 어디서 발급 받을 수 있나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;통신사별 가입 사실 확인서 발급방법 상이 \n\n1. SKT: ‘이용계약 등록사항 증명서'를 PC에서 발급 가능 합니다.\n 경로 : 로그인 > myt > 나의 가입 정보 > 증명서 조회\n \n2. KT: ‘가입원부증명서’를 PC,모바일에서 발급 받을 수 있습니다.\n1) 웹: https://kt.com > 마이페이지 > 조회/변경 > 가입 정보 에서 발급 \n2) 앱: ‘마이케이티’ > 마이페이지 > 가입정보 > 개통이력 조회에서 발급\n \n3. LG U+: PC, 직영점 내방하여 발급 받을 수 있습니다. \n1) PC: http://bitly.kr/mMHDIOi 에서 발급 가능, 실명인증 및 가입조회 하기 확인 후에 가입사실 확인서를 프린트 하실 수 있습니다. \n2) 직영점(대리점) 내방하여 발급 가능\n(1) 개인(명의자)은 명의자 신분증, 대리인은 명의자 신분증, 대리인 신분증\n(2) 미성년자는 명의자 신분증, 법정대리인은 법정대리인 신분증, 가족증빙서류\n(3) 사진 및 주민등록번호 명시되지 않은 경우, '성인' 기준의 신분증 별도 필요\n \n4. 기타 별정 통신사는 해당 통신사 고객센터로 문의를 부탁드립니다.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:25}"><span
                                                style="color: #ff0000;"><strong>통신사별 가입 사실 확인서 발급방법
                                                    상이</strong></span></span></p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;통신사별 가입 사실 확인서 발급방법 상이 \n\n1. SKT: ‘이용계약 등록사항 증명서'를 PC에서 발급 가능 합니다.\n 경로 : 로그인 > myt > 나의 가입 정보 > 증명서 조회\n \n2. KT: ‘가입원부증명서’를 PC,모바일에서 발급 받을 수 있습니다.\n1) 웹: https://kt.com > 마이페이지 > 조회/변경 > 가입 정보 에서 발급 \n2) 앱: ‘마이케이티’ > 마이페이지 > 가입정보 > 개통이력 조회에서 발급\n \n3. LG U+: PC, 직영점 내방하여 발급 받을 수 있습니다. \n1) PC: http://bitly.kr/mMHDIOi 에서 발급 가능, 실명인증 및 가입조회 하기 확인 후에 가입사실 확인서를 프린트 하실 수 있습니다. \n2) 직영점(대리점) 내방하여 발급 가능\n(1) 개인(명의자)은 명의자 신분증, 대리인은 명의자 신분증, 대리인 신분증\n(2) 미성년자는 명의자 신분증, 법정대리인은 법정대리인 신분증, 가족증빙서류\n(3) 사진 및 주민등록번호 명시되지 않은 경우, '성인' 기준의 신분증 별도 필요\n \n4. 기타 별정 통신사는 해당 통신사 고객센터로 문의를 부탁드립니다.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:25}"><br><br><strong>1.
                                                SKT:
                                                ‘이용계약 등록사항 증명서'를 PC에서 발급 가능 합니다.</strong><br>경로 : 로그인 &gt; myt &gt; 나의
                                            가입 정보 &gt; 증명서
                                            조회<br><br><strong>2. KT: ‘가입원부증명서’를 PC,모바일에서 발급 받을 수
                                                있습니다.</strong><br>&nbsp;1) 웹: https://kt.com
                                            &gt; 마이페이지 &gt; 조회/변경 &gt; 가입 정보 에서 발급<br>&nbsp;2) 앱: ‘마이케이티’ &gt; 마이페이지
                                            &gt; 가입정보 &gt; 개통이력 조회에서
                                            발급<br><br><strong>3. LG U+: PC, 직영점 내방하여 발급 받을 수 있습니다.</strong><br>&nbsp;1)
                                            PC:
                                            http://bitly.kr/mMHDIOi 에서 발급 가능, 실명인증 및 가입조회 하기 확인 후에 가입사실 확인서를 프린트 하실 수
                                            있습니다.<br>&nbsp;2) 직영점(대리점)
                                            내방하여 발급 가능<br>&nbsp; (1) 개인(명의자)은 명의자 신분증, 대리인은 명의자 신분증, 대리인 신분증<br>&nbsp;
                                            (2) 미성년자는 명의자 신분증, 법정대리인은
                                            법정대리인 신분증, 가족증빙서류<br>&nbsp; (3) 사진 및 주민등록번호 명시되지 않은 경우, '성인' 기준의 신분증 별도
                                            필요<br><br><br></span></p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>계정도용시 신고는 어떻게 진행해야 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;계정 도용 시 수사기관 접수\n\n번개장터의 권한으로는 도용에 대한 명확한 정황을 확인하기가 어려운 관계로 아래의 방법으로 신고접수를 부탁드립니다. \n \n1. 사이버안전지킴이\nhttp://www.police.go.kr/www/security/cyber.jsp\n \n계정이 도용된 경우 피해 내용과 함께 로그인 기록을 제출하셔야 하며,\n로그인 기록은 1:1문의로 휴대폰 가입사실 확인서를 첨부한 뒤 로그인 기록을 받으실\n이메일을 함께 작성하여 문의하시면 해당 메일로 제공해드리고 있습니다.\n \n2. 경찰서로 방문하여 신고접수\n가까운 경찰서로 방문하여 신고접수가 가능합니다. 경찰서 방문 신고 시에도 로그인 기록을 제출하셔야 하며, 로그인 기록 제공방식은 위와 동일합니다.\n \n회원님의 피해사실에 대해 사이버안전지킴이 및 경찰서를 통한 신고접수 시 \n수사에 최대한 협조 진행하고 있으니 도용이 의심되는 경우 빠른 신고접수를 부탁드립니다.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:17}"><span
                                                style="color: #ff0000;"><strong>계정 도용 시 수사기관 접수</strong></span></span>
                                    </p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;계정 도용 시 수사기관 접수\n\n번개장터의 권한으로는 도용에 대한 명확한 정황을 확인하기가 어려운 관계로 아래의 방법으로 신고접수를 부탁드립니다. \n \n1. 사이버안전지킴이\nhttp://www.police.go.kr/www/security/cyber.jsp\n \n계정이 도용된 경우 피해 내용과 함께 로그인 기록을 제출하셔야 하며,\n로그인 기록은 1:1문의로 휴대폰 가입사실 확인서를 첨부한 뒤 로그인 기록을 받으실\n이메일을 함께 작성하여 문의하시면 해당 메일로 제공해드리고 있습니다.\n \n2. 경찰서로 방문하여 신고접수\n가까운 경찰서로 방문하여 신고접수가 가능합니다. 경찰서 방문 신고 시에도 로그인 기록을 제출하셔야 하며, 로그인 기록 제공방식은 위와 동일합니다.\n \n회원님의 피해사실에 대해 사이버안전지킴이 및 경찰서를 통한 신고접수 시 \n수사에 최대한 협조 진행하고 있으니 도용이 의심되는 경우 빠른 신고접수를 부탁드립니다.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:17}"><br><br>번개장터의
                                            권한으로는 도용에 대한 명확한 정황을 확인하기가 어려운 관계로 아래의 방법으로 신고접수를 부탁드립니다.<br><br><strong>1.
                                                사이버안전지킴이</strong><br>http://www.police.go.kr/www/security/cyber.jsp<br><br>계정이
                                            도용된 경우 피해 내용과 함께
                                            로그인 기록을 제출하셔야 하며,<br>로그인 기록은 1:1문의로 휴대폰 가입사실 확인서를 첨부한 뒤 로그인 기록을 받으실<br>이메일을
                                            함께 작성하여 문의하시면 해당 메일로
                                            제공해드리고 있습니다.<br><br><strong>2. 경찰서로 방문하여 신고접수</strong><br>가까운 경찰서로 방문하여
                                            신고접수가 가능합니다. 경찰서 방문 신고 시에도
                                            로그인 기록을 제출하셔야 하며, 로그인 기록 제공방식은 위와 동일합니다.<br><br>회원님의 피해사실에 대해 사이버안전지킴이 및
                                            경찰서를 통한 신고접수 시<br>수사에 최대한
                                            협조 진행하고 있으니 도용이 의심되는 경우 빠른 신고접수를 부탁드립니다.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>휴면계정 해제는 어떻게 하나요? </h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>휴면계정은 해제가 불가, 재가입을 통한 서비스
                                                이용가능</strong></span></p>
                                    <p><br><br>회원의 개인 정보보호를 위해 1년 이상 서비스 이용이 없는 고객들을 대상으로 휴면 계정 정책을 시행합니다.<br><br>휴면
                                        계정으로 전환되는 경우 아래의 내용이 적용
                                        됩니다.<br>1. 개인 정보를 포함한 서비스 이용 정보가 모두 삭제처리<br>2. 보유한 포인트는 모두 소멸<br>3. 휴면 전환 즉시 해당
                                        사용자의 계정은 번개장터에서 탈퇴
                                        처리됩니다.<br><br></p>
                                    <p>관련 법령<br>- 개인정보 보호법 제39조의6 및 시행령 제48조의5(개인정보의 파기에 대한 특례)에 따라<br>정보통신서비스 제공자등은
                                        정보통신서비스를 1년의 기간 동안 이용하지
                                        아니하는 이용자의 개인정보를 보호하기 위하여 대통령령으로 정하는바에 따라 개인정보의 파기 등 필요한 조치를취하여야 한다.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>14세 미만은 가입이 불가한가요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p data-renderer-start-pos="293"><span
                                            data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot; 14세 미만 회원 가입불가\n\n번개장터는 만 14세미만 회원의 경우 법정대리인 동의 후 서비스 이용이 가능하도록 하였으나 \n법률적 대리인(보호자)정보를 파악하기에 어려움이 있어 회원가입 정책을 변경하였습니다. \n\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0}[null,1,{&quot;5&quot;:1}]{&quot;1&quot;:17}"><span
                                                style="color: #ff0000;"><strong>14세 미만 회원
                                                    가입불가</strong></span><br></span></p>
                                    <p data-renderer-start-pos="293"><span
                                            data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot; 14세 미만 회원 가입불가\n\n번개장터는 만 14세미만 회원의 경우 법정대리인 동의 후 서비스 이용이 가능하도록 하였으나 \n법률적 대리인(보호자)정보를 파악하기에 어려움이 있어 회원가입 정책을 변경하였습니다. \n\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0}[null,1,{&quot;5&quot;:1}]{&quot;1&quot;:17}"><br>번개장터는
                                            만 14세미만 회원의 경우 법정대리인 동의 후 서비스 이용이 가능하도록 하였으나<br></span><span
                                            data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot; 14세 미만 회원 가입불가\n\n번개장터는 만 14세미만 회원의 경우 법정대리인 동의 후 서비스 이용이 가능하도록 하였으나 \n법률적 대리인(보호자)정보를 파악하기에 어려움이 있어 회원가입 정책을 변경하였습니다. \n\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0}[null,1,{&quot;5&quot;:1}]{&quot;1&quot;:17}">법률적
                                            대리인(보호자)정보를 파악하기에 어려움이 있어 회원가입 정책을 변경하였습니다.</span><span
                                            data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot; 14세 미만 회원 가입불가\n\n번개장터는 만 14세미만 회원의 경우 법정대리인 동의 후 서비스 이용이 가능하도록 하였으나 \n법률적 대리인(보호자)정보를 파악하기에 어려움이 있어 회원가입 정책을 변경하였습니다. \n\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0}[null,1,{&quot;5&quot;:1}]{&quot;1&quot;:17}"><br></span><span
                                            data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot; 14세 미만 회원 가입불가\n\n번개장터는 만 14세미만 회원의 경우 법정대리인 동의 후 서비스 이용이 가능하도록 하였으나 \n법률적 대리인(보호자)정보를 파악하기에 어려움이 있어 회원가입 정책을 변경하였습니다. \n\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0}[null,1,{&quot;5&quot;:1}]{&quot;1&quot;:17}"><br></span>
                                    </p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>여러개의 계정을 만들 수 있나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                            </article>
                            <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>1인 1계정만 본인인인증 가능&nbsp;</strong></span></p>
                                    <p>&nbsp;</p>
                                    <p>명의자 1명당 1개 계정만 본인인증이 가능합니다.</p>
                                    </p>
                                </div>
                            </li>
                        </ul>
                        <ul class="qaBox">
                            <li class="qaBox1">
                                <article class="cdqpUd"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>택배사별 비용은 얼마 인가요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;택배사별 중량, 지역에 따라 운임비용 상이\n\n택배비는 이용하시려는 '택배사'에 따라, '물건의 종류'에 따라, '판매자의 타입(개인/전문)'에 따라\n'착불인지 선불'인지에 따라 달라질 수 있습니다.\n그러므로 물건을 구매하실 때에 꼭 해당 판매자에게 택배비에 대한 문의를 하셔야 됩니다.\n\n[편의점 택배] - 2019년 7월 10일 기준\n1.운임료\n1)350g 이하 - 동일권역(2,600원) 타권역(3,100원)\n2)350g 초과 - 동일권역(3,000원) 타권역(3,500원)\n3)5kg 초과 20kg 이하 - 동일권역(4,000원) 타권역(4,000원)\n \n- 권역에 대한 그룹\n : 수도권(서울,인천,경기)/대전,세종,충남/충북/강원/대구,경북/전북/경남,울산,부산/광주,전남/제주\n\n - 제주도 배송시 3,000원 추가 및 도서지역 배송 시 운송실비추가\n - 20kg 초과하거나 BOX 3변의 합이 140cm초과인 상품은 접수 불가합니다\n \n[방문택배 ]- 2019년 7월 10일 기준\n1. 운임료(구분/사이즈 - 운임요금)\n1) 15Kg 이하 / 120cm 이하 - 5000원\n2) 25Kg / 160cm 이하 - 6500원\n3) 25Kg 초과 / 160cm 초과 - 접수불가\n \n - 사이즈: 세 변의 합(가로/세로/높이) \n - 제주특별자치도로 배송 시 3,000원 추가\n - 기타 도서지역 배송 시 운송실비 추가&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:25}"><span
                                                style="color: #ff0000;"><strong>택배사별 중량, 지역에 따라 운임비용
                                                    상이</strong></span></span></p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;택배사별 중량, 지역에 따라 운임비용 상이\n\n택배비는 이용하시려는 '택배사'에 따라, '물건의 종류'에 따라, '판매자의 타입(개인/전문)'에 따라\n'착불인지 선불'인지에 따라 달라질 수 있습니다.\n그러므로 물건을 구매하실 때에 꼭 해당 판매자에게 택배비에 대한 문의를 하셔야 됩니다.\n\n[편의점 택배] - 2019년 7월 10일 기준\n1.운임료\n1)350g 이하 - 동일권역(2,600원) 타권역(3,100원)\n2)350g 초과 - 동일권역(3,000원) 타권역(3,500원)\n3)5kg 초과 20kg 이하 - 동일권역(4,000원) 타권역(4,000원)\n \n- 권역에 대한 그룹\n : 수도권(서울,인천,경기)/대전,세종,충남/충북/강원/대구,경북/전북/경남,울산,부산/광주,전남/제주\n\n - 제주도 배송시 3,000원 추가 및 도서지역 배송 시 운송실비추가\n - 20kg 초과하거나 BOX 3변의 합이 140cm초과인 상품은 접수 불가합니다\n \n[방문택배 ]- 2019년 7월 10일 기준\n1. 운임료(구분/사이즈 - 운임요금)\n1) 15Kg 이하 / 120cm 이하 - 5000원\n2) 25Kg / 160cm 이하 - 6500원\n3) 25Kg 초과 / 160cm 초과 - 접수불가\n \n - 사이즈: 세 변의 합(가로/세로/높이) \n - 제주특별자치도로 배송 시 3,000원 추가\n - 기타 도서지역 배송 시 운송실비 추가&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:25}"><br><br>택배비는
                                            이용하시려는 '택배사'에 따라, '물건의 종류'에 따라, '판매자의 타입(개인/전문)'에 따라<br>'착불인지 선불'인지에 따라 달라질
                                            수 있습니다.<br>그러므로 물건을 구매하실
                                            때에 꼭 해당 판매자에게 택배비에 대한 문의를 하셔야 됩니다.<br><br><span
                                                style="background-color: #ffff99;"><strong>[편의점 택배]
                                                    - 2019년 7월 10일 기준</strong></span><br>1.운임료<br>1)350g 이하 -
                                            동일권역(2,600원) 타권역(3,100원)<br>2)350g
                                            초과 - 동일권역(3,000원) 타권역(3,500원)<br>3)5kg 초과 20kg 이하 - 동일권역(4,000원)
                                            타권역(4,000원)<br><br>- 권역에 대한 그룹<br>:
                                            수도권(서울,인천,경기)/대전,세종,충남/충북/강원/대구,경북/전북/경남,울산,부산/광주,전남/제주<br><br>- 제주도 배송시
                                            3,000원 추가 및 도서지역 배송 시
                                            운송실비추가<br>- 20kg 초과하거나 BOX 3변의 합이 140cm초과인 상품은 접수 불가합니다<br><br><span
                                                style="background-color: #ffff99;"><strong>[방문택배 ]- 2019년 7월 10일
                                                    기준</strong></span><br>1.
                                            운임료(구분/사이즈 - 운임요금)<br>1) 15Kg 이하 / 120cm 이하 - 5000원<br>2) 25Kg / 160cm 이하 -
                                            6500원<br>3) 25Kg 초과 /
                                            160cm 초과 - 접수불가<br><br>- 사이즈: 세 변의 합(가로/세로/높이)<br>- 제주특별자치도로 배송 시 3,000원
                                            추가<br>- 기타 도서지역 배송 시 운송실비
                                            추가</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>번개장터 편의점택배는 어떻게 이용하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;내상점 > 상품목록 > 택배신청 가능 \n\n내상점 > 상품목록에서 택배 이용을 원하는 상품을 선택하여 하단에  [택배신청]버튼을 클릭해주세요.\n 배송서비스 목록 중 \&quot;편의점 택배\&quot;를 선택 해주시고,  서비스 이용 금액과 유의사항은 해당 서비스 페이지를 참조 부탁드립니다.\n \n번개장터 앱에서 택배 신청 후 가까운 편의점 Postbox 편의점택배 매장에서 접수해주시면 됩니다. (무인택배기가 있는 점포에서만 가능)\n상세한 접수 방법은 아래 이미지를 참조해주세요.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:23}"><span
                                                style="color: #ff0000;"><strong>내상점 &gt; 상품목록 &gt; 택배신청
                                                    가능</strong></span></span></p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;내상점 > 상품목록 > 택배신청 가능 \n\n내상점 > 상품목록에서 택배 이용을 원하는 상품을 선택하여 하단에  [택배신청]버튼을 클릭해주세요.\n 배송서비스 목록 중 \&quot;편의점 택배\&quot;를 선택 해주시고,  서비스 이용 금액과 유의사항은 해당 서비스 페이지를 참조 부탁드립니다.\n \n번개장터 앱에서 택배 신청 후 가까운 편의점 Postbox 편의점택배 매장에서 접수해주시면 됩니다. (무인택배기가 있는 점포에서만 가능)\n상세한 접수 방법은 아래 이미지를 참조해주세요.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:23}"><br><br>내상점
                                            &gt; 상품목록에서 택배 이용을 원하는 상품을 선택하여 하단에 [택배신청]버튼을 클릭해주세요.<br>배송서비스 목록 중 "편의점
                                            택배"를 선택 해주시고, 서비스 이용 금액과
                                            유의사항은 해당 서비스 페이지를 참조 부탁드립니다.<br><br>번개장터 앱에서 택배 신청 후 가까운 편의점 Postbox 편의점택배
                                            매장에서 접수해주시면 됩니다. (무인택배기가
                                            있는 점포에서만 가능)<br>상세한 접수 방법은 아래 이미지를 참조해주세요.</span></p>
                                    <p>&nbsp;</p>
                                    <p><img src="http://dbgl6r3fnusyg.cloudfront.net/static/150112-howto_send_a_parcel.jpg"
                                            alt="" width="327" height="525"></p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>번개장터 편의점택배를 이용했는데 발송 확인은 어떻게 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;내 상점 택배발송 내역 확인가능 \n\n[내상점-택배발송/수취내역-발송내역]에서 확인 하실 수 있습니다. &quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:19}"><span
                                                style="color: #ff0000;"><strong>내 상점 택배발송 내역
                                                    확인가능</strong></span><br><br>[내상점-택배발송/수취내역-발송내역]에서
                                            확인 하실 수 있습니다.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>방문택배 예약확인 및 취소는 어떻게 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;내 상점을 통해 예약내역 확인 가능, 예약 취소는 불가  \n\n[방문택배 예약확인 방법]\n내상점 > 발송/수취 택배관리 > 발신내역 을 통해 확인 가능합니다. \n \n[방문택배 취소신청 방법]\n방문택배는 어플에서 취소가 되지않고, CJ대한통운 고객센터로 연락하여 취소 할 수 있습니다.\n취소연락 : 1588-1255&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:34}"><span
                                                style="color: #ff0000;"><strong>내 상점을 통해 예약내역 확인 가능, 예약 취소는
                                                    불가</strong></span><br><br><span
                                                style="background-color: #ffff99;"><strong>[방문택배 예약확인
                                                    방법]</strong></span><br>내상점 &gt; 발송/수취 택배관리
                                            &gt; 발신내역 을 통해 확인 가능합니다.<br><br><span
                                                style="background-color: #ffff99;"><strong>[방문택배 취소신청
                                                    방법]</strong></span><br>방문택배는 어플에서 취소가 되지않고, CJ대한통운 고객센터로 연락하여 취소 할 수
                                            있습니다.<br>취소연락 :
                                            1588-1255</span></p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>공휴일에도 택배 배송이 가능한가요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;공휴일 택배 배송불가 \n\n토요일,일요일을 포함한 법정 공휴일에는 접수만 가능하나, 택배 배송은 진행되지 않습니다. \n주말과 공휴일 일정을 참고하여 접수 부탁드립니다. &quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:11}"><span
                                                style="color: #ff0000;"><strong>공휴일 택배
                                                    배송불가</strong></span><br><br>토요일,일요일을 포함한 법정 공휴일에는 접수만
                                            가능하나, 택배 배송은 진행되지 않습니다.<br>주말과 공휴일 일정을 참고하여 접수 부탁드립니다.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>홈픽 택배비는 얼마 인가요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>홈픽 서비스란, 고객님이 원하는 시간과 장소에서 물품을 집화(Pick
                                                up)하는 택배 서비스</strong></span>
                                    </p>
                                    <p>&nbsp;</p>
                                    <p>1.방문가능 시간 : 평일 09~17시, 토요일: 09~11시</p>
                                    <p>2.운임료(무게 / 사이즈/ 운임요금)</p>
                                    <p>&nbsp;</p>
                                    <table
                                        style="table-layout: fixed; font-size: 10pt; font-family: arial, sans, sans-serif; width: 0px; border-collapse: collapse; border: none;"
                                        dir="ltr" border="1" cellspacing="0" cellpadding="0">
                                        <colgroup>
                                            <col width="100">
                                            <col width="100">
                                            <col width="100">
                                        </colgroup>
                                        <tbody>
                                            <tr style="height: 21px;">
                                                <td style="border-width: 2px 1px 1px 2px; border-style: solid; border-color: #000000; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; background-color: #000000; font-weight: bold; color: #ffffff; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;무게&quot;}">
                                                    무게</td>
                                                <td style="border-width: 2px 1px 1px; border-style: solid; border-color: #000000 #000000 #000000 #cccccc; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; background-color: #000000; font-weight: bold; color: #ffffff; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;사이즈&quot;}">
                                                    사이즈</td>
                                                <td style="border-width: 2px 2px 1px 1px; border-style: solid; border-color: #000000 #000000 #000000 #cccccc; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; background-color: #000000; font-weight: bold; color: #ffffff; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;운임요금&quot;}">
                                                    운임요금</td>
                                            </tr>
                                            <tr style="height: 21px;">
                                                <td style="border-width: 1px 1px 1px 2px; border-style: solid; border-color: #cccccc #000000 #000000; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;2kg 까지&quot;}">
                                                    2kg 까지</td>
                                                <td style="border-width: 1px; border-style: solid; border-color: #cccccc #000000 #000000 #cccccc; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;80cm 까지&quot;}">
                                                    80cm 까지</td>
                                                <td style="border-width: 1px 2px 1px 1px; border-style: solid; border-color: #cccccc #000000 #000000 #cccccc; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;3,500원&quot;}">
                                                    3,500원</td>
                                            </tr>
                                            <tr style="height: 21px;">
                                                <td style="border-width: 1px 1px 1px 2px; border-style: solid; border-color: #cccccc #000000 #000000; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;5kg 까지&quot;}">
                                                    5kg 까지</td>
                                                <td style="border-width: 1px; border-style: solid; border-color: #cccccc #000000 #000000 #cccccc; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;100cm 까지&quot;}">
                                                    100cm 까지</td>
                                                <td style="border-width: 1px 2px 1px 1px; border-style: solid; border-color: #cccccc #000000 #000000 #cccccc; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;3,990원&quot;}">
                                                    3,990원</td>
                                            </tr>
                                            <tr style="height: 21px;">
                                                <td style="border-width: 1px 1px 1px 2px; border-style: solid; border-color: #cccccc #000000 #000000; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;10kg 까지&quot;}">
                                                    10kg 까지</td>
                                                <td style="border-width: 1px; border-style: solid; border-color: #cccccc #000000 #000000 #cccccc; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;120cm 까지&quot;}">
                                                    120cm 까지</td>
                                                <td style="border-width: 1px 2px 1px 1px; border-style: solid; border-color: #cccccc #000000 #000000 #cccccc; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;5,500원&quot;}">
                                                    5,500원</td>
                                            </tr>
                                            <tr style="height: 21px;">
                                                <td style="border-width: 1px 1px 1px 2px; border-style: solid; border-color: #cccccc #000000 #000000; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;20kg 까지&quot;}">
                                                    20kg 까지</td>
                                                <td style="border-width: 1px; border-style: solid; border-color: #cccccc #000000 #000000 #cccccc; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;160cm 까지&quot;}">
                                                    160cm 까지</td>
                                                <td style="border-width: 1px 2px 1px 1px; border-style: solid; border-color: #cccccc #000000 #000000 #cccccc; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;6,500원&quot;}">
                                                    6,500원</td>
                                            </tr>
                                            <tr style="height: 21px;">
                                                <td style="border-width: 1px 1px 2px 2px; border-style: solid; border-color: #cccccc #000000 #000000; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;20kg 초과&quot;}">
                                                    20kg 초과</td>
                                                <td style="border-width: 1px 1px 2px; border-style: solid; border-color: #cccccc #000000 #000000 #cccccc; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;160cm 초과&quot;}">
                                                    160cm 초과</td>
                                                <td style="border-width: 1px 2px 2px 1px; border-style: solid; border-color: #cccccc #000000 #000000 #cccccc; border-image: initial; overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: center;"
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;접수불가&quot;}">
                                                    접수불가</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <p>&nbsp;</p>
                                    <p>* 제주도인 경우 도신료 (3,000원)이 별도로 추가(실비정산) 됩니다.&nbsp;</p>
                                    <p>* 산간 및 섬 지역의 경우 추가운임이 발생합니다.&nbsp;</p>
                                    <p>* 크기는 가로, 세로, 높이 세변의 길이를 합한 것입니다. 단, 물품의 최장변은 100cm 이내여야 합니다.</p>
                                    <p>&nbsp;</p>
                                    <p>홈픽 서비스 이용 시 유의사항 안내 드립니다.&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>1. 홈픽택배 이용 시 유의사항</p>
                                    <p>&nbsp;1) 홈픽택배는 택배접수 후 지정하신 시간 내 픽업기사가 방문합니다.</p>
                                    <p>&nbsp;2) 홈픽택배 신청 시 카카오 알림톡으로 운임비 사전결제&nbsp; 메세지가 발송됩니다.운임비 결제가 완료되어야 홈픽택배 신청 접수가
                                        완료됩니다.</p>
                                    <p>&nbsp;3) 신청 시 중복 접수 방지를 위해 신청 클릭은 한번만 진행해 주세요.</p>
                                    <p>&nbsp;4) 픽업요청 시 23:00는 서비스 종료로 인하여 서비스는 익일 오전에 진행됩니다. (서비스 진행시간 9:00 ~
                                        18:00)<br><br></p>
                                    <p>2. 결제완료 후 홈픽택배 취소 및 운임비 결제취소 방법</p>
                                    <p>- 홈픽 고객센터로 취소요청 또는 현장방문 기사님을 통해 취소 요청이 가능합니다.</p>
                                    <p>&nbsp;</p>
                                    <p>- 홈픽 고객센터 : 1800-0987</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                        </ul>
                        <ul class="qaBox">
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>내 계정 이용제한을 해제하려면 어떻게 해야 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;이용제한 해제의 경우 문제해결 후 고객센터를 통해 해제가능 \n\n1. 운영정책 위반으로 인한 이용제한 \n  1) 운영정책위반으로 인해 계정이 이용제한 된 경우 [1:1문의하기]를 통해 양식 기재하여 문의하시면 확인 후 이용제한 유형에 따른 안내 진행되고 있습니다.\n \n2. 계정 도용으로 인한 이용제한\n 1) 계정 도용으로 인해 이용제한 되었다면 몇 가지 확인절차를 통해 해제가 가능합니다.\n 2) 휴대폰 가입 사실 확인서 번개장터 측으로 받은 문자내역 첨부하여 1:1문의 하시면 확인 후 해제 조치 진행되고 있습니다.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:34}"><span
                                                style="color: #ff0000;"><strong>이용제한 해제의 경우 문제해결 후 고객센터를 통해
                                                    해제가능</strong></span><br><br><strong>1. 운영정책 위반으로 인한
                                                이용제한</strong><br>1) 운영정책위반으로 인해 계정이 이용제한
                                            된 경우 [1:1문의하기]를 통해 양식 기재하여 문의하시면 확인 후 이용제한 유형에 따른 안내 진행되고
                                            있습니다.<br><br><strong>2. 계정 도용으로 인한
                                                이용제한</strong><br>1) 계정 도용으로 인해 이용제한 되었다면 몇 가지 확인절차를 통해 해제가 가능합니다.<br>2)
                                            휴대폰 가입 사실 확인서 번개장터 측으로
                                            받은 문자내역 첨부하여 1:1문의 하시면 확인 후 해제 조치 진행되고 있습니다.</span></p>
                                    <p>&nbsp;</p>
                                    <p><span
                                            style="font-size: 11pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">&nbsp;</span>
                                    </p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1> 홍보로 제재 받는 경우는?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong><span style="color: #ff0000;">타 사이트 결제 유도 및
                                                    홍보불가</span></strong></span></p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;외부채널 유도 및 홍보불가 \n1. 타 사이트 판매목적으로 유입채널 기재 (네이버, 카카오 url 및 물품 가능한 홈페이지 url) \n2. 메신저 및 댓글을 통한 1:1 홍보\n\n※ 판매중인 상품의 상세이미지나 정보확인을 위한 용도는 예외&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:16}"><br>1.
                                            타 사이트 판매목적으로 유입채널
                                            기재 (네이버, 카카오톡 url 및 물품 결제 가능한 홈페이지 url)<br>2. 메신저 및 댓글을 통한 1:1
                                            홍보<br><br><em>※ 판매중인 상품의 상세이미지나 정보확인을
                                                위한 용도는 예외</em></span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1> 도배로 제재를 받는경우는?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong><span
                                                    data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;상품등록, 댓글 도배등록 불가 \n\n1. 동일 상품을 2개이상 등록한 경우\n2. 1상품에 총 2개이상의 동일한 댓글작성\n3. 여러 상품에 총 10개 이상의 댓글을 작성한 경우\n ※단, 교신/대차 등 동일 상품군에 대해 10개 이상 남긴경우는 교신에 대한 목적이 명확할 경우 도배대상에서 제외\n4. 여러 상점에 무작위 홍보성 번개톡을 전송하는 경우 (내 상점 홍보 및 타사이트/URL 홍보 포함)&quot;}"
                                                    data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                                    data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:19}">상품등록,
                                                    댓글 도배등록
                                                    불가</span></strong></span></p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;상품등록, 댓글 도배등록 불가 \n\n1. 동일 상품을 2개이상 등록한 경우\n2. 1상품에 총 2개이상의 동일한 댓글작성\n3. 여러 상품에 총 10개 이상의 댓글을 작성한 경우\n ※단, 교신/대차 등 동일 상품군에 대해 10개 이상 남긴경우는 교신에 대한 목적이 명확할 경우 도배대상에서 제외\n4. 여러 상점에 무작위 홍보성 번개톡을 전송하는 경우 (내 상점 홍보 및 타사이트/URL 홍보 포함)&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:19}"><br><br>1.
                                            동일 상품을 2개이상 등록한
                                            경우<br>2. 1상품에 총 2개이상의 동일한 댓글작성<br>3. 여러 상품에 총 10개 이상의 댓글을 작성한 경우<br><em>※단,
                                                교신/대차 등 동일 상품군에 대해 10개
                                                이상 남긴경우는 교신에 대한 목적이 명확할 경우 도배대상에서 제외</em><br>4. 여러 상점에 무작위 홍보성 번개톡을 전송하는
                                            경우 (내 상점 홍보 및 타사이트/URL
                                            홍보 포함)</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>내 계정 이용제한 여부를 어떻게 확인 할 수 있나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>마이샵 &gt; 고객센터 &gt; 정책 &gt; 제재내역을 통해 확인 가능
                                            </strong></span></p>
                                    <p>&nbsp;</p>
                                    <p>1. 계정이 이용제한 된 경우, 상점명 앞에 ‘(차단)’이 추가되어 차단 되었음을 알 수 있습니다.</p>
                                    <p>2. 상세 사유는 마이샵 &gt; 고객센터 &gt; 정책 탭에서 확인 할 수 있습니다.</p>
                                    <p><span id="docs-internal-guid-f0cec026-7fff-28f1-887f-b7bdcab18201">&nbsp;</span>
                                    </p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>비매너로 제재를 받는 경우?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;이미지도용, 욕설, 비방, 일방적 거래파기등 비배너 해당 \n\n1. 타 상점의 이미지도용\n2. 나눔으로 수령한 상품을 가격측정하여 재판매\n3. 타 상점에서 구입 후 가격높여 재판매\n4. 거래상품과 관련없는 거래파기, 근거없는 시비, 비방 등의 댓글 및 리뷰작성\n5. 댓글 및 리뷰란 등 공개된 공간에서 타인에게 불쾌감을 줄수있는 욕설\n6. 성적 수치심을 주는 말이나 표현\n7. 거래이외의 목적으로 만남요청 등\n8. 음란이미지 전송 및 요청\n9. 의도적 연락두절이나, 거래장소에 나타나지 않는 등 거래 정황이 운영자의 판단에 따라 제재가 필요하다고 생각되는 경우(증거재출필요) &quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:34}"><span
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;이미지도용, 욕설, 비방, 일방적 거래파기등 비배너 해당 \n\n1. 타 상점의 이미지도용\n2. 나눔으로 수령한 상품을 가격측정하여 재판매\n3. 타 상점에서 구입 후 가격높여 재판매\n4. 거래상품과 관련없는 거래파기, 근거없는 시비, 비방 등의 댓글 및 리뷰작성\n5. 댓글 및 리뷰란 등 공개된 공간에서 타인에게 불쾌감을 줄수있는 욕설\n6. 성적 수치심을 주는 말이나 표현\n7. 거래이외의 목적으로 만남요청 등\n8. 음란이미지 전송 및 요청\n9. 의도적 연락두절이나, 거래장소에 나타나지 않는 등 거래 정황이 운영자의 판단에 따라 제재가 필요하다고 생각되는 경우(증거재출필요) &quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:34}"><strong>이미지도용,
                                                    욕설, 비방,
                                                    일방적 거래파기등 비매너 해당</strong></span></span></p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;이미지도용, 욕설, 비방, 일방적 거래파기등 비배너 해당 \n\n1. 타 상점의 이미지도용\n2. 나눔으로 수령한 상품을 가격측정하여 재판매\n3. 타 상점에서 구입 후 가격높여 재판매\n4. 거래상품과 관련없는 거래파기, 근거없는 시비, 비방 등의 댓글 및 리뷰작성\n5. 댓글 및 리뷰란 등 공개된 공간에서 타인에게 불쾌감을 줄수있는 욕설\n6. 성적 수치심을 주는 말이나 표현\n7. 거래이외의 목적으로 만남요청 등\n8. 음란이미지 전송 및 요청\n9. 의도적 연락두절이나, 거래장소에 나타나지 않는 등 거래 정황이 운영자의 판단에 따라 제재가 필요하다고 생각되는 경우(증거재출필요) &quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:34}"><br><br>1.
                                            타 상점의
                                            이미지도용<br>2. 나눔으로 수령한 상품을 가격측정하여 재판매<br>3. 타 상점에서 구입 후 가격높여 재판매<br>4. 거래상품과
                                            관련없는 거래파기, 근거없는 시비, 비방 등의
                                            댓글 및 리뷰작성<br>5. 댓글 및 리뷰란 등 공개된 공간에서 타인에게 불쾌감을 줄수있는 욕설<br>6. 성적 수치심을 주는 말이나
                                            표현<br>7. 거래이외의 목적으로 만남요청
                                            등<br>8. 음란이미지 전송 및 요청<br>9. 의도적 연락두절이나, 거래장소에 나타나지 않는 등 거래 정황이 운영자의 판단에 따라
                                            제재가 필요하다고 생각되는
                                            경우(증거재출필요)</span></p>
                                    </p>
                                </div>
                            </li>
                        </ul>
                        <ul class="qaBox">
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>UP하기 서비스가 뭐예요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>UP하기란, 번개장터에 등록한 상품을 많은 이용자에게 노출이 많이 되도록
                                                도와주는 프리미엄 아이템으로 유료결제
                                                서비스</strong></span><br><br></p>
                                    <p>&nbsp;</p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP+란, 번개장터에 등록한 상품을 많은 이용자에게 노출이 많이 되도록 도와주는 프리미엄 아이템으로 유료결제 서비스 \n\n1. UP플러스의 동작방식은 기본제공 UP과 동일하지만, 이용횟수 제한이 없어 원하시는 상품을 메인화면 및 상품리스트의 상단에 보다 많이 노출할 수 있도록 도와줍니다.\n2. \&quot;Up Plus 예약하기\&quot; 기능을 통해 원하는 상품을 설정한 시간/간격에 맞게 자동 Up 할 수 있어, 지속적인 상품관리가 쉬워집니다.\n \n▶ UP플러스 구매하기\n1. UP플러스는 구글플레이/앱스토어 결제서비스를 통해 구매하실 수 있습니다.\n2. 고객님이 필요한 UP개수에 따라 \&quot;UP플러스A(5개)\&quot;, \&quot;UP플러스B(20개)\&quot;, \&quot;UP플러스C(50개)\&quot; 3개의 상품이 준비되어 있습니다.\n3. UP플러스의 모든 상품은 개수 제한 없이 중복/반복 구매가 가능합니다. \n \n※ UP플러스는 현재 구글플레이, IOS 앱스토어에서 이용 가능합니다.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:65}">1.
                                            UP하기의 동작방식은 기본제공 UP과 동일하지만, 이용횟수 제한이 없어 원하시는 상품을 메인화면 및 상품리스트의 상단에 보다 많이 노출할
                                            수 있도록 도와줍니다.<br>2. "UP
                                            하기 예약하기" 기능을 통해 원하는 상품을 설정한 시간/간격에 맞게 자동 UP 할 수 있어, 지속적인 상품관리가
                                            쉬워집니다.<br><br><strong>▶ UP하기
                                                구매하기</strong><br>&nbsp;1. UP하기는 구글플레이/앱스토어 결제서비스를 통해 구매하실 수
                                            있습니다.<br>&nbsp;2. 고객님이 필요한 UP개수에 따라
                                            "UP하기A(5개)", "UP하기B(20개)", "UP하기C(50개)" 3개의 상품이 준비되어 있습니다.<br>&nbsp;3. UP하기의
                                            모든 상품은 개수 제한 없이 중복/반복
                                            구매가 가능합니다.<br><br><span
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP+란, 번개장터에 등록한 상품을 많은 이용자에게 노출이 많이 되도록 도와주는 프리미엄 아이템으로 유료결제 서비스 \n\n1. UP플러스의 동작방식은 기본제공 UP과 동일하지만, 이용횟수 제한이 없어 원하시는 상품을 메인화면 및 상품리스트의 상단에 보다 많이 노출할 수 있도록 도와줍니다.\n2. \&quot;Up Plus 예약하기\&quot; 기능을 통해 원하는 상품을 설정한 시간/간격에 맞게 자동 Up 할 수 있어, 지속적인 상품관리가 쉬워집니다.\n \n▶ UP플러스 구매하기\n1. UP플러스는 구글플레이/앱스토어 결제서비스를 통해 구매하실 수 있습니다.\n2. 고객님이 필요한 UP개수에 따라 \&quot;UP플러스A(5개)\&quot;, \&quot;UP플러스B(20개)\&quot;, \&quot;UP플러스C(50개)\&quot; 3개의 상품이 준비되어 있습니다.\n3. UP플러스의 모든 상품은 개수 제한 없이 중복/반복 구매가 가능합니다. \n \n※ UP플러스는 현재 구글플레이, IOS 앱스토어에서 이용 가능합니다.&quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:65}"><em>※
                                                    UP플러스는 현재 구글플레이, IOS 앱스토어에서 이용 가능합니다.</em></span></span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>UP하기 예약 설정은 어떻게 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 예약 설정 가능 \n\n[IUP+ 예약 설정방법]\n\n1. 최상단 UP! 페이지 하단의 \&quot;예약하기\&quot; 버튼을 선택합니다.\n2. 자동UP실행 기능을 ON 합니다.\n3. 반복실행 회수 및 구간을 설정합니다.\n  (예시1 : 금일 오후6시부터 3시간 간격으로 24시간 UP 실행을 원하는 경우)\n   1) 반복실행 3시간 설정 \n   2) 24시간으로 체크 상태 유지 \n   3) 시작 시간 18시 설정 \n\n   (예시2 : 매일 오후 6시부터 오후 11시 사이에 1시간 간격으로 UP 실행을 원하는 경우)\n   1) 반복실행 1시간 설정\n   2) 시작시간 18시 ~ 종료시간 23시로 설정 \n   \n4. 반복실행을 원하는 시작일과 종료일을 설정합니다.\n5. [저장] 버튼을 누르면 예약기능이 저장됩니다.\n \n▶ 예약 확인 및 수정/취소\n1. 예약한 UP플러스가 실행되면 Push 알림이 발송됩니다.\n2. 예약 내용의 수정을 원하면 수정하려는 상품의 UP플러스 \&quot;예약수정\&quot; 버튼 선택 후 예약과 동일한 방법으로 수정가능합니다.\n3. 예약취소하려는 상품의 \&quot;예약수정\&quot; 페이지에 있는 자동UP실행을 OFF 로 변경 후 저장하시면 예약이 취소됩니다.\n \n▶ UP+ 예약 기능 참고사항\n1. 예약하기는 보유하신 UP플러스 개수안에서만 적용됩니다.\n2. 예약하기로 UP이 자동실행될 때마다 UP플러스가 1개씩 차감됩니다\n3. 설정 > 알림설정 > UP플러스 실행 알림을 통해 UP플러스 예약하기 알림 수신여부를 설정 할 수 있습니다.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:17}{&quot;1&quot;:31,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:32}"><span
                                                style="color: #ff0000;"
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 예약 설정 가능 \n\n[IUP+ 예약 설정방법]\n\n1. 최상단 UP! 페이지 하단의 \&quot;예약하기\&quot; 버튼을 선택합니다.\n2. 자동UP실행 기능을 ON 합니다.\n3. 반복실행 회수 및 구간을 설정합니다.\n  (예시1 : 금일 오후6시부터 3시간 간격으로 24시간 UP 실행을 원하는 경우)\n   1) 반복실행 3시간 설정 \n   2) 24시간으로 체크 상태 유지 \n   3) 시작 시간 18시 설정 \n\n   (예시2 : 매일 오후 6시부터 오후 11시 사이에 1시간 간격으로 UP 실행을 원하는 경우)\n   1) 반복실행 1시간 설정\n   2) 시작시간 18시 ~ 종료시간 23시로 설정 \n   \n4. 반복실행을 원하는 시작일과 종료일을 설정합니다.\n5. [저장] 버튼을 누르면 예약기능이 저장됩니다.\n \n▶ 예약 확인 및 수정/취소\n1. 예약한 UP플러스가 실행되면 Push 알림이 발송됩니다.\n2. 예약 내용의 수정을 원하면 수정하려는 상품의 UP플러스 \&quot;예약수정\&quot; 버튼 선택 후 예약과 동일한 방법으로 수정가능합니다.\n3. 예약취소하려는 상품의 \&quot;예약수정\&quot; 페이지에 있는 자동UP실행을 OFF 로 변경 후 저장하시면 예약이 취소됩니다.\n \n▶ UP+ 예약 기능 참고사항\n1. 예약하기는 보유하신 UP플러스 개수안에서만 적용됩니다.\n2. 예약하기로 UP이 자동실행될 때마다 UP플러스가 1개씩 차감됩니다\n3. 설정 > 알림설정 > UP플러스 실행 알림을 통해 UP플러스 예약하기 알림 수신여부를 설정 할 수 있습니다.&quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:17}{&quot;1&quot;:31,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:32}"><strong>UP하기
                                                    예약 설정 가능</strong></span><br><br><span
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 예약 설정 가능 \n\n[IUP+ 예약 설정방법]\n\n1. 최상단 UP! 페이지 하단의 \&quot;예약하기\&quot; 버튼을 선택합니다.\n2. 자동UP실행 기능을 ON 합니다.\n3. 반복실행 회수 및 구간을 설정합니다.\n  (예시1 : 금일 오후6시부터 3시간 간격으로 24시간 UP 실행을 원하는 경우)\n   1) 반복실행 3시간 설정 \n   2) 24시간으로 체크 상태 유지 \n   3) 시작 시간 18시 설정 \n\n   (예시2 : 매일 오후 6시부터 오후 11시 사이에 1시간 간격으로 UP 실행을 원하는 경우)\n   1) 반복실행 1시간 설정\n   2) 시작시간 18시 ~ 종료시간 23시로 설정 \n   \n4. 반복실행을 원하는 시작일과 종료일을 설정합니다.\n5. [저장] 버튼을 누르면 예약기능이 저장됩니다.\n \n▶ 예약 확인 및 수정/취소\n1. 예약한 UP플러스가 실행되면 Push 알림이 발송됩니다.\n2. 예약 내용의 수정을 원하면 수정하려는 상품의 UP플러스 \&quot;예약수정\&quot; 버튼 선택 후 예약과 동일한 방법으로 수정가능합니다.\n3. 예약취소하려는 상품의 \&quot;예약수정\&quot; 페이지에 있는 자동UP실행을 OFF 로 변경 후 저장하시면 예약이 취소됩니다.\n \n▶ UP+ 예약 기능 참고사항\n1. 예약하기는 보유하신 UP플러스 개수안에서만 적용됩니다.\n2. 예약하기로 UP이 자동실행될 때마다 UP플러스가 1개씩 차감됩니다\n3. 설정 > 알림설정 > UP플러스 실행 알림을 통해 UP플러스 예약하기 알림 수신여부를 설정 할 수 있습니다.&quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:17}{&quot;1&quot;:31,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:32}"><strong>[UP하기
                                                    예약 설정방법]</strong></span><br>1. 최상단 UP! 페이지 하단의 "예약하기" 버튼을
                                            선택합니다.<br>2. 자동UP실행 기능을 ON
                                            합니다.<br>3. 반복실행 회수 및 구간을 설정합니다.</span></p>
                                    <p>(예시1 : 금일 오후6시부터 3시간 간격으로 24시간 UP 실행을 원하는 경우)</p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 예약 설정 가능 \n\n[IUP+ 예약 설정방법]\n\n1. 최상단 UP! 페이지 하단의 \&quot;예약하기\&quot; 버튼을 선택합니다.\n2. 자동UP실행 기능을 ON 합니다.\n3. 반복실행 회수 및 구간을 설정합니다.\n  (예시1 : 금일 오후6시부터 3시간 간격으로 24시간 UP 실행을 원하는 경우)\n   1) 반복실행 3시간 설정 \n   2) 24시간으로 체크 상태 유지 \n   3) 시작 시간 18시 설정 \n\n   (예시2 : 매일 오후 6시부터 오후 11시 사이에 1시간 간격으로 UP 실행을 원하는 경우)\n   1) 반복실행 1시간 설정\n   2) 시작시간 18시 ~ 종료시간 23시로 설정 \n   \n4. 반복실행을 원하는 시작일과 종료일을 설정합니다.\n5. [저장] 버튼을 누르면 예약기능이 저장됩니다.\n \n▶ 예약 확인 및 수정/취소\n1. 예약한 UP플러스가 실행되면 Push 알림이 발송됩니다.\n2. 예약 내용의 수정을 원하면 수정하려는 상품의 UP플러스 \&quot;예약수정\&quot; 버튼 선택 후 예약과 동일한 방법으로 수정가능합니다.\n3. 예약취소하려는 상품의 \&quot;예약수정\&quot; 페이지에 있는 자동UP실행을 OFF 로 변경 후 저장하시면 예약이 취소됩니다.\n \n▶ UP+ 예약 기능 참고사항\n1. 예약하기는 보유하신 UP플러스 개수안에서만 적용됩니다.\n2. 예약하기로 UP이 자동실행될 때마다 UP플러스가 1개씩 차감됩니다\n3. 설정 > 알림설정 > UP플러스 실행 알림을 통해 UP플러스 예약하기 알림 수신여부를 설정 할 수 있습니다.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:17}{&quot;1&quot;:31,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:32}"
                                            data-mce-mark="1">&nbsp;1) 반복실행 3시간 설정<br>&nbsp;2) 24시간으로 체크 상태
                                            유지<br>&nbsp;3) 시작 시간 18시
                                            설정<br><br>(예시2 : 매일 오후 6시부터 오후 11시 사이에 1시간 간격으로 UP 실행을 원하는 경우)<br>1) 반복실행
                                            1시간 설정<br>2) 시작시간 18시 ~
                                            종료시간 23시로 설정<br><br>4. 반복실행을 원하는 시작일과 종료일을 설정합니다.<br>5. [저장] 버튼을 누르면 예약기능이
                                            저장됩니다.<br><br><strong>▶
                                                예약 확인 및 수정/취소</strong><br>1. 예약한 UP하기가 실행되면 Push 알림이 발송됩니다.<br>2. 예약 내용의
                                            수정을 원하면 수정하려는 상품의 UP하기
                                            "예약수정" 버튼 선택 후 예약과 동일한 방법으로 수정가능합니다.<br>3. 예약취소하려는 상품의 "예약수정" 페이지에 있는
                                            자동UP실행을 OFF 로 변경 후 저장하시면 예약이
                                            취소됩니다.<br><br><strong>▶ UP하기 예약 기능 참고사항</strong><br>1. 예약하기는 보유하신 UP하기
                                            개수안에서만 적용됩니다.<br>2. 예약하기로 UP이
                                            자동실행될 때마다 UP하기가 1개씩 차감됩니다<br>3. 설정 &gt; 알림설정 &gt; UP하기 실행 알림을 통해 UP하기 예약하기
                                            알림 수신여부를 설정 할 수
                                            있습니다.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>UP하기 환불/보상 기준은 어떻게 되나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 환불/보상 정책 안내 \n\n[환불정책]\n 1. 구매한 UP+를 사용하지 않고, 구매시간으로부터 48시간 이내 시 환불이 가능합니다. \n 2. 한개라도 사용한 경우 구글플레이, IOS앱스토어 인앱 결제 정책에 따라 환불이 불가합니다. \n   ▶ 안드로이드 링크 : 구글 플레이스토어\n   ▶ 아이폰 링크 : 애플 앱스토어\n\n 3. 사용하지 않은 UP+ 환불 요청 경로 : 1:1문의 > 서비스기능 >UP플러스 로 문의 해주세요. \n\n[보상기준] \n 1. 사용한 UP플러스보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP플러스 개수만큼 제공 \n 2. 결제완료 하였으나 UP플러스가 제공되지 않은 경우 : 영업일 기준 1일이내 누락된 UP플러스 제공 \n 3. UP플러스 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된  UP플러스 개수만큼 영업일 기준 3일이내 제공 \n    장애기준 :  검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가\n\n[제재된 경우]\n1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP플러스 적용중인 경우 경고없이 삭제 될 수 있으며 UP플러스는 보상되지 않습니다.\n2. 계정 차단 : 계정 차단 시 UP플러스 사용이 불가하며, 차단 해제 시 사용이 가능합니다. \n\n[유효기간 및 소멸]\n1. 결제한 UP플러스는 이용기간의 제한없이 사용 가능합니다. \n2. 회원 탈퇴 시 UP플러스는 소멸처리 되며,  재가입 후에도 복구는 불가합니다. \n\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}{&quot;1&quot;:246,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:254}{&quot;1&quot;:515,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:524}{&quot;1&quot;:662,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:674}"><span
                                                style="color: #ff0000;"
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 환불/보상 정책 안내 \n\n[환불정책]\n 1. 구매한 UP+를 사용하지 않고, 구매시간으로부터 48시간 이내 시 환불이 가능합니다. \n 2. 한개라도 사용한 경우 구글플레이, IOS앱스토어 인앱 결제 정책에 따라 환불이 불가합니다. \n   ▶ 안드로이드 링크 : 구글 플레이스토어\n   ▶ 아이폰 링크 : 애플 앱스토어\n\n 3. 사용하지 않은 UP+ 환불 요청 경로 : 1:1문의 > 서비스기능 >UP플러스 로 문의 해주세요. \n\n[보상기준] \n 1. 사용한 UP플러스보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP플러스 개수만큼 제공 \n 2. 결제완료 하였으나 UP플러스가 제공되지 않은 경우 : 영업일 기준 1일이내 누락된 UP플러스 제공 \n 3. UP플러스 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된  UP플러스 개수만큼 영업일 기준 3일이내 제공 \n    장애기준 :  검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가\n\n[제재된 경우]\n1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP플러스 적용중인 경우 경고없이 삭제 될 수 있으며 UP플러스는 보상되지 않습니다.\n2. 계정 차단 : 계정 차단 시 UP플러스 사용이 불가하며, 차단 해제 시 사용이 가능합니다. \n\n[유효기간 및 소멸]\n1. 결제한 UP플러스는 이용기간의 제한없이 사용 가능합니다. \n2. 회원 탈퇴 시 UP플러스는 소멸처리 되며,  재가입 후에도 복구는 불가합니다. \n\n&quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}{&quot;1&quot;:246,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:254}{&quot;1&quot;:515,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:524}{&quot;1&quot;:662,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:674}"><strong>UP하기
                                                    환불/보상 정책 안내</strong></span><br><br><span
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 환불/보상 정책 안내 \n\n[환불정책]\n 1. 구매한 UP+를 사용하지 않고, 구매시간으로부터 48시간 이내 시 환불이 가능합니다. \n 2. 한개라도 사용한 경우 구글플레이, IOS앱스토어 인앱 결제 정책에 따라 환불이 불가합니다. \n   ▶ 안드로이드 링크 : 구글 플레이스토어\n   ▶ 아이폰 링크 : 애플 앱스토어\n\n 3. 사용하지 않은 UP+ 환불 요청 경로 : 1:1문의 > 서비스기능 >UP플러스 로 문의 해주세요. \n\n[보상기준] \n 1. 사용한 UP플러스보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP플러스 개수만큼 제공 \n 2. 결제완료 하였으나 UP플러스가 제공되지 않은 경우 : 영업일 기준 1일이내 누락된 UP플러스 제공 \n 3. UP플러스 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된  UP플러스 개수만큼 영업일 기준 3일이내 제공 \n    장애기준 :  검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가\n\n[제재된 경우]\n1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP플러스 적용중인 경우 경고없이 삭제 될 수 있으며 UP플러스는 보상되지 않습니다.\n2. 계정 차단 : 계정 차단 시 UP플러스 사용이 불가하며, 차단 해제 시 사용이 가능합니다. \n\n[유효기간 및 소멸]\n1. 결제한 UP플러스는 이용기간의 제한없이 사용 가능합니다. \n2. 회원 탈퇴 시 UP플러스는 소멸처리 되며,  재가입 후에도 복구는 불가합니다. \n\n&quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}{&quot;1&quot;:246,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:254}{&quot;1&quot;:515,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:524}{&quot;1&quot;:662,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:674}"><strong>[환불정책]</strong></span><br></span>
                                    </p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 환불/보상 정책 안내 \n\n[환불정책]\n 1. 구매한 UP+를 사용하지 않고, 구매시간으로부터 48시간 이내 시 환불이 가능합니다. \n 2. 한개라도 사용한 경우 구글플레이, IOS앱스토어 인앱 결제 정책에 따라 환불이 불가합니다. \n   ▶ 안드로이드 링크 : 구글 플레이스토어\n   ▶ 아이폰 링크 : 애플 앱스토어\n\n 3. 사용하지 않은 UP+ 환불 요청 경로 : 1:1문의 > 서비스기능 >UP플러스 로 문의 해주세요. \n\n[보상기준] \n 1. 사용한 UP플러스보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP플러스 개수만큼 제공 \n 2. 결제완료 하였으나 UP플러스가 제공되지 않은 경우 : 영업일 기준 1일이내 누락된 UP플러스 제공 \n 3. UP플러스 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된  UP플러스 개수만큼 영업일 기준 3일이내 제공 \n    장애기준 :  검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가\n\n[제재된 경우]\n1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP플러스 적용중인 경우 경고없이 삭제 될 수 있으며 UP플러스는 보상되지 않습니다.\n2. 계정 차단 : 계정 차단 시 UP플러스 사용이 불가하며, 차단 해제 시 사용이 가능합니다. \n\n[유효기간 및 소멸]\n1. 결제한 UP플러스는 이용기간의 제한없이 사용 가능합니다. \n2. 회원 탈퇴 시 UP플러스는 소멸처리 되며,  재가입 후에도 복구는 불가합니다. \n\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}{&quot;1&quot;:246,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:254}{&quot;1&quot;:515,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:524}{&quot;1&quot;:662,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:674}">구매한
                                            UP하기를 사용하지 않을 시 7일이내 환불이 가능합니다.</span></p>
                                    <p>단, 구글플레이, 앱스토어 환불정책이 상이하므로 아래 자세한 사항을 참고 부탁 드립니다.&nbsp;</p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 환불/보상 정책 안내 \n\n[환불정책]\n 1. 구매한 UP+를 사용하지 않고, 구매시간으로부터 48시간 이내 시 환불이 가능합니다. \n 2. 한개라도 사용한 경우 구글플레이, IOS앱스토어 인앱 결제 정책에 따라 환불이 불가합니다. \n   ▶ 안드로이드 링크 : 구글 플레이스토어\n   ▶ 아이폰 링크 : 애플 앱스토어\n\n 3. 사용하지 않은 UP+ 환불 요청 경로 : 1:1문의 > 서비스기능 >UP플러스 로 문의 해주세요. \n\n[보상기준] \n 1. 사용한 UP플러스보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP플러스 개수만큼 제공 \n 2. 결제완료 하였으나 UP플러스가 제공되지 않은 경우 : 영업일 기준 1일이내 누락된 UP플러스 제공 \n 3. UP플러스 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된  UP플러스 개수만큼 영업일 기준 3일이내 제공 \n    장애기준 :  검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가\n\n[제재된 경우]\n1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP플러스 적용중인 경우 경고없이 삭제 될 수 있으며 UP플러스는 보상되지 않습니다.\n2. 계정 차단 : 계정 차단 시 UP플러스 사용이 불가하며, 차단 해제 시 사용이 가능합니다. \n\n[유효기간 및 소멸]\n1. 결제한 UP플러스는 이용기간의 제한없이 사용 가능합니다. \n2. 회원 탈퇴 시 UP플러스는 소멸처리 되며,  재가입 후에도 복구는 불가합니다. \n\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}{&quot;1&quot;:246,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:254}{&quot;1&quot;:515,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:524}{&quot;1&quot;:662,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:674}">&nbsp;
                                            Ⅰ.&nbsp;<strong>구글플레이&nbsp;</strong></span></p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 환불/보상 정책 안내 \n\n[환불정책]\n 1. 구매한 UP+를 사용하지 않고, 구매시간으로부터 48시간 이내 시 환불이 가능합니다. \n 2. 한개라도 사용한 경우 구글플레이, IOS앱스토어 인앱 결제 정책에 따라 환불이 불가합니다. \n   ▶ 안드로이드 링크 : 구글 플레이스토어\n   ▶ 아이폰 링크 : 애플 앱스토어\n\n 3. 사용하지 않은 UP+ 환불 요청 경로 : 1:1문의 > 서비스기능 >UP플러스 로 문의 해주세요. \n\n[보상기준] \n 1. 사용한 UP플러스보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP플러스 개수만큼 제공 \n 2. 결제완료 하였으나 UP플러스가 제공되지 않은 경우 : 영업일 기준 1일이내 누락된 UP플러스 제공 \n 3. UP플러스 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된  UP플러스 개수만큼 영업일 기준 3일이내 제공 \n    장애기준 :  검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가\n\n[제재된 경우]\n1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP플러스 적용중인 경우 경고없이 삭제 될 수 있으며 UP플러스는 보상되지 않습니다.\n2. 계정 차단 : 계정 차단 시 UP플러스 사용이 불가하며, 차단 해제 시 사용이 가능합니다. \n\n[유효기간 및 소멸]\n1. 결제한 UP플러스는 이용기간의 제한없이 사용 가능합니다. \n2. 회원 탈퇴 시 UP플러스는 소멸처리 되며,  재가입 후에도 복구는 불가합니다. \n\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}{&quot;1&quot;:246,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:254}{&quot;1&quot;:515,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:524}{&quot;1&quot;:662,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:674}">&nbsp;
                                            &nbsp; &nbsp;1. 인앱 환불정책에 따라 48시간 이내 미사용 시 구글프레이를 통해 환불 신청이
                                            가능합니다.&nbsp;</span></p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 환불/보상 정책 안내 \n\n[환불정책]\n 1. 구매한 UP+를 사용하지 않고, 구매시간으로부터 48시간 이내 시 환불이 가능합니다. \n 2. 한개라도 사용한 경우 구글플레이, IOS앱스토어 인앱 결제 정책에 따라 환불이 불가합니다. \n   ▶ 안드로이드 링크 : 구글 플레이스토어\n   ▶ 아이폰 링크 : 애플 앱스토어\n\n 3. 사용하지 않은 UP+ 환불 요청 경로 : 1:1문의 > 서비스기능 >UP플러스 로 문의 해주세요. \n\n[보상기준] \n 1. 사용한 UP플러스보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP플러스 개수만큼 제공 \n 2. 결제완료 하였으나 UP플러스가 제공되지 않은 경우 : 영업일 기준 1일이내 누락된 UP플러스 제공 \n 3. UP플러스 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된  UP플러스 개수만큼 영업일 기준 3일이내 제공 \n    장애기준 :  검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가\n\n[제재된 경우]\n1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP플러스 적용중인 경우 경고없이 삭제 될 수 있으며 UP플러스는 보상되지 않습니다.\n2. 계정 차단 : 계정 차단 시 UP플러스 사용이 불가하며, 차단 해제 시 사용이 가능합니다. \n\n[유효기간 및 소멸]\n1. 결제한 UP플러스는 이용기간의 제한없이 사용 가능합니다. \n2. 회원 탈퇴 시 UP플러스는 소멸처리 되며,  재가입 후에도 복구는 불가합니다. \n\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}{&quot;1&quot;:246,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:254}{&quot;1&quot;:515,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:524}{&quot;1&quot;:662,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:674}">&nbsp;
                                            &nbsp; &nbsp;2. 48시간 경과 되었을 시 7일 이내&nbsp; 1:1문의 &gt; 이용방법문의 &gt; UP하기를 통해
                                            환불요청 해주시면
                                            됩니다.&nbsp;</span></p>
                                    <p>&nbsp; <strong>Ⅱ. 앱스토어</strong></p>
                                    <p>&nbsp; &nbsp; 환불요청 및 문의는 앱스토어를 통해 가능하며 환불 가능 여부는 앱스토어 환불정책에 따라 진행됨을 안내
                                        드립니다.&nbsp;</p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 환불/보상 정책 안내 \n\n[환불정책]\n 1. 구매한 UP+를 사용하지 않고, 구매시간으로부터 48시간 이내 시 환불이 가능합니다. \n 2. 한개라도 사용한 경우 구글플레이, IOS앱스토어 인앱 결제 정책에 따라 환불이 불가합니다. \n   ▶ 안드로이드 링크 : 구글 플레이스토어\n   ▶ 아이폰 링크 : 애플 앱스토어\n\n 3. 사용하지 않은 UP+ 환불 요청 경로 : 1:1문의 > 서비스기능 >UP플러스 로 문의 해주세요. \n\n[보상기준] \n 1. 사용한 UP플러스보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP플러스 개수만큼 제공 \n 2. 결제완료 하였으나 UP플러스가 제공되지 않은 경우 : 영업일 기준 1일이내 누락된 UP플러스 제공 \n 3. UP플러스 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된  UP플러스 개수만큼 영업일 기준 3일이내 제공 \n    장애기준 :  검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가\n\n[제재된 경우]\n1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP플러스 적용중인 경우 경고없이 삭제 될 수 있으며 UP플러스는 보상되지 않습니다.\n2. 계정 차단 : 계정 차단 시 UP플러스 사용이 불가하며, 차단 해제 시 사용이 가능합니다. \n\n[유효기간 및 소멸]\n1. 결제한 UP플러스는 이용기간의 제한없이 사용 가능합니다. \n2. 회원 탈퇴 시 UP플러스는 소멸처리 되며,  재가입 후에도 복구는 불가합니다. \n\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}{&quot;1&quot;:246,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:254}{&quot;1&quot;:515,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:524}{&quot;1&quot;:662,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:674}">&nbsp;<strong>
                                                Ⅲ. 광고포인트 사용</strong></span></p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 환불/보상 정책 안내 \n\n[환불정책]\n 1. 구매한 UP+를 사용하지 않고, 구매시간으로부터 48시간 이내 시 환불이 가능합니다. \n 2. 한개라도 사용한 경우 구글플레이, IOS앱스토어 인앱 결제 정책에 따라 환불이 불가합니다. \n   ▶ 안드로이드 링크 : 구글 플레이스토어\n   ▶ 아이폰 링크 : 애플 앱스토어\n\n 3. 사용하지 않은 UP+ 환불 요청 경로 : 1:1문의 > 서비스기능 >UP플러스 로 문의 해주세요. \n\n[보상기준] \n 1. 사용한 UP플러스보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP플러스 개수만큼 제공 \n 2. 결제완료 하였으나 UP플러스가 제공되지 않은 경우 : 영업일 기준 1일이내 누락된 UP플러스 제공 \n 3. UP플러스 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된  UP플러스 개수만큼 영업일 기준 3일이내 제공 \n    장애기준 :  검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가\n\n[제재된 경우]\n1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP플러스 적용중인 경우 경고없이 삭제 될 수 있으며 UP플러스는 보상되지 않습니다.\n2. 계정 차단 : 계정 차단 시 UP플러스 사용이 불가하며, 차단 해제 시 사용이 가능합니다. \n\n[유효기간 및 소멸]\n1. 결제한 UP플러스는 이용기간의 제한없이 사용 가능합니다. \n2. 회원 탈퇴 시 UP플러스는 소멸처리 되며,  재가입 후에도 복구는 불가합니다. \n\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}{&quot;1&quot;:246,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:254}{&quot;1&quot;:515,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:524}{&quot;1&quot;:662,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:674}">&nbsp;
                                            &nbsp; UP하기 결제일로부터&nbsp;7일 이내&nbsp; 1:1문의 &gt; 이용방법문의 &gt; UP하기를 통해 환불요청
                                            해주시면 됩니다.<br><br><span
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 환불/보상 정책 안내 \n\n[환불정책]\n 1. 구매한 UP+를 사용하지 않고, 구매시간으로부터 48시간 이내 시 환불이 가능합니다. \n 2. 한개라도 사용한 경우 구글플레이, IOS앱스토어 인앱 결제 정책에 따라 환불이 불가합니다. \n   ▶ 안드로이드 링크 : 구글 플레이스토어\n   ▶ 아이폰 링크 : 애플 앱스토어\n\n 3. 사용하지 않은 UP+ 환불 요청 경로 : 1:1문의 > 서비스기능 >UP플러스 로 문의 해주세요. \n\n[보상기준] \n 1. 사용한 UP플러스보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP플러스 개수만큼 제공 \n 2. 결제완료 하였으나 UP플러스가 제공되지 않은 경우 : 영업일 기준 1일이내 누락된 UP플러스 제공 \n 3. UP플러스 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된  UP플러스 개수만큼 영업일 기준 3일이내 제공 \n    장애기준 :  검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가\n\n[제재된 경우]\n1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP플러스 적용중인 경우 경고없이 삭제 될 수 있으며 UP플러스는 보상되지 않습니다.\n2. 계정 차단 : 계정 차단 시 UP플러스 사용이 불가하며, 차단 해제 시 사용이 가능합니다. \n\n[유효기간 및 소멸]\n1. 결제한 UP플러스는 이용기간의 제한없이 사용 가능합니다. \n2. 회원 탈퇴 시 UP플러스는 소멸처리 되며,  재가입 후에도 복구는 불가합니다. \n\n&quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}{&quot;1&quot;:246,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:254}{&quot;1&quot;:515,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:524}{&quot;1&quot;:662,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:674}"><strong>[보상기준]</strong></span><br>1.
                                            사용한 UP하기 보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP하기 개수만큼 제공<br>2. 결제완료 하였으나 UP하기가
                                            제공되지 않은 경우 : 영업일 기준
                                            1일이내 누락된 UP하기 제공<br>3. UP하기 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된 UP하기
                                            개수만큼 영업일 기준 3일이내
                                            제공<br>장애기준 : 검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가<br><br><span
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 환불/보상 정책 안내 \n\n[환불정책]\n 1. 구매한 UP+를 사용하지 않고, 구매시간으로부터 48시간 이내 시 환불이 가능합니다. \n 2. 한개라도 사용한 경우 구글플레이, IOS앱스토어 인앱 결제 정책에 따라 환불이 불가합니다. \n   ▶ 안드로이드 링크 : 구글 플레이스토어\n   ▶ 아이폰 링크 : 애플 앱스토어\n\n 3. 사용하지 않은 UP+ 환불 요청 경로 : 1:1문의 > 서비스기능 >UP플러스 로 문의 해주세요. \n\n[보상기준] \n 1. 사용한 UP플러스보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP플러스 개수만큼 제공 \n 2. 결제완료 하였으나 UP플러스가 제공되지 않은 경우 : 영업일 기준 1일이내 누락된 UP플러스 제공 \n 3. UP플러스 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된  UP플러스 개수만큼 영업일 기준 3일이내 제공 \n    장애기준 :  검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가\n\n[제재된 경우]\n1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP플러스 적용중인 경우 경고없이 삭제 될 수 있으며 UP플러스는 보상되지 않습니다.\n2. 계정 차단 : 계정 차단 시 UP플러스 사용이 불가하며, 차단 해제 시 사용이 가능합니다. \n\n[유효기간 및 소멸]\n1. 결제한 UP플러스는 이용기간의 제한없이 사용 가능합니다. \n2. 회원 탈퇴 시 UP플러스는 소멸처리 되며,  재가입 후에도 복구는 불가합니다. \n\n&quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}{&quot;1&quot;:246,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:254}{&quot;1&quot;:515,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:524}{&quot;1&quot;:662,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:674}"><strong>[제재된
                                                    경우]</strong></span><br>1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP하기 적용중인
                                            경우 경고없이 삭제 될 수 있으며 UP하기는
                                            보상되지 않습니다.<br>2. 계정 차단 : 계정 차단 시 UP하기 사용이 불가하며, 차단 해제 시 사용이
                                            가능합니다.<br><br><span
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 환불/보상 정책 안내 \n\n[환불정책]\n 1. 구매한 UP+를 사용하지 않고, 구매시간으로부터 48시간 이내 시 환불이 가능합니다. \n 2. 한개라도 사용한 경우 구글플레이, IOS앱스토어 인앱 결제 정책에 따라 환불이 불가합니다. \n   ▶ 안드로이드 링크 : 구글 플레이스토어\n   ▶ 아이폰 링크 : 애플 앱스토어\n\n 3. 사용하지 않은 UP+ 환불 요청 경로 : 1:1문의 > 서비스기능 >UP플러스 로 문의 해주세요. \n\n[보상기준] \n 1. 사용한 UP플러스보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP플러스 개수만큼 제공 \n 2. 결제완료 하였으나 UP플러스가 제공되지 않은 경우 : 영업일 기준 1일이내 누락된 UP플러스 제공 \n 3. UP플러스 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된  UP플러스 개수만큼 영업일 기준 3일이내 제공 \n    장애기준 :  검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가\n\n[제재된 경우]\n1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP플러스 적용중인 경우 경고없이 삭제 될 수 있으며 UP플러스는 보상되지 않습니다.\n2. 계정 차단 : 계정 차단 시 UP플러스 사용이 불가하며, 차단 해제 시 사용이 가능합니다. \n\n[유효기간 및 소멸]\n1. 결제한 UP플러스는 이용기간의 제한없이 사용 가능합니다. \n2. 회원 탈퇴 시 UP플러스는 소멸처리 되며,  재가입 후에도 복구는 불가합니다. \n\n&quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}{&quot;1&quot;:246,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:254}{&quot;1&quot;:515,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:524}{&quot;1&quot;:662,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:674}"><strong>[유효기간
                                                    및 소멸]</strong></span><br>1. 결제한 UP하기는 이용기간의 제한없이 사용
                                            가능합니다.<br></span><span
                                            data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 환불/보상 정책 안내 \n\n[환불정책]\n 1. 구매한 UP+를 사용하지 않고, 구매시간으로부터 48시간 이내 시 환불이 가능합니다. \n 2. 한개라도 사용한 경우 구글플레이, IOS앱스토어 인앱 결제 정책에 따라 환불이 불가합니다. \n   ▶ 안드로이드 링크 : 구글 플레이스토어\n   ▶ 아이폰 링크 : 애플 앱스토어\n\n 3. 사용하지 않은 UP+ 환불 요청 경로 : 1:1문의 > 서비스기능 >UP플러스 로 문의 해주세요. \n\n[보상기준] \n 1. 사용한 UP플러스보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP플러스 개수만큼 제공 \n 2. 결제완료 하였으나 UP플러스가 제공되지 않은 경우 : 영업일 기준 1일이내 누락된 UP플러스 제공 \n 3. UP플러스 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된  UP플러스 개수만큼 영업일 기준 3일이내 제공 \n    장애기준 :  검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가\n\n[제재된 경우]\n1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP플러스 적용중인 경우 경고없이 삭제 될 수 있으며 UP플러스는 보상되지 않습니다.\n2. 계정 차단 : 계정 차단 시 UP플러스 사용이 불가하며, 차단 해제 시 사용이 가능합니다. \n\n[유효기간 및 소멸]\n1. 결제한 UP플러스는 이용기간의 제한없이 사용 가능합니다. \n2. 회원 탈퇴 시 UP플러스는 소멸처리 되며,  재가입 후에도 복구는 불가합니다. \n\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}{&quot;1&quot;:246,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:254}{&quot;1&quot;:515,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:524}{&quot;1&quot;:662,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:674}">2.
                                            회원 탈퇴 시 UP하기는 소멸처리 되며, 재가입 후에도 복구는 불가합니다.</span><span
                                            data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 환불/보상 정책 안내 \n\n[환불정책]\n 1. 구매한 UP+를 사용하지 않고, 구매시간으로부터 48시간 이내 시 환불이 가능합니다. \n 2. 한개라도 사용한 경우 구글플레이, IOS앱스토어 인앱 결제 정책에 따라 환불이 불가합니다. \n   ▶ 안드로이드 링크 : 구글 플레이스토어\n   ▶ 아이폰 링크 : 애플 앱스토어\n\n 3. 사용하지 않은 UP+ 환불 요청 경로 : 1:1문의 > 서비스기능 >UP플러스 로 문의 해주세요. \n\n[보상기준] \n 1. 사용한 UP플러스보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP플러스 개수만큼 제공 \n 2. 결제완료 하였으나 UP플러스가 제공되지 않은 경우 : 영업일 기준 1일이내 누락된 UP플러스 제공 \n 3. UP플러스 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된  UP플러스 개수만큼 영업일 기준 3일이내 제공 \n    장애기준 :  검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가\n\n[제재된 경우]\n1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP플러스 적용중인 경우 경고없이 삭제 될 수 있으며 UP플러스는 보상되지 않습니다.\n2. 계정 차단 : 계정 차단 시 UP플러스 사용이 불가하며, 차단 해제 시 사용이 가능합니다. \n\n[유효기간 및 소멸]\n1. 결제한 UP플러스는 이용기간의 제한없이 사용 가능합니다. \n2. 회원 탈퇴 시 UP플러스는 소멸처리 되며,  재가입 후에도 복구는 불가합니다. \n\n&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}{&quot;1&quot;:246,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:254}{&quot;1&quot;:515,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:524}{&quot;1&quot;:662,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:674}"><span
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;UP플러스 환불/보상 정책 안내 \n\n[환불정책]\n 1. 구매한 UP+를 사용하지 않고, 구매시간으로부터 48시간 이내 시 환불이 가능합니다. \n 2. 한개라도 사용한 경우 구글플레이, IOS앱스토어 인앱 결제 정책에 따라 환불이 불가합니다. \n   ▶ 안드로이드 링크 : 구글 플레이스토어\n   ▶ 아이폰 링크 : 애플 앱스토어\n\n 3. 사용하지 않은 UP+ 환불 요청 경로 : 1:1문의 > 서비스기능 >UP플러스 로 문의 해주세요. \n\n[보상기준] \n 1. 사용한 UP플러스보다 더 많이 차감된 경우 : 영업일 기준 3일이내 차감된 UP플러스 개수만큼 제공 \n 2. 결제완료 하였으나 UP플러스가 제공되지 않은 경우 : 영업일 기준 1일이내 누락된 UP플러스 제공 \n 3. UP플러스 사용 중 장애가 발생된 경우 : 장애발생 시각 10분전부터 종료시각까지 사용된  UP플러스 개수만큼 영업일 기준 3일이내 제공 \n    장애기준 :  검색/카테고리 페이지 접속불가, 상점 접속불가, 앱 실행불가, 상품정보 갱신불가\n\n[제재된 경우]\n1. 상품 삭제 : 허위상품 및 번개장터 거래금지품목 상품을 UP플러스 적용중인 경우 경고없이 삭제 될 수 있으며 UP플러스는 보상되지 않습니다.\n2. 계정 차단 : 계정 차단 시 UP플러스 사용이 불가하며, 차단 해제 시 사용이 가능합니다. \n\n[유효기간 및 소멸]\n1. 결제한 UP플러스는 이용기간의 제한없이 사용 가능합니다. \n2. 회원 탈퇴 시 UP플러스는 소멸처리 되며,  재가입 후에도 복구는 불가합니다. \n\n&quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}{&quot;1&quot;:246,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:254}{&quot;1&quot;:515,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:524}{&quot;1&quot;:662,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:674}"><br><br></span></span>
                                    </p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>키워드 검색광고는 어디서 신청하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><strong><span style="color: #ff0000;">키워드 검색 광고는 총 5개의 방법으로 신청 가능
                                            </span></strong></p>
                                    <p>1. 마이샵&gt;빨리 팔기&gt;광고하기</p>
                                    <p>2. 마이샵&gt;상품 오른쪽 더보기 클릭&gt;광고하기</p>
                                    <p>3. 마이샵&gt;상품 선택&gt;연필 아이콘(수정)&gt;상품 선택 &gt;광고하기</p>
                                    <p>4. 마이샵&gt;상단 판매자센터</p>
                                    <p>5. 판매자센터 (url)&gt;광고신청</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>키워드 검색 광고는 어떤 광고인가요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>상품 키워드 검색 시 노출되는 광고 </strong></span></p>
                                    <p>키워드 검색 광고는 설정한 키워드를 유저가 검색 후 클릭 했을 시</p>
                                    <p>클릭당 광고비가 과금되는 광고입니다. 번개장터 키워드 검색 광고는 판매자가 설정한 예산에 맞는 입찰가를 추천 해드립니다.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>키워드 검색 광고를 사용하면 상품은 어디에 노출 되나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>[검색 결과 지면], [상품 정보 하단 ‘이 상품과 비슷해요’ 지면],
                                                [카테고리 추천 상품 지면]에 AD마크로
                                                노출</strong></span></p>
                                    <p>단, 디바이스에 따라 지면 명칭은 달라 질 수 있습니다.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>키워드 검색 광고로 신청한 상품이 노출이 되지 않아요!</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;" data-mce-mark="1"><strong>광고신청 상태 및 입찰가 확인 필요
                                            </strong></span></p>
                                    <p>광고가 신청되면 광고 소재에 대해 심사를 거치게 되며 심사중일때 광고 상태는 ‘대기’ 로 확인되며</p>
                                    <p>광고 대기상태에서는 광고 노출이 되지 않습니다.</p>
                                    <p>광고대기 상태가 아닐 경우&nbsp; 입찰가를 낮게 설정하신 경우 후순위(하단) 노출이 될 수 있습니다.&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>광고사용 중 상점이 제재 당한 경우 광고는 어떻게 되는건가요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;"><strong>제재상점은 상품 판매 및 광고 사용 불가 </strong></span></p>
                                    <p>판매자 상점이 제재가 될 경우 신청하신 광고가 모두 '취소' 처리됩니다.</p>
                                    </p>
                                </div>
                            </li>
                        </ul>
                        <ul class="qaBox">
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>1. 상품등록</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p>상품등록 시 이미지, 이름, 가격, 상태, 수량 등의 자세한 설명은 번개장터 내 원활한 거래가 이루어질 수 잇습니다.</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1> 2. 판매하기</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p>현재 상품에 대해 거래가 가능한지, 하자는 없는지, 재고는 확보되었는지 등의 내용을 구매자에게 알려주세요.</p>
                                    <p>※ 배송비, 교환신청, 에누리 등의 내용도 작성하신다면 더 좋아요^^</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1> 3. 결제하기</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p>결제방법으로는 번개페이(안심구매), 판매자계좌입금이 있습니다.</p>
                                    <p>&nbsp;</p>
                                    <p><strong>번개페이(안심구매)란?&nbsp;</strong>구매자가 상품구매 시 결제대금은 번개장터에 임시보관되며,</p>
                                    <p>&nbsp;</p>
                                    <p><strong>①판매자의 상품발송&gt;②구매자 상품수령완료&gt;<br>③판매자에게 결제대금이 입금되는 서비스</strong>로 선입금 및 배송
                                        후 입금관련&nbsp;<br>거래문제를
                                        방지할 수 있습니다.</p>
                                    <p>* 번개페이 자세한 이용방법은 자주묻는질문&gt;안전거래 를 확인하세요!&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p><strong>판매자 계좌입금이란?</strong>&nbsp;판매자가 요청하는 계좌로 구매자가 해당금액을 이체하는 방법입니다.</p>
                                    <p>번개톡 하단 "계좌보내기", "주소보내기"를 통해 계좌와 주소를 간단하게 주고 받을 수 있습니다.</p>
                                    <p>계좌입금으로 인한 거래가 불안하시다면 번개페이를 통해 안전한 거래를 해보세요.</p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1> 4. 발송준비</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p>구매자가 상품대금을 입금하였다면, 바로 상품발송 준비해주시고, 구매자를 안심시킬 수 있도록</p>
                                    <p>현재 준비상황 및 운송장번호를 알려주세요.</p>
                                    <p>&nbsp;</p>
                                    <p><span style="color: #888888;">※ 내 상점상품&gt;택배신청&gt;편의점택배 or 방문택배 선택 시 편리하게 배송접수가
                                            가능합니다.</span></p>
                                    <p>&nbsp;</p>
                                    <p class="MsoNormal"><strong><span
                                                style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;" lang="EN-US">1)
                                            </span><span style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;">편의점
                                                택배(추천)</span></strong></p>
                                    <p class="MsoNormal"
                                        style="text-indent: 18.8pt; mso-char-indent-count: 2.0; mso-pagination: widow-orphan; text-autospace: ideograph-numeric ideograph-other; word-break: keep-all;">
                                        <span style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;">집 앞 편의점에서 편<span
                                                lang="EN-US">~</span>하게
                                            택배접수가 가능한 서비스</span>
                                    </p>
                                    <p class="MsoNormal"
                                        style="margin-left: 20.0pt; mso-para-margin-left: 2.0gd; mso-pagination: widow-orphan; text-autospace: ideograph-numeric ideograph-other; word-break: keep-all;">
                                        <span style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;">→ 상품정보<span
                                                lang="EN-US"> &gt;
                                            </span>택배신청<span lang="EN-US"> &gt; </span>편의점택배 클릭</span>
                                    </p>
                                    <p class="MsoNormal"><span style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;"
                                            lang="EN-US">&nbsp;</span>
                                    </p>
                                    <p class="MsoNormal"><strong><span
                                                style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;" lang="EN-US">2)
                                                CJ</span><span
                                                style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;">대한통운
                                                방문택배(추천)</span></strong></p>
                                    <p class="MsoNormal"
                                        style="text-indent: 18.8pt; mso-char-indent-count: 2.0; mso-pagination: widow-orphan; text-autospace: ideograph-numeric ideograph-other; word-break: keep-all;">
                                        <span style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;">우리집 대문 앞까지 택배기사님이
                                            방문하여 상품을 수거해가는 편리한
                                            서비스</span>
                                    </p>
                                    <p class="MsoNormal"
                                        style="margin-left: 20.0pt; mso-para-margin-left: 2.0gd; mso-pagination: widow-orphan; text-autospace: ideograph-numeric ideograph-other; word-break: keep-all;">
                                        <span style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;">→ 상품정보<span
                                                lang="EN-US"> &gt;
                                            </span>택배신청<span lang="EN-US"> &gt; CJ</span>대한통운 방문택배 클릭</span>
                                    </p>
                                    <p class="MsoNormal"><span style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;"
                                            lang="EN-US">&nbsp;</span>
                                    </p>
                                    <p class="MsoNormal"><strong><span
                                                style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;" lang="EN-US">3)
                                            </span></strong><strong><span
                                                style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;">일반
                                                택배</span></strong></p>
                                    <p class="MsoNormal"
                                        style="margin-left: 18.8pt; text-indent: -18.8pt; mso-char-indent-count: -2.0; mso-pagination: widow-orphan; text-autospace: ideograph-numeric ideograph-other; word-break: keep-all;">
                                        <span style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;"
                                            lang="EN-US">&nbsp;&nbsp;&nbsp;
                                        </span><span style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;">편의점 택배<span
                                                lang="EN-US">,
                                            </span>방문택배 이외의 타 택배사를 통해 상품발송하는 서비스<span lang="EN-US">. </span></span>
                                    </p>
                                    <p class="MsoNormal"
                                        style="margin-left: 20.0pt; mso-para-margin-left: 2.0gd; mso-pagination: widow-orphan; text-autospace: ideograph-numeric ideograph-other; word-break: keep-all;">
                                        <span style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;">단<span
                                                lang="EN-US">, </span>번개장를 이용한
                                            택배서비스보다 비용이 비싸게 책정될 수 있습니다<span lang="EN-US">.</span></span>
                                    </p>
                                    <p class="MsoNormal"
                                        style="margin-left: 18.8pt; text-indent: -18.8pt; mso-char-indent-count: -2.0; mso-pagination: widow-orphan; text-autospace: ideograph-numeric ideograph-other; word-break: keep-all;">
                                        <span style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;"
                                            lang="EN-US">&nbsp;</span>
                                    </p>
                                    <p class="MsoNormal"><strong><span
                                                style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;" lang="EN-US">4)
                                            </span></strong><strong><span
                                                style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;">직거래</span></strong>
                                    </p>
                                    <p class="MsoNormal"
                                        style="margin-left: 20.0pt; mso-para-margin-left: 2.0gd; mso-pagination: widow-orphan; text-autospace: ideograph-numeric ideograph-other; word-break: keep-all;">
                                        <span style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;">매매보호서비스를 통하지 않고
                                            판매자와 구매자가 직접 물품대금과 상품 등을
                                            주고받는 거래로 상품의 상태 확인이 가능합니다<span lang="EN-US">. </span>약속시간<span
                                                lang="EN-US">, </span>장소는 꼭 맞춰주셔야
                                            거래파기를 예방할 수 있습니다<span lang="EN-US">.</span></span>
                                    </p>
                                    <p class="MsoNormal"
                                        style="text-indent: 18.8pt; mso-char-indent-count: 2.0; mso-pagination: widow-orphan; text-autospace: ideograph-numeric ideograph-other; word-break: keep-all;">
                                        <span style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;"
                                            lang="EN-US">&nbsp;</span>번개톡 하단 "직거래하기"를
                                        통해 약속을 정해보세요^^
                                    </p>
                                    <p class="MsoNormal"
                                        style="text-indent: 18.8pt; mso-char-indent-count: 2.0; mso-pagination: widow-orphan; text-autospace: ideograph-numeric ideograph-other; word-break: keep-all;">
                                        &nbsp;</p>
                                    <p class="MsoNormal"><strong><span
                                                style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;"
                                                lang="EN-US">&nbsp;&nbsp;&nbsp; </span></strong><strong><span
                                                style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;">주의하세요<span
                                                    lang="EN-US">!</span></span></strong></p>
                                    <p class="MsoNormal"
                                        style="margin-left: 20.0pt; mso-para-margin-left: 2.0gd; mso-pagination: widow-orphan; text-autospace: ideograph-numeric ideograph-other; word-break: keep-all;">
                                        <span
                                            style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕; color: #c00000;">우편<span
                                                lang="EN-US">(</span>등기<span lang="EN-US">)</span>거래</span><span
                                            style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;"> <span lang="EN-US">–
                                            </span>이동경로 확인 불가<span lang="EN-US">, </span>분실 시 귀책여부 확인이 어렵습니다<span
                                                lang="EN-US">.</span></span>
                                    </p>
                                    <p>&nbsp;</p>
                                    <p class="MsoNormal"
                                        style="margin-left: 20.0pt; mso-para-margin-left: 2.0gd; mso-pagination: widow-orphan; text-autospace: ideograph-numeric ideograph-other; word-break: keep-all;">
                                        <span style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕; color: #c00000;"
                                            lang="EN-US">SMS</span><span
                                            style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕; color: #c00000;">발송</span><span
                                            style="mso-bidi-font-size: 10.0pt; font-family: 나눔고딕;"> <span lang="EN-US">–
                                                PIN</span>번호<span lang="EN-US">, </span>기프티콘 등 구매 전 사용여부 확인불가로 분쟁발생소지가
                                            있습니다<span lang="EN-US">.</span></span>
                                    </p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>5. 발송완료</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p>상품 발송 후 구매자를 안심시킬 수 있도록 운송장 번호는 꼭 알려주시고,&nbsp;</p>
                                    <p>배송지연이 된다면 사유와 함께 정확한 배송일자를 알려주세요.</p>
                                    <p>판매완료가 되었다면 상품상태 변경해주세요!</p>
                                    <p>&nbsp;</p>
                                    <p>구매자의 좋은 리뷰를 기대해보아요!^^</p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                        </ul>
                        <ul class="qaBox">
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>1. 상품선택</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;구매하고자 하는 상품페이지의 상세설명은 꼼꼼히 확인하세요. \n거래전 판매상점에 대한 리뷰, 상품정보 등을 확인해두시면 좋습니다.\n또한 지나치게 저렴하다면 조심&amp;의심하세요.\n\n거래 시 주의해야 하는 상품 : 휴대폰(아이폰), 아이팟, 아이패드, 명품 의류/가방&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}">구매하고자
                                            하는 상품페이지의 상세설명은 꼼꼼히 확인하세요.<br>거래전 판매상점에 대한 리뷰, 상품정보 등을 확인해두시면 좋습니다.<br>또한
                                            지나치게 저렴하다면
                                            조심&amp;의심하세요.<br><br>거래 시 주의해야 하는 상품 : 휴대폰(아이폰), 아이팟, 아이패드, 명품 의류/가방</span>
                                    </p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1> 2. 연락하기</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;번개톡을 통해 판매자와 상품의 하자, 재고여부, 착샷 등 상품정보를 확인해주세요.\n연락처 공개 상점의 경우 전화로도 연락이 가능해요!\n안전거래를 위해 문자, 전화 보다는 번개톡으로 연락하시기 바랍니다.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:12540,&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}">번개톡을
                                            통해 판매자와 상품의 하자, 재고여부, 착샷 등 상품정보를 확인해주세요.<br>연락처 공개 상점의 경우 전화로도 연락이
                                            가능해요!<br>안전거래를 위해 문자, 전화 보다는
                                            번개톡으로 연락하시기 바랍니다.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>3. 발송문의</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;상품을 구매하기로 했다면  착불/선불여부, 발송일자 문의는 꼭 상의해주세요. \n계좌정보와 판매자정보가 동일한지도 확인 해주세요.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}">상품을
                                            구매하기로 했다면 착불/선불여부, 발송일자 문의는 꼭 상의해주세요.<br>계좌정보와 판매자정보가 동일한지도 확인 해주세요.</span>
                                    </p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>4. 구매하기</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;판매자의 계좌정보로 상품금액을 입금했다면 입금완료내역을 판매자에게 알려주시고, 배송주소를 알려주세요.\n운송장번호는 꼭 알아두시고, 직거래가 불가하거나 고가의 제품이라면 안전결제서비스를 이용하시는 것도 좋습니다.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:12540,&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}">판매자의
                                            계좌정보로 상품금액을 입금했다면 입금완료내역을 판매자에게 알려주시고, 배송주소를 알려주세요.<br>운송장번호는 꼭 알아두시고, 직거래가
                                            불가하거나 고가의 제품이라면 안전결제서비스를
                                            이용하시는 것도 좋습니다.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>5. 수령완료</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p>상품 배송완료 되었다면 판매자에게 정확한 리뷰를 작성해주세요.</p>
                                    <p>만약 물품이 판매자가 알려준 상태와 다르다면 관련자료들을 첨부하여 번개장터 앱 내 설정&gt;1:1상담하기로 문의주세요.</p>
                                    <p>구매했으나 상품이 오지 않았다면 운송장번호를 확인하여 배송상태를 확인하시고, 시일이 지났는데도 판매자가 미발송, 연락두절이라면&nbsp;</p>
                                    <p>번개장터 앱 내 설정&gt;1:1상담하기로 문의 주세요!&nbsp;</p>
                                    <p>문의에 대해 빠르게 처리 도와드릴 수 있도록 하겠습니다.</p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                        </ul>
                        <ul class="qaBox">
                            <li class="qaBox1">
                                <article class="fXDURM"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>사기를 당하면 어떻게 처리해야 되나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot; 사기거래 발생 시 수사기관 접수\n\n번개장터는 개인간의  거래(C2C)에 대해 직접관여하지 않으므로, 피해를 당하셨을 경우 유관기관에 직접 신고를 하여 처리하셔야 합니다.\n신고 방법 및 필요서류는 아래내용을 참고 부탁드립니다. \n \n1. 준비자료 및 증거자료 수집 \n ▶ 준비자료 : 피해자 인적사항, 피해일시, 해당사이트, ID 또는 상점명, 거래내역\n                         가해상점의 개인정보는 개인정보보호법에 의해 신고인에게 직접 제공할 수 없으며, 경찰서의 공문을 통해 제공하고 있습니다. \n\n ▶ 증거자료 수집 : 상대방과 거래한 대화내용, 입금한 이체내역서 \n\n\n \n2. 경찰서 민원봉사실이나 사이버안전지킴이에 신고\n\n- 경찰청: https://www.police.go.kr/index.do\n 1) 경찰서 민원봉사실 방문(형사상 처리를 통해 검거 또는 보상이 필요할 경우)\n 2) 고소장을 작성\n 3) 사건사실확인서 발급을 요청\n 4) 사건사실확인서를 가지고 상대방의 은행에 방문하여 계좌지급정지 신청\n \n \n\n \n- 사이버안전지킴이\nhttps://www.police.go.kr/www/security/cyber.jsp\n해당 사이트에 방문하여 증거자료를 첨부하여 안내에 따라 작성하시면 됩니다.\n \n번개장터에서 처리해 드릴 수 있는 부분은, 사실확인 후 신고된 상대방의 상점이 활동하지 못하도록 계정을 정지하여 드리는 것입니다.\n[설정>1:1상담하기]를 통해 제보해 주실 수 있습니다.\n처리절차는 다음과 같습니다. (1:1문의통해 거래/송금 증거자료 제출 - 사실여부 확인 - 계정정지)\n \n<신고사유에 따른 필요 내용>\n• 상태불량 : 실제수령한 상품이미지 등 관련자료 이미지 첨부\n• 착불 : 선불로 협의한 대화내용(카톡, 번개톡 등) 등 관련 자료 이미지 첨부\n• 교환 : 상점에 등록 된 신고자(본인)의 상품과 상대방의 상품기재(본인상품, 상대방의 상품 추가금 발생했다면 기재)&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}"><span
                                                style="color: #ff0000;"><strong>사기거래 발생 시 수사기관 접수</strong></span></span>
                                    </p>
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot; 사기거래 발생 시 수사기관 접수\n\n번개장터는 개인간의  거래(C2C)에 대해 직접관여하지 않으므로, 피해를 당하셨을 경우 유관기관에 직접 신고를 하여 처리하셔야 합니다.\n신고 방법 및 필요서류는 아래내용을 참고 부탁드립니다. \n \n1. 준비자료 및 증거자료 수집 \n ▶ 준비자료 : 피해자 인적사항, 피해일시, 해당사이트, ID 또는 상점명, 거래내역\n                         가해상점의 개인정보는 개인정보보호법에 의해 신고인에게 직접 제공할 수 없으며, 경찰서의 공문을 통해 제공하고 있습니다. \n\n ▶ 증거자료 수집 : 상대방과 거래한 대화내용, 입금한 이체내역서 \n\n\n \n2. 경찰서 민원봉사실이나 사이버안전지킴이에 신고\n\n- 경찰청: https://www.police.go.kr/index.do\n 1) 경찰서 민원봉사실 방문(형사상 처리를 통해 검거 또는 보상이 필요할 경우)\n 2) 고소장을 작성\n 3) 사건사실확인서 발급을 요청\n 4) 사건사실확인서를 가지고 상대방의 은행에 방문하여 계좌지급정지 신청\n \n \n\n \n- 사이버안전지킴이\nhttps://www.police.go.kr/www/security/cyber.jsp\n해당 사이트에 방문하여 증거자료를 첨부하여 안내에 따라 작성하시면 됩니다.\n \n번개장터에서 처리해 드릴 수 있는 부분은, 사실확인 후 신고된 상대방의 상점이 활동하지 못하도록 계정을 정지하여 드리는 것입니다.\n[설정>1:1상담하기]를 통해 제보해 주실 수 있습니다.\n처리절차는 다음과 같습니다. (1:1문의통해 거래/송금 증거자료 제출 - 사실여부 확인 - 계정정지)\n \n<신고사유에 따른 필요 내용>\n• 상태불량 : 실제수령한 상품이미지 등 관련자료 이미지 첨부\n• 착불 : 선불로 협의한 대화내용(카톡, 번개톡 등) 등 관련 자료 이미지 첨부\n• 교환 : 상점에 등록 된 신고자(본인)의 상품과 상대방의 상품기재(본인상품, 상대방의 상품 추가금 발생했다면 기재)&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,4408131]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Malgun Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="{&quot;1&quot;:0,&quot;2&quot;:{&quot;5&quot;:1}}{&quot;1&quot;:20}"><br><br>번개장터는
                                            개인간의 거래(C2C)에 대해 직접관여하지 않으므로, 피해를 당하셨을 경우 유관기관에 직접 신고를 하여 처리하셔야 합니다.<br>신고
                                            방법 및 필요서류는 아래내용을 참고
                                            부탁드립니다.<br><br><strong>1. 준비자료 및 증거자료 수집</strong><br>▶ 준비자료 : 피해자 인적사항,
                                            피해일시, 해당사이트, ID 또는 상점명,
                                            거래내역<br>가해상점의 개인정보는 개인정보보호법에 의해 신고인에게 직접 제공할 수 없으며, 경찰서의 공문을 통해 제공하고
                                            있습니다.<br>▶ 증거자료 수집 : 상대방과 거래한
                                            대화내용, 입금한 이체내역서<br><br><br><br><strong>2. 경찰서 민원봉사실이나 사이버안전지킴이에
                                                신고</strong><br>- 경찰청:
                                            https://www.police.go.kr/index.do<br>1) 경찰서 민원봉사실 방문(형사상 처리를 통해 검거 또는 보상이
                                            필요할 경우)<br>2) 고소장을
                                            작성<br>3) 사건사실확인서 발급을 요청<br>4) 사건사실확인서를 가지고 상대방의 은행에 방문하여 계좌지급정지
                                            신청<br><br><br>-
                                            사이버안전지킴이<br>https://www.police.go.kr/www/security/cyber.jsp<br>해당 사이트에 방문하여
                                            증거자료를 첨부하여 안내에 따라 작성하시면
                                            됩니다.<br><br>번개장터에서 처리해 드릴 수 있는 부분은, 사실확인 후 신고된 상대방의 상점이 활동하지 못하도록 계정을 정지하여
                                            드리는
                                            것입니다.<br>[설정&gt;1:1상담하기]를 통해 제보해 주실 수 있습니다.<br>처리절차는 다음과 같습니다. (1:1문의통해
                                            거래/송금 증거자료 제출 - 사실여부 확인 -
                                            계정정지)<br><br>&lt;신고사유에 따른 필요 내용&gt;<br>• 상태불량 : 실제수령한 상품이미지 등 관련자료 이미지
                                            첨부<br>• 착불 : 선불로 협의한 대화내용(카톡,
                                            번개톡 등) 등 관련 자료 이미지 첨부<br>• 교환 : 상점에 등록 된 신고자(본인)의 상품과 상대방의 상품기재(본인상품, 상대방의
                                            상품 추가금 발생했다면 기재)</span>
                                    </p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>계정도용 시 신고는 어떻게 진행해야 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p>번개장터의 권한으로는 도용에 대한 명확한 정황을 확인하기가 어려운 관계로 아래의 방법으로 신고 접수를 부탁 드립니다.&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p><strong>1. 사이버안전지킴이</strong></p>
                                    <p>&nbsp;</p>
                                    <p>http://www.police.go.kr/www/security/cyber.jsp</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>계정이 도용된 경우 피해 내용과 함께 로그인 기록을 제출하셔야 하며,</p>
                                    <p>&nbsp;</p>
                                    <p>로그인 기록은 1:1문의로 휴대폰 가입사실 확인서를 첨부한 뒤 로그인 기록을 받으실</p>
                                    <p>&nbsp;</p>
                                    <p>이메일을 함께 작성하여 문의하시면 해당 메일로 제공 해드리고 있습니다.</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p><strong>2. 경찰서로 방문하여 신고접수</strong></p>
                                    <p>&nbsp;</p>
                                    <p>가까운 경찰서로 방문하여 신고접수가 가능합니다. 경찰서 방문 신고 시에도 로그인 기록을 제출하셔야 하며, 로그인 기록 제공방식은 위와 동일합니다.
                                    </p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>회원님의 피해사실에 대해 사이버안전지킴이 및 경찰서를 통한 신고접수 시 수사에 최대한 협조 진행하고 있으니 도용이 의심되는 경우 빠른 신고접수를
                                        부탁드립니다.</p>
                                    </p>
                                </div>
                            </li>
                        </ul>
                        <ul class="qaBox">
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1> 휴대폰 판매 절차는 어떻게 진행되나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p>1. 판매신청 : 기기정보 입력, 정산계좌, 반송주소등 필요한 정보를 입력해주세요.</p>
                                    <p>2. 휴대폰 발송 : 판매신청 시 발급된 편의점택배 예약번호로 번개장터로 발송해주세요.(배송비 부담: 번개장터)</p>
                                    <p>3. 검수 및 제안 : 데이터 초기화 및 기능/외관 검수 합리적인 견적가로 제안드립니다.</p>
                                    <p>4. 정산 : 제안드린 견적금액을 수락 시 요청하신 계좌로 정산됩니다. (정산기한 : 수락일 +1일이내 )</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>휴대폰 검수는 어떻게 진행되나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;1. 데이터 삭제 : 개인정보가 남지 않도록 초기화를 진행합니다. \n2. 세척 및 오염제거 : 외관의 오염과 불순물을 제거 합니다. \n3. 기능검사 : 소프트웨어 기능을 점검 합니다. (전원, 배터리, LCD, 카메라, WIFI등)\n4. 외관검사 : 하드웨어의 상태를 확인 합니다. (스크래치, 찍힘, 오염, 파손, 휨, 변경등)\n\n※ 데이터백업 서비스는 제공되지 않으므로 중요한 데이터는 백업 후 보내주세요. &quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Nanum Gothic&quot;,&quot;16&quot;:9}">1.
                                            데이터 삭제 : 개인정보가 남지 않도록 초기화를 진행합니다.<br>2. 세척 및 오염제거 : 외관의 오염과 불순물을
                                            제거합니다.<br>3. 기능검사 : 소프트웨어 기능을
                                            점검합니다. (전원, 배터리, LCD, 카메라, WIFI 등)<br>4. 외관검사 : 하드웨어의 상태를 확인합니다. (스크래치, 찍힘,
                                            오염, 파손, 휨, 변경
                                            등)<br><br><span
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;1. 데이터 삭제 : 개인정보가 남지 않도록 초기화를 진행합니다. \n2. 세척 및 오염제거 : 외관의 오염과 불순물을 제거 합니다. \n3. 기능검사 : 소프트웨어 기능을 점검 합니다. (전원, 배터리, LCD, 카메라, WIFI등)\n4. 외관검사 : 하드웨어의 상태를 확인 합니다. (스크래치, 찍힘, 오염, 파손, 휨, 변경등)\n\n※ 데이터백업 서비스는 제공되지 않으므로 중요한 데이터는 백업 후 보내주세요. &quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Nanum Gothic&quot;,&quot;16&quot;:9}"><em>※
                                                    데이터 백업 서비스는 제공되지 않으므로 중요한 데이터는 백업 후 보내주세요.</em></span></span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>휴대폰 발송은 어떻게 해야 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;매입 신청 시 발급된 편의점 택배 예약번호로 접수 \n\n편의점으로 방문하셔서 매입 신청 시 발급된 예약번호로 무료로 발송이 가능합니다. \n\n[포장 방법]\n 1. 상품 파손이 되지 않도록 완충제(뽁뽁이) 사용하기\n 2. 배송 중 파손이 발생되지 않도록 상품크기에 맞는 BOX 사용하기 \n 3. 상품 훼손/분실 이 발생되지 않도록 BOX 테이프 사용하기 \n\n※ 포장 미흡으로 인해 제품파손 또는 분실은 발생할 경우 고객과실로 구분되오니 꼼꼼하게 포장 부탁 드립니다.&quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Nanum Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:28}"><span
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;매입 신청 시 발급된 편의점 택배 예약번호로 접수 \n\n편의점으로 방문하셔서 매입 신청 시 발급된 예약번호로 무료로 발송이 가능합니다. \n\n[포장 방법]\n 1. 상품 파손이 되지 않도록 완충제(뽁뽁이) 사용하기\n 2. 배송 중 파손이 발생되지 않도록 상품크기에 맞는 BOX 사용하기 \n 3. 상품 훼손/분실 이 발생되지 않도록 BOX 테이프 사용하기 \n\n※ 포장 미흡으로 인해 제품파손 또는 분실은 발생할 경우 고객과실로 구분되오니 꼼꼼하게 포장 부탁 드립니다.&quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Nanum Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:28}"><strong>판매
                                                    신청 시 발급된
                                                    편의점 택배 예약번호로 접수</strong></span><br><br>편의점으로 방문하셔서 판매 신청 시 발급된 예약번호로
                                            무료로 발송이
                                            가능합니다.<br><br>[포장 방법]<br>1. 상품 파손이 되지 않도록 완충재(뽁뽁이) 사용하기<br>2. 배송 중 파손이 발생되지
                                            않도록 상품크기에 맞는 BOX
                                            사용하기<br>3. 상품 훼손/분실 이 발생되지 않도록 박스 테이프 사용하기<br><br><span
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;매입 신청 시 발급된 편의점 택배 예약번호로 접수 \n\n편의점으로 방문하셔서 매입 신청 시 발급된 예약번호로 무료로 발송이 가능합니다. \n\n[포장 방법]\n 1. 상품 파손이 되지 않도록 완충제(뽁뽁이) 사용하기\n 2. 배송 중 파손이 발생되지 않도록 상품크기에 맞는 BOX 사용하기 \n 3. 상품 훼손/분실 이 발생되지 않도록 BOX 테이프 사용하기 \n\n※ 포장 미흡으로 인해 제품파손 또는 분실은 발생할 경우 고객과실로 구분되오니 꼼꼼하게 포장 부탁 드립니다.&quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Nanum Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:28}"><em>※
                                                    포장 미흡으로 인해 제품파손
                                                    또는 분실이 발생할 경우 고객 과실로 구분되오니 꼼꼼하게 포장 부탁 드립니다.</em></span></span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>휴대폰 견적은 어떻게 계산이 되나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;기능,외관검사 후 검수 당일 시세기준으로 견적 \n\n검수 당일의 시세기준으로 기능,외관 검사 결과에 따라 A/B등급으로 분규가 되어 견적금액이 산출  됩니다. &quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Nanum Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:28}"><span
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;기능,외관검사 후 검수 당일 시세기준으로 견적 \n\n검수 당일의 시세기준으로 기능,외관 검사 결과에 따라 A/B등급으로 분규가 되어 견적금액이 산출  됩니다. &quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Nanum Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:28}"><strong>기능,외관검사
                                                    후 검수
                                                    당일 시세기준으로 견적</strong></span><br><br>검수 당일의 시세기준으로 기능,외관 검사 결과에 따라
                                            A/B등급으로 분류가 되어 견적금액이 산출
                                            됩니다.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>휴대폰 견적제안 수락은 언제까지 해야하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;견적금액 제안일 + 2일 이내 \n\n상품도착 후 1일 이내 견적금액 제안이 되며, 제안일로부터 2일이내 수락하지 않을 시 상품은 반송처리가 됩니다. &quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Nanum Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:19}"><span
                                                style="color: #ff0000;"><strong>견적금액 제안일 + 2일
                                                    이내</strong></span><br><br>상품도착 후 1일 이내 견적금액 제안이
                                            되며, 제안일로부터 2일이내 수락하지 않을 시 상품은 반송처리가 됩니다.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>휴대폰 금액 정산은 언제 진행 되나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;견적 수락일 + 1일 이내 (영업일 기준)\n\n견적 제안금액에 대해 수락하실 경우 등록해놓으신 정산계좌로 1일이내 입금처리가 됩니다. \n정산계좌 변경을 원하실 경우 견적수락 전에 내상점 > 판매/거래내역>신청 상세페이지 > 정산 > 변경하기 통해 가능합니다. &quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Nanum Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:23}"><span
                                                style="color: #ff0000;"><strong>견적 수락일 + 1일 이내 (영업일
                                                    기준)</strong></span><br><br>견적 제안금액에 대해 수락하실
                                            경우 등록해놓으신 정산계좌로 1일이내 입금처리가 됩니다.<br>정산계좌 변경을 원하실 경우 견적수락 전에 내상점 &gt;
                                            판매/거래내역&gt;신청 상세페이지 &gt; 정산 &gt;
                                            변경하기 통해 가능합니다.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>휴대폰 판매 신청 취소 하고 싶어요!</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;내상점 > 판매/거래내역 > 신청상세 페이지 > 취소신청 가능 \n\n상품 발송 후 매입신청 취소를 하신 경우 상품 도착 시 번개장터에서 무료로 다시 반송처리 해드립니다. \n반송주소 변경을 원하실 경우 상품 도착 전 내상점>판매/거래내역>신청 상세페이지 > 반송주소 변경을 통해 가능합니다. &quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Nanum Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:35}"><span
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;내상점 > 판매/거래내역 > 신청상세 페이지 > 취소신청 가능 \n\n상품 발송 후 매입신청 취소를 하신 경우 상품 도착 시 번개장터에서 무료로 다시 반송처리 해드립니다. \n반송주소 변경을 원하실 경우 상품 도착 전 내상점>판매/거래내역>신청 상세페이지 > 반송주소 변경을 통해 가능합니다. &quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Nanum Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:35}"><strong>내상점
                                                    &gt;
                                                    판매/거래내역 &gt; 신청상세 페이지 &gt; 취소신청 가능</strong></span><br><br>상품 발송 후 판매
                                            신청 취소를 하신 경우 상품 도착 시
                                            번개장터에서 무료로 다시 반송처리 해드립니다.<br>반송주소 변경을 원하실 경우 상품 도착 전 내상점&gt;판매/거래내역&gt;신청
                                            상세페이지 &gt; 반송주소 변경을 통해
                                            가능합니다.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>판매 불가한 상품이 있나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;매입 신청리스트에 있는 기기만 판매 가능 \n\n매입신청 리스트에서 조회되지 않는 구형 기기는 판매가 불가합니다. \n또한, 전원이 작동하지 않는 상품, 요금 미납, 분실신고 상품은 판매가 불가합니다. &quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Nanum Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:23}"><span
                                                style="color: #ff0000;"
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;매입 신청리스트에 있는 기기만 판매 가능 \n\n매입신청 리스트에서 조회되지 않는 구형 기기는 판매가 불가합니다. \n또한, 전원이 작동하지 않는 상품, 요금 미납, 분실신고 상품은 판매가 불가합니다. &quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Nanum Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:23}"><strong>시세조회
                                                    리스트에 있는
                                                    기기만 판매 가능</strong></span><br><br>시세조회 리스트에서 조회되지 않는 구형 기기는 판매가
                                            불가합니다.<br>또한, 전원이 작동하지 않는 상품,
                                            요금 미납, 분실신고 상품은 판매가 불가합니다.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>휴대폰 악세사리도 함께 판매가 가능한가요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;휴대폰만 매입 가능 \n\n휴대폰 악세사리(이어폰, 충전기등)는 매입품목에 포함되지 않으며\n휴대폰과 함께 발송하실 경우 폐기 될 수 있으므로 포장 전 꼭 확인 부타 드립니다. &quot;}"
                                            data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Nanum Gothic&quot;,&quot;16&quot;:9}"
                                            data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:11}"><span
                                                data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;휴대폰만 매입 가능 \n\n휴대폰 악세사리(이어폰, 충전기등)는 매입품목에 포함되지 않으며\n휴대폰과 함께 발송하실 경우 폐기 될 수 있으므로 포장 전 꼭 확인 부타 드립니다. &quot;}"
                                                data-sheets-userformat="{&quot;2&quot;:13053,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,14277081]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:1,&quot;12&quot;:0,&quot;15&quot;:&quot;Nanum Gothic&quot;,&quot;16&quot;:9}"
                                                data-sheets-textstyleruns="[null,0,{&quot;5&quot;:1}]{&quot;1&quot;:11}"><strong>휴대폰만
                                                    판매
                                                    가능</strong></span><br><br>휴대폰 악세사리(이어폰, 충전기등)는 판매 품목에 포함되지
                                            않으며<br>휴대폰과 함께 발송하실 경우 폐기 될 수
                                            있으므로 포장 전 꼭 확인 부탁 드립니다.</span></p>
                                    </p>
                                </div>
                            </li>
                        </ul>
                        <ul class="qaBox">
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>포장 택배 서비스란 무엇인가요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;">픽업 가능 지역: 서울(서초/강남/송파)&nbsp;</span></p>
                                    <p>&nbsp;</p>
                                    <p>포장 택배란, 상품만 준비해 두시면 기사님이 정해진 시간에 픽업 후 포장부터 배송까지 대신하는 번개장터의 택배 서비스 입니다.</p>
                                    <p>&nbsp;</p>
                                    <p>포장(픽업) 서비스는 현재 서초/강남/송파 지역에서 시범 운영중이며 추후 확대될 예정입니다.(단 ,택배를 받으시는 분의 지역은 전국 가능합니다.)
                                    </p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>픽업 예약 가능한 시간은 어떻게 되나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 12px; white-space: pre-wrap; color: #ff0000;">당일
                                            예약 불가 및 신청일 기준 이틀 후 까지 예약 가능</span></p>
                                    <p><br
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 12px; white-space: pre-wrap;"><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 12px; white-space: pre-wrap;">당일
                                            예약은 불가하며, 신청일
                                            기준으로 이틀 후 까지 예약 가능합니다.</span><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 12px; white-space: pre-wrap;">(주말
                                            및 공휴일 제외)
                                        </span></p>
                                    <p>&nbsp;</p>
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 12px; white-space: pre-wrap;">예약
                                            가능한 시간:오전9시 -
                                            오후5시이며 선착순으로 예약이 진행되기에 조기 마감될 수 있습니다.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>아주 큰 상품도 보낼 수 있나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p>&nbsp;</p>
                                    <p><span style="color: #ff0000;">상품 크기 160cm 이하, 무게 25kg 이하만 접수 가능</span></p>
                                    <p>&nbsp;</p>
                                    <p>포장택배는 무게 25kg 이하, 크기 160cm 이하(가로+세로+높이 합 전체)의 상품만 이용 가능합니다.</p>
                                    <p>&nbsp;</p>
                                    <p>이용 가능한 무게 및 크기 초과 시 상품 수거가 불가능하니 신청 전, 꼭 상품의 무게와 크기를 확인해주세요!<br><br></p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>픽업 예약 시간은 어떻게 변경하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><strong><span style="color: #ff0000;">예약 시간 변경 불가 </span></strong></p>
                                    <p>&nbsp;</p>
                                    <p>픽업 예약 시간은 변경이 어려우며, 예약 취소 후 다시 예약 접수만 가능합니다.</p>
                                    <p>&nbsp;</p>
                                    <p>예약취소는 포장 택배 전용 고객센터를 통해 방문 일정 2시간 전까지 가능합니다.</p>
                                    <p>&nbsp;</p>
                                    <p>- 포장택배 전용 고객센터:&nbsp; : 1661-0175</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>상품은 어떻게 전달 하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap; color: #ff0000;">기사님에게
                                            직접 전달(대면 전달) 및&nbsp;특정 장소 보관 후 수거 (비대면 전달) 가능</span></p>
                                    <p>&nbsp;</p>
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap;">상품
                                            전달은 기사님에게 직접
                                            전달(대면 전달) 또는 특정 장소 보관후 수거(비대면 전달)로 진행 가능합니다.</span></p>
                                    <p>&nbsp;</p>
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap;">다만
                                            비대면 전달 시, 수거 전
                                            발생한 상품 파손 및 오염, 분실 등 문제가 발생하는 경우 번</span><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap;">개장터에서
                                            보상이 어려우니 안전한
                                            장소에 상품을 보관해 주세요.</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>이용 불가 상품이 궁금해요.</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap; color: #ff0000;">이용불가
                                            상품 접수 시 수거가 불가능한 경우 배송비 환불 불가</span></p>
                                    <p>&nbsp;</p>
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap;">이용
                                            불가 상품은 아래와
                                            같습니다. </span></p>
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap;">이용불가
                                            상품을 신청하여 수거가
                                            불가능한 경우 배송비 환불이 어려우니 신청 전 꼼꼼하게 확인해주세요.</span></p>
                                    <p>&nbsp;</p>
                                    <p><strong><span
                                                style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap;">[이용불가
                                                상품]</span></strong></p>
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap;">
                                            - 현금, 수표, 주권,
                                            채권, 인지 등의 유가증권 </span></p>
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap;">
                                            - 금, 은, 귀금속 및
                                            다이아몬드 등 보석류 및 골동품</span></p>
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap;">
                                            - 개, 고양이 등의 동물 및
                                            식물 </span></p>
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap;">
                                            - 화약류, 인마살상용
                                            총포류, 인화물질</span></p>
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap;">
                                            - 밀수품, 밀반출군수품,
                                            부정임산물, 기타범칙물품</span></p>
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap;">
                                            - 재생불능 또는 재발행 할
                                            수 없는 물픔 </span></p>
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap;">
                                            - 서신류 등 우편법 상 제한
                                            물품 - 의약품 등 약사법 상 제한 물품 </span></p>
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap;">
                                            - 기타 법령에 의하여 취급
                                            금지 및 제한된 물품 </span></p>
                                    <p><span
                                            style="font-family: 'docs-Nanum Gothic'; font-size: 13px; white-space: pre-wrap;">
                                            - 중고 노트북, 컴퓨터(단,
                                            미개봉 새상품 노트북은 수거 가능)</span></p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>배송비는 어떻게 지불하나요?</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><span style="color: #ff0000;">배송비 선결제 후 픽업 가능</span></p>
                                    <p>&nbsp;</p>
                                    <p>포장 택배는 판매자의 선결제로만 이용 가능한 서비스 입니다.</p>
                                    <p>포장택배 신청 화면에서 배송비 결제가 가능합니다. 착볼로는 서비스 이용이 불가하니, 픽업 신청 전&nbsp; 배송비에 대해 구매자와 상의해주세요.
                                    </p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                            <li class="qaBox1">
                                <article class="qaBox2"><button class="qBox">
                                        <div class="qesTitle">
                                            <h1>상품 크기별 배송비가 궁금해요.</h1>
                                        </div><span class="qSpan"></span>
                                    </button>
                                </article>
                                <div class="aboxview">
                                    <p class="aBox">
                                    <p><strong><span style="color: #ff0000;">상품 크기별 배송비 상이</span></strong></p>
                                    <p>&nbsp;</p>
                                    <p>상품 크기별 배송비가 상이하니 신청 전&nbsp; 상품 크기를 꼭 확인해주세요.</p>
                                    <p>&nbsp;</p>
                                    <p><strong> - 중형 (크기 120cm 이하, 무게 10kg이하) : 5,000원</strong></p>
                                    <p><strong>- 대형 (크기 160cm 이하, 무게 25kg이하) : 6,500원</strong></p>
                                    <p>&nbsp;</p>
                                    <p>*제주도 및 도서산간지역은 추가 배송비 발생 (배송비 결제화면에서 확인 가능)</p>
                                    <p>*상품 크기를 잘못 선택하는 경우 배송비 추가 결제 요청 또는 수거가 어려울 수 있습니다.</p>
                                    <p>&nbsp;</p>
                                    </p>
                                </div>
                            </li>
                        </ul>
                    </div>
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
                <p>“번개장터_컨시어지” 상점의 판매상품을 제외한 모든 상품들에 대하여, 번개장터㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래 당사자가 아니며, 입점판매자가 등록한 상품정보 및
                    거래에
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