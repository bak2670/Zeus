<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.koreait.block.blockDTO"%>
<jsp:useBean id="productDAO" class="com.koreait.product.productDAO"/>
<jsp:useBean id="productDTO" class="com.koreait.product.productDTO"/>
<jsp:useBean id="memberDAO" class="com.koreait.member.memberDAO"/>
<jsp:useBean id="memberDTO" class="com.koreait.member.memberDTO"/>
<jsp:useBean id="recentproductDAO" class="com.koreait.recentProduct.recentProductDAO"/>
<jsp:useBean id="recentproductDTO" class="com.koreait.recentProduct.recentProductDTO"/>
<jsp:useBean id="blockDAO" class="com.koreait.block.blockDAO"/>
<%
	request.setCharacterEncoding("UTF-8");

	String b_memidx = String.valueOf(session.getAttribute("idx"));
	if(blockDAO.blockidx(b_memidx) == 1){
		blockDTO block = new blockDTO();
		block = blockDAO.blockinfo(b_memidx);
		String Blockreason;
		String b_blockdate;
		Blockreason = block.getBlockreason();
		b_blockdate = block.getBlockdate();
		 out.println("<script type='text/javascript'>");
		 out.println("alert('계정이 차단당했습니다. \\n 차단사유 : " + Blockreason + "\\n 차단일 : " +b_blockdate+ "');");
		 out.println("</script>");
	%>
	<script>
	location.href="logout.jsp"
	</script>

	<%
	}


	String username= null;
	String m_idx = null;
	if(session.getAttribute("username") != null){
		username= (String)session.getAttribute("username");
		m_idx = String.valueOf(session.getAttribute("idx"));
	}
	
%>
<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="UTF-8">

