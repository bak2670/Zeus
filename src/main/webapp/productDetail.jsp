<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.koreait.product.productDTO"%>
<%
	request.setCharacterEncoding("UTF-8");

	
	if(request.getParameter("p_idx") == null || request.getParameter("p_idx").equals("")){
%>
	<script>
		alert('잘못된 접근입니다.');
		location.href="./main.jsp";
	</script>
<%			
	}else{
%>
<jsp:useBean id="pDAO" class="com.koreait.product.productDAO"/>
<jsp:useBean id="memberDAO" class="com.koreait.member.memberDAO"/>
<jsp:useBean id="member" class="com.koreait.member.memberDTO"/>
<jsp:useBean id="inquireDAO" class="com.koreait.inquire.inquireDAO"/>
<jsp:useBean id="rpDAO" class="com.koreait.recentProduct.recentProductDAO"/>
<jsp:useBean id="categoryDAO" class="com.koreait.category.categoryDAO"/>
<jsp:useBean id="recentproductDAO" class="com.koreait.recentProduct.recentProductDAO"/>
<jsp:useBean id="recentproductDTO" class="com.koreait.recentProduct.recentProductDTO"/>

<%

	String username= null;
	String m_idx = null;
	if(session.getAttribute("username") != null){
		username= (String)session.getAttribute("username");
		m_idx = String.valueOf(session.getAttribute("idx"));
	}
	
	String p_idx = request.getParameter("p_idx");
	productDTO product = new productDTO();
	product = pDAO.info(p_idx);

	//int rcp_productidx = (Integer.parseInt(String.valueOf(request.getParameter("p_idx"))));
	//int rcp_memidx = (Integer.parseInt(String.valueOf(session.getAttribute("idx"))));
	if(username != null & m_idx != null){
		if (rpDAO.recentCheck(Integer.parseInt(p_idx)) == 1) {
			rpDAO.recentdel(Integer.parseInt(p_idx));
			rpDAO.recentProduct(Integer.parseInt(m_idx), Integer.parseInt(p_idx));
		} else {
			rpDAO.recentProduct(Integer.parseInt(m_idx), Integer.parseInt(p_idx));
		}
	}
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품상세페이지</title>
    <link rel="stylesheet" href="./css/title.css">
    <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="./js/script.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    <style>
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        div{
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        *{
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
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
					<%
					member.setIdx(Integer.parseInt(String.valueOf(session.getAttribute("idx"))));
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
		for(String rct : recentIdx){

			HashMap<String,String> rctList = recentproductDAO.recentphoto(rct);

%>

					<div class="zzim3Box1">
						<a class="zzim3Btn" href="productDetail.jsp?p_idx=<%=rct%>">
						<%
						out.print("<img src='./uploads/" + rctList.get("p_picture") + "' alt='상품이미지'>"); // 상대경로. 얘만됨
						%>	
							<div class="zzim3Box2"></div>
							<!-- 
							<div class="zzim3Box3">
								<button class="zzim3Box3Btn">
									<img
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
										width="10" height="12" alt="삭제 버튼 이미지">
								</button>
								<div class="zzim3Box3Txt"><%=rctList.get("p_content")%></div>
								<div class="zzim3Box3P"><%=rctList.get("p_price")%></div>
							</div>
							 -->
					</div>
					</a>
					<%
						}
					%>
				</div>
				<!-- 
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
				 -->
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
	<!-- 헤더 시작 -->
<!--     <div class="mainHeader">
        <div class="topHeader">
            <div class="headerBox">
                <div class="headerMenu"><a class="appDown" href="/splash"><img
                            src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxOSIgdmlld0JveD0iMCAwIDE2IDE5Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggc3Ryb2tlPSIjMjEyMTIxIiBkPSJNLTE2LjUtMTQuNWg0OXY0OWgtNDl6Ii8+CiAgICAgICAgPHBhdGggZmlsbD0iI0Y3MDAwMCIgZD0iTTExLjM3IDguOTI3TDYuNTIgMTQuMzhhLjI2OC4yNjggMCAwIDEtLjMzNC4wNTRjLS4xMS0uMDY0LS4xNjEtLjE3Mi0uMTIyLS4yOTVsMS4wOTktMy40MzVoLTEuOTJjLS4wODQgMC0uMTY0LS4wNjUtLjIxNS0uMTMzYS4zMDMuMzAzIDAgMCAxLS4wNDUtLjI1bDEuNDgyLTUuNDYzYS4yOC4yOCAwIDAgMSAuMjYtLjIxaDMuNTAxYy4wOSAwIC4xNzUuMDUuMjI1LjEyNi4wNS4wNzYuMDU5LjIwMi4wMjMuMjg2TDkuMDE5IDguNTI2aDIuMTVjLjEwNiAwIC4yMDMuMDM2LjI0Ni4xMzUuMDQzLjA5OC4wMjUuMTg2LS4wNDYuMjY2bTQuMDY3LTQuNzZMOC41MTIuMTNjLS4yOTUtLjE3Mi0uNzg0LS4xNzItMS4wNzkgMEwuNTMgNC4xNjdjLS4yOTUuMTcyLS41My41OTUtLjUzLjk0djguMDc2YzAgLjM0NS4yMzEuNzY4LjUyNi45NGw2LjkwNSA0LjAzOGMuMjk1LjE3Mi43NzUuMTcyIDEuMDcgMGw2LjkzNi00LjAzOGMuMjk1LS4xNzIuNTYzLS41OTUuNTYzLS45NFY1LjEwN2MwLS4zNDUtLjI3LS43NjgtLjU2NC0uOTQiLz4KICAgIDwvZz4KPC9zdmc+Cg=="
                            width="16" height="19" alt="앱다운로드버튼 이미지">앱다운로드</a><button class="bookmark"><img
                            src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNSIgdmlld0JveD0iMCAwIDE2IDE1Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggc3Ryb2tlPSIjQ0NDIiBkPSJNLTE2LjUtMTYuNWg0OXY0OWgtNDl6Ii8+CiAgICAgICAgPHBhdGggZmlsbD0iI0U5QjQ1NyIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNOCAwbDIuNSA0LjkzNCA1LjUuNzktNCAzLjg0OC45IDUuNDI4TDggMTIuNDM0IDMuMSAxNSA0IDkuNTcyIDAgNS43MjRsNS41LS43OXoiLz4KICAgIDwvZz4KPC9zdmc+Cg=="
                            width="16" height="15" alt="즐겨찾기버튼 이미지">즐겨찾기</button></div>
                <div class="headerMenu"><button class="loginOut">로그아웃</button>
                    <div class="noticeBox1">
                        <div class="noticeBox2"><a class="noticeBtn">알림</a>
                            <div class="noticeBox3">
                                <div class="noticeView"><img
                                        src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAuCAYAAABap1twAAAAAXNSR0IArs4c6QAABSBJREFUWAnVmVtoXEUYx/eSaLZsYyVKRI2y0lhDJCHZGFBbvDwU9KExFArF10q9UaEX34S0AcE++CIRvBQVpIUqiIg+WEEwfZFmNxeKGKK1GDWNoHU11LoJWX//dM422Zw9M2fPijow+c7MfN9//vN9c93EY3VIuVzucWCGSqXSZuR0PB4/lM1mP6oDdCweFWR8fPy+5eXlUcglPCwIFhsaGrLd3d1nvbpaZRm0VgDI7TPkhvv6+uAWH6F8zdLS0oFaMVfbRSYImX4BNjY2vmWAR4y838hIIjJBer9VDLq6umYlIfyNJOn2KyLa33oQbBQFQrskSZgXJRVmyagp0iKZmJjoZ659aUhcgOT1EJunfJup64Dw11FI1kRwcnJyC8RehczDDp2fSCQSB3t7e39y0F2nEppgPp/fCbHjJoSX8drHoJ6i/EMymbzIqm6lLkN5gPptSPVRgOQOSH6xjoGlIhRBNuRddHgczCQk3m5qajrQ2dn5a7U+5OnFxcVjtGtFXyYPEPJPq+n71TsTnJqauoPOJiGYhtyTnBSv+QFW1qGfwOuaDntp+wVPdoUJt/MqLhaLxwy5F13JiSyDWYbQ03x+SG4B403VuyYngjrOAHyQfK65ufmIK7inJ5J8P0X+A4KP4NE+r80mnQgy8Z8TEB0dbW9v/8sG6tfO3JvD/hW1QfKgn45fnZUgYEmNGvAix9lJP5AQdSvHIXiPkhtc7KwECW8PQBvJeY6ziy6g1XSYuzoGtXFvdA2zlSAjzZoO89U6DlNPJM5IH1wN3JqsBAG80aD8aEVzU/jWqHm4gVZWgoy0xSAUApEcG8HzpskNLiYuBNMCwpM6CeqRLhmQDS5gVoKArFyn2GpWrlMuoBadleuYh2vRjVkJ4rkmA+KN3IYZ2M5R5+2jdfPgdabHes3B34THwDcFjsQ0Wj3IpL7JAF5wAbTpgPez0bnZpqt2K0F0MlLkDD4vGTWlUqnzwoCo7oxJG14gQV2xAFCIv+MM/t0G5tKu+yPh1Z6a4pS622YTSJD73w4BAPiJDShMO577TPrsDDttdoEEAdotAAhGvSSs4QHe+wZ3N30EcqjayGH+ACD9gH3V09MzuqaHiAWeCrr2z0FuM2HeFQTnSxDDOHlYhhAcJpeCQMK2MQ+LYB6VHWE+PDMzc201DF+CjOpZCG7DKI/36hpejwj4r/P9PfnOQqEw5NVXynUEebl1MKqXGOEyu/5eyUqjepS5YV/imbrHYB3CKff44a4hODs7m2Jk76IoOcJjZ8zPqF51ROcUWHpEJXHKO4S6uRK7TBBCyfn5+RMo9OK1My0tLc9XKv8T5dbW1n30l6P/DkL9HnLNU6BMkFU7AoEB8hyuH8xkMvW6XgWOq62t7U9+7HwMJR2l2w2Pss3Kw31sbOwINS+Ua//lDzx6mPfLkGgkWBT6+C+RI8qlZ/DklUNCLF0TntaLbAs5yyoM9YjCthe7HHka27uQTqk8B520Y7HTRm/QUX+1mmfjYaxuq/odlqC3ae9n32qvilrRYHT3m2oPo0LLvxiKIKHRGSoPbNC+xVyx3uekI13ZyNZg8OmWQhE0kE8gC3R8LxN5NMiTapOOdGXDTyd73Ghd1XL+ffCqSSzGhH+I8gdkXWb1mHpZ5XQ6PYOMLSwsKPyacwqrPKf3zCDe+xwZKtVEUD1AUivxDfJWlQPSaXmO/zpNB+hUbaqZoIcI0e186063lQ32FtUTUl3pNVdPhp1zsv9fpb8BJA31DAFoy+sAAAAASUVORK5CYII="
                                        width="20" height="23" alt="빈 알림 이미지">최근 알림이 없습니다.</div>
                            </div>
                        </div>
                    </div>
                    <div class="storeBox1">
                        <div class="storeBox2"><a class="storeBtn" href="./myshop1.jsp">내 상점</a>
                            <div class="storeView"><a class="storeclick" href="./myshop1.jsp">내
                                    상품</a><a class="storeclick" href="./myshop3.jsp">찜한상품</a><a
                                    class="storeclick" href="./AccountSet.jsp">계정설정</a><a class="storeclick"
                                    href="./notice.jsp">고객센터</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="zeusTop">
            <div class="zeusBox1">
                <div class="zeusBox2"><a class="zeusLogo" href="./main.jsp"><img
                            src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTI4IiBoZWlnaHQ9IjM1IiB2aWV3Qm94PSIwIDAgMTI4IDM1Ij4KICAgIDxkZWZzPgogICAgICAgIDxwYXRoIGlkPSJhIiBkPSJNMCAzNC4wMzZoMTQyVi4wOTJIMHoiLz4KICAgIDwvZGVmcz4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggc3Ryb2tlPSIjQ0NDIiBkPSJNLTEwLjUtNy41aDE0OXY0OWgtMTQ5eiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03KSI+CiAgICAgICAgICAgIDxwYXRoIGZpbGw9IiNGNzAwMDAiIGQ9Ik0yOS4wMjUgMTYuNzAxTDE5Ljk0IDI2Ljc5N2EuNTA1LjUwNSAwIDAgMS0uNjI3LjEuNDgzLjQ4MyAwIDAgMS0uMjMtLjU3NWwyLjA2MS02LjM5MWgtMy41OThhLjUyNi41MjYgMCAwIDEtLjQwMi0uMjE1LjUyNy41MjcgMCAwIDEtLjA4NS0uNDVsMi43NzYtMTAuMDYzYy4wNjItLjIxOC4yNi0uMzM4LjQ4OC0uMzM4aDYuNTYxYy4xNyAwIC4zMjkuMDQ5LjQyMi4xOS4wOTQuMTQyLjEwOS4zOC4wNDIuNTM1bC0yLjcyNiA2LjQyMmg0LjAzYy4xOTggMCAuMzguMDQuNDYuMjIzLjA4MS4xOC4wNDcuMzE3LS4wODYuNDY2bTcuMzI2LTguODEyTDIzLjUyNC40MTRjLS41NTItLjMyLTEuMzk2LS4zMi0xLjk0OCAwTDguNTA0IDcuODg5Yy0uNTUzLjMyLTEuMTI4IDEuMTAxLTEuMTI4IDEuNzRWMjQuNThjMCAuNjM4LjYwNSAxLjQyMSAxLjE1NyAxLjc0bDEzLjAyNiA3LjQ3NWMuNTUzLjMyIDEuNDk2LjMyIDIuMDQ4IDBsMTIuNzI1LTcuNDc1Yy41NTItLjMxOS43OC0xLjEwMi43OC0xLjc0VjkuNjI4YzAtLjYzOC0uMjA4LTEuNDItLjc2LTEuNzM5TTEwMy40NTMgMjYuOTQ5Yy0xLjc3NyAwLTMuMjIyLTEuMjAzLTMuMjIyLTIuNjggMC0xLjQ2MyAxLjQ0NS0yLjY1NSAzLjIyMi0yLjY1NSAxLjgzOCAwIDMuMjc2IDEuMTY4IDMuMjc2IDIuNjU1IDAgMS41MDMtMS40MzggMi42OC0zLjI3NiAyLjY4bTAtOC4xMzVjLTMuNjEgMC02LjY2MiAyLjQ5OC02LjY2MiA1LjQ1NSAwIDMuMDIyIDIuOTkgNS40OCA2LjY2MiA1LjQ4IDMuNzE4IDAgNi43NDItMi40NTggNi43NDItNS40OCAwLTMuMDA4LTMuMDI0LTUuNDU1LTYuNzQyLTUuNDU1Ii8+CiAgICAgICAgICAgIDxtYXNrIGlkPSJiIiBmaWxsPSIjZmZmIj4KICAgICAgICAgICAgICAgIDx1c2UgeGxpbms6aHJlZj0iI2EiLz4KICAgICAgICAgICAgPC9tYXNrPgogICAgICAgICAgICA8cGF0aCBmaWxsPSIjRjcwMDAwIiBkPSJNNDkuNTYxIDE2LjAxMmg1LjA3MnYtMy4yMjhINDkuNTZ2My4yMjh6bTguMy0yLjA3NWg0LjE1djguMjk5aDMuMjI2VjQuOTQ2SDYyLjAxdjYuMjI0aC00LjE1VjYuMWgtMy4yMjd2My45Mkg0OS41NnYtMy45MmgtMy4yMjd2MTIuNjc4SDU3Ljg2di00Ljg0ek02OC4wMDQgOS43ODhoNi40NTR2Mi4wMDJjMCAuOTQtLjExNCAxLjc2Ni0uMjYzIDIuNDU2LS4xNS42ODctLjQ4NCAxLjM1OC0uOTU4IDEuOTk0LS40NzUuNjM4LTEuMTg5IDEuMzE1LTIuMTA0IDIuMDEzLS45MTcuNy0yLjE2MyAxLjU0OS0zLjY5NiAyLjUyNGwtLjAyOS4wMTcgMS45NDggMi40ODQuMDIyLS4wMTZjMS43NjctMS4xNjQgMy4yMTEtMi4xODUgNC4yOTItMy4wMzQgMS4wODYtLjg1MSAxLjkzNy0xLjY4NiAyLjUzLTIuNDguNTkzLS43OTUuOTg2LTEuNjI3IDEuMTktMi40NzQuMjAzLS44NDUuMjk1LTEuODQ3LjI5NS0yLjk3NlY2Ljc5aC05LjY4MXYyLjk5OHpNOTguMzcyIDE0LjI4OGMuMDcuMTQzLjI2LjM0NC41NzguNjE0LjMzNy4yODYuNzk0LjYzMiAxLjM1NiAxLjAyOGE3OS4zOTIgNzkuMzkyIDAgMCAwIDMuMjcyIDIuMjA3bC4wMi4wMTUgMS44MTctMi4zNTgtLjAyNy0uMDE2YTU3Ljg5IDU3Ljg5IDAgMCAxLTMuNzctMi41NDQgNS44MTYgNS44MTYgMCAwIDEtLjg2LS43NDggNC4wMjMgNC4wMjMgMCAwIDEtLjUzLS43MWMtLjEzLS4yMy0uMjYtLjQ4LS4zMDMtLjc0My0uMDQ1LS4yNjUtLjExLS41NTYtLjExLS44NjRWOC44NjVoNC42MTFWNi4wOTlIOTEuNzQ4djIuNzY2aDQuODR2MS4zMDRjMCAuNjMxLS4xNzUgMS4xOTgtLjQyOCAxLjY4NS0uMjU1LjQ5LS42MzcuOTM2LTEuMDkzIDEuMzNhNDUuMjAyIDQ1LjIwMiAwIDAgMS00LjM5OCAzLjI2OWwtLjAzLjAxNyAyLjAwMSAyLjQzNS4wMjEtLjAxNWMuNjctLjQ0NyAxLjMwOS0uODk3IDEuOTAyLTEuMzM4LjU5NS0uNDQzIDEuMTgtLjg5MyAxLjczOS0xLjMzN2ExNi45OSAxNi45OSAwIDAgMCAxLjQ2NS0xLjIxYy4zMzYtLjMyLjUzNS0uNTU2LjYwNS0uNzE3TTEyOC40OTEgMTkuNjEyYy0xLjI1LjE2OC0yLjYxNy4zNDItNC4wNjIuNC0xLjQ0LjA2LTIuODE3LjE1LTQuMDkuMTVoLTEuODUxdi0zLjkyaDcuMzc3di0yLjc2NmgtNy4zNzdWOS41NTdoOC4yOThWNi43OWgtMTEuNzU1djE2LjEzN2g0LjUxYy44MzkgMCAxLjY3MS0uMDYgMi40Ny0uMDY4LjgzNy0uMDA4IDEuNjY0LS4wNTYgMi40Ni0uMDlhNjMuMzUgNjMuMzUgMCAwIDAgMi4zMjYtLjE1NGMuNzQtLjA2IDEuNDI5LS4xNDggMi4wNDgtLjI1bC4wMjktLjAwNi0uMzU0LTIuNzUtLjAyOS4wMDN6TTUzLjcxIDIwLjYyMmgtMy42ODhWMjkuMTUyaDE1LjQ0NXYtMi43NjdINTMuNzExek04NS4yOTMgNS4wODZ2Ny4yMzdoLTIuMDc0VjQuOTQ3SDc5Ljc2djIzLjEzOGwzLjQ1OS0uODJWMTUuMzE5aDIuMDc0djEyLjc2NmwzLjQ1Ny0uODJWNC45NDdoLTMuNDU3eiIgbWFzaz0idXJsKCNiKSIvPgogICAgICAgICAgICA8cGF0aCBmaWxsPSIjRjcwMDAwIiBkPSJNMTMwLjkzNiA0Ljk0N3Y4LjUyOWgtNC4xNVYxNi40NzRoNC4xNXYxMS42MTJsMy42ODktLjg3OVY0Ljk0N3pNMTEwLjQyIDQuOTQ3aC0zLjY4OXYxMy44MzFoMy42ODh2LTUuMzAxaDMuMjI3di0yLjc2OGgtMy4yMjd6IiBtYXNrPSJ1cmwoI2IpIi8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
                            width="136" height="40" alt="번개장터 로고"></a>
                    <div class="zeusSerach1">
                        <form name="searchForm" id="searchForm" method="post" action="search.jsp">
							<div class="zeusSerach2">
								input text에 입력한 value값을 form 태그로 넘겨야함
								
									<input type="text" placeholder="상품명, 지역명, @상점명 입력"
										class="zeusTxt" value="" name="searchText">
										<a class="zeusSearchBtn"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAeZJREFUOBGVVD1PAkEQ3VlOjY0xIdGOI0BMxMSGytJE+RsWWomx8mfYWNBpZWltg1b2NCZaGBppFAzR1njsOO9gzHEfIJdws/vmvcft7OySiT2DQqUakDtipjoZ4xsyzGy6RNzy2F7mu53nmGRiKprRw7XaQm/wdU6OG2xMTvFoFPKQLTXX86tn1G7/RHM6thjArP/xeWscn8rUWqJLee/klhdW8MM4xCQHDrjQqEkivhfLF++FEvf80luvsLGXIIwB5MABF5o0HoU1M+5RkvK1Xn29+3KfRlQMpmyCOyzfM3Y7XlMbboDUjIiuZpnBFBwsH3WGVv9Io8VuYuLEUMFZUbmqjfJt2BqC5JZyT9HEtLFyVRvlhrscBeYaS4/G+VaQV4DD7+FWPJk1Vy4aPs6R+nILoBTzMJ7MmitXtVGexXFCC8j5OpzWgyoCxzEfQQOt4hot+gjHSZZOhoLraabIEQU3EEMT70HgHl44m3KcNqUm+2SCVt8vX6E1dDdRMyzTcSCXBhRSImc6o9HkW7589Pz3cpAD8CBL3oXKkj1Ze+00xxZh+DNUMHF9SQKdEL2+en7lmNmFRmmm6jVXhGl4SchF0fcrjbnEWeQ008SSs8RZuC5fjIbWW6xm8ebCYdovlg8g+gXwsu0wmCVGbgAAAABJRU5ErkJggg=="
										width="16" height="16" alt="검색 버튼 아이콘"></a>
								
							</div>
						</form>
						<div class="zuesViewBox1">
                            <div class="zuesViewBox2">
                                <div class="zuesViewBox3"><a class="lastSearch srchClick">최근검색어</a><a
                                        class="popularSearch">인기검색어</a></div>
                                <div class="searchBox1">
                                    <div class="searchBox2">
                                        <div class="searchBox3">
                                            <div class="searchBox4">
                                                <div class="serachOne"><button type="button">아이폰</button><button
                                                        type="button" class="serachRemove"><img
                                                            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
                                                            width="10" height="12" alt="최근검색어 삭제 버튼 아이콘"></button></div>
                                                <div class="serachOne"><button type="button">파워뱅크</button><button
                                                        type="button" class="serachRemove"><img
                                                            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
                                                            width="10" height="12" alt="최근검색어 삭제 버튼 아이콘"></button></div>
                                                <div class="serachOne"><button type="button">캠핑카</button><button
                                                        type="button" class="serachRemove"><img
                                                            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
                                                            width="10" height="12" alt="최근검색어 삭제 버튼 아이콘"></button></div>
                                                <div class="serachOne"><button type="button">ㅁ</button><button
                                                        type="button" class="serachRemove"><img
                                                            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
                                                            width="10" height="12" alt="최근검색어 삭제 버튼 아이콘"></button></div>
                                            </div>
                                            <div class="searchNo"><img
                                                    src="data:image/png;base64,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"
                                                    width="52" height="45" alt="검색어 없음 이미지">
                                                <div>최근 검색어가 없습니다.</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="starSearch1">
                                        <div class="starSearch2">
                                            <div class="starRank"><a class="starBtn"><span
                                                        class="starNum">1</span>냉장고</a><a class="starBtn"><span
                                                        class="starNum">2</span>그래픽카드</a><a class="starBtn"><span
                                                        class="starNum">3</span>아크테릭스</a><a class="starBtn"><span
                                                        class="starNum">4</span>노트10</a><a class="starBtn"><span
                                                        class="starNum">5</span>방탄</a><a class="starBtn"><span
                                                        class="starNum">6</span>pcx</a><a class="starBtn"><span
                                                        class="starNum">7</span>자전거</a><a class="starBtn"><span
                                                        class="starNum">8</span>로드자전거</a><a class="starBtn"><span
                                                        class="starNum">9</span>스쿠터</a><a class="starBtn"><span
                                                        class="starNum">10</span>루프탑텐트</a></div>
                                            <div class="starRank"><a class="starBtn"><span
                                                        class="starNum">11</span>나이키</a><a class="starBtn"><span
                                                        class="starNum">12</span>스톤아일랜드</a><a class="starBtn"><span
                                                        class="starNum">13</span>주술회전</a><a class="starBtn"><span
                                                        class="starNum">14</span>캠핑카</a><a class="starBtn"><span
                                                        class="starNum">15</span>pxg</a><a class="starBtn"><span
                                                        class="starNum">16</span>골프백</a><a class="starBtn"><span
                                                        class="starNum">17</span>mcm</a><a class="starBtn"><span
                                                        class="starNum">18</span>아이폰</a><a class="starBtn"><span
                                                        class="starNum">19</span>tv</a><a class="starBtn"><span
                                                        class="starNum">20</span>에어팟프로</a></div>
                                        </div>
                                    </div>
                                    <div class="storeSrch1">
                                        <div class="storeSrch2">
                                            <div class="storeSrch3"></div><a class="storeSrch"><img
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
                            <div class="closeBox"><a class="closeBtn">닫기</a><a class="removeBtn"><img
                                        src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAeCAYAAAAy2w7YAAAAAXNSR0IArs4c6QAAAOBJREFUSA3tVgEOwyAInEsf0Yf4lX2jj+k39hX/0f5i41xHWiI2rNY0iyYmciJwQILupqwQwoOuRtq9oiLhmYDBe/+UF5DvKXDBLE7wBAHhTXJ1SfQDRiYUocvo8BVl4EWCyj7HiI2UOLgfamH1G2sHR1OOstWqoj+jRqZaKIZU+Fu7ajX6P0fVmgGpG2ijBc9asb3ZOLpj6RDGjhykves0g4xsT9aycB1GWoRWvDGyZoz1W+o4FdZDS501Y6yf+9dFJfmv25PZsjhUq9GaEQZUX3ImkT0eqGtGpSftZrK+AWoUS5rz8CTIAAAAAElFTkSuQmCC"
                                        width="13" height="15" alt="쓰레기통 아이콘">검색어 전체삭제</a></div>
                        </div>
                    </div>
                    <div class="rightMenu"><button class="zeusTalk"><img
                                src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAwCAYAAABuZUjcAAAAAXNSR0IArs4c6QAAA59JREFUaAXtmU1S2zAUxyWnDaawSJfAJj1BzddMl2TXpblBQg9QOAFwAth2QZ0bQJddkWVn+GiOQDfADnemfIROrP6fx8o4Tkw86AnSTjWTSHqSpZ/+fnpyHCmS5HletVQqbaLq41PR9jHKm91ud7vdbp8Rk6SvhYWFupRyB8VxBCZEnUKl1Mbp6WlTJkp/R8u4Q/fgofx8aW5ujpR+p61/Qe46jlORi4uLKgNLvrQBXwoz9meppvZePQ0wAA7o1+MCrUEBX0HguNJ1yp10hcrjBp3HNACeXci41v+DF7kzt4FbpU+RvqP6PJniv4KXHg6P/cnG3dkoqCLtL4p0Mu1zu+fWAR3gdK6ZjqWvt6749Z67paQKMGELarf0xKa5NcWvAlEpi/KOVKpOkFC7YQqbvt4KOEFPqIlDTOTFk0mxy+XbGp4dnDahoxyC1g9tYUd0tvWEXDkr+HVQ9qWS5M8aWgglWq50vVuyJqkruuF043db1x+Ts4Hf7E2sA5KeNPuTFD4iip8ynuFXwGqq/qgiCziUDgBdL0DQ6sjO6uuGCAv0fbCLMThOwpUoEj+UELEfS6HeQtG0wjEAQmJzqnHPFlmMwZPY3NLy3HyOo4muxjn8vvFqrdPsMxpWjMHT89PmhMuspGxhJKPa9JrZRkyN1yuynZwUu6FsenO24c9vTKNHjzRTYAMvR+46xq7S+OTPgK5xbEIab1hicRV6VEXI+xhPoMTG1Nr97rDJOG0s4JGINiVCCZReBfQBJ2DeWMbgFA6hthdvQsPTMA9ymN0YXESi2nHs+rMV8MkPd81hA9u2sUUV26DZ8f8dcHprlF3dc9eHMQ0ojlddO8M6Phd88votfSLHKPTucB8lnwGseXJyMvLpb2lpicIn/UIySQd4Y+vEj6MmoyTX1kmEp7hbxOwcHR21ocBIpQouzIerHdqEJ1Zijn2c/prAKuYBx3Fce5bgyT3miZVElPRlkpaXl70oishns9EoxEQ1Usdk/LxrB6JKXsc8e3zbAIj2LGCFFkQLy7vWxG6suJ48CVukfBa090+Z7suRs4ETzAPwgjaV9k8O8BLHIHqMy8vLu4uLi0+zs7NV2PqUx7tDf2Zm5ifav+n+JjkruAYB3Jcc+Pf4e7Jyfn7+Vfd9bG68OfMmplMUKm9n2+EyfXci2160bg2cAI6Pj7cYD7e+NVkFp5loQ9qAtw6u4eE2FOtDqnOkJwEnULhNi05SFFng/wBaR0Y/O/3CZQAAAABJRU5ErkJggg=="
                                width="23" height="24" alt="번개톡버튼 이미지">번개톡</button>
                                <a class="myShopBtn" href="./myshop1.jsp"><img
                                src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAwCAYAAABuZUjcAAAAAXNSR0IArs4c6QAABCNJREFUaAXtWUtS20AQtWxXJSEbZ8XWuYH4rcEnwNzALg6Q5AQJy6yAE1icIOYEmDWf6AbRispSqwSqAOU91QwetUbWSAFjqpgq10z39OdNT89P9hqPVNbW1vowtY2fr36m5RAEf8cXFxdjs6Nu26urqPVWV1cHnud9Bd3VvJI6SpJk7/LyMiiRm9ldG/jGxoZ/f38/gnVGuE4Jm83m8OzsjDNRudQCrkCfwFunssesQgzwvTrgKwMvAR0jbQKkwinqmBjR7qC9iXoA0jbQWuArAfd9v9NqtX5ZAMQAxrw9QF9hwXr4jEFwPcgBxHd3dx/DMEwHW2jA6Gga7dImQO9DSDplrvbKQNM4ZSiLZkjaKAwIbTsX54gj2l0VbdN45UhRuWjmVNQj00FR2zniAM0pzhRM+06V6dXK1KGupnVt86H7ZO0MHIp9oRycn59PBM+ZVLqBUJA+RPeUdAK+vr6+BRWZ28dTM7Vb0kZH+So16AQcB40vLT3G0W2zYfMlfZN2Ao6dQEZ7YjNWk5exZfFlNdu2cisw/4ze7DeSise+1wiXhjdfKrjJif43cAV6K2d5FiOZ1enW55QqyLtYmJvmfNKQC0yIWsisztQWRC2+LAbcczwU2h3eWcjzmt4YVSz6Z5Gx0mkoGx1TGDkemnRR2ynitv0akflEo++G1xHSZa/IQY4P2VQHHdqGKWPzZfbrthNwJRxoJVUPdNSXdm8OksQrBU8ZylJf6Q6ULV0FulFWOwPHEX0kjSFiI947yH+/e/0NMj1EfyzlyGMfZdhHHepKOZsPKaNp50sWFfCu/IGqr5VVHeJy1JN3lr+jt93rxnX8YZjNf3XBOoGuL+yMcSDtCF4hWQk4nPKG+BPW0igbVmO0h7aT0JDhwDloRjqnj8GvYPCRKT+rXQk4DfEugUcDI2YrfAgfcme4vb2NKNBut7tICx9pwMXcJU8WppHrotS6lYFTUb3sczmqjVapMdBhnRd/LeAExl0BkWTOd0nXKBFmZqfOQ5m+WjUcpipXV1e/l5eXj5DzN2D4+L11tMVHxHfkNCMdOerkxGpH3LTEnQLR44ehTfC38MstPvAmSItTzFIgdyD0LU7hInZ9FCwO6lckxRGYmePMXezDXHhzLzgHsBSKPxBZgat9mgfGs4A2ohTyQLPt8xngam/mwfLcgA3saZNfyzJfdh+AK9A8yuVWJo08Fx0D/MOX3RR4CegYSMM5o+WM2wL4AD59LKu7sRTkhYlfYIM5g07dFfzToe/xK17Bhcl6x573AIru7ryYNXFMbwtA/AKbexgImbmQ3A6JBc5i0yEx8+nWF8zDWfunKTuPNrEA6KHw1be9OSdCaBHIHCYb8EUAmsGgX1Mm80UAR7pEJmi2XwRwCfoVuC0iT817TZWnjrC0/2Ij/g8RGqgJ9UrG3gAAAABJRU5ErkJggg=="
                                width="23" height="24" alt="내상점버튼 이미지">내상점</a>
                                <a class="sellBtn" href="./product.jsp"><img
                                src="data:image/png;base64,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"
                                width="23" height="26" alt="판매하기버튼 이미지">판매하기</a></div>
                </div>
                <div class="underMenu">
                    <div class="categoryMenu"><img
                            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAgCAYAAABgrToAAAAAAXNSR0IArs4c6QAAAExJREFUWAnt1sEJACAMA0DrJt1/SAVXyKfI9V8Il0+qu88afHtwthdNwOkNyUeAAAECvwuUNRNWbM2EgN4JECBAgEAoYM2EgMuaSQUv1d0EPE4sEMMAAAAASUVORK5CYII="
                            width="20" height="16" alt="메뉴 버튼 아이콘"></div><a href="https://m.bunjang.co.kr/seller"
                        target="_blank" class="sellerCenter"><b>번개장터 판매자센터</b><img
                            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAASCAYAAABvqT8MAAAAAXNSR0IArs4c6QAAAfZJREFUKBVtkstq21AQhi3pqCpWUllWkippCjY2WcWbLPoahS76Bl2XkscIhe7zAllkVbrMY8S0pGCwsWIS2U6ELFRfJPUbg4ubeGA0M2f+fy7nSKvX679KpVKEXmqaFsRx/D0MwwnxRtE5DYuieARcxndM06zWarUKvuSeieG6bh/wTzIf0BMIb3VdP/I874bu88FgkK+zlGEYAYA/s9lMxpCqVTpmFPEnk4lJHKIZuiRqOC9Qs9Fo7C8Wi10KfCKuQFpAGmG/lcvlsN1uPwpJ8Zmhc6XUXZZlAhoS63me70onChxMp1ODs6ngpMNKZBzd930XcoVd3hPvUeAEYsLZV+xImCspcHLmTknObds+JDYBvYNk072Nr9Y7rIhitWazuc1FHEI+B+hzNkazjXctBHQpgGmgSXeRQpZ+KobjOK8AfmThN9iXAIZcwhnE0TpBuhk8lryDy8yvAbjokDjmEm4hDVet9Var5SRJskPyM7rDY1rYCOI5e9x3Op2AgnPFclYURWaapvtU2OOwim4DHlNdFh1AlrdJ0UKROGZmj0pfSGxxeI3+Jr4gHvd6veXtCBgtKaoeYGVWGyv3PsKXV7/rdrvy28t/9E9k6VNACdV+4N/zG1xZlhX3+/2Y+L8/VVhC8Kgoo8WQHvgBH4IgSCS5Sf4Cbfj85T5s+hEAAAAASUVORK5CYII="
                            width="6" height="9" alt="화살표 아이콘"></a>
                </div>
            </div>
            <div class="zzimSideBox1">
                <div class="zzimSideBox2">
                    <div class="zzim1">
                        <div class="zzim1Txt">찜한상품</div>
                        <div class="zzim1Num"><a class="zzim1Btn" href="./myshop3.jsp"><img
                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAAEhyb7BAAAAAXNSR0IArs4c6QAAAhBJREFUOBGdVL9v01AQvjs7cRp1QiDBhFClqFsS7AwBIVWABJWYGCohRsTA1LFTgYkBCdQFxMDE1KlCqH9BJyBOkyxIpWLq0IEfGRroC2193Nn1i5sQQfsGv/u+++587+7ZAJmFplKbZ46WLLdb9lkBmnKwAcifXAYuAUPJSlA0a4KuWEb1CkzZP5BoUnui00Rk3z9n9vE5OrlFjPbuamicXhW6YmliJs84j1URXY9pZpZSg6cKkGdmJk13ZycJEAJxXwTuAMMXMt3eZkronhUkGKaSmiv+T2YoZsWpjTmcjkUpYQtTAuH+RLv5OvWBqQavpAM/uHrpvJL9sr8gRb/lev2UYjl8sC2VnFXwt1Uo5ovSkPECDer/+r060rXhbIww/U8RAj4hx3Hrw9EWI3wrtMMXlF//8J4I71jHoSG96UsLziiMX+e1wmUieJgVFjrNQhZbW9rx5khDDz3JFajWrgFHy3LzTtsINRC2yYEbHMFl8T0bHR1uOUS3862PIe5Wgscy+UdHEhwTyLkWdXLfZTDxGI8ZP5BLN0nO1howJ7OQMSTP5VkZ4OeTpdCPBppe6cIte73NxdpNiKJ30tDc/ySVwB4hXc23Gw3V20RpsKn6D2RKL1M8vMtne4CEc956YyXrG0mUOk3FX5Lq5lOsOyEueO0w/jFkebXHJlKn/ETcfre3IqKvXie8p9y49QcxxqrZMCDi2QAAAABJRU5ErkJggg=="
                                    width="9" height="9" alt="찜 아이콘">15</a></div>
                    </div>
                    <div class="zzimSideBox3">
                        <div class="zzim2Txt">최근본상품</div>
                        <div class="zzim2NumBox">
                            <div class="zzim2Num">3</div>
                        </div>
                        <div class="zzim3Box1"><a class="zzim3Btn" href="/products/149157703?content_position=0&amp;content_owner=7918163"><img
                                    src="https://media.bunjang.co.kr/product/149157703_1_1616050689_w140.jpg"
                                    alt="상품 이미지">
	
	                        <div class="zzim3Box2"></div>
	                        <div class="zzim3Box3"><button class="zzim3Box3Btn"><img
	                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAYCAYAAAD6S912AAAAAXNSR0IArs4c6QAAAWRJREFUOBHNlOtNhEAQgNmlBbUCSLx4PVzumrALm7EItYkj9qDxePzmx9kDOB9hyALLyz+6yQR2duZjHuwEwb9fZVneZFn2kuf57W+DxRcGLJOm6auAHo0xnyLHOI6/t4CB1XWdiDyI35sNw/AJGAqR85ZIW9gZXxgNi2iKorirqkoPPuTwtBSpA9sDs9aeoii6Gk1vC3QKBqsDslkDnYONgEvQJZgXOAVFT9NEejVD765eyu7BIP0vzgS2cxvg2uv7JBCDFvouoHv2ArtINw90k71vWZ9SdQKq5R3Rhcrdq757TgKdBpDmBRHWTmT25/cCHZg24ECq1E+A+znoqIYeWHMDyGnQKO+N6gFbWCIRNHdTr1NXoDF0NFA64BqYggeR9qBNDYcwqdVx7tdohoDYtDVlSiUw+KDxwZYmjUbq87Uytp61ZkS2FgYUW3w0UlgBY5uprSHr17c8qSkMWFv8/sb2ByEblYtthvS2AAAAAElFTkSuQmCC"
	                                    width="10" height="12" alt="삭제 버튼 이미지"></button>
	                            <div class="zzim3Box3Txt">갤럭시폴더2판매합니다</div>
	                            <div class="zzim3Box3P">80,000원</div>
	                        </div>
                        </div>
                        </a>
                        <div class="zzim4Box"><button disabled="" class="zzim4BoxBtn1"><img
                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAASCAYAAAEVsH/dAAAAAXNSR0IArs4c6QAAAWZJREFUKBVjYACChoaG7SBiIYgDBo2NjftgbGQaqOgkiM8EFZRDloSwZ86cycXQ3t6ugCnV2dnJiyIKtObG/v37WcCCIFf09PSIoKgACn5FEYBxgNawAiWvgviMMEEQDbRaiYWF5SVcrLu7Wwxo0Qa4AMgZQIEjcIFVq1axwcyCCwJVvIBzoAwmRkbGCU1NTZboEgxA1TOANqtgk9jS1tYmDJJAcSfQwtNCQkI2KILI2oHOlPn+/fthoNix+vr6WAyFQPsEf/78eQDoqJeCgoK+eXl5P1Gs6evr4/z8+fP2////83JwcDhVVFR8RLaBEehx5mvXrq0CChpwcnLalpeXP0NWAGOzXL9+PQ3I8WFmZvbFpQikGO5GoO86gfw0VlZW++rq6ksgSWQAVwgSBLqPCRiAS4FMC2DU2dTU1DyFKUZRCBOcP38+x6NHj3YA+VxAjzkDnfQZq0KYBlAM/P79eynQ9HgA91p/71jKrhEAAAAASUVORK5CYII="
                                    width="5" height="9" alt="화살표 아이콘"></button>
                            <div class="zzim4Txt">1/1</div><button disabled="" class="zzim4BoxBtn2"><img
                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAASCAYAAAEVsH/dAAAAAXNSR0IArs4c6QAAAVhJREFUKBVtUC1Pw0AYvtJ2mRkYRAVYkhrAkjASxPYDCFTjZhBYmjb9TGiTOhAoSkKCWAIa12SC4HB0CQqNwC0touW5pnespSfu3ufj3i/iOM4tYQfgmeA6YUT7tW37k3IrtfDQNJRlKXAmiqL1ypfn+QbxPO+YS0jzzcFyEMdxH+Ib5f4yAaCpu16v51Zm13XPQBxWgF4AIw7qgJYewrnTFggK3Pu+v9klJEEQrFGhXf1dVdVdNjapB13VNO2Hp/k3FdpacJUGcOQNAkBAj+fI54uiODYM46VtYJh3hCxXIDV82DdN84MZ2MuNlEiSRJrNZk8It2RZHuq6/tVpZGQYhoMsyxLgTFGU8WQyWTQyMiN9p9OpmKbpI8JtSZL2Oo1YwzUMGsofoPycfmwYsQG9KIoLZBhhA6/UwI5EAxhOsaIbQRCOMP2AicuvBOESprllWf1loR3/AksYejyOGFk5AAAAAElFTkSuQmCC"
                                    width="5" height="9" alt="화살표 아이콘"></button>
                        </div>
                    </div>

                </div>
                <div class="zzimTop"><button class="zzimTopBtn">TOP</button></div>
            </div>
        </div>
    </div> -->
    <!-- 헤더 끝 -->
    
    
    <!-- 본문시작 -->
    <div class="productDetailBox">
    	<div class="productDetailContainer">
    	
	        <!-- <div class="selectContainer">
	            <div class="selectList">
	                <div class="selectHome">
	                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAAXNSR0IArs4c6QAAAkRJREFUSA3tlb9LHEEUx2/vzhQXESxsTau1aWxsFDkQA0ljEcv78RfY2EQbwT/hflU2KjGkCASRgI1FQEVstNU2QkD0YnXn5x03x7vZXXfnXGzMwPBm3pv5fubNj10vNUCpVCpDTNuibpfL5e8DSKTSrpME6nneDvOWqLv1en3RVUPGO4ENtN1uf2RukzrUarW+4l8QMZcSG2xBb9Lp9DSgdRbxBrtH5nkXsBdncAB0tlgsnstcYmuYL2z/A/UD/gPxR5VI8FNQI27g9P9lMpnFQqHwy8TC7JPgOFAjrOBNjmGBzA9NLMiGnrELVIR5VmuYdWqOc//Bmc/QDi2BGbtCtbrK/I5tz7PtRzpu2r6MnwMVUZX5ME/tZ6PRkNvvK30ZPxeq1VXmt/jnWdBvHe9lnCRUACrzEbr7ZP5egzsZW9AU7zFfKpX29cBB29Vq9Vv3S/cXjTkWdCpaWRsqTsA3Yk1hTI4nMmn6YZYzvUf4UseB/un2R9E9YCGzJHWWRXCF4DjOE6yI5/REaQsU0WPbb/dFA1/flqoxsqB7GJsk8jnLQ9/AITXFao4JTEk7pDQRv7BjzHmLb8L26z6LX4YlC+uUrGnEsQJlm3wZ1Wq1qTg7ohm9W62dL9H+D36JXe4wnC4Xt3eMi1SyV8fFemf7ovpOYMTGgVSiROPEY4GBydenGiXIc7uKGmPiscB8Bq+ZUDaTkrCv7zkFbjVn+kk+g0lsKS9hkuqTCgQzahW4b3CSjj4wt1J+2r0/SJKg7svoST4CXawe/d9nd+gAAAAASUVORK5CYII="
	                        width="15" height="15" alt="홈 아이콘"> 홈
	                </div>
	                <div class="select">
	                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAUCAYAAAC58NwRAAAAAXNSR0IArs4c6QAAAaVJREFUKBWFUz1LA0EQde9DIjaxSBNIG2shnR9whYVgIQqnjURikhP/QDqLVPoL9KJJEUHIgYggSFCs7K2tU6ZIrAwa73zvyB6bM8GB3Ox782Z2Z3YjZmCe5832er2WruvVYrH4Rm6aaQz0+/0ruC3f99v1en1xmpi85rpuNQiCfQL41HA4fGo0GhniSaYJIRZigQySnpGUivEhFKgqLmHwhzEBe7Ecx/lQee4QlEqlMsgbNYD1En4PGMicyodNI8nPZrN5+Ds1iPUKBnKLPk3JhwkElmUNk8nkHpIeZZAeR92Au4YPtVECg7Ztf5mmuY2kF2LFdmu12jmxUMho2Ww25weDQRtVlyOSYiHOxnaQwUQi4UMcSKz6PzuwQVS6h55njwycWy6Xj8Z2gIiYDY6JwbUw+mNm6/xIS6fTF1jnJaZHZU7NzuVyP8QGPzRM4RSVeYGqvWLUO5jetyTDI0FcgbgiyZHn09iE+FPlBZp0QPAoqr3jPlYLhUJXJbnmDmsxsgPx+iSxTDgYNcYGu4ZhUNyJFYlgeA98kXhknqZpJ//9RX8BYkCa7Y9z0J0AAAAASUVORK5CYII="
	                        width="6" height="10" alt="카테고리 선택그룹 아이콘">
	                    <div class="bigSelect">
	                        <div class="bigSelectBox">
	                            <div class="bigSelectTitle">
	                                <select id="sidoSelect" onChange="changeSidoSelect();">
	                                    <option value="">대분류를 선택하세요.</option>
	                                </select>
	                            </div>
	                        </div>
	                    </div>
	                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAUCAYAAAC58NwRAAAAAXNSR0IArs4c6QAAAaVJREFUKBWFUz1LA0EQde9DIjaxSBNIG2shnR9whYVgIQqnjURikhP/QDqLVPoL9KJJEUHIgYggSFCs7K2tU6ZIrAwa73zvyB6bM8GB3Ox782Z2Z3YjZmCe5832er2WruvVYrH4Rm6aaQz0+/0ruC3f99v1en1xmpi85rpuNQiCfQL41HA4fGo0GhniSaYJIRZigQySnpGUivEhFKgqLmHwhzEBe7Ecx/lQee4QlEqlMsgbNYD1En4PGMicyodNI8nPZrN5+Ds1iPUKBnKLPk3JhwkElmUNk8nkHpIeZZAeR92Au4YPtVECg7Ztf5mmuY2kF2LFdmu12jmxUMho2Ww25weDQRtVlyOSYiHOxnaQwUQi4UMcSKz6PzuwQVS6h55njwycWy6Xj8Z2gIiYDY6JwbUw+mNm6/xIS6fTF1jnJaZHZU7NzuVyP8QGPzRM4RSVeYGqvWLUO5jetyTDI0FcgbgiyZHn09iE+FPlBZp0QPAoqr3jPlYLhUJXJbnmDmsxsgPx+iSxTDgYNcYGu4ZhUNyJFYlgeA98kXhknqZpJ//9RX8BYkCa7Y9z0J0AAAAASUVORK5CYII="
	                        width="6" height="10" alt="카테고리 선택그룹 아이콘">
	                    <div class="bigSelect">
	                        <div class="bigSelectBox">
	                            <div class="bigSelectTitle">
	                                <select id="gugunSelect" onChange="changeSecondSelect();">
	                                    <option value="">중분류 선택하세요.</option>
	                                </select>
	                            </div>
	                        </div>
	                    </div>
	                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAUCAYAAAC58NwRAAAAAXNSR0IArs4c6QAAAaVJREFUKBWFUz1LA0EQde9DIjaxSBNIG2shnR9whYVgIQqnjURikhP/QDqLVPoL9KJJEUHIgYggSFCs7K2tU6ZIrAwa73zvyB6bM8GB3Ox782Z2Z3YjZmCe5832er2WruvVYrH4Rm6aaQz0+/0ruC3f99v1en1xmpi85rpuNQiCfQL41HA4fGo0GhniSaYJIRZigQySnpGUivEhFKgqLmHwhzEBe7Ecx/lQee4QlEqlMsgbNYD1En4PGMicyodNI8nPZrN5+Ds1iPUKBnKLPk3JhwkElmUNk8nkHpIeZZAeR92Au4YPtVECg7Ztf5mmuY2kF2LFdmu12jmxUMho2Ww25weDQRtVlyOSYiHOxnaQwUQi4UMcSKz6PzuwQVS6h55njwycWy6Xj8Z2gIiYDY6JwbUw+mNm6/xIS6fTF1jnJaZHZU7NzuVyP8QGPzRM4RSVeYGqvWLUO5jetyTDI0FcgbgiyZHn09iE+FPlBZp0QPAoqr3jPlYLhUJXJbnmDmsxsgPx+iSxTDgYNcYGu4ZhUNyJFYlgeA98kXhknqZpJ//9RX8BYkCa7Y9z0J0AAAAASUVORK5CYII="
	                        width="6" height="10" alt="카테고리 선택그룹 아이콘">
	                    <div class="bigSelect">
	                        <div class="bigSelectBox">
	                            <div class="bigSelectTitle">
	                                <select id="lastSelect">
	                                    <option value="">소분류 선택하세요.</option>
	                                </select>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div> -->
    
    
	        <div class="photoContainer">
	            <div class="photoBox">
	                <div class="photoBox2">
	                    <div class="photo">
	                        <ul id="slider">
	                        	<li>
	                        		<img src="./uploads/<%=product.getPicture()%>" alt='상품이미지'>
	                        		
	                        	</li>
	                        </ul>
	                        <div class="fDCCka"></div>
	                    </div>
	                    <div class="kkpfSe"></div>
	                    <!-- <button direction="prev" class="prevButton">
	                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAsCAYAAAB/nHhDAAAAAXNSR0IArs4c6QAAARZJREFUWAntl9ENgkAMhpF32IFBYAwHYB7dBjdxCyfw6fx+c0dOSIghLQZDk6ZE49drf0qxKJzt5MUPITSwzy584C3+wIN5Apg9/hQcG8wSACvxi6jRrsTSJAGgCr9FsE7fm4AFAdbg9whX3ztL+ChmTKI7x8YA5mKqPbUJGdAh5ryTtGW/Ymoak+13Mtu5Kis/oRebilmtPOfnzzi1JtNHTKUC7vOYTXWQQKbHrJ2YCU602TgZcHbJyQeVgNluopQJ8FRk7VX7yoBOF4jNbZoqUSRJh7/fZ4jas3YrMCUSNMIJTncX4Bp3n49D/CTrdxFN/ld8u12dN5OWHZOfN2T5+leTv434y7Wv/JaWje9X+/wjnhf+Ap3Avf1JQDIIAAAAAElFTkSuQmCC"
	                            width="12" height="22" alt="이전 페이지 이동 버튼 아이콘">
	                    </button>
	                    <button direction="next" class="nextButton">
	                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAsCAYAAAB/nHhDAAAAAXNSR0IArs4c6QAAAQVJREFUWAntl9EJg0AQRMV/7SGFaDE2kSaSbkwn6SIV+HV5Q7IgeiCRXcFwC8PJobPrzK3nVVV0pJSu4BKWB3LFC3QhSSAelYGYwOCeBNIa3IHFjYs6ItEAsd5C8QBNRJIeYvmheAJ/80X6JWcIMh/iFkgmRTF/e60gUzF/Wya7A7mWna+vQOl8E2g9Is//dv4x5q9FdZiZd77/+v0UmBzqzFNQ/XxnHPN37ZhVNwPt5xZ+JsPYgJgNCuJlo/U7BMg/AnkHYn4SIJ6bKXnafBk/zkJUzFxrhiznNVPdaHHezvQ7+aDFoWb6HECoWp0ZY6ZWPOQxn1lrJxIoQo+xsQdxe5Oo8Q2tG8U3KxMfPwAAAABJRU5ErkJggg=="
	                            width="12" height="22" alt="다음 페이지 이동 버튼 아이콘">
	                    </button> -->
	                    <!-- <button class="zoomButton">
	                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAqBJREFUWAntlk9LFlEUxp0yyFRERKjADxC5CIncpIuWQUHt2pQfIFolEi3cuPMD1DcIWkRBS/FdFNIiWvUF7I9F0R/KQjKdfo+eA/O+c2fmzuvYygeeuddzn/PcM3+85016SpCm6RDLF+FleBqehAPwI3wHW/BJkiQvGZsDGw/AefgTxuAFouluKkg6kzCaIPYYjmXWPjDX3equ1+FxeApOwV7ouM/kFk9k0wO1Rja/BH9BxzKTKZgrVMbEh+Es/AodLSb9tTY2swkSffMN5jOxJmhH4BJ0PGISLDroiVjv/I1la/Pa75OcXvjQPDTMBTcLBRHPK8MwE9LExMjvg6/M5wfjaGUeoiHoX/tyZUKFAK9J6FiskO98SNdczXi+MiFCgM9T81ytlCN8YOI1xvgPp8QZnxvmqeFMibTnEIs64YQW/7/p7nTP1+yrdP+gqQrQ8SrokGkKaxhtm9mJMlMVoLNd0AnXCHiSWxhtmJn7B71VgBqLoOO1EfDeBzE6ZmbuH/RWAf7odbY3hazX+zJTFaAmI+jMH96d7vmq9i38hc92ZkUXNj0LHbNFutg4RkfhWzNcispDrH4uqKuNRCUViMi/IyPDlQJZexjxtGcwqqtle3y7uOQv8/ljXisl0vwSSfcsUYO6Wl9eVRxBr5v4AoV1OF6sDqyQcAS2oENdbTIgbQuh0TvXY/c732b+HdYrQK4k9UP9mMhCjeU6HIOHTTfI/BxcgP7BMU1/62L4xNhVEQmJc1D9vBNbBPxXU+faCoFxeDez0F0RdpejGC3C1Yxh53STgD7aq8px8Hd0EVHtF0O1VHU1NRad7TpedcI959z/xpiDiiC4YAufGS+gfZ0T7megzpPYtzoOivBHe/AkCp7ETY//19Fex21t+g8EN1dBluPf8gAAAABJRU5ErkJggg=="
	                            width="16" height="16" alt="확대 버튼 아이콘">확대
	                    </button> -->
	                    <!-- <div class="photoOrder">
	                        <button class="pothoClick ptClickOn"></button>
	                        <button class="pothoClick"></button>
	                        <button class="pothoClick"></button>
	                        <button class="pothoClick"></button>
	                    </div> -->
	                    <div class="reImgModal">
	                        <div class="reImgBox1">
	                            <button type="button" class="reImgCancle">
	                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEQAAABACAYAAACjgtGkAAAAAXNSR0IArs4c6QAAAolJREFUeAHl20tSxCAQANCJW12ql3DtKTxE9GQ6h/AU7j2EutT12J1qUowhCZ/+AFLFgIEU9pvApjPDAcrpdLqH5gHqJ9TjMAzf0HZfIO4rCHKEegP1FeJ+u6Co36H9oIGRJtJQn80fDIwdDQ6DCxcmXEIftW6hdv2kBDBwV/ygxQyCf/wHlC2MBUjvKHsYQZBeUWIwVkF6Q4nF2ATpBSUFYxekdZRUjCiQVlFyMKJBWkPJxUgCaQWlBCMZpHaUUowskFpRODCyQWpD4cIoAqkFhROjGMQahRuDBcQKRQKDDUQbRQqDFUQLRRKDHUQaRRpDBEQKRQNDDIQbRQtDFIQLRRNDHKQURRtDBSQXxQJDDSQVxQpDFSQWxRJDHWQPxRrDBGQNBa9DcYlnzLXO6cVpROnjLJWptOa0DDwNfi75i9a+htYMA/8HMxBcnFCeoIsQWBDm2SWepyvKH+51COVl5+VCX0jo2nyDdMcMxDtA8enAJwMr9kcag65+Mfk2PAx8c2c6Myh08/dT1EFCGO7MgDH/oDV5aUcVZAvDbQ5rFDWQGIwaUFRAUjCsUcRBcjAsUURBSjCsUMRAODAsUERAODG0UdhBJDA0UVhBJDG0UNhANDA0UFhANDGkUYpBLDAkUYpALDGkULJBasCQQMkCqQmDGyUZpEYMTpQkkJoxuFCiQVrA4ECJAmkJoxRlF6RFjBKUTZCWMXJRVkF6wMhBCSaqesJAFEpzHKGLOSDMBY0QI6Y8FmUBQhNdFt7lRqYf+S7ubuiCh4IxIcpjCOVsy9CER7oBb3xxSSTod1H2YpxB9iZ2oUFBbMU6gWxN6AnCj2UtZneG3MFk3FddbhMfwvUDZwoaHH4B+xHVOFecBB4AAAAASUVORK5CYII="
	                                    width="34" height="32" alt="닫기 버튼 아이콘">
	                            </button>
	                            <div class="reImgBox2">
	                                <div class="reImgTitle">제니베리 르망 쉬폰 스커트</div>
	                                <div class="reImgBox3">
	                                    <div class="reImgBox4">
	                                        <img src="https://media.bunjang.co.kr/product/135928638_1_1614690280_w1100.jpg"
	                                            alt="리뷰 이미지">
	                                        <div class="reImgTxt"></div>
	                                        <div class="reImgBox5"></div>
	                                    </div>
	                                    <div class="reImgBox4">
	                                        <img src="https://media.bunjang.co.kr/product/135928638_2_1614690280_w1100.jpg"
	                                            alt="리뷰 이미지">
	                                        <div class="reImgTxt"></div>
	                                        <div class="reImgBox5"></div>
	                                    </div>
	                                    <div class="reImgBox4">
	                                        <img src="https://media.bunjang.co.kr/product/135928638_3_1614690280_w1100.jpg"
	                                            alt="리뷰 이미지">
	                                        <div class="reImgTxt"></div>
	                                        <div class="reImgBox5"></div>
	                                    </div>
	                                    <div class="reImgBox4">
	                                        <img src="https://media.bunjang.co.kr/product/135928638_4_1614690280_w1100.jpg"
	                                            alt="리뷰 이미지">
	                                        <div class="reImgTxt"></div>
	                                        <div class="reImgBox5"></div>
	                                    </div>
	                                </div>
	                                <div class="reSuButton">
	                                    <button class="reImgClick"></button>
	                                    <button class="reImgClick"></button>
	                                    <button class="reImgClick"></button>
	                                    <button class="reImgClick"></button>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <script>
	                $('.reImgBox3').slick({
	                    centerMode: true,
	                    centerPadding: '60px',
	                    slidesToShow: 3,
	                    responsive: [{
	                        breakpoint: 768,
	                        settings: {
	                            arrows: false,
	                            centerMode: true,
	                            centerPadding: '40px',
	                            slidesToShow: 3
	                        }
	                    }, {
	                        breakpoint: 480,
	                        settings: {
	                            arrows: false,
	                            centerMode: true,
	                            centerPadding: '40px',
	                            slidesToShow: 1
	                        }
	                    }]
	                });
	            </script>
	            <div class="infoContainer">
	                <div class="infoBox1">
	                    <div class="infoBox2">
	                        <div class="infoTitleBox">
	                            <div class="infoTilte"><%=product.getName()%></div>
	                            <div class="infoPriceBox">
	                                <div class="infoPrice"><%=product.getPrice()%><span>원</span></div>
	                            </div>
	                            <div class="">
	                                <div class="iconContainer">
	                                    <div class="iconBox">
	                                        <div class="icon">
	                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAjhJREFUWAnFl1uPKUEUhbdCxF2Iu7h78f9/ixdexANeSNxCkJnz1ZwSRncrM0OvhK6ufVmrdiu1O/DxD/INq9VKFouFbDYbOR6PEggEJBKJSDqdlkKhIKFQ6FvE1+3pdJL5fC7EHw4HIXU4HJZEIiHZbFZSqdRdXOBaAEHj8VjW6/Wdo5kIBoNSLBalVCppYcxDNJvNNPn5fDaud9dkMimNRkMvxhgvAna7nQyHQ2EVNmBV3W5Xu45GI10tmziq1+v1JBaLaXctANLBYKDLbZPE+MTjcT3cbrdmyurKY+n3+/pRKiImk8nT5MRB/Cw5cfyu4ARqv9/LcrnUN+/8ghNuxcBhI7xcC5xwK7aMX4BbsfX8AtzKa9++Whjcij8WvwC3Yk/6BbiV+TPxQwTcKpPJ+MGtOeFWHBB+PAY44VYctZxu7waccOuzIJ/Pv7UKrB5OoAUopfQ5/a4q0BPAeRHAgG4nl8vpyVd+wQGXwZeM/3f1el2i0aix/fmV3HBc40YAZel0Oq4933Xgs2M6IXKb0pv4GwFM0ny22+1Lv2ccf3Pl195qtW56QZPvTgAG9mez2fwTEZCTy6kjhstRAAba6FqtxvBXIAe53OAqgADeASqVilvsw3liyeEFTwEElstl/fFK4mSzjXsogOSshBcRW+BrWzkrARBXq1UrEZDjawtrAUYEpXXDs+TkeUoAAZTWScRPyMnn/JqLxQPm+U6nU+2FIDPnEeZourycOlofTF4LeODqav4EUxqvNxGf2nsAAAAASUVORK5CYII="
	                                                width="16" height="16" alt="상품 상태 아이콘">
	                                            <div class=""><%=product.getZzim()%></div>
	                                        </div>
	                                        <%-- <div class="icon">
	                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAaCAYAAADMp76xAAAAAXNSR0IArs4c6QAABAdJREFUWAm9mFtIFFEYx9tZ11UW1tLoaoGEPShqq3ahgogyIgnqQXqIgih6qKgEH4JIqCgIIoowIrSn6i0irOxCQdAN7wb2IiSlSUZuGJGyumu/b9lZZo8zs7ObdeBwvvNd/uc/53zznWFcs9Js7e3tczVNWzs1NbUKiErGfJfLNYcxVyCRg8g/GAeZdiC3eTyeN2VlZd/Enm5zpRLY09Pjm5yc3EnMbghUMbpTiYd8BP8X9Dt+v/9uYWHhz1TixdcR4YGBgezh4eFD+J+gz5XAGWijYFzKycm5nArxpIQ5+hqAr9AXzgBJM4ggqXWyvLz8uplR1VkShmgOR3iVo9+jBv2LOWs9pu+H+JAdvilhyC4j6AldxqSNhT7g1Oh2u59mZWV9loDx8fGl4XB4C+IBHrpIdA7ad7C2V1RUvLPynUa4u7s7wIvVQsB8qyCDfgK5jgUaWChs0MdFyLo7OjoOo7hI98QN1sJvsHaB+cDMJYFwV1fXCnblJY5+M2dFN8GOVgcCgWeK3nQKdhXYDzE6IR2GdA2k76lgmq7o7OxcBGAzcydkJazOKVlxjvnWieyguTmZ25y21PiEFt3h/v7+rJGRkddYyhOsFhOe/gMvR6lVGliEzZL0YGPep5DTw16vd2VJScmAjhnd4WAweBaFI7KxwEaVLCQyIHOafB2ULrLo9IVkjMU0GnVJ5PmhUOim0UejIqwGuNaoTCZLNVB9yNFTkUikHqzF0kUWnepnFqv6GOdgbWYDDuo6jaduYOLWFU5Gvgk+qX4A73ei08ue6ms3B/ui3LbiozExLUd2AOxSQnWx850h2+f8/PyQYGksfoRxMhVguRRUf06qyYnOLFaNM87BjdAP0KMbq1Fu2phcMDolk2M3WIIbOGf5JjgD1hfpIosuwYmJWazqo8yvGG++6NH29vZmjo2NPcdxveJsOoXQ/yprXcKpsrLyt04kWtaKi4tDPp9vB0T6dIPdSN4Xxa5bO7dpNomR2GkGEwVchjIyMrYbyYpbwstDGSqkHL0CdJ4Jhqr6l1ezfNhvhGynumj8ahYDOSc7vI7+UeZJmke+DajjR3lAy7IoNvERX/CcfEd8pRBsMCMrfBJ2WCdITi8gpx8xD+g6u1FyGvtff15KSlLjt5aWllpumClhIdfX1+cdHR09D0gtu2TpZ/cgKdqasrOzj/M+/bKLS0qEb4JN5PU1QJbbAaVrY0M+UQKPkY73nWAkJSwgkoe84fsQ6+lLRDcD7Stkz3FV35Aq5RTPEWEdLFavt7HQXnTVPEimbnM4ThDbQtytvLy85oKCgnGHcXG3lAjHoxAogbNJlTWIq6VDQn6k5DLmih+y/EgJMsqPlFaOvZW3/y0v1A+xp9v+ADhPuomDsZuZAAAAAElFTkSuQmCC"
	                                                width="21" height="13" alt="상품 상태 아이콘"><%=product.getHit()%>
	                                        </div> --%>
	                                        <div class="icon">
	                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAuRJREFUWAnFV01rE1EUzUwSMWATENpFRNyIi0YI+eiui4LoogWFgkvBH6Dgpip+dONKgivdC3XlpkWELkTQRVw1H4QwWQmhLrKwq1IwxHyM54zvDck4mc6bTO3AY97MO/eeM/e9d+c+LeLzqlQq8Wg0ujIajW6ZprkIs7SmaRfQN9HvsOG5pev6h+Fw+LVYLPb9uNaOAzUajYXBYPAcPHeATR2HF+OHEPMuFou9yGazP71spgowDONMt9t9BOMNtDkvJx5jRxgrJRKJl5lM5rcbzlVArVabR6i3YbDsZhTgXRlTs57P5w+ctv8IAPkiwr2LdskJnuUZU7KPtgoRrXE/EwL45SDeC5tcEgoRS+OR0OUg55xhPyly8tA3OcgleW0BYsEpzTnm9THaknTm874suCy4JYBbDU9c7UoXvugzwllRMvoL3hCcEUsA9zneB91qAfgjc4IzojPD4UuYZP7rRU5y60yvYPab4cIUmSK3ztweplcVX+TWEYqMilGYWHJzEabDdKroK60jO52aAHLbiUhReShwTIHJNcBiYqYLX/IxoIMOIxBYANLweRIXCoWb2FJrEPJdUUiHa8BQNLLh2EY7+IM+a7fbZ3O53G4ymbwKf08B+GWDPDrAtrR6vX4dNdwnD5yfoR9w9hCReE9ws9m82Ov1XqF728sYUbuhMR0CxEoljGz4DdPyQP6gqtXqXayxt1NEHOL9vFWQAPgawHtTgEqvEQm4Mrcg5An6VxDdL24OMPYGEbtvCeCvsd/vcwGF+UdkZRyFmHMuAo7i8fhlVsxWHhClc8kFOMur1BRy+izJct1ORCydMVCehdGnbVlwWXBbAOt2zNs6wrbv05EyjL7JMX5GsAXQG6tVgFZPQgR90vd4RUzOCQFCRAtAFpphTkeZPkE+cSZwFSBEHGCerqG/icbjVdCLtpv05fxy6dDahvLB7X5qh1OnGMfxnFUUj+dWLYHtJo/nBhaZ0vH8D6NELRJSWvu9AAAAAElFTkSuQmCC"
	                                                width="16" height="16" alt="상품 상태 아이콘"><%=product.getRegdate().substring(0,10)%>
	                                        </div>
	                                    </div>
	                                    <button class="report">
	                                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAbBJREFUeNrsls9LAkEcxb+au+JSGIEQyGbBdg881CmConsE9Qd07S/p0qG69RcUdOzSoUt0UujS3c0kEQULU7R17c2wyhazNbvaesgHH9xZh3kzb35tpNfrUV/5fJ7+Stls9ks5FqCNKTDv/L6AjyAdiUrWi4AdcAXewDMwwTu4AQdAHbXxCrh3TJm55vpPAVvgHDyC7VEZM6M7sCbRlgGuwaGM8U9zvAkunbn0M/8nzvNpkBHr4MKnqVvHYDWI8RGY84wpFiNFUX5L8sxZlNJRL4E9UeVkMknpdJoSiQQvt9ttKpfLVK1WhVsXbIBb2RHvi96nUikyDGNgyhSPxymTyZCu614D2/UT9bqooqZpnrm6OyNYoNLGy6KKxWKRR/td3W6XCoWCV/sLfoyFJ5Bt29zAfbb3O9TpdLzaZzFND3NkcjUaDapUKoNyvV6nWq0ms7eHM2YqlUrUarXIsiwyTTPwbeX7dmJRs8hVVeXmoRkzNZtNzjCK0pg0MQ5NosX1BKwRetjCb6lcLje2ES+GHDk72G1m/MCu2hCNZ8HrZDv9j33MVtlMiJ58X38KMADfFnDPWur9bAAAAABJRU5ErkJggg=="
	                                            width="15" height="15" alt="신고 아이콘">신고하기
	                                    </button>
	                                </div>
	                                <div class="aaaa">
	                                    <div class="contentBox">
	                                        <div class="staticContent">상품상태</div>
	                                        <div class="contentAnswer"><%=product.getState()%></div>
	                                    </div>
	                                    <div class="contentBox">
	                                        <div class="staticContent">교환여부</div>
	                                        <div class="contentAnswer">
	                                        <%
	                                        	if(product.getExchange().equals("Y")){
	                                        		out.println("교환가능");
	                                        	}else{
	                                        		out.println("교환불가능");
	                                        	}
	                                        
	                                        %></div>
	                                    </div>
	                                    <div class="contentBox">
	                                        <div class="staticContent">배송비</div>
	                                        <div class="delivery">
	                                        <%
	                                        	if(product.getDelcharge().equals("Y")){
	                                        		out.println("배송비 포함");
	                                        	}else{
	                                        		out.println("배송비 별도");
	                                        	}
	                                        %>
	                                        </div>
	                                    </div>
	                                    <div class="contentBox">
	                                        <div class="staticContent">거래지역</div>
	                                        <div class="tradeArea">
	                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAeCAYAAAA2Lt7lAAAAAXNSR0IArs4c6QAAA0VJREFUSA2tVktoE0EYnmwejUlDCYUcJD3YGooJGA1RYgJtKh6KtJ6q+EAvvQn25EnEHjx56qGgCJ5EPCqIBxE1j/YmiFJSYkvQBiExqRRJNNGkid+/uMvsdjZJtQOT+Z/fN/+/M7sxsQ4jkUgcNJlMV9rtdhTrEEK9mD8x85ifYX/qcrmehMNhsgmHSWRNpVKHkHwXMy7y8zYQVyjW6/XO+3y+X7yP5B0EyWRyDvY7SLLrgzvpIFrBvDQ+Pr7Cx2kI0JKbcN7mA3Yjg2ALG4tOTExklTyVADu/DOdDxfGvK0g+2e32E5FI5CthSPSzvLy8H8t9kv93YJMH6vX6ooIjEzQajVtw7FOMe7DOpNPpEOFIODFDKGt2D0BVCGzW1Gq15mUCKJOYFtW7C6Gvr48NDw8zbFCUdSqTydgI+KTI281GoH6/nw0MDMgEuVxOk4JNO0ql0nEJwlGNp0dlZGREBscDZRsbG8IsbOKwhB+ryEs7xHETuZjH42G4uQx9ZmgDazabwjgY21SBWe9Vyg+FQszpdGrcDoeDjY6Oyrb19XVWqVQ0fl4BzjYd0y+8kZdtNhsLBoMqidlsZoFAgNFaLBZZoVDgw3fIIMhRi1J6D6piq6urrFwuM56Edk4VVatVtra2pk/T6MCtDg4OLlGLEhrPX0VPQu2i3lO/qe/U/y7jFar9LcXj8TcI/CgK5kmoLTSy2Syr1WqicI1NkqRHZKAWtaDc0Hg5hSfJ5/Nsc3OT8xqKH3AYnpFXvYJ4mz4G2AWjFGyEEVm3gbgtq9V6LBaLyTdPftlREh7mLJxvjQB6BG+iG2cVcMJSCaLRaA0gZ0CSNyLpwT43Njb2mo9TCciIL1ERBFOYxreHz+Zk5CziwNzjTLKoPgPegU/nJPTnmDtuOR+nyAB/iW/xaazbik1ZNRUoRlTyAsHXFL3Tirhsf3//ORE45QkJyEHlImmB5A7jG07MFP4XfTeKMSSgBJR9HSTyedYDwN6AbYY/MfoY0jsSAKTldrsvYn2nT8aJu4pWJvV2vd6RgILxNv1hsVimQaK+dSEvAPyBHkykC0+RKBAn6wiAl+BLo3VE2PVtRzhdK1DIsOP3aMs0qjnfKzjl/gFgkydRSXu9AAAAAABJRU5ErkJggg=="
	                                                width="12" height="15" alt="지역 아이콘"><%=product.getDeallocation()%>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        
	                        <!-- 찜 스크립트 -->
	                        <script>
								function zzimY(){
									$(".zzimButton1").hide()
									$(".zzimButton2").show()
								}
								function zzimN(){
									$(".zzimButton2").hide()
									$(".zzimButton1").show()
								}
								function up(){
									const xhr = new XMLHttpRequest();
									xhr.open('GET', 'zzim_up.jsp?p_idx=<%=product.getIdx()%>', true);
									xhr.send();
									
									
									xhr.onreadystatechange = function(){
										if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
											//alert('좋아요!');
											//document.getElementById('zzim').innerHTML = httpRequest.responseText;	
											let zzimCnt = xhr.responseText;
											console.log(zzimCnt);
											document.getElementById('zzim').innerHTML = zzimCnt;
											location.reload();
										}
									}
								}
		                        
								function down(){
									const xhr = new XMLHttpRequest();
									xhr.open('GET', 'zzim_down.jsp?p_idx=<%=product.getIdx()%>', true);
									xhr.send();
									
									
									xhr.onreadystatechange = function(){
										if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
											let zzimCnt = xhr.responseText;
											console.log(zzimCnt);
											//alert('좋아요!');
											document.getElementById('zzim').innerHTML = zzimCnt;	
										}
									}
									
								}

							</script> 
	                      
	                    <%
	                        // 해당 상품을 찜 했는지 안했는지 판단하기
	                        int zzimYN = memberDAO.zzimYN(product.getIdx(), m_idx);
	                    %>
	                    	<div class="zzimContainer">
	                            <div class="zzimBox">
 	                    <%
	                        if(zzimYN == 1){
	                        	// 현재 사용자가 해당 상품 찜한 상태
	                        	System.out.println("찜o");
						%>
	                                <button class="zzimButton1" style="display: none;" onclick="up()">
	                                    <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9IiNGRkYiIGZpbGwtcnVsZT0ibm9uemVybyIgZD0iTTcuMDA1IDEuMDQ1aC4yMzNjLjI4LjIyOC41MzcuNDkuNzYyLjc3Ny4yMjUtLjI4OC40ODEtLjU0OS43NjItLjc3N2guMjMzYTYuMTYgNi4xNiAwIDAgMC0uMDktLjExM0M5LjY4NC4zNDQgMTAuNjI4IDAgMTEuNiAwIDE0LjA2NCAwIDE2IDIuMTEgMTYgNC43OTZjMCAzLjI5Ni0yLjcyIDUuOTgxLTYuODQgMTAuMDYyTDggMTZsLTEuMTYtMS4xNTFDMi43MiAxMC43NzcgMCA4LjA5MiAwIDQuNzk2IDAgMi4xMSAxLjkzNiAwIDQuNCAwYy45NzIgMCAxLjkxNi4zNDQgMi42OTUuOTMyYTYuMTYgNi4xNiAwIDAgMC0uMDkuMTEzeiIvPgo8L3N2Zz4K"
	                                        width="16" height="16" alt="찜 아이콘"> 
	                                    <span>찜</span>
	                                    <span id="zzim"><%=product.getZzim()%></span>
	                                </button>	  
	                                <button class="zzimButton2" onclick="down()">
	                                    <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9IiNGNzJGMzMiIGZpbGwtcnVsZT0ibm9uemVybyIgZD0iTTcuMDA1IDEuMDQ1aC4yMzNjLjI4LjIyOC41MzcuNDkuNzYyLjc3Ny4yMjUtLjI4OC40ODEtLjU0OS43NjItLjc3N2guMjMzYTYuMTYgNi4xNiAwIDAgMC0uMDktLjExM0M5LjY4NC4zNDQgMTAuNjI4IDAgMTEuNiAwIDE0LjA2NCAwIDE2IDIuMTEgMTYgNC43OTZjMCAzLjI5Ni0yLjcyIDUuOTgxLTYuODQgMTAuMDYyTDggMTZsLTEuMTYtMS4xNTFDMi43MiAxMC43NzcgMCA4LjA5MiAwIDQuNzk2IDAgMi4xMSAxLjkzNiAwIDQuNCAwYy45NzIgMCAxLjkxNi4zNDQgMi42OTUuOTMyYTYuMTYgNi4xNiAwIDAgMC0uMDkuMTEzeiIvPgo8L3N2Zz4K"
	                                        width="16" height="16" class="yesC" alt="찜 아이콘"> <span>찜</span><span id="zzim"><%=product.getZzim()%></span>
	                                </button>
	                                <div class="zzimNo">
	                                    <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNCIgaGVpZ2h0PSIxNCIgdmlld0JveD0iMCAwIDE0IDE0Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjMzMzIiBzdHJva2Utd2lkdGg9IjEuNSIgZD0iTTIuMTA2IDdsMy42NjMgNCA3LjAxNS04IiBvcGFjaXR5PSIuNDA2Ii8+Cjwvc3ZnPgo="
	                                        width="14" height="14" alt="찜 아이콘"> <span class="zzimNoTxt"></span> 되었습니다
	                                </div>                      
	                    <%
	                    	}else{
	                        	// 현재 사용자가 해당 상품 찜하지 않은 상태
	                        	System.out.println("찜x");
						%>
	                                <button class="zzimButton1" onclick="up()">
	                                    <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9IiNGRkYiIGZpbGwtcnVsZT0ibm9uemVybyIgZD0iTTcuMDA1IDEuMDQ1aC4yMzNjLjI4LjIyOC41MzcuNDkuNzYyLjc3Ny4yMjUtLjI4OC40ODEtLjU0OS43NjItLjc3N2guMjMzYTYuMTYgNi4xNiAwIDAgMC0uMDktLjExM0M5LjY4NC4zNDQgMTAuNjI4IDAgMTEuNiAwIDE0LjA2NCAwIDE2IDIuMTEgMTYgNC43OTZjMCAzLjI5Ni0yLjcyIDUuOTgxLTYuODQgMTAuMDYyTDggMTZsLTEuMTYtMS4xNTFDMi43MiAxMC43NzcgMCA4LjA5MiAwIDQuNzk2IDAgMi4xMSAxLjkzNiAwIDQuNCAwYy45NzIgMCAxLjkxNi4zNDQgMi42OTUuOTMyYTYuMTYgNi4xNiAwIDAgMC0uMDkuMTEzeiIvPgo8L3N2Zz4K"
	                                        width="16" height="16" alt="찜 아이콘"> 
	                                    <span>찜</span>
	                                    <span id="zzim"><%=product.getZzim()%></span>
	                                </button>	  
	                                <button class="zzimButton2" style="display: none;" onclick="down()">
	                                    <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9IiNGNzJGMzMiIGZpbGwtcnVsZT0ibm9uemVybyIgZD0iTTcuMDA1IDEuMDQ1aC4yMzNjLjI4LjIyOC41MzcuNDkuNzYyLjc3Ny4yMjUtLjI4OC40ODEtLjU0OS43NjItLjc3N2guMjMzYTYuMTYgNi4xNiAwIDAgMC0uMDktLjExM0M5LjY4NC4zNDQgMTAuNjI4IDAgMTEuNiAwIDE0LjA2NCAwIDE2IDIuMTEgMTYgNC43OTZjMCAzLjI5Ni0yLjcyIDUuOTgxLTYuODQgMTAuMDYyTDggMTZsLTEuMTYtMS4xNTFDMi43MiAxMC43NzcgMCA4LjA5MiAwIDQuNzk2IDAgMi4xMSAxLjkzNiAwIDQuNCAwYy45NzIgMCAxLjkxNi4zNDQgMi42OTUuOTMyYTYuMTYgNi4xNiAwIDAgMC0uMDkuMTEzeiIvPgo8L3N2Zz4K"
	                                        width="16" height="16" class="yesC" alt="찜 아이콘"> <span>찜</span><span id="zzim"><%=product.getZzim()%></span>
	                                </button>
	                                <div class="zzimNo">
	                                    <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNCIgaGVpZ2h0PSIxNCIgdmlld0JveD0iMCAwIDE0IDE0Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjMzMzIiBzdHJva2Utd2lkdGg9IjEuNSIgZD0iTTIuMTA2IDdsMy42NjMgNCA3LjAxNS04IiBvcGFjaXR5PSIuNDA2Ii8+Cjwvc3ZnPgo="
	                                        width="14" height="14" alt="찜 아이콘"> <span class="zzimNoTxt"></span> 되었습니다
	                                </div>
						
						<%
	                        }
	                    %>
							<script>
	                        function hpcall(aaa){ 
								console.log(aaa)
	                        	alert('연락처 : ' + aaa );
	                        	
	                        }
	                        </script>                     

	                            </div>
	                            <%
	                            String p_memidx = pDAO.storeNum(p_idx);
	                            String call = String.valueOf(pDAO.hpcall(p_memidx));
	                            
	                            %>
	                            <button class="callButton" onclick="hpcall('<%=call%>');">연락하기</button>
	                            <a class="buyButton" href="buy.jsp?p_idx=<%=p_idx%>">바로구매</a>
	                        </div>
	                        
	                        
	                        <div class="rpModal"></div>
	                        <div class="reBox1">
	                            <div class="reBox2">
	                                <div class="reTitle">신고하기</div>
	                                <button class="reCancle">
	                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAiBJREFUaAXtmM1xwjAQRrFvcE+aSJoIPaSI5MCNHmC4caCK1ECaCE0kBTBccPxl0MyO0C6r1drkIF/Q6Gf3vbU9kplM6lUrUCtQK/BvK7Bard622+3DvQCRGwxS/pYbvCzcHY/H/T0kkBO5e76dJMEKzGazj6Zpvrquex5bIsAjNxjAwhW64QbQHweaTqfzxWLxI60pHcvNKQqMLZELD76bAmNJWODVAkNLWOGzBIaSKIHPFvCWKIU3CXhJeMCbBUolvOCLBKwSnvDFAgmJQ7/ZvXCb3QX+s99hn7DDemyMqn0AoNIVgSUlNHOkHNyYiwCCS4DSGAem7XcT4CTQ3x8Gw2OTvDta2NQ8VwEkiKuNvssz7w6P2O4CCEol/pI0zSDwiM1+D2DQep1Op6vCpPqs8em6q0R00NLebDaP5/N5Hx4bxAjttm3ny+Xy2xKXW+MqEMMDGImpkLeEm0AKPlRbGuMqq+13EdAAauZooem8YoEcsJy5FFJqFwlYgCxrBhEoASlZG8uY7oAHgEcMyGQLeCVGco9YWQIeCQFOr9KY6qNEaSIKTdvYK7C59R84B+zY2PRwlqJzpLZKAAGH3E1jCRy/tRI3HyF6skSVvI8CtLrxXZY+T8M6USCG1wQMga2/uTlZgdxAVuDUupzc7DvQP4ev4Rg8RuWpCP7VQM7wYoOFjqvb6/X6HdVQL3CeiHcCDM5ha7hagVqBWgHHCvwCWAH5e5bAf84AAAAASUVORK5CYII="
	                                        width="24" height="24" alt="닫기 버튼 아이콘">
	                                </button>
	                            </div>
	                            <div class="reBox3">
	                                <div class="reportBox reportBox1">
	                                    <div class="reportTxt">
	                                        <span>광고(상점홍보, 낚시글, 도배글)</span>
	                                        <button type="button">
	                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAQCAYAAAAI0W+oAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAXNJREFUeNqslK1Pw1AUxV9fmoq5Ldl/MCSaBLkEAQkIPgxzTUABjoRMsAJmCQ4HJGAAw8yCwGFQaCyOKSpgZmIGzk1OyU1Zu7fRm/yWvtvec1777p0XRVFgjLkGZ+DFFBtzYBeEPn5uwAZYAPPgrSCTGngAVRBY/HTBNxOPoFKASYVaVWp3xegWRGoX97KDf5gE1KhxfSwelosTGkrUwRXwpjDxWFvnWjSP5CIxktcLwRPXDdCawqjFWkOtkNq/RhJDsKaa4VAVuUSDNYYa69Q0aSOJL7AI4hGfIS/0546p8akfsCOKZDfLYMCD7aiDzWrjDp8dsPbPiNiMYhncLX7fsmrVdCQjUeaz21lDb3N2egeaqeErqfsl5pK3barOnchIog3O1d/JBc9BuGTO8LqdJ+Q7HPQemOGBS2e9M7+p2nhnnIiLkbToKngGs+BA3XvlveE4Ees4I32wBD5ULmau7yLgTzCQPbAC9rk+Zc4pfgQYAOZsSsrHKCoBAAAAAElFTkSuQmCC"
	                                                width="13" height="8" alt="화살표 아이콘">
	                                        </button>
	                                    </div>
	                                    <div class="reSubBox reSubBox1">
	                                        <div class="reButton">
	                                            <button type="button" onclick="report(<%=product.getIdx()%>,<%=product.getMemidx()%>,'상점홍보')">상점홍보</button>
	                                        </div>
	                                        <div class="reButton">
	                                            <button type="button" onclick="report(<%=product.getIdx()%>,<%=product.getMemidx()%>,'낚시글')">낚시글</button>
	                                        </div>
	                                        <div class="reButton">
	                                            <button type="button" onclick="report(<%=product.getIdx()%>,<%=product.getMemidx()%>,'도배글')">도배글</button>
	                                        </div>
	                                        <div class="reButton">
	                                            <button type="button" onclick="report(<%=product.getIdx()%>,<%=product.getMemidx()%>,'타사이트,어플 광고')">타사이트,어플 광고</button>
	                                        </div>
	                                        <div class="reJoin">
	                                            <input type="text" class="reprotTT1" placeholder="기타(사유)">
	                                            <button type="button" onclick="report1(<%=product.getIdx()%>,<%=product.getMemidx()%>)">등록</button>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="reportBox reportBox2">
	                                    <div class="reportTxt">
	                                        <span>물품정보 부정확(카테고리, 가격, 사진)</span>
	                                        <button type="button">
	                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAQCAYAAAAI0W+oAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAXNJREFUeNqslK1Pw1AUxV9fmoq5Ldl/MCSaBLkEAQkIPgxzTUABjoRMsAJmCQ4HJGAAw8yCwGFQaCyOKSpgZmIGzk1OyU1Zu7fRm/yWvtvec1777p0XRVFgjLkGZ+DFFBtzYBeEPn5uwAZYAPPgrSCTGngAVRBY/HTBNxOPoFKASYVaVWp3xegWRGoX97KDf5gE1KhxfSwelosTGkrUwRXwpjDxWFvnWjSP5CIxktcLwRPXDdCawqjFWkOtkNq/RhJDsKaa4VAVuUSDNYYa69Q0aSOJL7AI4hGfIS/0546p8akfsCOKZDfLYMCD7aiDzWrjDp8dsPbPiNiMYhncLX7fsmrVdCQjUeaz21lDb3N2egeaqeErqfsl5pK3barOnchIog3O1d/JBc9BuGTO8LqdJ+Q7HPQemOGBS2e9M7+p2nhnnIiLkbToKngGs+BA3XvlveE4Ees4I32wBD5ULmau7yLgTzCQPbAC9rk+Zc4pfgQYAOZsSsrHKCoBAAAAAElFTkSuQmCC"
	                                                width="13" height="8" alt="화살표 아이콘">
	                                        </button>
	                                    </div>
	                                    <div class="reSubBox reSubBox2">
	                                        <div class="reButton">
	                                            <button type="button" onclick="report(<%=product.getIdx()%>,<%=product.getMemidx()%>,'카테고리가 잘못됨')">카테고리가 잘못됨</button>
	                                        </div>
	                                        <div class="reButton">
	                                            <button type="button" onclick="report(<%=product.getIdx()%>,<%=product.getMemidx()%>,'가격이 잘못됨')">가격이 잘못됨</button>
	                                        </div>
	                                        <div class="reButton">
	                                            <button type="button" onclick="report(<%=product.getIdx()%>,<%=product.getMemidx()%>,'사진이 잘못됨')">사진이 잘못됨</button>
	                                        </div>
	                                        <div class="reButton">
	                                            <button type="button" onclick="report(<%=product.getIdx()%>,<%=product.getMemidx()%>,'상품명이 잘못됨')">상품명이 잘못됨</button>
	                                        </div>
	                                        <div class="reJoin">
	                                            <input type="text" class="reprotTT2" placeholder="기타(사유)">
	                                            <button type="button" onclick="report2(<%=product.getIdx()%>,<%=product.getMemidx()%>)">등록</button>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="reportBox reportBox3">
	                                    <div class="reportTxt">
	                                        <span>거래 금지 품목(담배, 주류, 장물)</span>
	                                        <button type="button">
	                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAQCAYAAAAI0W+oAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAXNJREFUeNqslK1Pw1AUxV9fmoq5Ldl/MCSaBLkEAQkIPgxzTUABjoRMsAJmCQ4HJGAAw8yCwGFQaCyOKSpgZmIGzk1OyU1Zu7fRm/yWvtvec1777p0XRVFgjLkGZ+DFFBtzYBeEPn5uwAZYAPPgrSCTGngAVRBY/HTBNxOPoFKASYVaVWp3xegWRGoX97KDf5gE1KhxfSwelosTGkrUwRXwpjDxWFvnWjSP5CIxktcLwRPXDdCawqjFWkOtkNq/RhJDsKaa4VAVuUSDNYYa69Q0aSOJL7AI4hGfIS/0546p8akfsCOKZDfLYMCD7aiDzWrjDp8dsPbPiNiMYhncLX7fsmrVdCQjUeaz21lDb3N2egeaqeErqfsl5pK3barOnchIog3O1d/JBc9BuGTO8LqdJ+Q7HPQemOGBS2e9M7+p2nhnnIiLkbToKngGs+BA3XvlveE4Ees4I32wBD5ULmau7yLgTzCQPbAC9rk+Zc4pfgQYAOZsSsrHKCoBAAAAAElFTkSuQmCC"
	                                                width="13" height="8" alt="화살표 아이콘">
	                                        </button>
	                                    </div>
	                                    <div class="reSubBox reSubBox3">
	                                        <div class="reButton">
	                                            <button type="button" onclick="report(<%=product.getIdx()%>,<%=product.getMemidx()%>,'담배/주류')">담배/주류</button>
	                                        </div>
	                                        <div class="reButton">
	                                            <button type="button" onclick="report(<%=product.getIdx()%>,<%=product.getMemidx()%>,'장물(분시폰,분실노트북...)')">장물(분실폰,분실노트북, ..)</button>
	                                        </div>
	                                        <div class="reButton">
	                                            <button type="button" onclick="report(<%=product.getIdx()%>,<%=product.getMemidx()%>,'의약품류')">의약품류</button>
	                                        </div>
	                                        <div class="reButton">
	                                            <button type="button" onclick="report(<%=product.getIdx()%>,<%=product.getMemidx()%>,'콘택트 렌즈')">콘택트 렌즈</button>
	                                        </div>
	                                        <div class="reJoin">
	                                            <input type="text" class="reprotTT3" placeholder="기타(사유)">
	                                            <button type="button" onclick="report3(<%=product.getIdx()%>,<%=product.getMemidx()%>)">등록</button>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="reportBox reportBox4">
	                                    <div class="reportTxt">
	                                        <span>언어폭력(비방, 욕설, 성희롱)</span>
	                                        <button type="button">
	                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAQCAYAAAAI0W+oAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAXNJREFUeNqslK1Pw1AUxV9fmoq5Ldl/MCSaBLkEAQkIPgxzTUABjoRMsAJmCQ4HJGAAw8yCwGFQaCyOKSpgZmIGzk1OyU1Zu7fRm/yWvtvec1777p0XRVFgjLkGZ+DFFBtzYBeEPn5uwAZYAPPgrSCTGngAVRBY/HTBNxOPoFKASYVaVWp3xegWRGoX97KDf5gE1KhxfSwelosTGkrUwRXwpjDxWFvnWjSP5CIxktcLwRPXDdCawqjFWkOtkNq/RhJDsKaa4VAVuUSDNYYa69Q0aSOJL7AI4hGfIS/0546p8akfsCOKZDfLYMCD7aiDzWrjDp8dsPbPiNiMYhncLX7fsmrVdCQjUeaz21lDb3N2egeaqeErqfsl5pK3barOnchIog3O1d/JBc9BuGTO8LqdJ+Q7HPQemOGBS2e9M7+p2nhnnIiLkbToKngGs+BA3XvlveE4Ees4I32wBD5ULmau7yLgTzCQPbAC9rk+Zc4pfgQYAOZsSsrHKCoBAAAAAElFTkSuQmCC"
	                                                width="13" height="8" alt="화살표 아이콘">
	                                        </button>
	                                    </div>
	                                    <div class="reSubBox reSubBox4">
	                                        <div class="reButton">
	                                            <button type="button" onclick="report(<%=product.getIdx()%>,<%=product.getMemidx()%>,'비방/욕설')">비방/욕설</button>
	                                        </div>
	                                        <div class="reButton">
	                                            <button type="button" onclick="report(<%=product.getIdx()%>,<%=product.getMemidx()%>,'성희롱')">성희롱</button>
	                                        </div>
	                                        <div class="reJoin">
	                                            <input type="text" class="reprotTT4" placeholder="기타(사유)">
	                                            <button type="button" onclick="report4(<%=product.getIdx()%>,<%=product.getMemidx()%>)">등록</button>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="reportBox reportBox5">
	                                    <div class="reportTxt">
	                                        <span>기타사유(직접입력)</span>
	                                        <button type="button">
	                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAQCAYAAAAI0W+oAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAXNJREFUeNqslK1Pw1AUxV9fmoq5Ldl/MCSaBLkEAQkIPgxzTUABjoRMsAJmCQ4HJGAAw8yCwGFQaCyOKSpgZmIGzk1OyU1Zu7fRm/yWvtvec1777p0XRVFgjLkGZ+DFFBtzYBeEPn5uwAZYAPPgrSCTGngAVRBY/HTBNxOPoFKASYVaVWp3xegWRGoX97KDf5gE1KhxfSwelosTGkrUwRXwpjDxWFvnWjSP5CIxktcLwRPXDdCawqjFWkOtkNq/RhJDsKaa4VAVuUSDNYYa69Q0aSOJL7AI4hGfIS/0546p8akfsCOKZDfLYMCD7aiDzWrjDp8dsPbPiNiMYhncLX7fsmrVdCQjUeaz21lDb3N2egeaqeErqfsl5pK3barOnchIog3O1d/JBc9BuGTO8LqdJ+Q7HPQemOGBS2e9M7+p2nhnnIiLkbToKngGs+BA3XvlveE4Ees4I32wBD5ULmau7yLgTzCQPbAC9rk+Zc4pfgQYAOZsSsrHKCoBAAAAAElFTkSuQmCC"
	                                                width="13" height="8" alt="화살표 아이콘">
	                                        </button>
	                                    </div>
	                                    <div class="reSubBox reSubBox5">
	                                        <div class="rsTxa">
	                                            <textarea id="reprotTT5"></textarea>
	                                            <button type="button" onclick="report5(<%=product.getIdx()%>,<%=product.getMemidx()%>)">등록</button>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="reportBox reportBox6">
	                                    <div class="reportTxt">
	                                        <span>거래사기(1:1문의하기)</span>
	                                        <button class="oneOne">1:1문의하기</button>
	                                    </div>
	                                    <div class="reSubBox"></div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <script>
								function report(a,b,c){
									const xhr = new XMLHttpRequest();
									xhr.open('GET', 'report_ok.jsp?rp_productidx='+a+'&rp_memidx='+b+'&rp_reason='+c, true);
									xhr.send();
									
									
									xhr.onreadystatechange = function(){
										if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
											alert('신고되었습니다.')
	
										}
									}
								}
								
								function report1(a,b){
									const xhr = new XMLHttpRequest();
									var re_reason = $('.reprotTT1').val();
									xhr.open('GET', 'report_ok.jsp?rp_productidx='+a+'&rp_memidx='+b+'&rp_reason='+re_reason, true);
									xhr.send();
									
									
									xhr.onreadystatechange = function(){
										if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
											alert('신고되었습니다.')

										}
									}
								}
								function report2(a,b){
									const xhr = new XMLHttpRequest();
									var re_reason = $('.reprotTT2').val();
									xhr.open('GET', 'report_ok.jsp?rp_productidx='+a+'&rp_memidx='+b+'&rp_reason='+re_reason, true);
									xhr.send();
									
									
									xhr.onreadystatechange = function(){
										if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
											alert('신고되었습니다.')

										}
									}
								}
								function report3(a,b){
									const xhr = new XMLHttpRequest();
									var re_reason = $('.reprotTT3').val();
									xhr.open('GET', 'report_ok.jsp?rp_productidx='+a+'&rp_memidx='+b+'&rp_reason='+re_reason, true);
									xhr.send();
									
									
									xhr.onreadystatechange = function(){
										if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
											alert('신고되었습니다.')

										}
									}
								}
								function report4(a,b){
									const xhr = new XMLHttpRequest();
									var re_reason = $('.reprotTT4').val();
									xhr.open('GET', 'report_ok.jsp?rp_productidx='+a+'&rp_memidx='+b+'&rp_reason='+re_reason, true);
									xhr.send();
									
									
									xhr.onreadystatechange = function(){
										if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
											alert('신고되었습니다.')

										}
									}
								}
								function report5(a,b){
									const xhr = new XMLHttpRequest();
									var re_reason = $("textarea#reprotTT5").val();
									xhr.open('GET', 'report_ok.jsp?rp_productidx='+a+'&rp_memidx='+b+'&rp_reason='+re_reason, true);
									xhr.send();
									
									
									xhr.onreadystatechange = function(){
										if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
											alert('신고되었습니다.')

										}
									}
								}

	        </script>
    
	        <div class="relationContainer">
	            <div class="relationBox">
	                <div class="relation">
	                    <div class="relationTitle">
	                        연관상품
	                        <div class="adBox">
	                            <div class="ad">AD</div>
	                            <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNCIgaGVpZ2h0PSIxNCIgdmlld0JveD0iMCAwIDE0IDE0Ij4KICAgIDxwYXRoIGZpbGw9IiM5Qjk5QTkiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTE0IDdjMCAzLjg2LTMuMTQgNy03IDdzLTctMy4xNC03LTcgMy4xNC03IDctNyA3IDMuMTQgNyA3em0tMS40IDBjMC0zLjA4OC0yLjUxMi01LjYtNS42LTUuNi0zLjA4OCAwLTUuNiAyLjUxMi01LjYgNS42IDAgMy4wODggMi41MTIgNS42IDUuNiA1LjYgMy4wODggMCA1LjYtMi41MTIgNS42LTUuNnpNOC40IDkuOGMwIC4zODctLjMxMy43LS43LjdIN2MtLjM4NyAwLS43LS4zMTMtLjctLjdWN2MtLjM4NyAwLS43LS4zMTMtLjctLjcgMC0uMzg3LjMxMy0uNy43LS43SDdjLjM4NyAwIC43LjMxMy43Ljd2Mi44Yy4zODcgMCAuNy4zMTMuNy43ek02LjIzIDQuMmMwLS40MjUuMzQ1LS43Ny43Ny0uNzcuNDI1IDAgLjc3LjM0NS43Ny43NyAwIC40MjUtLjM0NS43Ny0uNzcuNzctLjQyNSAwLS43Ny0uMzQ1LS43Ny0uNzd6Ii8+Cjwvc3ZnPgo="
	                                alt="AD 가이드" width="14" height="14">
	                        </div>
	                    </div>
	                    <div class="photoCnt">1/4</div>
	                </div>
	                <div class="repContainer responsive">
	                    <div class="repBox">
	                        <a data-pid="147133588" class="repLink"
	                            href="/products/147133588?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProdcut">
	                                <img src="https://media.bunjang.co.kr/product/147133588_1_1614146063_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">라벨르블랑 에밀리 샤틴 스커트</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="139890133" class="repLink"
	                            href="/products/139890133?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/139890133_1_1614068773_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">세린느 정품 H라인스커트 55 애슐리상점 n2602</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="147589550" class="repLink"
	                            href="/products/147589550?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/147589550_1_1614758143_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">메이윤 니트머메이드스커트</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="141683150" class="repLink"
	                            href="/products/141683150?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/141683150_1_1612918384_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">럭키슈에뜨 프릴 롱스커트 55 미착용제품 n2702 애슐리상점</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="147695866" class="repLink"
	                            href="/products/147695866?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/147695866_1_1614925589_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">롱스커트.봄스커트.새틴 스커트 판매합니다</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="146842129" class="repLink"
	                            href="/products/146842129?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/146842129_1_1613885683_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">오즈세컨 주름 롱스커트 44~날씬55 n2154 애슐리상점
	                                미착용제품</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="147133588" class="repLink"
	                            href="/products/147133588?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProdcut">
	                                <img src="https://media.bunjang.co.kr/product/143123499_1_1615363311_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">아크메드라비 반팔</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="139890133" class="repLink"
	                            href="/products/139890133?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/149206725_1_1616080645_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">돌섬 와펜 반팔티 <21SS 신상 인기>
	                            </div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="147589550" class="repLink"
	                            href="/products/147589550?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/135808231_1_1604318682_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">우영미 20fw 백로고반팔</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="141683150" class="repLink"
	                            href="/products/141683150?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/145931204_1_1615610608_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">폴 자수 반팔티</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="147695866" class="repLink"
	                            href="/products/147695866?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/148337710_1_1615620919_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">새상품 메종키츠네 반팔 21SS 그레이폭스헤드</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="146842129" class="repLink"
	                            href="/products/146842129?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/149157975_1_1616050855_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">돌섬 사각패치 반팔티</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="147133588" class="repLink"
	                            href="/products/147133588?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProdcut">
	                                <img src="https://media.bunjang.co.kr/product/147133588_1_1614146063_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">라벨르블랑 에밀리 샤틴 스커트</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="139890133" class="repLink"
	                            href="/products/139890133?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/139890133_1_1614068773_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">세린느 정품 H라인스커트 55 애슐리상점 n2602</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="147589550" class="repLink"
	                            href="/products/147589550?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/147589550_1_1614758143_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">메이윤 니트머메이드스커트</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="141683150" class="repLink"
	                            href="/products/141683150?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/141683150_1_1612918384_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">럭키슈에뜨 프릴 롱스커트 55 미착용제품 n2702 애슐리상점</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="147695866" class="repLink"
	                            href="/products/147695866?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/147695866_1_1614925589_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">롱스커트.봄스커트.새틴 스커트 판매합니다</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="146842129" class="repLink"
	                            href="/products/146842129?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/146842129_1_1613885683_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">오즈세컨 주름 롱스커트 44~날씬55 n2154 애슐리상점
	                                미착용제품</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="147133588" class="repLink"
	                            href="/products/147133588?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProdcut">
	                                <img src="https://media.bunjang.co.kr/product/143123499_1_1615363311_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">아크메드라비 반팔</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="139890133" class="repLink"
	                            href="/products/139890133?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/149206725_1_1616080645_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">돌섬 와펜 반팔티 <21SS 신상 인기>
	                            </div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="147589550" class="repLink"
	                            href="/products/147589550?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/135808231_1_1604318682_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">우영미 20fw 백로고반팔</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="141683150" class="repLink"
	                            href="/products/141683150?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/145931204_1_1615610608_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">폴 자수 반팔티</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="147695866" class="repLink"
	                            href="/products/147695866?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/148337710_1_1615620919_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">새상품 메종키츠네 반팔 21SS 그레이폭스헤드</div>
	                        </a>
	                    </div>
	                    <div class="repBox">
	                        <a data-pid="146842129" class="repLink"
	                            href="/products/146842129?ref=%EC%97%B0%EA%B4%80%EC%83%81%ED%92%88">
	                            <div class="reProduct">
	                                <img src="https://media.bunjang.co.kr/product/149157975_1_1616050855_w310.jpg" width="155"
	                                    height="155" alt="상품 이미지">
	                                <div class="cLBgyp"></div>
	                            </div>
	                            <div class="repContent">돌섬 사각패치 반팔티</div>
	                        </a>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <script>
	            $('.responsive').slick({
	                dots: false,
	                infinite: false,
	                speed: 300,
	                slidesToShow: 6,
	                slidesToScroll: 6,
	                responsive: [{
	                    breakpoint: 1030,
	                    settings: {
	                        slidesToShow: 3,
	                        slidesToScroll: 3,
	                        infinite: true,
	                        dots: false
	                    }
	                }, {
	                    breakpoint: 600,
	                    settings: {
	                        slidesToShow: 2,
	                        slidesToScroll: 2
	                    }
	                }, {
	                    breakpoint: 480,
	                    settings: {
	                        slidesToShow: 1,
	                        slidesToScroll: 1
	                    }
	                }
	
	                ]
	            });
	        </script>    
    
    		<!-- 여기부터 깨져서 css 수정 -->
            <div class="shopContainer">
                <div class="shopBox">
                    <div class="shopbutton">
                        <a href="#shopinfo" class="shopinfo">
                            <button type="button">
                                상품정보 <span class="iOgkKA"></span>
                            </button>
                        </a> 
                        <a href="#shopQes" class="shopQes">
                            <button type="button">
                                상품문의 (0) <span class="iOgkKA"></span>
                            </button>
                        </a>
