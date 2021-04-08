<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전체회원관리 - 사용자관리 | 관리자페이지</title>
    <link href="./css/templete.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div id="container">
        <div class="sidebar">
            <ul>
                <li>
                    사용자관리
                    <ul>
                        <li><a href="./member/mem_manage.jsp">- 전체회원관리</a></li>
                        <li><a href="./member/mem_withdrawal.jsp">- 탈퇴신청회원관리</a></li>
                        <li><a href="./member/mem_block.jsp">- 계정차단회원관리</a></li>
                        <li><a href="./member/mem_reported.jsp">- 신고회원관리</a></li>
                    </ul>
                </li>
                <li>
                    상품관리
                    <ul>
                        <li><a href="./product/product_list.jsp">- 상품목록</a></li>
                        <li><a href="./product/payment_list.jsp">- 결제내역</a></li>
                    </ul>
                </li>
                <li class="title"><a href="./category.jsp">카테고리관리</a></li>
                <li>
                    게시판
                    <ul>
                        <li ><a href="./notice/notice_list.jsp">- 공지사항</a></li>
                        <li><a href="./notice/FAQ_list.jsp">- 자주묻는질문</a></li>
                    </ul>
                </li>
                <li><a href="./inquiry/inquiry_list.jsp">문의내역</a></li>
            </ul>
        </div>
        <div class="contents">
            <h1><img src="./images/arrow.png">카테고리관리</h1>
            <div class="category">
                <div>
                    <h3>대분류</h3>
                    <table class="category1">
                        <tr>
                            <th><input type="checkbox" name="caCheck"></th>
                            <th>분류명</th>
                            <th>출력</th>
                            <th>하위</th>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="caCheck"></td>
                            <td>여성의류</td>
                            <td>yes</td>
                            <td>▶</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="caCheck"></td>
                            <td>패션잡화</td>
                            <td>yes</td>
                            <td>▶</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="caCheck"></td>
                            <td>남성의류</td>
                            <td>yes</td>
                            <td>▶</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="caCheck"></td>
                            <td>디지털/가전</td>
                            <td>yes</td>
                            <td>▶</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                    <table class="category2">
                        <tr>
                            <th><input type="checkbox" name="caCheck"></th>
                            <th>분류명</th>
                            <th>출력</th>
                            <th>하위</th>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="caCheck"></td>
                            <td>원피스</td>
                            <td>yes</td>
                            <td>▶</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="caCheck"></td>
                            <td>스커트/치마</td>
                            <td>yes</td>
                            <td>▶</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="caCheck"></td>
                            <td>자켓</td>
                            <td>yes</td>
                            <td>▶</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="caCheck"></td>
                            <td>니트/스웨터</td>
                            <td>yes</td>
                            <td>▶</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="caCheck"></td>
                            <td>야상/점퍼/패딩</td>
                            <td>yes</td>
                            <td>▶</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
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
    </div>
</body>
</html>