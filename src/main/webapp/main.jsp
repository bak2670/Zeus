<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>메인</title>
    <link rel="stylesheet" href="./css/style.css">
    <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="./js/script.js"></script>
</head>
<body>
    <header>
        <div id="headertop">
            <ul class="headertop">
                <li class="top_left">
                    <a href="#"><img src="./img/번개장터이미지/번개장터.png"><span>앱다운로드</span></a>
                </li>
                <li class="top_left2">
                    <a href="#"><img src="./img/번개장터이미지/별.svg"><span>즐겨찾기</span></a>
                </li>
            </ul>
            <ul class="headertop2">
                <li class="top_right"><a href="#">로그아웃</a></li>
                <li class="top_right"><a href="#">알림<span class="tri"></span></a></li>
                <li class="top_right"><a href="#">내 상점<span class="tri"></span></a></li>
            </ul>
        </div>
        <div class= header_fix>
        <p class="line"></p>

        <div id="header_center">
            <ul class="header_center">
                <li class="center_1"><a href="#"><img src="./img/번개장터이미지/번개장터로고.png"></a></li>
                <li class="center_text">
                    <input type="text" id="headerserch" placeholder="&nbsp;&nbsp;&nbsp;상품명,지역명,@상점명 입력">
                </li>
            </ul>
            <ul class="header_center2">
                <li>
                    <a href="#"><img src="./img/번개장터이미지/판매하기.png"> 판매하기 </a>
                </li>
                <li>
                    <a href="#"><img src="./img/번개장터이미지/내상점.png"> 내 상점 </a>
                </li>
                <li>
                    <a href="#"><img src="./img/번개장터이미지/번개톡.png"> 번개톡 </a>
                </li>
            </ul>

            <!-- 변경부분 시작-->
            <div class="header_bottom">
                <div id="category_img">
                    <img
                        src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAgCAYAAABgrToAAAAAAXNSR0IArs4c6QAAAExJREFUWAnt1sEJACAMA0DrJt1/SAVXyKfI9V8Il0+qu88afHtwthdNwOkNyUeAAAECvwuUNRNWbM2EgN4JECBAgEAoYM2EgMuaSQUv1d0EPE4sEMMAAAAASUVORK5CYII=" alt="메뉴 버튼 아이콘" width="20" height="16">
                </div>
                <!-- 카테고리 시작 img hover시 추가되는 div -->
                <div class="main_category">
                    <!-- 대분류 -->
                    <div class="category" id="big_category">
                        <div class="big_category_top">
                            전체 카테고리
                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAASCAYAAABvqT8MAAAAAXNSR0IArs4c6QAAAX9JREFUKBWdkz1LA0EQhmf2Ei6msBEb/4JgPi4fhYUpRIn4gYpY2ajYKbZa5S9YKzZWIgoqCIpFLKxyMQb0Z0hEQnIbcjfuLtyykmDEhbt7571ndvZm9wDE4MnMIU9mD6QeOLyUs9dOOCQvoXcHJTAIcEJDARy1U5lNHfcRzF6e3wHAc/mOhMCAjnk6u96HVRYqsFCI8EbzioAWZIyIXWC4Enup3CrKuDEFlMtde2x0TYCPMiaiCPjBhZfKThuskqpCaJLjxD0fH0TGpPQQoWUBzkRf3eeQURXCAKvVVsy25gRYlR4RxH2Au04672gmFOaTcrkR3gmexNLGlY/4wQin7Hrl/UcFM6lHR0ktvyeB8vlh3vHvw9lFI74sZs3arvsmJ/n/R1OxaHMfr3WHxBEDZEtmh3QFkhv32bwUy1hUptw4hNVYzb2RsTkYlUrMazTPNAzidCFs9INlInqJzIk4ElsqkK1nuD1Uc0/NWU3NgFFdGwz2f4M1J3+ev/5A37oEmInyqvw0AAAAAElFTkSuQmCC" width="6" height="9" alt="화살표 아이콘">
                        </div>
                        <div class="category_list">
                            <a href="#" class="big_non_selected big_list">여성의류</a>
                            <a href="#" class="big_selected big_list">패션잡화</a>
                            <a href="#" class="big_non_selected big_list">남성의류</a>
                            <a href="#" class="big_non_selected big_list">디지털/가전</a>
                        </div>
                    </div>
                    <!-- 중분류 -->
                    <div class="category" id="middle_category">
                        <div class="middle_category_top" id="middle_top">
                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAASCAYAAABvqT8MAAAAAXNSR0IArs4c6QAAAX9JREFUKBWdkz1LA0EQhmf2Ei6msBEb/4JgPi4fhYUpRIn4gYpY2ajYKbZa5S9YKzZWIgoqCIpFLKxyMQb0Z0hEQnIbcjfuLtyykmDEhbt7571ndvZm9wDE4MnMIU9mD6QeOLyUs9dOOCQvoXcHJTAIcEJDARy1U5lNHfcRzF6e3wHAc/mOhMCAjnk6u96HVRYqsFCI8EbzioAWZIyIXWC4Enup3CrKuDEFlMtde2x0TYCPMiaiCPjBhZfKThuskqpCaJLjxD0fH0TGpPQQoWUBzkRf3eeQURXCAKvVVsy25gRYlR4RxH2Au04672gmFOaTcrkR3gmexNLGlY/4wQin7Hrl/UcFM6lHR0ktvyeB8vlh3vHvw9lFI74sZs3arvsmJ/n/R1OxaHMfr3WHxBEDZEtmh3QFkhv32bwUy1hUptw4hNVYzb2RsTkYlUrMazTPNAzidCFs9INlInqJzIk4ElsqkK1nuD1Uc0/NWU3NgFFdGwz2f4M1J3+ev/5A37oEmInyqvw0AAAAAElFTkSuQmCC" width="6" height="9" alt="화살표 아이콘">
                        </div>
                        <!-- 대분류 "여성의류"에 대한 중분류 -->
                        <div class="category_list">
                            <!-- <a class="ms_list" href="#"><div class="ms_non_selected">원피스</div></a>                            
                            <a class="ms_list" href="#"><div class="ms_selected">스커트/치마</div></a>      
                            <a class="ms_list" href="#"><div class="ms_non_selected">자켓</div></a>      
                            <a class="ms_list" href="#"><div class="ms_non_selected">니트/스웨터</div></a>      
                            <a class="ms_list" href="#"><div class="ms_non_selected">야상/점퍼/패딩</div></a>                          -->
                        </div>
                    </div>
                    <!-- 소분류 -->
                    <div class="category" id="small_category">
                        <div class="small_category_top" id="small_top"></div>
                        <!-- 여성의류 -> 원피스 -->
                        <div class="category_list">
                            <!-- <a class="ms_list" href="#"><div class="ms_non_selected">롱 원피스</div></a>
                            <a class="ms_list" href="#"><div class="ms_selected">캐주얼 원피스</div></a>
                            <a class="ms_list" href="#"><div class="ms_non_selected">미니 원피스</div></a>
                            <a class="ms_list" href="#"><div class="ms_non_selected">럭셔리 원피스</div></a>
                            <a class="ms_list" href="#"><div class="ms_non_selected">기타 원피스</div></a> -->
                        </div>
                    </div>
                </div>
                <a href="#">&nbsp;&nbsp;&nbsp;&nbsp;<b>번개장터 판매자센터</b>></a>
                
            </div>
            <!-- 변경부분 끝 -->
        </div>
        <div class="side_barbox">
            <div class="side_bar">
                <div class="bar_top">
                    <p>찜한상품</p>
                    <img src="./img/번개장터이미지/찜.png">
                </div>
                <div class="bar_center">
                    <p class="bar_center1">최근본상품</p>
                    <p class="bar_center2">.............</p>
                    <br>
                    <p class="bar_center3"><img src="./img/번개장터이미지/눈깔.png"></p>
                    <p class="bar_center4">최근 본 상품<br>이<br>없습니다.</p>
                </div>
                <div class="bar_bottom">
                    <a href="#">TOP</a>
                </div>
            </div>
        </div>
    </div>
    </header>


    <div class="container">
        <div class="container_slide">
            <a href="#"><img src="img/번개장터이미지/메인슬라이드1.jpg"></a>
        </div>
        <div class = "container_text">
            <h2>오늘의 추천 상품</h2>
        </div>
        <div class="container_main">
            <div class="item_box">
                <a href="#" class="item">
                    <div class="item_img">
                        <img src="img/번개장터이미지/댓글.png">
                    </div>
                    <div class="item_text">
                        <div class = "text_top">
                            돋보기
                        </div>
                        <div class="text_bottom">
                            <div class="text_bottom1">
                                888,888
                            </div>
                            <div class="text_bottom2">
                                시간
                            </div>
                        </div>

                    </div>
                </a>
            </div>
            <div class="item_box">
                <a href="#" class="item">
                    <div class="item_img">
                        <img src="img/번개장터이미지/댓글.png">
                    </div>
                    <div class="item_text">
                        <div class = "text_top">
                            돋보기
                        </div>
                        <div class="text_bottom">
                            <div class="text_bottom1">
                                888,888
                            </div>
                            <div class="text_bottom2">
                                시간
                            </div>
                        </div>

                    </div>
                </a>
            </div>
            <div class="item_box">
                <a href="#" class="item">
                    <div class="item_img">
                        <img src="img/번개장터이미지/댓글.png">
                    </div>
                    <div class="item_text">
                        <div class = "text_top">
                            돋보기
                        </div>
                        <div class="text_bottom">
                            <div class="text_bottom1">
                                888,888
                            </div>
                            <div class="text_bottom2">
                                시간
                            </div>
                        </div>

                    </div>
                </a>
            </div>
            <div class="item_box">
                <a href="#" class="item">
                    <div class="item_img">
                        <img src="img/번개장터이미지/댓글.png">
                    </div>
                    <div class="item_text">
                        <div class = "text_top">
                            돋보기
                        </div>
                        <div class="text_bottom">
                            <div class="text_bottom1">
                                888,888
                            </div>
                            <div class="text_bottom2">
                                시간
                            </div>
                        </div>

                    </div>
                </a>
            </div>
            <div class="item_box">
                <a href="#" class="item">
                    <div class="item_img">
                        <img src="img/번개장터이미지/댓글.png">
                    </div>
                    <div class="item_text">
                        <div class = "text_top">
                            돋보기
                        </div>
                        <div class="text_bottom">
                            <div class="text_bottom1">
                                888,888
                            </div>
                            <div class="text_bottom2">
                                시간
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="item_box">
                <a href="#" class="item">
                    <div class="item_img">
                        <img src="img/번개장터이미지/댓글.png">
                    </div>
                    <div class="item_text">
                        <div class = "text_top">
                            돋보기
                        </div>
                        <div class="text_bottom">
                            <div class="text_bottom1">
                                888,888
                            </div>
                            <div class="text_bottom2">
                                시간
                            </div>
                        </div>

                    </div>
                </a>
            </div>
            <div class="item_box">
                <a href="#" class="item">
                    <div class="item_img">
                        <img src="img/번개장터이미지/댓글.png">
                    </div>
                    <div class="item_text">
                        <div class = "text_top">
                            돋보기
                        </div>
                        <div class="text_bottom">
                            <div class="text_bottom1">
                                888,888
                            </div>
                            <div class="text_bottom2">
                                시간
                            </div>
                        </div>

                    </div>
                </a>
            </div>
            
        </div>

    </div>

    <footer>
        <div class="footer_top">
            <ul class="footer_top1">
                <li>공지사항</li>
                <li>자주묻는질문</li>
                <li>운영정책</li>
                <li>1:1문의하기</li>
                <li>사업자정보확인</li>
                <li>이용약관</li>
                <li><b>개인정보처리방침</b></li>
                <li>청소년보호정책</li>
                <li>위치기반서비스 이용약관</li>
            </ul>
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


    <div class="tri">

    </div>
</div>




</body>

</html>