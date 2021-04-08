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
                        <li><a href="../member/mem_manage.jsp">- 전체회원관리</a></li>
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
                        <li><a href="../notice/notice_list.jsp">- 공지사항</a></li>
                        <li class="title"><a href="../notice/FAQ_list.jsp">- 자주묻는질문</a></li>
                    </ul>
                </li>
                <!-- <li><a href="../inquiry/inquiry_list.jsp">문의내역</a></li> -->
            </ul>
        </div>
        <div class="contents">
            <h1><img src="../images/arrow.png">자주묻는질문</h1>
            <form method="post" action="FAQ_add_ok.jsp">
            <div class="q_edit1">
                <select class="q_sel" name="q_category">
                    <option value="상점/상품">상점/상품</option>
                    <option value="거래">거래</option>
                    <option value="번개페이">번개페이</option>
                    <option value="회원정보(계정)">회원정보(계정)</option>
                    <option value="택배서비스">택배서비스</option>
                    <option value="제재정책">제재정책</option>
                    <option value="광고서비스(UP하기)">광고서비스(UP하기)</option>
                    <option value="똑똑한 판매팁">똑똑한 판매팁</option>
                    <option value="안전한 구매팁">안전한 구매팁</option>
                    <option value="분쟁해결기준">분쟁해결기준</option>
                    <option value="내폰시세/판매">내폰시세/판매</option>
                    <option value="번개장터 포장택배">번개장터 포장택배</option>
                </select>
                <input type="text" class="q_edit2_t" placeholder="제목을 입력하세요" name="q_title">
            </div>
            <div class="q_empty">
            </div>
            <div class="q_edit3">
                <textarea class="q_edit3_t" placeholder="글을 입력하세요" name="q_content"></textarea>
            </div>
            <div class="q_edit4">
                <p><input type="submit" value="추가완료"> <input type="button" value="뒤로가기" onclick="location.href='./FAQ_list.jsp'"></p>
            </div>
            </form>

        </div>
    </div>
</body>

</html>