<!-- 						여기 스크립트 보기
						<a name="shopinfo">

						</a>
 -->
					</div>
					
					<div class="inContainer">
						<div class="inBox1">
							<div class="inTitle">상품정보</div>
							<div>
								<div class="inStyle"></div>
			                    <div class="inContent">
			                        <%=product.getContent()%>
			                    </div>
			                    
			                    <!-- <a name="shopQes"></a> -->
			                    <div class="chooseContainer">
			                        <div class="chooseBox">
			                            <div class="chooseContent">
			                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
			                                    width="16" height="18" alt="거래지역 아이콘">거래지역
			                            </div>
			                            <div class="choose">
			                                <div class="confirm"> <span><%=product.getDeallocation()%></span> </div>
			                            </div>
			                        </div>
			                        <div class="chooseBox">
			                            <div class="chooseContent">
			                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAkCAYAAADo6zjiAAAAAXNSR0IArs4c6QAAANJJREFUWAntWEEKxCAMjGJ70h/4Aq/+/wm99gX9gTcVujsLe1pQoWj2kJyERCeZkNCOut9WSqHruiilRDjPtH3fyVpL3nvato1Uzvk+z5NqrTNxf942xlAIgTQqXw2ObIAJbA3auQzYenbPW8UBW7cCVvgkAXYGTK/PMcZeSNN/HEfT//8M9CpoljfgZGdAEhAGZA90GZA9MLDMHoXIGLIz0J0C+R6QPfBoyAcus08BfwL4R+cyaAXaOceF/xEqNJQKiAWrDZjAVqslGrQcrH8lmhfQ0lJsYYep+gAAAABJRU5ErkJggg=="
			                                    width="16" height="18" alt="카테고리 아이콘">카테고리
			                            </div>
			                            <div class="choose">
			                                <span class="chooseDash"><%=categoryDAO.categorySmall(Integer.parseInt(p_idx))%></span>
			                            </div>
			                        </div>
			                        <%-- <div class="chooseBox">
			                            <div class="chooseContent">
			                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAkCAYAAACaJFpUAAAAAXNSR0IArs4c6QAAAbpJREFUSA3tVzFSwkAU3c2EggKK1BxAoRAmXIKjYAkztsYDaCk34Ara6QEIVKAdDWoFDQUFDPF9hgxZJOEFRhvzZ3aS3f/ef5v3N0zQKmX0er0LrfWD0IIgaNXr9fc0JTQLHg6HzmKxuAX+GsPe8la4Pubz+btKpTLbriVejgriKezBYNBcr9ceKjkx1WaWZXm1Wq2Dp5dNxEaiYL/fb0DwHuMytkIkAbE3TFuu6z5Hlo3bg4K+74uACDUMNDmB8BOgbQjLBowwBLd98oBoYoR9MggpJmJtB/31ov3dCJJ9SqFlQI3+6rR9MkqlmEh/Mdoa71XA8nK5nCqVSqpQKGwo8/lcTSYTtVwu2RJ8n0SsXC4r29611nEcVSwW1Wg0okUtdmvyZFGxkCdrkmODFgxtPFQ4KbePpwX3iafOaUE5IHGRlNvn0IJyGlernz+TsiY5NnZH7ghDjr6cxj97LWQ/Ijoej49sLTlNW5pchs9mgrxXJDKzlDSKh2WW8l6RyMxS0ige9j8s/eINOQ+JD+FPsfTlvDI8G38pXi18V96AMuVpJyOnomVVq9UP3FyhTBfjN+yVml3REK1volCeXrtQ40gAAAAASUVORK5CYII="
			                                    width="15" height="18" alt="상품태그 아이콘">상품태그
			                            </div>
			                            <div class="choose"> <a class=""><%=product.getTag()%></a></div>
			                        </div> --%>
			                    </div>
			                </div>
						</div>
					<%
					List<HashMap<String, String>> inquireList = inquireDAO.inquire(p_idx);
					int inquireCnt = inquireList.size();
					%>
				        <div class="enquiryContainer">
				            <div class="enquiryTitle">
				                상품문의 <span class="enquirySub"><%=inquireCnt %></span>
				            </div>
				            <div class="enquiryBox1">
				                <form method="post" action="productDetail_inquire_ok.jsp?m_idx=<%=m_idx %>&p_idx=<%=product.getIdx()%>&p_memidx=<%=product.getMemidx()%>">
				                <div class="enquiryBox2">
				                    <textarea name="i_content" placeholder="상품문의 입력" class="enquiryTxt" id="enquiryTxt"></textarea>
				                </div>
				                <div class="enquiryBox3">
				                    <div class="enquiryCnt">0 / 100</div>
				                    <button class="enquiryButton">
				                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAgCAYAAAAFQMh/AAAAAXNSR0IArs4c6QAABFdJREFUSA3Nl11MVEcUgPfnIj8B1kRi4AFI9cEiITFGfZXUYNWKxJ9CtBqC0WCMuoEGgfIPBsVsU7MpVdRV0qZpgkZLjU2qrYD6oCTw4A+YoGktTQhiIE1hC7td8Dsb7ua6ruxd2IdOMsy5Z84535wzM/cuRkOYW0tLS8zw8PCR6enpfKPRaCH865mZmRuKolysrKx8qeKMqhCO0WazJUxMTNwBlAF0gJjXkBGNHzN+wHi4pqbme2GFDexwOOIGBwf/JHgccW0pKSm1BQUFkwKRVl9fv4cqnDWZTNbq6urWsIA7OjqUrq6uH4DmwFDI7nRtbW2Zl6j509DQ8JHH42k3m83rzBr9vMS2tjZzT0+PlG9LVFTURrJahvxZZmZmdGdn56/aoCzwd/Qr0a0yaSdClQXa39//HRlm4fvH5ORkc0xMzKdk3kU/Ttan/GOS7RXsc+YNxtnU19fXSuBNERERWfHx8euBucfHx38LAv8PO8u8wAKtq6u7TIBsMthYUVHRW1xcPBoZGbmBhTjngrMVW7F5FfLhAmrkhDoYd3I3s7ib3QTytebm5tiRkZGbKBbHxsZucDqdUtr19NMs9CH6K4zHQgLjLNALOOdKpkAf+IgaQV4iQ0ND7aiW+sE9QG+npaVl6y61QCnvOcY8oJveBxV+YWGhMzU1NRvxLyk75e0Wf9rfsv+5ubkeXRnPQr8h0F7KuxnofQEEa5z6RZz6XvzTgV7nuuWXlpb+I3667jFvm69xzAf6CdB7wYDqfEZGRgnQ3QJNTEzMs1qt/6pzQUtNee04FwDfCvSu6hhsxK+EEp9UoZTfrfWZE8wL4CuMD7Cn2VVVVZ1ax7lkDmAxi5VT7M3UHyq+7wWzYhvzh+g5QO+IsZ6Gn5VMv5wLKnGUQMHItAn9EZxz+IzdDmQTSAf0KJmeCQYV33cyBir7YmVuO9BfAgEC6SjvYaB2PVDxf+s6seITOJfgvAOovH10NfwKMTxL/1FOb6A99Q/kKzWZ1jF5nIO0iz3VDSXTAyw2JKgswpsxH+hdHIg2AoyQ7QDjIAu4zAJu+a9U+wx0P7YX0enOVPX37jHQJBQu+nkCyX3bhq5SNQo0Ut58bC4wFzJU4nlLDWwNcj/lrhIlmXxB0OUiB2rM72X+EtVp17un/nHUPRZwrzpJ0BUEnZJSIqch/8xh65B5dHtYaOtCoBLHJN9Pxg8J9EQUs20ZwQ8CdaDfhywfCAPlzUP+FvGn+WY6G9+gjI2NreaBV7HpqU+pKJ8DSIiOju52u92LXS7XM6C7BcpCFgwVjkJWUmYDXx5fxnwMfL8q7Ha7a2pqygxQoDcWmqmwpAl4LeN4WVnZy/LyckNTU1McoJVkJz9D00dHR9PFkOfepKQkXS8HsQ/WjJzkAYwS6A/IKB1Asjghexie0x+he2GxWOxFRUVDMheOJqd6EV3usMhX2etHjI+Tk5Ofav8FQRfe1tjYuCS8Ef/n0d4Ah7Y0Xn+VgFMAAAAASUVORK5CYII="
				                            width="15" height="16" alt="문의등록버튼 아이콘">등록
				                    </button>
				                </div>
				                </form>
				            </div>
				            <!-- 여기부터 수정 --> 
				            <div class="productInquiry">
				                <div class="inquiryContainer">
				                    <div class="inquiryContent">
				                        <a class="inquiryImg" href="/shop/1/reviews"><img
				                                src="https://media.bunjang.co.kr/images/crop/199870305_w{res}.jpg" width="48" height="48"
				                                alt="프로필 이미지"></a>
				                        <div class="inquiryDiv">
				                            <div class="inquiryHeader">
				                                <div class="inquiryMem">번장알림센터</div>
				                                <div class="inquiryTime">1분 전</div>
				                            </div>
				                            <div class="inquiryText">[공지글] 안전거래를 위한 번개장터만의 휴대폰/계좌조회
				                                서비스가 출시되었습니다. http://bit.ly/2j0Mc7G</div>
				                            <div class="inquiryFooter">
				                                <div class="inquiryComment">
				                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII="
				                                        width="17" height="14" alt="댓글달기 버튼 이미지">댓글달기
				                                </div>
				                                <div class="inquiryComment">
				                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAAAAXNSR0IArs4c6QAAAgtJREFUSA3tVrtOAkEUdQnKkvADFGtpIR01DYXyMLGwVisLjFEbE42FhYWJiY0YEwsqtLYwkZcFf2C3FJZuwQdIAvgAz8EdGHZZwpJIInGS3blzzzn3zty5m6wyM8Iol8tqs9lca7Vaq6CHFUUJUtZut6uYnj0ez4PP57uPRqMN+ocNZRhILJ/Pr2M6Q3BtGBebMIAfJxKJu6E8JxCn8tbr9SvgKXIQsIIpg7kUCARe6avVavPYyDLMLcyL9GHc+P3+XZz282fZ//b2L3srkQwJPuA9iMfj17C/eoyOpeOtI1m6UCjswL6AnYKW4DZf1jGwpCwjhLdMhvtZicViT1bhoHWxWFzCPT9COwvtxqDy2hKyQRqNxgtEGkT7EKVFcF3X5wzDOAW2SR/wrKZpJ6FQ6F1wsNk94JfADFVVF6yN5BFEMbMbzWQVllH4OTMZTnAIPMiHNn0yxyx9hTEYS8Zo2xKarU+MDdJ3ZwjSORlBMaw+U5MhLsUSdHtCIGGiEJa6LJeGpO3EkuW2E4Lc+ahF68tkYFl5TXuQT2hFLFljS4gSBUiIRCJvMpE2GwRde45AVT606bPyhFbEknHH71AmCdvsxiOs+Yw1bCccK4oL0X9CF8UajTr9JXX8LHK5XHu0IrljTbyk7rb3F9nKb92VUzEmfofdLk0mk7bfDaddjuMXlZz4Caf/Dr8BRaXTUmgtW58AAAAASUVORK5CYII="
				                                        width="14" height="14" alt="신고하기 버튼 이미지">신고하기
				                                </div>
				                            </div>
				                        </div>
				                    </div>
									<%   

										for(HashMap inq : inquireList){
									%>
									<div class="inquiryContent">
				                        <a class="inquiryImg" href="/shop/1/reviews"><img
				                                src="https://media.bunjang.co.kr/images/crop/199870305_w{res}.jpg" width="48" height="48"
				                                alt="프로필 이미지"></a>
				                        <div class="inquiryDiv">
				                            <div class="inquiryHeader">

				                                <div class="inquiryMem"><%=memberDAO.storeName(Integer.parseInt(String.valueOf((inq.get("i_memidx")))))%></div>
				                                <div class="inquiryTime"><%=inq.get("i_regdate") %></div>
				                            </div>
				                            <div class="inquiryText"><%=inq.get("i_content") %></div>
				                            <div class="inquiryFooter">
				                                <div class="inquiryComment">
				                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII="
				                                        width="17" height="14" alt="댓글달기 버튼 이미지">댓글달기
				                                </div>
				                                <div class="inquiryComment">
				                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAAAAXNSR0IArs4c6QAAAgtJREFUSA3tVrtOAkEUdQnKkvADFGtpIR01DYXyMLGwVisLjFEbE42FhYWJiY0YEwsqtLYwkZcFf2C3FJZuwQdIAvgAz8EdGHZZwpJIInGS3blzzzn3zty5m6wyM8Iol8tqs9lca7Vaq6CHFUUJUtZut6uYnj0ez4PP57uPRqMN+ocNZRhILJ/Pr2M6Q3BtGBebMIAfJxKJu6E8JxCn8tbr9SvgKXIQsIIpg7kUCARe6avVavPYyDLMLcyL9GHc+P3+XZz282fZ//b2L3srkQwJPuA9iMfj17C/eoyOpeOtI1m6UCjswL6AnYKW4DZf1jGwpCwjhLdMhvtZicViT1bhoHWxWFzCPT9COwvtxqDy2hKyQRqNxgtEGkT7EKVFcF3X5wzDOAW2SR/wrKZpJ6FQ6F1wsNk94JfADFVVF6yN5BFEMbMbzWQVllH4OTMZTnAIPMiHNn0yxyx9hTEYS8Zo2xKarU+MDdJ3ZwjSORlBMaw+U5MhLsUSdHtCIGGiEJa6LJeGpO3EkuW2E4Lc+ahF68tkYFl5TXuQT2hFLFljS4gSBUiIRCJvMpE2GwRde45AVT606bPyhFbEknHH71AmCdvsxiOs+Yw1bCccK4oL0X9CF8UajTr9JXX8LHK5XHu0IrljTbyk7rb3F9nKb92VUzEmfofdLk0mk7bfDaddjuMXlZz4Caf/Dr8BRaXTUmgtW58AAAAASUVORK5CYII="
				                                        width="14" height="14" alt="신고하기 버튼 이미지">신고하기
				                                </div>
				                            </div>
				                        </div>
				                    </div>
									<%
										}
									%> 
								</div>
				                <div class="enquiryReport">
				                    <div class="enquireReportContainer">
				                        <div class="ReportTitle">
				                            <div class="ReportTitleDiv">신고하기</div>
				                            <button class="fmYgpR">
				                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAiBJREFUaAXtmM1xwjAQRrFvcE+aSJoIPaSI5MCNHmC4caCK1ECaCE0kBTBccPxl0MyO0C6r1drkIF/Q6Gf3vbU9kplM6lUrUCtQK/BvK7Bard622+3DvQCRGwxS/pYbvCzcHY/H/T0kkBO5e76dJMEKzGazj6Zpvrquex5bIsAjNxjAwhW64QbQHweaTqfzxWLxI60pHcvNKQqMLZELD76bAmNJWODVAkNLWOGzBIaSKIHPFvCWKIU3CXhJeMCbBUolvOCLBKwSnvDFAgmJQ7/ZvXCb3QX+s99hn7DDemyMqn0AoNIVgSUlNHOkHNyYiwCCS4DSGAem7XcT4CTQ3x8Gw2OTvDta2NQ8VwEkiKuNvssz7w6P2O4CCEol/pI0zSDwiM1+D2DQep1Op6vCpPqs8em6q0R00NLebDaP5/N5Hx4bxAjttm3ny+Xy2xKXW+MqEMMDGImpkLeEm0AKPlRbGuMqq+13EdAAauZooem8YoEcsJy5FFJqFwlYgCxrBhEoASlZG8uY7oAHgEcMyGQLeCVGco9YWQIeCQFOr9KY6qNEaSIKTdvYK7C59R84B+zY2PRwlqJzpLZKAAGH3E1jCRy/tRI3HyF6skSVvI8CtLrxXZY+T8M6USCG1wQMga2/uTlZgdxAVuDUupzc7DvQP4ev4Rg8RuWpCP7VQM7wYoOFjqvb6/X6HdVQL3CeiHcCDM5ha7hagVqBWgHHCvwCWAH5e5bAf84AAAAASUVORK5CYII="
				                                    width="24" height="24" alt="닫기 버튼 아이콘">
				                            </button>
				                        </div>
				                        <div class="ezYoOv">
				                            <div class="enquireReportList">
				                                <div class="ERL1">
				                                    <span>광고(교신 및 상점홍보)</span>
				                                    <button type="button">
				                                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAQCAYAAAAI0W+oAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAXNJREFUeNqslK1Pw1AUxV9fmoq5Ldl/MCSaBLkEAQkIPgxzTUABjoRMsAJmCQ4HJGAAw8yCwGFQaCyOKSpgZmIGzk1OyU1Zu7fRm/yWvtvec1777p0XRVFgjLkGZ+DFFBtzYBeEPn5uwAZYAPPgrSCTGngAVRBY/HTBNxOPoFKASYVaVWp3xegWRGoX97KDf5gE1KhxfSwelosTGkrUwRXwpjDxWFvnWjSP5CIxktcLwRPXDdCawqjFWkOtkNq/RhJDsKaa4VAVuUSDNYYa69Q0aSOJL7AI4hGfIS/0546p8akfsCOKZDfLYMCD7aiDzWrjDp8dsPbPiNiMYhncLX7fsmrVdCQjUeaz21lDb3N2egeaqeErqfsl5pK3barOnchIog3O1d/JBc9BuGTO8LqdJ+Q7HPQemOGBS2e9M7+p2nhnnIiLkbToKngGs+BA3XvlveE4Ees4I32wBD5ULmau7yLgTzCQPbAC9rk+Zc4pfgQYAOZsSsrHKCoBAAAAAElFTkSuQmCC"
				                                            width="13" height="8" alt="화살표 아이콘">
				                                    </button>
				                                </div>
				                                <div class="ERL1_1">
				                                    <div class="ERL1_1_1">
				                                        <button type="button">교환신청</button>
				                                    </div>
				                                    <div class="ERL1_1_1">
				                                        <button type="button">상점홍보</button>
				                                    </div>
				                                    <div class="ERL1_1_1">
				                                        <button type="button">타사이트, 어플광고</button>
				                                    </div>
				                                    <div class="ERL1_1_2">
				                                        <input type="text" placeholder="기타(사유)">
				                                        <button type="button">등록</button>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="enquireReportList">
				                                <div class="ERL1">
				                                    <span>언어폭력(비방, 욕설, 성희롱)</span>
				                                    <button type="button">
				                                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAQCAYAAAAI0W+oAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAXNJREFUeNqslK1Pw1AUxV9fmoq5Ldl/MCSaBLkEAQkIPgxzTUABjoRMsAJmCQ4HJGAAw8yCwGFQaCyOKSpgZmIGzk1OyU1Zu7fRm/yWvtvec1777p0XRVFgjLkGZ+DFFBtzYBeEPn5uwAZYAPPgrSCTGngAVRBY/HTBNxOPoFKASYVaVWp3xegWRGoX97KDf5gE1KhxfSwelosTGkrUwRXwpjDxWFvnWjSP5CIxktcLwRPXDdCawqjFWkOtkNq/RhJDsKaa4VAVuUSDNYYa69Q0aSOJL7AI4hGfIS/0546p8akfsCOKZDfLYMCD7aiDzWrjDp8dsPbPiNiMYhncLX7fsmrVdCQjUeaz21lDb3N2egeaqeErqfsl5pK3barOnchIog3O1d/JBc9BuGTO8LqdJ+Q7HPQemOGBS2e9M7+p2nhnnIiLkbToKngGs+BA3XvlveE4Ees4I32wBD5ULmau7yLgTzCQPbAC9rk+Zc4pfgQYAOZsSsrHKCoBAAAAAElFTkSuQmCC"
				                                            width="13" height="8" alt="화살표 아이콘">
				                                    </button>
				                                </div>
				                                <div class="ERL1_1">
				                                    <div class="ERL1_1_1">
				                                        <button type="button">비방/욕설</button>
				                                    </div>
				                                    <div class="ERL1_1_1">
				                                        <button type="button">성희롱</button>
				                                    </div>
				                                    <div class="ERL1_1_2">
				                                        <input type="text" placeholder="기타(사유)">
				                                        <button type="button">등록</button>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="enquireReportList">
				                                <div class="ERL1">
				                                    <span>기타사유(직접입력)</span>
				                                    <button type="button">
				                                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAQCAYAAAAI0W+oAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAXNJREFUeNqslK1Pw1AUxV9fmoq5Ldl/MCSaBLkEAQkIPgxzTUABjoRMsAJmCQ4HJGAAw8yCwGFQaCyOKSpgZmIGzk1OyU1Zu7fRm/yWvtvec1777p0XRVFgjLkGZ+DFFBtzYBeEPn5uwAZYAPPgrSCTGngAVRBY/HTBNxOPoFKASYVaVWp3xegWRGoX97KDf5gE1KhxfSwelosTGkrUwRXwpjDxWFvnWjSP5CIxktcLwRPXDdCawqjFWkOtkNq/RhJDsKaa4VAVuUSDNYYa69Q0aSOJL7AI4hGfIS/0546p8akfsCOKZDfLYMCD7aiDzWrjDp8dsPbPiNiMYhncLX7fsmrVdCQjUeaz21lDb3N2egeaqeErqfsl5pK3barOnchIog3O1d/JBc9BuGTO8LqdJ+Q7HPQemOGBS2e9M7+p2nhnnIiLkbToKngGs+BA3XvlveE4Ees4I32wBD5ULmau7yLgTzCQPbAC9rk+Zc4pfgQYAOZsSsrHKCoBAAAAAElFTkSuQmCC"
				                                            width="13" height="8" alt="화살표 아이콘">
				                                    </button>
				                                </div>
				                                <div class="ERL1_1">
				                                    <div class="ERL1_1_Other">
				                                        <textarea></textarea>
				                                        <button type="button">등록</button>
				                                    </div>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				                <div class="jywRSH"></div>
				            </div>
				
				        </div>
					
					</div>
	          	
                </div>
                
                <div class="snsContainer">
		            <div class="snsBox">
		                <button type="button" class="blog">
		                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAkCAYAAADy19hsAAAAAXNSR0IArs4c6QAAA3tJREFUWAnVmE1IlEEYx+dVs7Wy1KLA04JBlwIDvYZ6qE7ZJSjoUp30khB0iaBIL4LYyU4VQoegS96qg0rQyUApD3mI9qKncqW11Fbdnt+4s43zfiyaq+/+YXbmnc/fPM8zs7uvpxzlcrmkVF2WVOc07fZjShYc9zyP3C9AJY1JipvGBChpiD0KUtEs2ZikvbYqOEFakMp2sfaUJ7BAfpMUV1izgZQUzlbIR4+kuMMKokpK6sHCWJeHclAK4Fw5kBpGQqKsVHbAVa55V+dmVOZ1v65OtF5SNa2dbhf9nB66pf58ndDttZ13lVdTG9hvpyt9wOtLGQ3CQtUnW4qutzQxotbm51R999OifXeiw7ZDorKhsbA+lsYzuyGfhe1Fsfbv9y/UyjRfgkrZIXL46iNtWWDR2vysqmo8pct8rEyPiqc+qtXZGR0u1U0tOnzc0MFDWemHl/Aoc5jNJ1o6lW0Y5o0EBtYWcEwOLGIBA8wi+093qJxscuF5T6HejGcDi++eqIbuZ4WN/Xx5XwFsZOYyz/uaWn3AWw4JFsByYQLKXdj03djMbf3IHDas6VMsjwTGfcfuvVEnBj5p65nJsFaY7LZDF7r02HqxqhGuxxvZfChRTxgc7/2gkx1WZoydRwInxMUmhg6cu14YR1yGCSCjg+e7dJH4tUE4G7YSZzp0nGMgylGKBF4WS2INXGnHs9lE0MR22y8JD4TrzUHiucK5s5c/j+pDx2YpRyny0AH6Y+CKb3wi5MuEjnzRLL7dACU3ZTMJliZ5idpCG5v53nfRdInMIy0cNJK4xMVhIgy4LYIE6JFrvboJT5jbxu7rXnt2G2XfrzWsmpUdI1yXnf2i1tMbcenei7hwLd9WWd9YiHfGcgu4BytoI8zBQc0tZxTXGGUTfhxW1zg+YBbbC7FBvnwyI/36zMBw9M6rTYeVusgYpsNuKT10c9NS1WJt+2YxjVuOYTOwlDmwdTceBy4Rq5CA0D0LLjXAZfWfjpAYdncR4+dh8yJlUiCbYwwK2pS8SNHvJXhop4JCTAUbjErfEkK+kK94KDnluAgWmHhNpbm8IDI5iG1Sn8wnyYqKf6rNRXpNSfu/X+vRnVPSnBLI8ehu22yVDfLmMy0pTLQltzl9aYYJ0IMwWtpKs+p/zipgkwHQ3EDxlMC2BQC3xZM2TyXAgxb04E7D/gXP5HEhGvl4rAAAAABJRU5ErkJggg=="
		                        width="22" height="18" alt="블로그 아이콘">
		                </button>
		                <button type="button" class="facebook">
		                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAeCAYAAAAl+Z4RAAAAAXNSR0IArs4c6QAAALRJREFUOBFjZMAD/v//bweUDgNiWyBWAmIeICYMgBr5gHgPEBMEWE0D6tpBUCdUAYYBQHFXYjWD1DFhmMDAkIRFjHghoKHP8LjgIFBOE69peDSDpHTRNTOiC4BUoYsh8ZkYGRlR5LGFAZJ6VCa6ZpAsIwEbUU1gYDiLJnCdBU2AENcYXQFJXkDXDOIPvAGgMDBBc9oZND4yNx2ZA2S/JikdAKMRQ/3Ah8GoCwZDShyNhcEQCwBSL924weeuygAAAABJRU5ErkJggg=="
		                        width="8" height="15" alt="페이스북 아이콘">
		                </button>
		                <button type="button" class="twitter">
		                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAaCAYAAADWm14/AAAAAXNSR0IArs4c6QAAAmVJREFUSA21l8tLVFEYwOemhWKLEh/4yAIVkcCVrkJolbVxESiubdUmyJaC4GZ0YVSzSRAEQfAfaKErewhpC8VAxdcqy1epKPiW8ffd5lzOHefO3OPM/eDH953vfI/juWfOvYZCGZJoNGrBC/gCO3AI89AHhfFt8DXCLduPcRNexwf5HZNbBV/BS7aYaIFqeAXf4b1Tn8FzEHnrOH0a5NyGFUk2kCVi7zotGHRryR+xs53JFAaxA1quH/MzQZXQCk/s8hgfQJcZBg0peoeIKYILPdGHvRmL+Yb+/4divEmQKIUjcMdrIcw1J8jz45ogKN+py6AuSdYRcyPwFLKcJAzG7WAq0jxH1bG3wLKsnzjHcDapCU1LcFuMdeKmsJdgGUrBVGbpd3wlicKlIA2Cli69+Q0Z0LEDJRMROIAgZUMvrn5uv3Ea3wF6IQP7jx5ryYAdKEGtQq6MA5QLahdyBnZVD/sR4FjH0aecAeofenPpYy8g1rAH/SlmB6VGkxbmUWRBGPYg03JKwXvxC9B3QOYqQA5kGFyHhXG6MsT2/4ovYh9C5WSFctMtQLXyZUjL4athAXLQXeLaAQIk8CWcuKLSH4QTNfcsy07ISyZT50A+VFzvEM/G+gRJ+dALk7AP15Ftksr1usY2BWpAFmEqayQ8NG6oEkh+AO9APi5NZZGE+6pWMi1fsrUE5IF8oxVAHTwG+SIyfXZRcoahg0P3F51aWIC8hvvhDNKRaZIfpe7oEUFyGXTCKviVfwQOwjNw/aQ92lxxuy4iNUsxuYgaoR6KQf6xkDtCbke5KUXPwThbfY6+tlwCs6a6dPJWGwwAAAAASUVORK5CYII="
		                        width="16" height="13" alt="트위터 아이콘">
		                </button>
		                <button type="button" class="share">
		                    <img src="data:image/png;base64,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"
		                        width="25" height="25" alt="url 공유 아이콘"><span class="urlClick">클릭하여 복사하기</span>
		                </button>
		            </div>
		            <!-- 오른쪽 하단 상점정보 컨테이너 -->
		            <div class="sidcContaienr">
		                <div class="sideBox1">
		                    <div class="sideTitle">상점정보</div>
		                    <div class="sideBox2">
		                        <div class="sideBox3">
		                            <a class="sideLink" href="./yourshop1.jsp?m_idx=<%=product.getMemidx() %>">
		                            	<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAbQAAAG0CAYAAABaNNJGAAAAAXNSR0IArs4c6QAAHX1JREFUeAHt3Q1T28YWBmBD8wnT//87Ow2hJbS9OeTaCWCzli3Je84+mmFCkC3vPmfDG0nr9dXDw8N/GxsBAgQIEEgucJ28/ZpPgAABAgSeBASagUCAAAECJQQEWoky6gQBAgQICDRjgAABAgRKCAi0EmXUCQIECBAQaMYAAQIECJQQEGglyqgTBAgQICDQjAECBAgQKCEg0EqUUScIECBAQKAZAwQIECBQQkCglSijThAgQICAQDMGCBAgQKCEgEArUUadIECAAAGBZgwQIECAQAkBgVaijDpBgAABAgLNGCBAgACBEgICrUQZdYIAAQIEBJoxQIAAAQIlBARaiTLqBAECBAgINGOAAAECBEoICLQSZdQJAgQIEBBoxgABAgQIlBAQaCXKqBMECBAgINCMAQIECBAoISDQSpRRJwgQIEBAoBkDBAgQIFBCQKCVKKNOECBAgIBAMwYIECBAoISAQCtRRp0gQIAAAYFmDBAgQIBACQGBVqKMOkGAAAECAs0YIECAAIESAgKtRBl1ggABAgQEmjFAgAABAiUEBFqJMuoEAQIECAg0Y4AAAQIESggItBJl1AkCBAgQEGjGAAECBAiUEBBoJcqoEwQIECAg0IwBAgQIECghINBKlFEnCBAgQECgGQMECBAgUEJAoJUoo04QIECAgEAzBggQIECghIBAK1FGnSBAgAABgWYMECBAgEAJAYFWoow6QYAAAQICzRggQIAAgRICAq1EGXWCAAECBASaMUCAAAECJQQEWoky6gQBAgQICDRjgAABAgRKCAi0EmXUCQIECBAQaMYAAQIECJQQEGglyqgTBAgQICDQjAECBAgQKCEg0EqUUScIECBAQKAZAwQIECBQQkCglSijThAgQICAQDMGCBAgQKCEgEArUUadIECAAAGBZgwQIECAQAkBgVaijDpBgAABAgLNGCBAgACBEgICrUQZdYIAAQIEBJoxQIAAAQIlBARaiTLqBAECBAgINGOAAAECBEoICLQSZdQJAgQIEBBoxgABAgQIlBAQaCXKqBMECBAgINCMAQIECBAoISDQSpRRJwgQIEBAoBkDBAgQIFBCQKCVKKNOECBAgIBAMwYIECBAoISAQCtRRp0gQIAAAYFmDBAgQIBACQGBVqKMOkGAAAECAs0YIECAAIESAgKtRBl1ggABAgQEmjFAgAABAiUEBFqJMuoEAQIECAg0Y4AAAQIESggItBJl1AkCBAgQEGjGAAECBAiUEBBoJcqoEwQIECAg0IwBAgQIECghINBKlFEnCBAgQECgGQMECBAgUEJAoJUoo04QIECAgEAzBggQIECghIBAK1FGnSBAgAABgWYMECBAgEAJAYFWoow6QYAAAQICzRggQIAAgRICAq1EGXWCAAECBASaMUCAAAECJQQEWoky6gQBAgQICDRjgAABAgRKCAi0EmXUCQIECBAQaMYAAQIECJQQEGglyqgTBAgQICDQjAECBAgQKCEg0EqUUScIECBAQKAZAwQIECBQQkCglSijThAgQICAQDMGCBAgQKCEgEArUUadIECAAAGBZgwQIECAQAkBgVaijDpBgAABAgLNGCBAgACBEgICrUQZdYIAAQIEBJoxQIAAAQIlBARaiTLqBAECBAgINGOAAAECBEoICLQSZdQJAgQIEBBoxgABAgQIlBAQaCXKqBMECBAgINCMAQIECBAoISDQSpRRJwgQIEBAoBkDBAgQIFBCQKCVKKNOECBAgIBAMwYIECBAoISAQCtRRp0gQIAAAYFmDBAgQIBACQGBVqKMOkGAAAEC7xAQIDCvwD///LN5eHjYPD4+bv7999+nr6urq81vv/22ub6+3rx//37z4cOHeV/U0QgQ2Fx9/4f3HwcCBM4XiAD7+vXrJgKttUXAffz4cfP58+fWQ+0nQOBIAYF2JJSHETgkEGdh9/f3T2dlhx5z6Odxxhah5oztkJCfEzheQKAdb+WRBF4JRJD99ddfr34+9QdxOfL29vbpsuTU53o8AQI/BASakUDgBIG4RxZhFmdnc25xGfLTp09P99rmPK5jERhBQKCNUGV9nE0g7o/d3d0ddZ/s1BeN+2sRavFlI0DgeAGBdryVRw4sEGdicWnx77//Xk0h7q/d3Nw8zYpc7UW9EIHEAgItcfE0fR2BCLL4+u+/y0wIfvfu3VOwxX02GwEChwUE2mEbewYX+Pbt29N9smOm4a9BFTMh44wtLknaCBB4LSDQXpv4yeACEWDxfrJ4X1lvW4RZTPOPySM2AgSeCwi05x7+NrBAXFKMmYtr3ic7lTsuP0awxaojNgIEfggINCOBwHeBCLEIs0vdJzu1CBFoEWzur50q6HmVBARapWrqy2SBKctVTT74ik/YLqPl/tqK6F6qOwGB1l1JNGgNgbhPFmdkMfGjyhZhFpNGLKNVpaL6MVVAoE0V8/jUAnFJcTsNP3VH3mh8XH6MYIvp/jYCIwkItJGqPXhf4z5ZhNncy1X1yhpnanF/Ld6gbSMwgoBAG6HKg/dxjeWqeibeLqPl/lrPVdK2OQQE2hyKjtGlwDkf69Jlh85oVJylRbB5/9oZiJ7avYBA675EGniKQFxajEkftucCcX/Nx9Q8N/G3OgICrU4t9eS7wFIf61IN1/21ahXVnxAQaMZBCYF4P1mckfW4XFXPwDFpxMfU9FwhbZsiINCmaHlsdwIxDT/WXYwzM9tpAnF/LYLN+9dO8/OsfgQEWj+10JKJAlmXq5rYzdUeHu9bi2Dz/rXVyL3QzAICbWZQh1teoLePdVm+x+u+gmW01vX2avMJCLT5LB1pYYGKy1UtTHby4eM9a9v3r518EE8ksLKAQFsZ3MtNF8j0sS7Te9f3M3xMTd/10brnAgLtuYe/dSbgPlkfBYn7arE+pI+p6aMeWrFfQKDtd/HTCwuYhn/hAhx4effXDsD4cRcCAq2LMmjEVsByVVuJfv+M+2sxG9IyWv3WaNSWCbRRK99hv+ON0bFklS2HgI+pyVGnkVop0Eaqdqd9tVxVp4U5slnv379/OmNzf+1IMA9bTECgLUbrwC2BmIYfq3xYrqollWP/dpq/j6nJUa+KrRRoFavaeZ9Mw++8QGc0z/21M/A89WwBgXY2oQNMEYh7ZPEVoWarK2AZrbq17blnAq3n6hRqm+WqChVzQld8TM0ELA89W0CgnU3oAG8JWK7qLZ1x9sX9tZjqbyOwpIBAW1J34GO7TzZw8Q903cfUHIDx49kEBNpslA60FbBc1VbCn/sEYnr/7e2tZbT24fjZWQIC7Sw+T/5VIKbfxzT8uMxoI9ASiJVG4lJknLnZCMwhINDmUBz8GLFcVQRZTPywEZgi4GNqpmh5bEtAoLWE7D8oEPfJttPwDz7IDgJHCLi/dgSShzQFBFqTyAP2CcRlxS9fvmzi7MxGYC6BWEYr7q9ZbWQu0bGOI9DGqvcsvY21F+/u7mY5loMQeClg0shLEX8/VsDd2GOlPO5JICZ+CDODYUmB7dm/1WSWVK55bIFWs66L9Cp+wQizRWgd9IVAXMqOS9o2AlME3k15sMeOLRAzGd0z23R1f6fyWUxcDYj3NPog0bF/70zpvUCbojXwY+MXZ9w7G3mLdQlvbm66CrSoR7xdIs6cK4ZbzKIVaCP/q5vWd5ccp3kN++jRw2w7UaHH2XfbD9isODjjikCcpdkIHCMg0I5R8pjh3zQdodHz1nv7zrHzhv1z9MZ6rkAbq94n93b0e2e9B0bl+vhE85P/2Q73RIE2XMlP6/DI6zPGZcb4wMqet8q/9CveG+x5LGVum0DLXD1tX0Wg97OzQHCfaZWh4EU6FxBonRdI8y4v0HugxYSdypccLz8CtCCLgEDLUintvJhA75cbnZ1dbGh44c4EBFpnBdGcvgRiun7Pn9cV9zYr3z/razRoTe8CAq33CmnfRQWcnV2U34sTmCQg0CZxefBoAj3fP4vZfy43jjYi9fctAYH2lo59wwv0fIYmzIYfngBeCAi0FyD+SmArEGHW41JX2/YJtK2EPwn8EBBoRgKBAwI9X26M5aBM1T9QOD8eVkCgDVt6HW8J9BxosQq9jQCB5wIC7bmHvxF4EohLjTFlv8fNVP0eq6JNPQgItB6qoA3dCfR8dubeWXfDRYM6ERBonRRCM/oS6HV2ow9a7WucaE1fAgKtr3poTScCvZ6hxbqNVp/vZJBoRncCAq27kmjQpQV6Xu7K5cZLjw6v37OAQOu5Otp2EYFeLzfGVP2RP5fuIoPBi6YSEGipyqWxawj0ernR2dka1fcamQUEWubqafsiAj0GWryJOs7QbAQIHBYQaIdt7BlQoNfLjd5IPeBg1OXJAgJtMpknVBbo8ewsvGN2o40AgbcFBNrbPvYOJtDjGZqp+oMNQt09WUCgnUznidUEYrmrHgPN5cZqI01/lhIQaEvJOm46gR4vNz4+Ppqqn24kafClBATapeS9bncCPZ6dmarf3TDRoI4FBFrHxdG0dQV6O0OLqfomg6w7BrxabgGBlrt+Wj+TQI/LXTk7m6m4DjOMgEAbptQ6+pZAb2dn0VaB9lbF7CPwWkCgvTbxkwEFegu0CDOr6g84EHX5LAGBdhafJ1cR6G1CiHtnVUaWfqwpINDW1PZaXQr0dnYWU/Xjy0aAwDQBgTbNy6MLCvQWaO6dFRxkurSKgEBbhdmL9CzQ0+VGU/V7Hina1ruAQOu9Qtq3qMD19fUmpuz3sjk766US2pFR4F3GRmszgbkEervc+OHDh80SbYozv1gT0idezzVyHKdHAYHWY1W0aTWBni43RqeXPFuMoPzjjz+8HWC10eWF1hZwyXFtca/XlcASZ0NddfCXxvT6aQK/NNG3BM4SEGhn8XlyZoE4O4tf8iNtLjmOVO3x+irQxqu5Hv9foLfLjUsX5uvXr5u4l2YjUFVAoFWtrH41BUa63BgTQsygbA4JD0guINCSF1DzTxcY5Qwtguz+/v50KM8kkERAoCUplGbOKzDK2dm3b982canRRmAEAYE2QpX18ZXACIEWE0C+fPnyqu9+QKCqgECrWln9elOg+uXGCLM///zzTQM7CVQTEGjVKqo/TYHelrtqNnjiA2ImY5yZ+Ty1iXAenl5AoKUvoQ5MFah8uTFCLMLM9Pypo8LjKwgItApV1IdJApUvN0aYefP0pOHgwYUEBFqhYurKcQJVz9Du7u58MOhxQ8CjigoItKKF1a39ArH4b8XlrmJq/sPDw/5O+ymBQQQE2iCF1s0fAhXPzqwCYnQT+CEg0IyEoQSqBZpVQIYavjrbEBBoDSC76whU+/gUq4DUGZt6Mo+AQJvH0VESCCz54Zlrd98qIGuLe70MAgItQ5W0cRaBKu/NsgrILMPBQQoKCLSCRdWl/QIRaNlnAloFZH9t/ZRACLzDQGAkgXivVpzhzDk5JO7NrXE50yogI41UfT1FQKCdouY5qQVimnt8zbXd3NysEmhWAZmrYo5TVcAlx6qV1a/VBD58+LD4a1kFZHFiL1BAQKAVKKIuXE4g1oVceuURq4Bcrr5eOZeAQMtVL63tTGDpszOrgHRWcM3pWkCgdV0ejetdYM7JJS/7ahWQlyL+TuBtAYH2to+9BA4KxOXG+LDQJTargCyh6pjVBZb511hdTf8IfBdY6nKjVUAMLwKnCQi009w8i8Cs72XbcloFZCvhTwLTBQTadDPPIPD0vrO5LzdaBcTAInCegEA7z8+zBxWY+3KjVUAGHUi6PauAQJuV08FGEZh7dqNVQEYZOfq5pIBAW1LXsUsKxLqNc67daBWQksNEpy4gINAugO4lcwvMebnRKiC5x4LW9yUg0Pqqh9YkEJjrcqNVQBIUWxNTCQi0VOXS2EsLzHW50Sogl66k168oINAqVlWfFhOY4+zMKiCLlceBBxcQaIMPAN2fJnDu/TOrgEzz9mgCUwQE2hQtjx1aIN5Ifc7sRquADD18dH4FAYG2ArKXqCFwzuVGq4DUGAN60beAQOu7PlrXkcCplxutAtJRETWltIBAK11enZtLIC43xsfFnLJZBeQUNc8hMF1AoE0384wBBU693GgVkAEHiy5fTECgXYzeC2cSOOVyo1VAMlVYWysICLQKVdSHRQWurq4mX260CsiiJXFwAnsFBNpeFj8k8FNg6tmZVUB+2vmOwJoCAm1N7cSvdeqEiMRd3jV9yv0zq4Ds2Gb7Zu4PUp2tYQ7UnYBA664kfTZo1F8qcbnx2ECzCsgyY/dY/2Ve3VEzCQi0TNW6YFtH/aVybL+tArLc4Jx6yXe5ljhy7wICrfcKddK++KUy4lnaMb9MrQKy3CCNpcZGvty9nGzNIwu0mnVdpFefPn1a5Lg9H7R1hmYVkGWr9/nz52VfwNFLCQi0UuVctjMfP34c6n/Lx5ydWQVkuTEX/4Fq/YdiuVd35IwCAi1j1S7Y5tvb201MlBhha/0ytQrIcqMgLjM6O1vOt+qRBVrVyi7Ur7iP9vvvv5/1MSoLNW32w74VaFYBmZ17d8C4EhBjzEZgqoBAmyrm8U9hFr9wjrkkl5UrwuzQmahVQJapanjf3Nw8fS3zCo5aXeC05cOrq+hfUyB++cTlx/jf9P39/ebx8bH5nEwPODSj0yogy1QxxlFcYjz0n4hlXtVRqwkItGoVXbk/ca8jztYeHh42cRkuZv1V2OJ9ZS83q4C8FDn/79t7Zabmn2/pCJvN1fdfRDV+A6nmxQUizOJsLc5iKmxxSTVm2sVZgzCbt6JxBhxnZJUvW88r5mjHCAi0Y5Q8ZpJAnN1EsEUI2Ai8FIggG/E9jS8d/H1+AYE2v6kj/l8gAi2Cbd/lO0jjCcTZWITZofuT44no8dwCAm1uUcd7JRCzAuOryv21Vx30gzcFYvmqmEAUf9oILCkg0JbUdeydQLX7a7uO+eagQJyJxaXFmMFoI7CGgEBbQ9lr7ARien/Faf67DvrmSSCCLC4v2gisKSDQ1tT2WjuBmOYfwRYr1dvqCLhPVqeWGXsi0DJWrVCb495aBJstt4D3k+WuX5XWC7QqlUzcjzhLi1CLszZbLoF4j15cWnSfLFfdqrZWoFWtbMJ+xf21WG3ENP8cxYv7ZPFluaoc9RqhlQJthCon62OsNBKXIt1f67NwsXBznJWZht9nfUZulUAbufod9z2m+W/fv9ZxM4dqWgRYrIZv3cWhyp6qswItVbnGa6xltC5fc/fJLl8DLThOQKAd5+RRFxZwf+0yBfCxLpdx96qnCQi009w860IC288js4zWsgVwn2xZX0dfRkCgLePqqAsKWEZrOdy4TxYTPiLQbASyCQi0bBXT3p1A3F+Laf7VPi1718EVv3GfbEVsL7WYgEBbjNaB1xLYfvimaf6nicdyVTF70fvJTvPzrH4EBFo/tdCSMwW20/zdXzsOMqbfR5B5P9lxXh7Vv4BA679GWjhBIM7SIthi8ohtv4D7ZPtd/DS/gEDLX0M92CMQ99fu7u4so/WLTVxS3C5X9cuPfUugjIBAK1NKHdkn4GNqfqh4P9m+0eFn1QQEWrWK6s9egVjNPy5Fjrb5WJfRKj52fwXa2PUfqvcjfUzN9fX10/vJYgajjcAoAgJtlErr504g3rcWZ2xV378Wb4yOe2U2AqMJCLTRKq6/O4G4vxZvzK4yzT/OxiLM4uzMRmBEAYE2YtX1eSdQYRmtmIZ/e3vr/WS7qvpmVAGBNmrl9fuZQMaPqYkzsbi0GDMYbQQIbDYCzSgg8ItALKMV99ci4HreIsji8qKNAIGfAgLtp4XvCOwEev2YGvfJdiXyDYFXAgLtFYkfEPgh0NP9Ne8nMyoJtAUEWtvIIwYXuOQ0fx/rMvjg0/1JAgJtEpcHjyyw9jJa23UXfazLyKNO36cICLQpWh5L4LtALKEVE0eW2uLTomPCh491WUrYcasKCLSqldWvRQWWWEYrAiw+nyzul9kIEJguINCmm3kGgZ1A3F+L1UbOmebvPtmO0zcEzhIQaGfxeTKBHwIxzT8uRcaZ25TNx7pM0fJYAm8LCLS3fewlcLRATPOPYIuvVrBFkMWX+2RH83oggaaAQGsSeQCB6QJxKTK+Itgi6OKyYixVFV8x6cPMxemmnkGgJSDQWkL2EyBAgEAKAZ8zkaJMGkmAAAECLQGB1hKynwABAgRSCAi0FGXSSAIECBBoCQi0lpD9BAgQIJBCQKClKJNGEiBAgEBLQKC1hOwnQIAAgRQCAi1FmTSSAAECBFoCAq0lZD8BAgQIpBAQaCnKpJEECBAg0BIQaC0h+wkQIEAghYBAS1EmjSRAgACBloBAawnZT4AAAQIpBARaijJpJAECBAi0BARaS8h+AgQIEEghINBSlEkjCRAgQKAlINBaQvYTIECAQAoBgZaiTBpJgAABAi0BgdYSsp8AAQIEUggItBRl0kgCBAgQaAkItJaQ/QQIECCQQkCgpSiTRhIgQIBAS0CgtYTsJ0CAAIEUAgItRZk0kgABAgRaAgKtJWQ/AQIECKQQEGgpyqSRBAgQINASEGgtIfsJECBAIIWAQEtRJo0kQIAAgZaAQGsJ2U+AAAECKQQEWooyaSQBAgQItAQEWkvIfgIECBBIISDQUpRJIwkQIECgJSDQWkL2EyBAgEAKAYGWokwaSYAAAQItAYHWErKfAAECBFIICLQUZdJIAgQIEGgJCLSWkP0ECBAgkEJAoKUok0YSIECAQEtAoLWE7CdAgACBFAICLUWZNJIAAQIEWgICrSVkPwECBAikEBBoKcqkkQQIECDQEhBoLSH7CRAgQCCFgEBLUSaNJECAAIGWgEBrCdlPgAABAikEBFqKMmkkAQIECLQEBFpLyH4CBAgQSCEg0FKUSSMJECBAoCUg0FpC9hMgQIBACgGBlqJMGkmAAAECLQGB1hKynwABAgRSCAi0FGXSSAIECBBoCQi0lpD9BAgQIJBCQKClKJNGEiBAgEBLQKC1hOwnQIAAgRQCAi1FmTSSAAECBFoCAq0lZD8BAgQIpBAQaCnKpJEECBAg0BIQaC0h+wkQIEAghYBAS1EmjSRAgACBloBAawnZT4AAAQIpBARaijJpJAECBAi0BARaS8h+AgQIEEghINBSlEkjCRAgQKAlINBaQvYTIECAQAoBgZaiTBpJgAABAi0BgdYSsp8AAQIEUggItBRl0kgCBAgQaAkItJaQ/QQIECCQQkCgpSiTRhIgQIBAS0CgtYTsJ0CAAIEUAgItRZk0kgABAgRaAgKtJWQ/AQIECKQQEGgpyqSRBAgQINASEGgtIfsJECBAIIWAQEtRJo0kQIAAgZaAQGsJ2U+AAAECKQQEWooyaSQBAgQItAQEWkvIfgIECBBIISDQUpRJIwkQIECgJSDQWkL2EyBAgEAKAYGWokwaSYAAAQItAYHWErKfAAECBFIICLQUZdJIAgQIEGgJCLSWkP0ECBAgkEJAoKUok0YSIECAQEtAoLWE7CdAgACBFAICLUWZNJIAAQIEWgICrSVkPwECBAikEBBoKcqkkQQIECDQEhBoLSH7CRAgQCCFgEBLUSaNJECAAIGWgEBrCdlPgAABAikEBFqKMmkkAQIECLQEBFpLyH4CBAgQSCEg0FKUSSMJECBAoCUg0FpC9hMgQIBACgGBlqJMGkmAAAECLQGB1hKynwABAgRSCAi0FGXSSAIECBBoCQi0lpD9BAgQIJBCQKClKJNGEiBAgEBLQKC1hOwnQIAAgRQCAi1FmTSSAAECBFoCAq0lZD8BAgQIpBAQaCnKpJEECBAg0BIQaC0h+wkQIEAghYBAS1EmjSRAgACBloBAawnZT4AAAQIpBARaijJpJAECBAi0BARaS8h+AgQIEEghINBSlEkjCRAgQKAlINBaQvYTIECAQAoBgZaiTBpJgAABAi0BgdYSsp8AAQIEUggItBRl0kgCBAgQaAkItJaQ/QQIECCQQkCgpSiTRhIgQIBAS0CgtYTsJ0CAAIEUAgItRZk0kgABAgRaAgKtJWQ/AQIECKQQEGgpyqSRBAgQINASEGgtIfsJECBAIIWAQEtRJo0kQIAAgZaAQGsJ2U+AAAECKQQEWooyaSQBAgQItAQEWkvIfgIECBBIIfA/ypeqVpGQ7DMAAAAASUVORK5CYII=" width="48" height="48" alt="판매자 프로필 이미지">
		                            </a>
		                            <div>
		                                <a class="sideTxt" href="/shop/1671876/products"><%=pDAO.storeName(Integer.parseInt(p_idx))%></a>
		                                <div class="UpBox">
		                                    <a class="shopUp" href="/shop/1671876/products">상품<%=pDAO.storeProductCnt(Integer.parseInt(p_idx)) %></a> 
		                                    <a class="shopUp" href="/shop/1671876/followers">팔로워<%=pDAO.storeFollwer(Integer.parseInt(p_idx)) %></a>
		                                </div>
		                            </div>
		                        </div>
		                        <button class="followButton">
		                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAcCAYAAAATFf3WAAAAAXNSR0IArs4c6QAAAfZJREFUWAntVrFOAkEQ5VYjjZ9gjKWcP0BNYeIPkFjYaWHUxo6CC4GCzkpiY2dhwg+YUEBBox8gWBo+wMoGizvn4WKysLN3c3diwybHZmfem3nM7d6sV0g4ms3mQRiGpwQ/pGdX0yY095RS90EQvGpbrpMXF63b7W6Nx+ObKIrOCasYfOh53l2pVLquVqtfDMZqbjQaERw0W7VwCWfBIG40Gj2RuAsyuLAKGGDBmZFz+nElLaBylKciyFXRHAHFDWUFYs/p1+qOsOAFB9wFc+olK1AfCNbvyKg01wFJ7nIJwGlNO7JwjZybxspczD8lpjXZaok7P60cnfO7KsjFWqndVcEJKfFTqgHXGNx3bl45zu+qYM/IIFtk4RqZWIFoX4QMDXSyRai5ydAxKFYgeivaVwx/yQ1Onn2ZFYjM6K009ZdU8Ia+5vAIoccpEI3f9/0jqkqH4rpeNy4LHWCll4U4vdYbhI30X9ctm5a1TVKB31dMtxDVarUuqdGfUIB9erYlgSzYT7K90SfnoV6v39Iede1hC/3HNBPYbrf3ptPpI5nKLDKb47lYLB7XarV3aRjchNUfi4OmMnIgl1TgBo0rIp5JiSnwO8Ph8GMwGLxIuLhcYs+tZKTJhZLjQKxqiHNBYNbTKvlz4lziTStRkwd2LTBrFb8B8aSntyo1wCwAAAAASUVORK5CYII="
		                                width="20" height="14" alt="화이트 테마 언팔로우 버튼 아이콘">팔로우
		                        </button>
		                        <!-- 상점의 최근 상품 두개 -->
		                        <div class="addBox">
		                        <%
		                        	List<HashMap<String,String>> productList = pDAO.recentProduct(Integer.parseInt(p_idx));
		                    	
		                        	for(HashMap pList : productList) {
		                        %>
		                            <div class="pdAdd">
		                                <a data-pid="135395297" class="addLink"
		                                    href="./productDetail.jsp?p_idx=<%=pList.get("p_idx") %>" >
		                                    <img src='./uploads/<%=pList.get("p_picture") %>' width="102" height="107" alt="상품 이미지">
		                                    <div class="pdAddPrice">
		                                        <span><%=pList.get("p_price")%></span>원
		                                    </div>
		                                    <div class="addStyle"></div>
		                                </a>
		                            </div>
		                            
		                        <%
		                        	}
		                        %>
		                        </div>
		                        <div class="addPlus">
		                            <a class="plusLink" href="/shop/1671876/products"> 
		                            	<span class="plus">
		                            	<%
		                            		int pCnt = pDAO.storeProductCnt(Integer.parseInt(p_idx));
		                            		if(pCnt > 2){
		                            			out.println(pCnt-2+"개</span>상품 더보기");
		                            		}else{
		                            			out.println("0개</span>상품 더보기");
		                            		}
		                            	%>
		                            		
		                            </a>
		                        </div>
		                        <div class="lateContainer">
		                            <div class="lateTitle">
		                                상점후기<span class="lateCnt">140</span>
		                            </div>
		                            <div class="lateBox1">
		                                <div class="lateBox2">
		                                    <a class="lateshop" href="/shop/2337944/products"><img
		                                            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAbQAAAG0CAYAAABaNNJGAAAAAXNSR0IArs4c6QAAHX1JREFUeAHt3Q1T28YWBmBD8wnT//87Ow2hJbS9OeTaCWCzli3Je84+mmFCkC3vPmfDG0nr9dXDw8N/GxsBAgQIEEgucJ28/ZpPgAABAgSeBASagUCAAAECJQQEWoky6gQBAgQICDRjgAABAgRKCAi0EmXUCQIECBAQaMYAAQIECJQQEGglyqgTBAgQICDQjAECBAgQKCEg0EqUUScIECBAQKAZAwQIECBQQkCglSijThAgQICAQDMGCBAgQKCEgEArUUadIECAAAGBZgwQIECAQAkBgVaijDpBgAABAgLNGCBAgACBEgICrUQZdYIAAQIEBJoxQIAAAQIlBARaiTLqBAECBAgINGOAAAECBEoICLQSZdQJAgQIEBBoxgABAgQIlBAQaCXKqBMECBAgINCMAQIECBAoISDQSpRRJwgQIEBAoBkDBAgQIFBCQKCVKKNOECBAgIBAMwYIECBAoISAQCtRRp0gQIAAAYFmDBAgQIBACQGBVqKMOkGAAAECAs0YIECAAIESAgKtRBl1ggABAgQEmjFAgAABAiUEBFqJMuoEAQIECAg0Y4AAAQIESggItBJl1AkCBAgQEGjGAAECBAiUEBBoJcqoEwQIECAg0IwBAgQIECghINBKlFEnCBAgQECgGQMECBAgUEJAoJUoo04QIECAgEAzBggQIECghIBAK1FGnSBAgAABgWYMECBAgEAJAYFWoow6QYAAAQICzRggQIAAgRICAq1EGXWCAAECBASaMUCAAAECJQQEWoky6gQBAgQICDRjgAABAgRKCAi0EmXUCQIECBAQaMYAAQIECJQQEGglyqgTBAgQICDQjAECBAgQKCEg0EqUUScIECBAQKAZAwQIECBQQkCglSijThAgQICAQDMGCBAgQKCEgEArUUadIECAAAGBZgwQIECAQAkBgVaijDpBgAABAgLNGCBAgACBEgICrUQZdYIAAQIEBJoxQIAAAQIlBARaiTLqBAECBAgINGOAAAECBEoICLQSZdQJAgQIEBBoxgABAgQIlBAQaCXKqBMECBAgINCMAQIECBAoISDQSpRRJwgQIEBAoBkDBAgQIFBCQKCVKKNOECBAgIBAMwYIECBAoISAQCtRRp0gQIAAAYFmDBAg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"
		                                            width="32" height="32" alt="리뷰 쓴 사람 프로필 이미지"></a>
		                                    <div class="lateBox3">
		                                        <div class="lateBox4">
		                                            <a class="lateName" href="/shop/2337944/products">상점명0428</a>
		                                            <div class="lateDate">1주 전</div>
		                                        </div>
		                                        <div class="starBox">
		                                            <div class="Star">
		                                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAArVJREFUSA2tVs1rE0EUf28TWr8uBQU/AqLGhAh+QWhrTECwePJiC1r0IHit4MU/Qw8evAoe9OZRTwqCNVEpaC+Wpqle4gfiURobdvN8b9JdZ7a7k822C8u++b3fx87sZFqAlBc1jpfkTikHJ60Qer1pdac0SB9MOANyp7wwjY7eF49Q1/0iWhzJHsWJ5a/D+qSbcdedDoL0OgAHF+mCUVtivR6cFzCGXmqaLx4EcNtEoLSIQADZHFaXvweuCYrhZ0zeFT9U/FXNWIIsgzJ8MNL/7+tbRWF+L+Y51FLTQmEvdLyfvLYZ3Y9NPNiZ2Y/l5m8dt9VZqufPAmZ22UhBb92bCodKTzBc781Ro/gy4NoK8tZQHXsePSWiMzbudvUQ8RO/5nUHz60swdjoBKJzr79DtyvC9BFvyVBZnGl8Y6oXLvL5+5hnf8iUbW3Es/wGjnMTK81XvpOxq1XDGT3FxGc+YatP5SWeWqh4GjPWQ+hN/haPHxDQHh1PWiPgH+bewVrrUZQmNljIVD+WBw+fcPh4lDgO49APkKEbWFltxXPiOhs40YUszLcXOfzEAKpqc+hnqOZOI752bXzjG0cSP7bHGC9E9qLBAvQ10d0NdHDwGs7wbLNWF62puKzRoMhycDDRbKTSBibQ2DfXQukA/O3Kn8BNL8hCdTzycTkVfgc+LHqwYySH5aUf4Z4/3mToN9Sz414Nh/Lvssuhd6HauiS31ILpOqVhrY6Fa3sw0jVdoHYsOeNYW73PYXwE8s01CCa7Wb9CWr0ldWwwvS0d5l/ypC/gkIeQ2VfGWnPRx/ynwqQnnOCiyb5HABhFbDCQWmb2gl/oOJex2rqNlUbHUGsD6SmOcFnT/88kfrktwTTLBi8Ad5/E8yvPtQxrqbiiEW2C3W2Y0bt8js/qOQNMMRAP8YqS/gMbzegG1X8tjgAAAABJRU5ErkJggg=="
		                                                    width="15" height="14" alt="작은 별점 2점 이미지"><img
		                                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAArVJREFUSA2tVs1rE0EUf28TWr8uBQU/AqLGhAh+QWhrTECwePJiC1r0IHit4MU/Qw8evAoe9OZRTwqCNVEpaC+Wpqle4gfiURobdvN8b9JdZ7a7k822C8u++b3fx87sZFqAlBc1jpfkTikHJ60Qer1pdac0SB9MOANyp7wwjY7eF49Q1/0iWhzJHsWJ5a/D+qSbcdedDoL0OgAHF+mCUVtivR6cFzCGXmqaLx4EcNtEoLSIQADZHFaXvweuCYrhZ0zeFT9U/FXNWIIsgzJ8MNL/7+tbRWF+L+Y51FLTQmEvdLyfvLYZ3Y9NPNiZ2Y/l5m8dt9VZqufPAmZ22UhBb92bCodKTzBc781Ro/gy4NoK8tZQHXsePSWiMzbudvUQ8RO/5nUHz60swdjoBKJzr79DtyvC9BFvyVBZnGl8Y6oXLvL5+5hnf8iUbW3Es/wGjnMTK81XvpOxq1XDGT3FxGc+YatP5SWeWqh4GjPWQ+hN/haPHxDQHh1PWiPgH+bewVrrUZQmNljIVD+WBw+fcPh4lDgO49APkKEbWFltxXPiOhs40YUszLcXOfzEAKpqc+hnqOZOI752bXzjG0cSP7bHGC9E9qLBAvQ10d0NdHDwGs7wbLNWF62puKzRoMhycDDRbKTSBibQ2DfXQukA/O3Kn8BNL8hCdTzycTkVfgc+LHqwYySH5aUf4Z4/3mToN9Sz414Nh/Lvssuhd6HauiS31ILpOqVhrY6Fa3sw0jVdoHYsOeNYW73PYXwE8s01CCa7Wb9CWr0ldWwwvS0d5l/ypC/gkIeQ2VfGWnPRx/ynwqQnnOCiyb5HABhFbDCQWmb2gl/oOJex2rqNlUbHUGsD6SmOcFnT/88kfrktwTTLBi8Ad5/E8yvPtQxrqbiiEW2C3W2Y0bt8js/qOQNMMRAP8YqS/gMbzegG1X8tjgAAAABJRU5ErkJggg=="
		                                                    width="15" height="14" alt="작은 별점 2점 이미지"><img
		                                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAArVJREFUSA2tVs1rE0EUf28TWr8uBQU/AqLGhAh+QWhrTECwePJiC1r0IHit4MU/Qw8evAoe9OZRTwqCNVEpaC+Wpqle4gfiURobdvN8b9JdZ7a7k822C8u++b3fx87sZFqAlBc1jpfkTikHJ60Qer1pdac0SB9MOANyp7wwjY7eF49Q1/0iWhzJHsWJ5a/D+qSbcdedDoL0OgAHF+mCUVtivR6cFzCGXmqaLx4EcNtEoLSIQADZHFaXvweuCYrhZ0zeFT9U/FXNWIIsgzJ8MNL/7+tbRWF+L+Y51FLTQmEvdLyfvLYZ3Y9NPNiZ2Y/l5m8dt9VZqufPAmZ22UhBb92bCodKTzBc781Ro/gy4NoK8tZQHXsePSWiMzbudvUQ8RO/5nUHz60swdjoBKJzr79DtyvC9BFvyVBZnGl8Y6oXLvL5+5hnf8iUbW3Es/wGjnMTK81XvpOxq1XDGT3FxGc+YatP5SWeWqh4GjPWQ+hN/haPHxDQHh1PWiPgH+bewVrrUZQmNljIVD+WBw+fcPh4lDgO49APkKEbWFltxXPiOhs40YUszLcXOfzEAKpqc+hnqOZOI752bXzjG0cSP7bHGC9E9qLBAvQ10d0NdHDwGs7wbLNWF62puKzRoMhycDDRbKTSBibQ2DfXQukA/O3Kn8BNL8hCdTzycTkVfgc+LHqwYySH5aUf4Z4/3mToN9Sz414Nh/Lvssuhd6HauiS31ILpOqVhrY6Fa3sw0jVdoHYsOeNYW73PYXwE8s01CCa7Wb9CWr0ldWwwvS0d5l/ypC/gkIeQ2VfGWnPRx/ynwqQnnOCiyb5HABhFbDCQWmb2gl/oOJex2rqNlUbHUGsD6SmOcFnT/88kfrktwTTLBi8Ad5/E8yvPtQxrqbiiEW2C3W2Y0bt8js/qOQNMMRAP8YqS/gMbzegG1X8tjgAAAABJRU5ErkJggg=="
		                                                    width="15" height="14" alt="작은 별점 2점 이미지"><img
		                                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAArVJREFUSA2tVs1rE0EUf28TWr8uBQU/AqLGhAh+QWhrTECwePJiC1r0IHit4MU/Qw8evAoe9OZRTwqCNVEpaC+Wpqle4gfiURobdvN8b9JdZ7a7k822C8u++b3fx87sZFqAlBc1jpfkTikHJ60Qer1pdac0SB9MOANyp7wwjY7eF49Q1/0iWhzJHsWJ5a/D+qSbcdedDoL0OgAHF+mCUVtivR6cFzCGXmqaLx4EcNtEoLSIQADZHFaXvweuCYrhZ0zeFT9U/FXNWIIsgzJ8MNL/7+tbRWF+L+Y51FLTQmEvdLyfvLYZ3Y9NPNiZ2Y/l5m8dt9VZqufPAmZ22UhBb92bCodKTzBc781Ro/gy4NoK8tZQHXsePSWiMzbudvUQ8RO/5nUHz60swdjoBKJzr79DtyvC9BFvyVBZnGl8Y6oXLvL5+5hnf8iUbW3Es/wGjnMTK81XvpOxq1XDGT3FxGc+YatP5SWeWqh4GjPWQ+hN/haPHxDQHh1PWiPgH+bewVrrUZQmNljIVD+WBw+fcPh4lDgO49APkKEbWFltxXPiOhs40YUszLcXOfzEAKpqc+hnqOZOI752bXzjG0cSP7bHGC9E9qLBAvQ10d0NdHDwGs7wbLNWF62puKzRoMhycDDRbKTSBibQ2DfXQukA/O3Kn8BNL8hCdTzycTkVfgc+LHqwYySH5aUf4Z4/3mToN9Sz414Nh/Lvssuhd6HauiS31ILpOqVhrY6Fa3sw0jVdoHYsOeNYW73PYXwE8s01CCa7Wb9CWr0ldWwwvS0d5l/ypC/gkIeQ2VfGWnPRx/ynwqQnnOCiyb5HABhFbDCQWmb2gl/oOJex2rqNlUbHUGsD6SmOcFnT/88kfrktwTTLBi8Ad5/E8yvPtQxrqbiiEW2C3W2Y0bt8js/qOQNMMRAP8YqS/gMbzegG1X8tjgAAAABJRU5ErkJggg=="
		                                                    width="15" height="14" alt="작은 별점 2점 이미지"><img
		                                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAArVJREFUSA2tVs1rE0EUf28TWr8uBQU/AqLGhAh+QWhrTECwePJiC1r0IHit4MU/Qw8evAoe9OZRTwqCNVEpaC+Wpqle4gfiURobdvN8b9JdZ7a7k822C8u++b3fx87sZFqAlBc1jpfkTikHJ60Qer1pdac0SB9MOANyp7wwjY7eF49Q1/0iWhzJHsWJ5a/D+qSbcdedDoL0OgAHF+mCUVtivR6cFzCGXmqaLx4EcNtEoLSIQADZHFaXvweuCYrhZ0zeFT9U/FXNWIIsgzJ8MNL/7+tbRWF+L+Y51FLTQmEvdLyfvLYZ3Y9NPNiZ2Y/l5m8dt9VZqufPAmZ22UhBb92bCodKTzBc781Ro/gy4NoK8tZQHXsePSWiMzbudvUQ8RO/5nUHz60swdjoBKJzr79DtyvC9BFvyVBZnGl8Y6oXLvL5+5hnf8iUbW3Es/wGjnMTK81XvpOxq1XDGT3FxGc+YatP5SWeWqh4GjPWQ+hN/haPHxDQHh1PWiPgH+bewVrrUZQmNljIVD+WBw+fcPh4lDgO49APkKEbWFltxXPiOhs40YUszLcXOfzEAKpqc+hnqOZOI752bXzjG0cSP7bHGC9E9qLBAvQ10d0NdHDwGs7wbLNWF62puKzRoMhycDDRbKTSBibQ2DfXQukA/O3Kn8BNL8hCdTzycTkVfgc+LHqwYySH5aUf4Z4/3mToN9Sz414Nh/Lvssuhd6HauiS31ILpOqVhrY6Fa3sw0jVdoHYsOeNYW73PYXwE8s01CCa7Wb9CWr0ldWwwvS0d5l/ypC/gkIeQ2VfGWnPRx/ynwqQnnOCiyb5HABhFbDCQWmb2gl/oOJex2rqNlUbHUGsD6SmOcFnT/88kfrktwTTLBi8Ad5/E8yvPtQxrqbiiEW2C3W2Y0bt8js/qOQNMMRAP8YqS/gMbzegG1X8tjgAAAABJRU5ErkJggg=="
		                                                    width="15" height="14" alt="작은 별점 2점 이미지">
		                                            </div>
		                                        </div>
		                                        <div class="lateTxt">진짜 판매자님 너무 너무 친절하세요ㅠㅠ.. 이 분이 판매하시는옷
		                                            다 새상...</div>
		                                    </div>
		                                </div>
		                                <div class="lateBox2">
		                                    <a class="lateshop" href="/shop/4296820/products"><img
		                                            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAbQAAAG0CAYAAABaNNJGAAAAAXNSR0IArs4c6QAAHX1JREFUeAHt3Q1T28YWBmBD8wnT//87Ow2hJbS9OeTaCWCzli3Je84+mmFCkC3vPmfDG0nr9dXDw8N/GxsBAgQIEEgucJ28/ZpPgAABAgSeBASagUCAAAECJQQEWoky6gQBAgQICDRjgAABAgRKCAi0EmXUCQIECBAQaMYAAQIECJQQEGglyqgTBAgQICDQjAECBAgQKCEg0EqUUScIECBAQKAZAwQIECBQQkCglSijThAgQICAQDMGCBAgQKCEgEArUUadIECAAAGBZgwQIECAQAkBgVaijDpBgAABAgLNGCBAgACBEgICrUQZdYIAAQIEBJoxQIAAAQIlBARaiTLqBAECBAgINGOAAAECBEoICLQSZdQJAgQIEBBoxgABAgQIlBAQaCXKqBMECBAgINCMAQIECBAoISDQSpRRJwgQIEBAoBkDBAgQIFBCQKCVKKNOECBAgIBAMwYIECBAoISAQCtRRp0gQIAAAYFmDBAgQIBACQGBVqKMOkGAAAECAs0YIECAAIESAgKtRBl1ggABAgQEmjFAgAABAiUEBFqJMuoEAQIECAg0Y4AAAQIESggItBJl1AkCBAgQEGjGAAECBAiUEBBoJcqoEwQIECAg0IwBAgQIECghINBKlFEnCBAgQECgGQMECBAgUEJAoJUoo04QIECAgEAzBggQIECghIBAK1FGnSBAgAABgWYMECBAgEAJAYFWoow6QYAAAQICzRggQIAAgRICAq1EGXWCAAECBASaMUCAAAECJQQEWoky6gQBAgQICDRjgAABAgRKCAi0EmXUCQIECBAQaMYAAQIECJQQEGglyqgTBAgQICDQjAECBAgQKCEg0EqUUScIECBAQKAZAwQIECBQQkCglSijThAgQICAQDMGCBAgQKCEgEArUUadIECAAAGBZgwQIECAQAkBgVaijDpBgAABAgLNGCBAgACBEgICrUQZdYIAAQIEBJoxQIAAAQIlBARaiTLqBAECBAgINGOAAAECBEoICLQSZdQJAgQIEBBoxgABAgQIlBAQaCXKqBMECBAgINCMAQIECBAoISDQSpRRJwgQIEBAoBkDBAgQIFBCQKCVKKNOECBAgIBAMwYIECBAoISAQCtRRp0gQIAAAYFmDBAg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"
		                                            width="32" height="32" alt="리뷰 쓴 사람 프로필 이미지"></a>
		                                    <div class="lateBox3">
		                                        <div class="lateBox4">
		                                            <a class="lateName" href="/shop/4296820/products">hoy4481</a>
		                                            <div class="lateDate">1주 전</div>
		                                        </div>
		                                        <div class="starBox">
		                                            <div class="star">
		                                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAArVJREFUSA2tVs1rE0EUf28TWr8uBQU/AqLGhAh+QWhrTECwePJiC1r0IHit4MU/Qw8evAoe9OZRTwqCNVEpaC+Wpqle4gfiURobdvN8b9JdZ7a7k822C8u++b3fx87sZFqAlBc1jpfkTikHJ60Qer1pdac0SB9MOANyp7wwjY7eF49Q1/0iWhzJHsWJ5a/D+qSbcdedDoL0OgAHF+mCUVtivR6cFzCGXmqaLx4EcNtEoLSIQADZHFaXvweuCYrhZ0zeFT9U/FXNWIIsgzJ8MNL/7+tbRWF+L+Y51FLTQmEvdLyfvLYZ3Y9NPNiZ2Y/l5m8dt9VZqufPAmZ22UhBb92bCodKTzBc781Ro/gy4NoK8tZQHXsePSWiMzbudvUQ8RO/5nUHz60swdjoBKJzr79DtyvC9BFvyVBZnGl8Y6oXLvL5+5hnf8iUbW3Es/wGjnMTK81XvpOxq1XDGT3FxGc+YatP5SWeWqh4GjPWQ+hN/haPHxDQHh1PWiPgH+bewVrrUZQmNljIVD+WBw+fcPh4lDgO49APkKEbWFltxXPiOhs40YUszLcXOfzEAKpqc+hnqOZOI752bXzjG0cSP7bHGC9E9qLBAvQ10d0NdHDwGs7wbLNWF62puKzRoMhycDDRbKTSBibQ2DfXQukA/O3Kn8BNL8hCdTzycTkVfgc+LHqwYySH5aUf4Z4/3mToN9Sz414Nh/Lvssuhd6HauiS31ILpOqVhrY6Fa3sw0jVdoHYsOeNYW73PYXwE8s01CCa7Wb9CWr0ldWwwvS0d5l/ypC/gkIeQ2VfGWnPRx/ynwqQnnOCiyb5HABhFbDCQWmb2gl/oOJex2rqNlUbHUGsD6SmOcFnT/88kfrktwTTLBi8Ad5/E8yvPtQxrqbiiEW2C3W2Y0bt8js/qOQNMMRAP8YqS/gMbzegG1X8tjgAAAABJRU5ErkJggg=="
		                                                    width="15" height="14" alt="작은 별점 2점 이미지"><img
		                                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAArVJREFUSA2tVs1rE0EUf28TWr8uBQU/AqLGhAh+QWhrTECwePJiC1r0IHit4MU/Qw8evAoe9OZRTwqCNVEpaC+Wpqle4gfiURobdvN8b9JdZ7a7k822C8u++b3fx87sZFqAlBc1jpfkTikHJ60Qer1pdac0SB9MOANyp7wwjY7eF49Q1/0iWhzJHsWJ5a/D+qSbcdedDoL0OgAHF+mCUVtivR6cFzCGXmqaLx4EcNtEoLSIQADZHFaXvweuCYrhZ0zeFT9U/FXNWIIsgzJ8MNL/7+tbRWF+L+Y51FLTQmEvdLyfvLYZ3Y9NPNiZ2Y/l5m8dt9VZqufPAmZ22UhBb92bCodKTzBc781Ro/gy4NoK8tZQHXsePSWiMzbudvUQ8RO/5nUHz60swdjoBKJzr79DtyvC9BFvyVBZnGl8Y6oXLvL5+5hnf8iUbW3Es/wGjnMTK81XvpOxq1XDGT3FxGc+YatP5SWeWqh4GjPWQ+hN/haPHxDQHh1PWiPgH+bewVrrUZQmNljIVD+WBw+fcPh4lDgO49APkKEbWFltxXPiOhs40YUszLcXOfzEAKpqc+hnqOZOI752bXzjG0cSP7bHGC9E9qLBAvQ10d0NdHDwGs7wbLNWF62puKzRoMhycDDRbKTSBibQ2DfXQukA/O3Kn8BNL8hCdTzycTkVfgc+LHqwYySH5aUf4Z4/3mToN9Sz414Nh/Lvssuhd6HauiS31ILpOqVhrY6Fa3sw0jVdoHYsOeNYW73PYXwE8s01CCa7Wb9CWr0ldWwwvS0d5l/ypC/gkIeQ2VfGWnPRx/ynwqQnnOCiyb5HABhFbDCQWmb2gl/oOJex2rqNlUbHUGsD6SmOcFnT/88kfrktwTTLBi8Ad5/E8yvPtQxrqbiiEW2C3W2Y0bt8js/qOQNMMRAP8YqS/gMbzegG1X8tjgAAAABJRU5ErkJggg=="
		                                                    width="15" height="14" alt="작은 별점 2점 이미지"><img
		                                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAArVJREFUSA2tVs1rE0EUf28TWr8uBQU/AqLGhAh+QWhrTECwePJiC1r0IHit4MU/Qw8evAoe9OZRTwqCNVEpaC+Wpqle4gfiURobdvN8b9JdZ7a7k822C8u++b3fx87sZFqAlBc1jpfkTikHJ60Qer1pdac0SB9MOANyp7wwjY7eF49Q1/0iWhzJHsWJ5a/D+qSbcdedDoL0OgAHF+mCUVtivR6cFzCGXmqaLx4EcNtEoLSIQADZHFaXvweuCYrhZ0zeFT9U/FXNWIIsgzJ8MNL/7+tbRWF+L+Y51FLTQmEvdLyfvLYZ3Y9NPNiZ2Y/l5m8dt9VZqufPAmZ22UhBb92bCodKTzBc781Ro/gy4NoK8tZQHXsePSWiMzbudvUQ8RO/5nUHz60swdjoBKJzr79DtyvC9BFvyVBZnGl8Y6oXLvL5+5hnf8iUbW3Es/wGjnMTK81XvpOxq1XDGT3FxGc+YatP5SWeWqh4GjPWQ+hN/haPHxDQHh1PWiPgH+bewVrrUZQmNljIVD+WBw+fcPh4lDgO49APkKEbWFltxXPiOhs40YUszLcXOfzEAKpqc+hnqOZOI752bXzjG0cSP7bHGC9E9qLBAvQ10d0NdHDwGs7wbLNWF62puKzRoMhycDDRbKTSBibQ2DfXQukA/O3Kn8BNL8hCdTzycTkVfgc+LHqwYySH5aUf4Z4/3mToN9Sz414Nh/Lvssuhd6HauiS31ILpOqVhrY6Fa3sw0jVdoHYsOeNYW73PYXwE8s01CCa7Wb9CWr0ldWwwvS0d5l/ypC/gkIeQ2VfGWnPRx/ynwqQnnOCiyb5HABhFbDCQWmb2gl/oOJex2rqNlUbHUGsD6SmOcFnT/88kfrktwTTLBi8Ad5/E8yvPtQxrqbiiEW2C3W2Y0bt8js/qOQNMMRAP8YqS/gMbzegG1X8tjgAAAABJRU5ErkJggg=="
		                                                    width="15" height="14" alt="작은 별점 2점 이미지"><img
		                                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAArVJREFUSA2tVs1rE0EUf28TWr8uBQU/AqLGhAh+QWhrTECwePJiC1r0IHit4MU/Qw8evAoe9OZRTwqCNVEpaC+Wpqle4gfiURobdvN8b9JdZ7a7k822C8u++b3fx87sZFqAlBc1jpfkTikHJ60Qer1pdac0SB9MOANyp7wwjY7eF49Q1/0iWhzJHsWJ5a/D+qSbcdedDoL0OgAHF+mCUVtivR6cFzCGXmqaLx4EcNtEoLSIQADZHFaXvweuCYrhZ0zeFT9U/FXNWIIsgzJ8MNL/7+tbRWF+L+Y51FLTQmEvdLyfvLYZ3Y9NPNiZ2Y/l5m8dt9VZqufPAmZ22UhBb92bCodKTzBc781Ro/gy4NoK8tZQHXsePSWiMzbudvUQ8RO/5nUHz60swdjoBKJzr79DtyvC9BFvyVBZnGl8Y6oXLvL5+5hnf8iUbW3Es/wGjnMTK81XvpOxq1XDGT3FxGc+YatP5SWeWqh4GjPWQ+hN/haPHxDQHh1PWiPgH+bewVrrUZQmNljIVD+WBw+fcPh4lDgO49APkKEbWFltxXPiOhs40YUszLcXOfzEAKpqc+hnqOZOI752bXzjG0cSP7bHGC9E9qLBAvQ10d0NdHDwGs7wbLNWF62puKzRoMhycDDRbKTSBibQ2DfXQukA/O3Kn8BNL8hCdTzycTkVfgc+LHqwYySH5aUf4Z4/3mToN9Sz414Nh/Lvssuhd6HauiS31ILpOqVhrY6Fa3sw0jVdoHYsOeNYW73PYXwE8s01CCa7Wb9CWr0ldWwwvS0d5l/ypC/gkIeQ2VfGWnPRx/ynwqQnnOCiyb5HABhFbDCQWmb2gl/oOJex2rqNlUbHUGsD6SmOcFnT/88kfrktwTTLBi8Ad5/E8yvPtQxrqbiiEW2C3W2Y0bt8js/qOQNMMRAP8YqS/gMbzegG1X8tjgAAAABJRU5ErkJggg=="
		                                                    width="15" height="14" alt="작은 별점 2점 이미지"><img
		                                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAArVJREFUSA2tVs1rE0EUf28TWr8uBQU/AqLGhAh+QWhrTECwePJiC1r0IHit4MU/Qw8evAoe9OZRTwqCNVEpaC+Wpqle4gfiURobdvN8b9JdZ7a7k822C8u++b3fx87sZFqAlBc1jpfkTikHJ60Qer1pdac0SB9MOANyp7wwjY7eF49Q1/0iWhzJHsWJ5a/D+qSbcdedDoL0OgAHF+mCUVtivR6cFzCGXmqaLx4EcNtEoLSIQADZHFaXvweuCYrhZ0zeFT9U/FXNWIIsgzJ8MNL/7+tbRWF+L+Y51FLTQmEvdLyfvLYZ3Y9NPNiZ2Y/l5m8dt9VZqufPAmZ22UhBb92bCodKTzBc781Ro/gy4NoK8tZQHXsePSWiMzbudvUQ8RO/5nUHz60swdjoBKJzr79DtyvC9BFvyVBZnGl8Y6oXLvL5+5hnf8iUbW3Es/wGjnMTK81XvpOxq1XDGT3FxGc+YatP5SWeWqh4GjPWQ+hN/haPHxDQHh1PWiPgH+bewVrrUZQmNljIVD+WBw+fcPh4lDgO49APkKEbWFltxXPiOhs40YUszLcXOfzEAKpqc+hnqOZOI752bXzjG0cSP7bHGC9E9qLBAvQ10d0NdHDwGs7wbLNWF62puKzRoMhycDDRbKTSBibQ2DfXQukA/O3Kn8BNL8hCdTzycTkVfgc+LHqwYySH5aUf4Z4/3mToN9Sz414Nh/Lvssuhd6HauiS31ILpOqVhrY6Fa3sw0jVdoHYsOeNYW73PYXwE8s01CCa7Wb9CWr0ldWwwvS0d5l/ypC/gkIeQ2VfGWnPRx/ynwqQnnOCiyb5HABhFbDCQWmb2gl/oOJex2rqNlUbHUGsD6SmOcFnT/88kfrktwTTLBi8Ad5/E8yvPtQxrqbiiEW2C3W2Y0bt8js/qOQNMMRAP8YqS/gMbzegG1X8tjgAAAABJRU5ErkJggg=="
		                                                    width="15" height="14" alt="작은 별점 2점 이미지">
		                                            </div>
		                                        </div>
		                                        <div class="lateTxt">판매자님 너무너무 친절하세요! 이렇게 친절하신 판매자님은 처음
		                                            만난거같아...</div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="latePlusBox">
		                                <a class="latePlus" href="/shop/1671876/reviews">상점후기 더보기</a>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <div class="sideButton">
		                    <button class="callBtn"  onclick="hpcall('<%=call%>')">연락하기</button>
		                    <a class="buyBtn" href="buy.jsp?p_idx=<%=p_idx%>">바로구매</a>
		                </div>
		            </div>
		            <!-- 오른쪽 하단 상점정보 컨테이너 끝-->
		        </div>  
            </div>    
    	
    	
    	
    	
    	</div>
    </div>
	<!-- 본문끝 -->
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
    

    <!--로그아웃 클릭시 화면-->
    <!-- <div class="warp2"></div>
    <div class="Aclogoutpage">
        <div class="Aclogoutpage_top">로그아웃</div>
        <p class="Aclogoutpage_center">로그아웃 시 6개월 이상 경과된 번개톡
            대화 내용이 모두 삭제됩니다.
            계속하시겠습니까?
        </p>
        <div class="Aclogoutpage_bottom">
            <a href="./AccountSet.html"><button type="button" class="Aclogoutpage_btn1">취소</button></a>
            <button type="button" class="Aclogoutpage_btn2">확인</button>
        </div>
    </div> -->
</body>
</html>
<%
	}
%>