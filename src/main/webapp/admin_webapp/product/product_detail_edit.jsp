<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="product" class="com.koreait.admin.product.ProductDTO"/>
<jsp:useBean id="dao" class="com.koreait.admin.product.ProductDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
		if(request.getParameter("p_idx") == null || request.getParameter("p_idx").equals("")){
%>
			<script>
				alert('잘못된 접근입니다.');
				location.href='product_list.jsp';
			</script>
<%
}else{
	%>
		<jsp:useBean id="CategoryDAO" class="com.koreait.admin.category.CategoryDAO"/>
	<%
		String p_idx = request.getParameter("p_idx");
		product = dao.prodetail(p_idx);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품상세 - 상품관리 | 관리자페이지</title>
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
        <form method="post" accept-charset="utf-8" action="product_detail_edit_ok.jsp?p_idx=<%=product.getIdx() %>" >
	        <div class="contents">
	            <h1><img src="../images/arrow.png">상품상세</h1>
	            <div id="product_detail_edit">
	                <div class="pro_category">
	                    <p>홈 > <%=CategoryDAO.categoryBig(Integer.parseInt(p_idx))%> > <%=CategoryDAO.categoryMiddle(Integer.parseInt(p_idx))%> > <%=CategoryDAO.categorySmall(Integer.parseInt(p_idx))%></p>
	                </div>
	                <div class="pro_detail1">
	                    <table>
	                        <tr>
	                            <td rowspan="5"><img src="../../uploads/<%=product.getPicture()%>" alt='상품이미지'></td>
	                            <th>상품명</th>
	                            <td><input type="text" name="p_name" value="<%=product.getName()%>"></td>
	                            <th>등록일</th>
	                            <td><%=product.getRegdate() %></td>
	                        </tr>
	                        <tr>
	                            <th>가격</th>
	                            <td><input type="text" name="p_price" value="<%=product.getPrice()%>"></td>
	                            <th>거래지역</th>
	                            <td><%=product.getDeallocation() %></td>
	                        </tr>
	                        <tr>
	                            <th>상품상태</th>
	                            <td><select name="p_state">
	                                <option value="새상품">새상품</option>
	                                <option value="중고상품">중고상품</option>
	                            </select></td>
	                            <th>조회수</th>
	                            <td><%=product.getHit() %></td>
	                        </tr>

	                        <tr>
	                            <th>교환여부</th>
	                            <td><select name="p_exchange">
	                                <option value="교환가능">교환가능</option>
	                                <option value="교환불가능">교환불가능</option>
	                            </select></td>
	                            <th>찜</th>
	                            <td><%=product.getZzim() %></td>
	                        </tr>
	                        <tr>
	                            <th>배송비</th>
	                            <td><select name="p_delcharge">
	                                <option value="배송비 포함">배송비 포함</option>
	                                <option value="배송비별도">배송비 별도</option>
	                            </select></td>
	                            <th>판매상태</th>
	                            <td><select name="p_salesStatus">
	                                <option value="판매중">판매중</option>
	                                <option value="판매완료">판매완료</option>
	                            </select></td>
	                        </tr>
	                    </table>
	                </div>
	                <div class="pro_detail2">
	                    <input type="radio" name="tab_group" id="tab01" checked><label for="tab01">상품정보</label>
	
	
	                    <input type="radio" name="tab_group" id="tab02" ><label for="tab02">상품문의</label>
	
	                    <div class="conbox con1"><textarea name="p_content"><%= product.getContent()%></textarea></div>
	                    <div class="conbox con2">
	                        <table>
	                            <tr>
	                                <th>상품 문의 관련</th>
	                                <th>상점명</th>
	                                <th>등록일자</th>
	                                <th>삭제</th>
	                            </tr>
	                            <tr>
	                                <td>상품 만약 구매하면 언제쯤 받아볼 수 있나요?</td>
	                                <td>사과상점</td>
	                                <td>2021-03-03</td>
	                                <td><input type="button" value="삭제"></td>
	                            </tr>
	                            <tr>
	                                <td>상품 만약 구매하면 언제쯤 받아볼 수 있나요?</td>
	                                <td>제우스의상점</td>
	                                <td>2021-03-03</td>
	                                <td><input type="button" value="삭제"></td>
	                            </tr>
	                        </table>
	                        <table>
	                            <tr>
	                                <th>상점후기 관련</th>
	                                <th>상점명</th>
	                                <th>등록일자</th>
	                                <th>삭제</th>
	                            </tr>
	                            <tr>
	                                <td>상품잘받았습니다. 다음에도 거래해요~</td>
	                                <td>바나나상점</td>
	                                <td>2021-02-13</td>
	                                <td><input type="button" value="삭제"></td>
	                            </tr>
	                        </table>
	                    </div>
	                </div>
	            </div>
	            <div class="buttons">
	                <p><input type="submit" value="수정완료"></p>
	                <p><input type="button" value="돌아가기" onclick="history.back(-1);"></p>
	            </div>
	        </div>
    	</form>
</body>
</html>
<%
}
%>