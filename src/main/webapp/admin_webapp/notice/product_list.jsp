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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../js/script.js"></script>
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
                        <li class="title"><a href="../product/product_list.jsp">- 상품목록</a></li>
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
            <h1><img src="../images/arrow.png">상품목록</h1>
            <div class="product_list">
                <div class="product_search">
                    <table>
                        <tr>
                            <th>상품명(상점명)</th>
                            <td><input type="text"></td>
                            <td><input type="button" value="검색"> <input type="button" value="초기화"></td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>선택된 상품을
                                <select name="pro_status">
                                    <option value="상품삭제">상품삭제</option>
                                    <option value="판매중">판매중</option>
                                    <option value="예약중">예약중</option>
                                    <option value="판매완료">판매완료</option>
                                </select>
                                <input type="button" value="처리">
                            </td>
                            <td>
                                <p>선택된 상품 총 34개 | 총 등록상품 80개</p>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="product_lists">
                    <div id="lists1">
                        <table>
                            <tr>
                                <th><input type="checkbox" name="checkAll" id="checkAll"></th>
                                <th colspan="2">상품정보</th>
                                <th>판매상태</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="check"></td>
                                <th><a href="./product_detail.jsp"><img src="../images/상품.PNG" width="100"></a></th>
                                <td><span class="bold"><a href="./product_detail.jsp">아이폰 12,12프로 실리콘케이스</a></span><br>가격:	4,000원<br>디지털/가전 > 모바일 > 케이스/범퍼<br>2021-02-18 12:27:51</td>
                                <td>
                                    <select name="pro_status">
                                    <option value="상품삭제">상품삭제</option>
                                    <option value="판매중">판매중</option>
                                    <option value="예약중">예약중</option>
                                    <option value="판매완료">판매완료</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="check"></td>
                                <th><img src="../images/상품.PNG" width="100"></th>
                                <td><span class="bold">아이폰 12,12프로 실리콘케이스</span><br>가격:	4,000원<br>디지털/가전 > 모바일 > 케이스/범퍼<br>2021-02-18 12:27:51</td>
                                <td>
                                    <select name="pro_status">
                                    <option value="상품삭제">상품삭제</option>
                                    <option value="판매중">판매중</option>
                                    <option value="예약중">예약중</option>
                                    <option value="판매완료">판매완료</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="check"></td>
                                <th><img src="../images/상품.PNG" width="100"></th>
                                <td><span class="bold">아이폰 12,12프로 실리콘케이스</span><br>가격:	4,000원<br>디지털/가전 > 모바일 > 케이스/범퍼<br>2021-02-18 12:27:51</td>
                                <td>
                                    <select name="pro_status">
                                    <option value="상품삭제">상품삭제</option>
                                    <option value="판매중">판매중</option>
                                    <option value="예약중">예약중</option>
                                    <option value="판매완료">판매완료</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="check"/></td>
                                <th><img src="../images/상품.PNG" width="100"></th>
                                <td><span class="bold">아이폰 12,12프로 실리콘케이스</span><br>가격:	4,000원<br>디지털/가전 > 모바일 > 케이스/범퍼<br>2021-02-18 12:27:51</td>
                                <td>
                                    <select name="pro_status">
                                    <option value="상품삭제">상품삭제</option>
                                    <option value="판매중">판매중</option>
                                    <option value="예약중">예약중</option>
                                    <option value="판매완료">판매완료</option>
                                    </select>
                                </td>
                            </tr>
    						<tr>
                                <td><input type="checkbox" name="check"/></td>
                                <th><img src="../images/상품.PNG" width="100"></th>
                                <td><span class="bold">아이폰 12,12프로 실리콘케이스</span><br>가격:	4,000원<br>디지털/가전 > 모바일 > 케이스/범퍼<br>2021-02-18 12:27:51</td>
                                <td>
                                    <select name="pro_status">
                                    <option value="상품삭제">상품삭제</option>
                                    <option value="판매중">판매중</option>
                                    <option value="예약중">예약중</option>
                                    <option value="판매완료">판매완료</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="lists2">
                        <table>
                            <tr>
                                <th><input type="checkbox" name="checkAll"id="checkAll2"></th>
                                <th colspan="2">상품정보</th>
                                <th>판매상태</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="check2"></td>
                                <th><img src="../images/상품.PNG" width="100"></th>
                                <td><span class="bold">아이폰 12,12프로 실리콘케이스</span><br>가격:	4,000원<br>디지털/가전 > 모바일 > 케이스/범퍼<br>2021-02-18 12:27:51</td>
                                <td>
                                    <select name="pro_status">
                                    <option value="상품삭제">상품삭제</option>
                                    <option value="판매중">판매중</option>
                                    <option value="예약중">예약중</option>
                                    <option value="판매완료">판매완료</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="check2"></td>
                                <th><img src="../images/상품.PNG" width="100"></th>
                                <td><span class="bold">아이폰 12,12프로 실리콘케이스</span><br>가격:	4,000원<br>디지털/가전 > 모바일 > 케이스/범퍼<br>2021-02-18 12:27:51</td>
                                <td>
                                    <select name="pro_status">
                                    <option value="상품삭제">상품삭제</option>
                                    <option value="판매중">판매중</option>
                                    <option value="예약중">예약중</option>
                                    <option value="판매완료">판매완료</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="check2"></td>
                                <th><img src="../images/상품.PNG" width="100"></th>
                                <td><span class="bold">아이폰 12,12프로 실리콘케이스</span><br>가격:	4,000원<br>디지털/가전 > 모바일 > 케이스/범퍼<br>2021-02-18 12:27:51</td>
                                <td>
                                    <select name="pro_status">
                                    <option value="상품삭제">상품삭제</option>
                                    <option value="판매중">판매중</option>
                                    <option value="예약중">예약중</option>
                                    <option value="판매완료">판매완료</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <p class="pageNum">1 2 3 4 5</p>
        </div>
    </div>
</body>
</html>