<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="paymentDAO" class="com.koreait.payment.paymentDAO"/>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<%
	request.setCharacterEncoding("UTF-8");
	String username= null;
	String m_idx = null;
	
	if(session.getAttribute("username") == null){
%>
	<script>
		alert('로그인이 필요한 서비스 입니다.');
		history.back();
	</script>
<%
	}else{

		m_idx = String.valueOf(session.getAttribute("idx"));
	
		String p_idx = request.getParameter("p_idx");

%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>거래내역</title>
    <link rel="stylesheet" href="./css/title.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="./js/script.js"></script>
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

<body><noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root">
        <div class="tradeContainer">
            <div class="tradePage">
                <div class="tradeTitle">
                    <h1>거래내역</h1>
                </div>
                <main class="tradeBody">
                    <nav class="tradeBox">
                        <ul class="tradeList">
                            <li class="selected"><button type="button" data-index="0" id="btnBuy">구매</button></li>
                            <li class=""><button type="button" data-index="1" id="btnSell">판매</button></li>
                        </ul>
                        <div class="filterBox">
                             <!-- <nav class="tradeFilter"> 
                                <div> <button
                                        data-filter="{&quot;key&quot;:&quot;all&quot;,&quot;label&quot;:&quot;전체 상태&quot;}"
                                        class="tradeButton checkButton">전체 상태</button>
                                        <button
                                        data-filter="{&quot;key&quot;:&quot;on_progress&quot;,&quot;label&quot;:&quot;진행중&quot;}"
                                        class="tradeButton">진행중</button>
                                        <button
                                        data-filter="{&quot;key&quot;:&quot;completed&quot;,&quot;label&quot;:&quot;완료&quot;}"
                                        class="tradeButton">완료</button>
                                        <button
                                        data-filter="{&quot;key&quot;:&quot;cancelled&quot;,&quot;label&quot;:&quot;취소/환불&quot;}"
                                        class="tradeButton">취소/환불</button>
                                </div> 
                                
                    		</nav> -->
                            <div class="tradeContent" id="tradeBuy">
                                <div>
                                	<!-- 거래내역 보여지는 부분 -->
                                	<%
                                		String select = "구매";
	                                	List<HashMap<String, String>> tradeList = paymentDAO.tradeList(select, m_idx);
                                	
                                    	if(tradeList.isEmpty()){
                                    %>
                                    	구매내역이 없습니다.
                                    <%
                                    	}else{
                                    		for(HashMap<String, String> trade : tradeList){
                                    %>
                                    
                                    <div class="tradeText">

	                                    	<!-- 가져온 리스트 보여줘야해 -->
											<div class="tradeListBox">
												<div class="tradeInnerBox">
													<div class="tradeImgBox">
														<img src='./uploads/<%=trade.get("p_picture") %>' alt='상품이미지'>
													</div>
													<aside class="tradeAsideBox">
														<span class="tradeProductName">
															<%=trade.get("p_name") %>
														</span>
														<span class="tradeProductPrice tradeProductPriceee"><strong><%=trade.get("p_price") %></strong>원</span>
														<span class="tradeProductUserName hfRDV"><%=trade.get("seller") %></span>
														<span class="tradeProductDate dCroum"><time datetime="1615020591000"><%=String.valueOf(trade.get("pm_regdate")) %></time></span>
													</aside>
												</div>
											</div>
                                    </div>
                                    <%
                                    		}
                                    	}
                                    %>
                                </div>
                            </div>
                            <div class="tradeContent" id="tradeSell" style="display:none">
                                <div>
                                	<!-- 거래내역 보여지는 부분 -->
                                	<%
                                		select = "판매";
	                                	tradeList = paymentDAO.tradeList(select, m_idx);
                                    	if(tradeList.isEmpty()){
                                    %>
                                    	판매내역이 없습니다.
                                    <%
                                    	}else{
                                    		for(HashMap<String, String> trade : tradeList){
                                    %>
                                    
                                    <div class="tradeText">

	                                    	<!-- 가져온 리스트 보여줘야해 -->
											<div class="tradeListBox">
												<div class="tradeInnerBox">
													<div class="tradeImgBox">
														<img src='./uploads/<%=trade.get("p_picture") %>' alt='상품이미지'>
													</div>
													<aside class="tradeAsideBox">
														<span class="tradeProductName">
															<%=trade.get("p_name") %>
														</span>
														<span class="tradeProductPrice tradeProductPriceee"><strong><%=trade.get("p_price") %></strong>원</span>
														<span class="tradeProductUserName hfRDV"><%=trade.get("seller") %></span>
														<span class="tradeProductDate dCroum"><time datetime="1615020591000"><%=String.valueOf(trade.get("pm_regdate")) %></time></span>
													</aside>
												</div>
											</div>
                                    </div>
                                    <%
                                    		}
                                    	}
                                    %>
                                </div>
                            </div>
                        </div>
                    </nav>
                </main>
            </div>
        </div>
    </div>
    <div id="backdrop"></div>
    <div id="modal"></div>
    <div id="full"></div>
    <script>!function (f) { function e(e) { for (var r, t, n = e[0], o = e[1], a = e[2], c = 0, u = []; c < n.length; c++)t = n[c], l[t] && u.push(l[t][0]), l[t] = 0; for (r in o) Object.prototype.hasOwnProperty.call(o, r) && (f[r] = o[r]); for (s && s(e); u.length;)u.shift()(); return d.push.apply(d, a || []), i() } function i() { for (var e, r = 0; r < d.length; r++) { for (var t = d[r], n = !0, o = 1; o < t.length; o++) { var a = t[o]; 0 !== l[a] && (n = !1) } n && (d.splice(r--, 1), e = p(p.s = t[0])) } return e } var t = {}, l = { 10: 0 }, d = []; function p(e) { if (t[e]) return t[e].exports; var r = t[e] = { i: e, l: !1, exports: {} }; return f[e].call(r.exports, r, r.exports, p), r.l = !0, r.exports } p.e = function (a) { var e = [], t = l[a]; if (0 !== t) if (t) e.push(t[2]); else { var r = new Promise(function (e, r) { t = l[a] = [e, r] }); e.push(t[2] = r); var n, c = document.createElement("script"); c.charset = "utf-8", c.timeout = 120, p.nc && c.setAttribute("nonce", p.nc), c.src = p.p + "static/js/" + ({}[a] || a) + "." + { 0: "e1cc04c0", 1: "d5b001e5", 2: "91854f72", 3: "5f18fad4", 4: "606c5cfa", 5: "39d47467", 6: "eecf8e84", 7: "cd89f5b7", 8: "6c79ad45", 12: "655b337d", 13: "5b9988f1", 14: "ecc32d85", 15: "46e5b9d6", 16: "31600834", 17: "27025c61", 18: "ab8b24b3", 19: "4392f723", 20: "390d1f58", 21: "396de6a9", 22: "ddd720c3", 23: "f35629fb", 24: "a6433e28", 25: "6175baf1", 26: "815e8a73", 27: "111b47d2", 28: "e6104f37", 29: "17479ed4", 30: "1da0beea", 31: "f2c198f3", 32: "eb5a67a9", 33: "53917b02", 34: "fb29c1a6" }[a] + ".chunk.js", n = function (e) { c.onerror = c.onload = null, clearTimeout(u); var r = l[a]; if (0 !== r) { if (r) { var t = e && ("load" === e.type ? "missing" : e.type), n = e && e.target && e.target.src, o = new Error("Loading chunk " + a + " failed.\n(" + t + ": " + n + ")"); o.type = t, o.request = n, r[1](o) } l[a] = void 0 } }; var u = setTimeout(function () { n({ type: "timeout", target: c }) }, 12e4); c.onerror = c.onload = n, document.head.appendChild(c) } return Promise.all(e) }, p.m = f, p.c = t, p.d = function (e, r, t) { p.o(e, r) || Object.defineProperty(e, r, { enumerable: !0, get: t }) }, p.r = function (e) { "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, { value: "Module" }), Object.defineProperty(e, "__esModule", { value: !0 }) }, p.t = function (r, e) { if (1 & e && (r = p(r)), 8 & e) return r; if (4 & e && "object" == typeof r && r && r.__esModule) return r; var t = Object.create(null); if (p.r(t), Object.defineProperty(t, "default", { enumerable: !0, value: r }), 2 & e && "string" != typeof r) for (var n in r) p.d(t, n, function (e) { return r[e] }.bind(null, n)); return t }, p.n = function (e) { var r = e && e.__esModule ? function () { return e.default } : function () { return e }; return p.d(r, "a", r), r }, p.o = function (e, r) { return Object.prototype.hasOwnProperty.call(e, r) }, p.p = "/", p.oe = function (e) { throw console.error(e), e }; var r = window.webpackJsonp = window.webpackJsonp || [], n = r.push.bind(r); r.push = e, r = r.slice(); for (var o = 0; o < r.length; o++)e(r[o]); var s = n; i() }([])</script>
    <script src="/static/js/11.523f033c.chunk.js"></script>
    <script src="/static/js/main.c8a6101b.chunk.js"></script>
</body>

</html>
<%
	}
%>