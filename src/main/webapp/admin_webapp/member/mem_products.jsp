<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전체회원관리 - 사용자관리 | 관리자페이지</title>
    <link href="../css/templete.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div id="container">
        <div class="sidebar">
            <ul>
                <li>
                    사용자관리
                    <ul>
                        <li class="title"><a href="../member/mem_manage.jsp">- 전체회원관리</a></li>
                        <li><a href="../member/mem_withdrawal.jsp">- 탈퇴신청회원관리</a></li>
                        <li><a href="../member/mem_block.jsp">- 계정차단회원관리</a></li>
                        <li><a href="../member/mem_reported.jsp">- 신고회원관리</a></li>
                    </ul>
                </li>
                <li>
                    상품관리
                    <ul>
                        <li><a href="../product/product_list.jsp">- 상품목록</a></li>
                        <li><a href="../product/payment_list.jsp">- 결제내역</a></li>
                    </ul>
                </li>
                <!-- <li><a href="../category.jsp">카테고리관리</a></li> -->
                <li>
                    게시판
                    <ul>
                        <li ><a href="../notice/notice_list.jsp">- 공지사항</a></li>
                        <li><a href="../notice/FAQ_list.jsp">- 자주묻는질문</a></li>
                    </ul>
                </li>
                <!-- <li><a href="../inquiry/inquiry_list.jsp">문의내역</a></li> -->
            </ul>
        </div>
        <div class="contents">
            <h1><img src="../images/arrow.png">전체회원관리</h1>
            <div class="mem_products">
                <div class="products_list">
                    <h3>상품 <span class="redtxt">8개</span></h3>
                    <div onclick="location.href='../product/product_detail.jsp'"><a href="../product/product_detail.jsp"><img src="../images/상품.PNG"><p>아이폰 12,12프로 실리콘케이스</p><p>4,000원</p></a></div>
                    <div><img src="../images/상품.PNG"><p>아이폰 12,12프로 실리콘케이스</p><p>4,000원</p></div>
                    <div><img src="../images/상품.PNG"><p>아이폰 12,12프로 실리콘케이스</p><p>4,000원</p></div>
                    <div><img src="../images/상품.PNG"><p>아이폰 12,12프로 실리콘케이스</p><p>4,000원</p></div>
                    <div><img src="../images/상품.PNG"><p>아이폰 12,12프로 실리콘케이스</p><p>4,000원</p></div>
                    <div><img src="../images/상품.PNG"><p>아이폰 12,12프로 실리콘케이스</p><p>4,000원</p></div>
                    <div><img src="../images/상품.PNG"><p>아이폰 12,12프로 실리콘케이스</p><p>4,000원</p></div>
                    <div><img src="../images/상품.PNG"><p>아이폰 12,12프로 실리콘케이스</p><p>4,000원</p></div>
                    <div><img src="../images/상품.PNG"><p>아이폰 12,12프로 실리콘케이스</p><p>4,000원</p></div>
                    <div><img src="../images/상품.PNG"><p>아이폰 12,12프로 실리콘케이스</p><p>4,000원</p></div>
                    <input type="button" value="돌아가기" onclick="location.href='./mem_detail.jsp'">
                    <p class="pageNum">1 2 3 4 5</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>