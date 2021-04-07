<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String username= null;
	String idx = null;
	if(session.getAttribute("username") != null){
		username= (String)session.getAttribute("username");
		idx = String.valueOf(session.getAttribute("idx"));
	}
%>
<jsp:useBean id="member" class="com.koreait.member.memberDTO" scope="page"/>
<jsp:useBean id="dao" class="com.koreait.member.memberDAO"/>
<%
	if(dao.myshop(member, idx) != null){
		System.out.println("데이터왔어");
	}else{
		System.out.println("데이터없어");
	}
    

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/title.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="./js/script.js"></script>
    <title>계정설정</title>
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
    <div class="Acwarp">

        <div class="AcSetBox">
            <div class="Actop Acboxsize">
                <button><img
                        src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxwYXRoIGZpbGw9IiMxRTFEMjkiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTE5IDguOTk2SDMuNjZMOS42NTcgMy43NWExIDEgMCAwIDAtMS4zMTYtMS41MDZsLTggN2MtLjAwOC4wMDctLjAxLjAxOC0uMDE5LjAyNWEuOTc1Ljk3NSAwIDAgMC0uMTc3LjI0Yy0uMDE4LjAzLS4wNDUuMDU0LS4wNTkuMDg3YS45NzUuOTc1IDAgMCAwIDAgLjgwMmMuMDE0LjAzMy4wNDEuMDU3LjA2LjA4OC4wNS4wODcuMTAzLjE3LjE3Ni4yMzkuMDA4LjAwNy4wMTEuMDE4LjAyLjAyNWw4IDdhLjk5Ni45OTYgMCAwIDAgMS40MS0uMDk1IDEgMSAwIDAgMC0uMDk1LTEuNDExTDMuNjYgMTAuOTk2SDE5YTEgMSAwIDEgMCAwLTIiLz4KPC9zdmc+Cg=="
                        alt="back" width="20" height="20"></button>
                계정설정
            </div>
            <div class="Acline Acboxsize"></div>


            <a href="#">
                <div class="AcSNS Acboxsize" id="submit">SNS연동</div>
            </a>

            <a href="#">
                <div class="Aclogout Acboxsize" id="Aclogout">로그아웃</div>
            </a>

            <a href="./AcOut.jsp">
                <div class="Acout Acboxsize">
                    탈퇴
                </div>
            </a>

        </div>

        <div class="Aclogoutpage">
            <div class="Aclogoutpage_top">로그아웃</div>
            <p class="Aclogoutpage_center">로그아웃 시 6개월 이상 경과된 번개톡
            대화 내용이 모두 삭제됩니다.
            계속하시겠습니까?
            </p>
            <div class="Aclogoutpage_bottom">
                <a href="./AccountSet.jsp"><button type="button" class="Aclogoutpage_btn1">취소</button></a>
                <button type="button" class="Aclogoutpage_btn2">확인</button>
            </div>
        </div>
    </div>
    <div class="dim"></div>
    <!--sns연동 클릭시 화면 -->
    <div class="AcSnswarp">
        <div class="AcSnsBox">
            <div class="AcSnsBtn" onClick="closeLayer(this)" style="cursor:pointer;font-size:1.5em" title="닫기">
            </div>
            <div class="AcSnsTextBox">
                <div class="AcSnsText1">SNS계정 연동하고 간편하게 이용하세요!</div>
                <p>다음에 로그인하실 때,
                    연동한 소셜 계정으로 간편하게 로그인할 수 있습니다.</p>
                <div class="AcSnsmenu">
                    <div><button class="iJqwUM"><img src="./img/번개장터이미지/카카오.png">카카오톡으로 연동하기</button></div>
                    <div><button class="jiFDsF"><img src="./img/번개장터이미지/네이버 (1).png">네이버로 연동하기</button></div>
                    <div><button class="fOHdHh"><img src="./img/번개장터이미지/페이스.png">페이스북으로 연동하기</button></div>
                </div>
            </div>
        </div>
    </div>
    <!--로그아웃 클릭시 화면-->
    <div class="warp2"></div>





    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="./js/script.js"></script>



</body>

</html>