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
    <link rel="stylesheet" href="./css/AcOut.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="./js/script.js"></script>
    <title>Document</title>
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
    <div class=AcOutwarp>
        <div class="AcOuttop">
                <div class="AcOuttop_intext">
                    <p>회원 탈퇴시 7일 이내 재가입이 불가능하며, 유료 구매한 아이템은 소멸됩니다.</p>
                    <br>
                    <p>[잠깐!]</p>
                    <span>- 상점명 변경 및 휴대폰번호 변경은 내정보 수정에서 가능합니다.<br>- 이용 중 불편사항이 있으셨다면 설정 > 1:1상담하기로 문의주시기 바랍니다.<br>- 탈퇴 시 계정의 모든 정보는 삭제되며 재가입시에도 복구되지 않습니다.</span>
                    <a href="#"><div><button type="button" value="탈퇴" id="popOpenBtn">>탈퇴</button></div></a>
                </div>
                <div id ="popup_mask"></div>
                <div id="popupDiv"> <!-- 팝업창 -->
                   <form method="post" action="AcOut_ok.jsp?m_idx=<%=member.getIdx()%>">
                    <div>
                        <p><img src="./img/번개장터이미지/arrow.png">회원탈퇴</p>
                        <hr>
                        <h2>탈퇴하시겠습니까?</h2>
                        <textarea name="w_reason" placeholder="탈퇴사유를 작성해주세요."></textarea>
                    </div>
                    <input type="submit" class="popCloseBtn" value="탈퇴">
                    <input type="button" class="popCloseBtn" value="취소">
                    </form>	
                </div>
        </div>

        <div class="AcOutbottom">
            <div class="AcOut_footer">
                <div class="AcOut_footer_menu">
                    <a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1138645836">사업자정보확인</a>
                    <a href="https://terms.bunjang.co.kr/terms/service.jsp">이용약관</a>
                    <a href="https://terms.bunjang.co.kr/terms/service-policy.jsp">운영정책</a>
                    <a href="https://terms.bunjang.co.kr/terms/privacy.jsp">개인정보처리방침</a>
                    <a href="https://terms.bunjang.co.kr/terms/location.jsp">위치기반서비스약관</a>
                </div>
                <br>
                <p><b>번개장터(주) 대표이사</b> 이재후 | <b>개인정보보호담당자</b> 이동주 <b>사업자등록번호</b> 113-86-45836</p>
                <p><b>통신판매업신고</b> 2019-서울서초-1126</p>
                <p><b>주소</b> 서울특별시 서초구 서초대로38길 12, 7층(서초동, 마제스타시티 타워2)</p>
                <p><b>고객센터 대표번호</b> 1670-2910 / FAX: 02-598-8241</p>
                <p><b>고객센터 운영시간 전화문의</b> : 9시~18시(주말.공휴일 제외) / 1:1문의: 9시~18시</p>
                <p><b>고객센터 문의</b> help@bunjang.co.kr | 제휴문의 partner@bunjang.co.kr</p>
                <p><b>호스팅서비스 제공자</b> Amazon Web Services (AWS)</p>
                <br>
                <p>“번개장터_컨시어지” 상점의 판매상품을 제외한 모든 상품들에 대하여, 번개장터㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래 당사자가 아니며, 입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.</p>
                <p><b>우리은행 채무지급보증</b> 안내 번개장터(주)는 “번개장터_컨시어지” 상점이 판매한 상품에 한해, 고객님이 현금 결제한 금액에 대해 우리은행과 채무지급보증 계약을 체결하여 안전거래를 보장하고 있습니다. <a href="https://terms.bunjang.co.kr/terms/wooriguarantee.jsp">서비스 가입사실 확인</a></p>
                <p>Copyright ⓒ QUICKET Co, Ltd. All rights reserved</p>
            </div>
        </div>
    </div>
</body>
</html>