<title>번개장터</title>
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
							
						</div>
						<div class="rightMenu">
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
						<!-- <div class="noticeBox1">
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
						</div> -->
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
				<!-- <div class="zzimSideBox1">
				<div class="zzimSideBox2">
					<div class="zzim1">
						<div class="zzim1Txt">찜한상품</div>
						<div class="zzim1Num">img src 경로 수정(20210405)
							<a class="zzim1Btn1" href="#"><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAAAXNSR0IArs4c6QAAAX1JREFUOBGdk7FLw0AUxnPXFhdHRdBdVJBCGgedBP8GoYJQHMRBRNBF1EGnTkopXcRBBEFB/A+cnNuIhEBHQcFBnHRolsTfqwZiWmLSg8t733vf++7d5U4Zv8NxnDHP846Ai8xxpdRDEAT7lmU5YKPZbE5hlonPYfPknrB18m9YQ8nHtu0l3/dvcEcER8ZnLpcrUzTLPGYORXLifmity6Zp3ivXdYc7nU4b0kSMlArS4Tu1MxqR7UFFZCVqRxE71DjzqZZOJi1o1CaTOamy0xraSypqAoldPcvWHhM4aVO2LhQKNbb3lbYizqPWI1bVxWLxla4O4oQMeI9L2ZYzMnDqXKxqhuIuVWpKpVJNQPdmhwI8gxP8nRD/Y09pYDfk/BGSYKvVarDVzZDQz3IuDTrZiuZ6hBBRvL0z7HqUGPqInPO2NrBBGBPbIyRBEaOzC9yK4Mi4pJO1uIjk+wpJAjGN2BXuimDGNSKriPg/MMMXsTw/4BbBO/EzlA5O/QbfD5IxtG4t8AAAAABJRU5ErkJggg=="
								width="9" height="9" alt="찜 아이콘">0</a>
						</div>
					</div>
					<div class="zzimSideBox3">
						<div class="zzim2Txt">최근본상품</div> -->
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
					
	<!-- 메인 슬라이드 -->
	<section class="visual">
		<div class="slickimg">
			<img src="https://media.bunjang.co.kr/images/nocrop/550629562.jpg"
				alt="" class="slideimg">
		</div>
		<div class="slickimg">
			<img src="https://media.bunjang.co.kr/images/nocrop/607369823.jpg"
				alt="" class="slideimg">
		</div>
		<div class="slickimg">
			<img src="https://media.bunjang.co.kr/images/nocrop/603183669.jpg"
				alt="" class="slideimg">
		</div>
		<div class="slickimg">
			<img src="https://media.bunjang.co.kr/images/nocrop/606595174.jpg"
				alt="" class="slideimg">
		</div>
		<div class="slickimg">
			<img src="https://media.bunjang.co.kr/images/nocrop/603409559.jpg"
				alt="" class="slideimg">
		</div>
		<div class="slickimg">
			<img src="https://media.bunjang.co.kr/images/nocrop/604111493.jpg"
				alt="" class="slideimg">
		</div>
		<div class="slickimg">
			<img src="https://media.bunjang.co.kr/images/nocrop/596982302.jpg"
				alt="" class="slideimg">
		</div>
		<div class="slickimg">
			<img src="https://media.bunjang.co.kr/images/nocrop/606288041.jpg"
				alt="" class="slideimg">
		</div>
		<div class="slickimg">
			<img src="https://media.bunjang.co.kr/images/nocrop/606502652.jpg"
				alt="" class="slideimg">
		</div>
		<div class="slickimg">
			<img src="https://media.bunjang.co.kr/images/nocrop/602906062.jpg"
				alt="" class="slideimg">
		</div>
		<div class="slickimg">
			<img src="https://media.bunjang.co.kr/images/nocrop/590565332.jpg"
				alt="" class="slideimg">
		</div>
		<div class="slickimg">
			<img src="https://media.bunjang.co.kr/images/nocrop/605493577.jpg"
				alt="" class="slideimg">
		</div>
	</section>
	<script>
        $('.visual').slick({
    autoplay: true,
autoplaySpeed: 2000,
});
    </script>
	<div class="container">
		<div class="container_text">
			<h2>오늘의 추천 상품</h2>
		</div>
		<div class="container_main">
			<!-- 상품 가져와서 보여주기 -> 순서는 일단 인덱스 순서 -->
			<%
				List<HashMap<String, String>> productList = productDAO.mainProduct();
				int productCnt = productList.size();
				for(HashMap product : productList){
			%>
			<div class="item_box">
				<a href="productDetail.jsp?p_idx=<%=product.get("p_idx")%>"
					class="item">
					<div class="item_img">
						<%
						out.print("<img src='./uploads/" + product.get("p_picture") + "' alt='상품이미지'>"); // 상대경로. 얘만됨
						%>
					</div>
					<div class="item_text">
						<div class="text_top">
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
			<p class="footer_center2">누구나, 무엇이든 쉽고 편하고 안전하게 거래하는 세상을 꿈꾸고
				있습니다.</p>
			<p class="footer_center3">
				<a href="#"><img src="./img/번개장터이미지/페이스북.png"></a> <a href="#"><img
					src="./img/번개장터이미지/블로그.png"></a> <a href="#"><img
					src="./img/번개장터이미지/인스타.png"></a>
			</p>
		</div>
		<div class="footer_bottom">
			<p>대표이사: 이재후 | 개인정보보호담당자: 이동주 | 사업자등록정보: 113-86-45836 | 통신판매업신고:
				2019-서울서초-1126</p>
			<p>주소: 서울특별시 서초구 서초대로38길 12 마제스타시티 타워2 지하1층</p>
			<p>고객센터 대표번호: 1670-2910 | FAX: 02-598-8241</p>
			<p>고객센터 운영시간:전화문의 : 9시~18시(주말.공휴일 제외) | 1:1문의 : 9시~18시</p>
			<p class="footer_bottom1">※점심시간 12~13시</p>
			<p>고객센터 문의 help@bunjang.co.kr | 제휴문의 partner@bunjang.co.kr</p>
			<p>호스팅서비스 제공자: Amazon Web Services (AWS)</p>
			<br>
			<p>“번개장터_컨시어지” 상점의 판매상품을 제외한 모든 상품들에 대하여, 번개장터㈜는 통신판매중개자로서 중고거래마켓
				번개장터의 거래 당사자가 아니며, 입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.</p>
			<br>
			<p class="footer_bottom2">
				<b>우리은행 채무지급보증 안내</b>
			</p>
			<p>번개장터(주)는 “번개장터_컨시어지” 상점이 판매한 상품에 한해, 고객님이 현금 결제한 금액에 대해 우리은행과
				채무지급보증 계약을 체결하여 안전거래를 보장하고 있습니다.</p>
			<p class="footer_bottom3">
				<a href="#">서비스 가입사실 확인</a>
			</p>
			<br>
			<p>Copyright ⓒ Bungaejangter Inc. All rights reserved.</p>
		</div>
	</footer>




</body>

</html>