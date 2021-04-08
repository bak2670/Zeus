<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="inquire" class="com.koreait.admin.inquire.InquireDTO"/>
<jsp:useBean id="product" class="com.koreait.admin.product.ProductDTO"/>
<jsp:useBean id="dao" class="com.koreait.admin.product.ProductDAO"/>



<%
	if(request.getParameter("p_idx") == null || request.getParameter("p_idx").equals("")){
%>
	<script>
		alert("잘못된 접근입니다.");
		location.href='./product_list.jsp';
	</script>
<%
	}else{
		
	%>		
		
		<jsp:useBean id="member" class="com.koreait.admin.member.MemberDTO" scope="page"/>
		<jsp:useBean id="reviewDTO" class="com.koreait.admin.review.reviewDTO" scope="page"/>
		<jsp:useBean id="reviewDAO" class="com.koreait.admin.review.reviewDAO"/>
		<jsp:useBean id="InquireDAO" class="com.koreait.admin.inquire.InquireDAO"/>
		<jsp:useBean id="CategoryDAO" class="com.koreait.admin.category.CategoryDAO"/>
		
	
	<%
		String p_idx = request.getParameter("p_idx");
		String p_delcharge = request.getParameter("p_delcharge");
		String exchange = "";
      	String delcharge="";
		
		product = dao.prodetail(p_idx);

       	if(product.getExchange().equals("Y")){
       		exchange="교환가능";
       	}else{
       		exchange="교환불가능";
       	}

      	if(product.getDelcharge().equals("Y")){
      		delcharge="배송비 포함";
      	}else{
      		delcharge="배송비 별도";
      	}

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품상세 - 상품관리 | 관리자페이지</title>
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
            <h1><img src="../images/arrow.png">상품상세</h1>
            <div id="product_detail">
                <div class="pro_category">
                    <p>홈 > <%=CategoryDAO.categoryBig(Integer.parseInt(p_idx))%> > <%=CategoryDAO.categoryMiddle(Integer.parseInt(p_idx))%> > <%=CategoryDAO.categorySmall(Integer.parseInt(p_idx))%></p>
                </div>
                <div class="pro_detail1">
                    <table>
                        <tr>
                            <td rowspan="5"><img src="../../uploads/<%=product.getPicture()%>" alt='상품이미지'></td>
                            <th>상품명</th>
                            <td><%=product.getName()%></td>
                            <th>상품상태</th>
                            <td><%=product.getState()%></td>
                        </tr>
                        <tr>
                            <th>가격</th>
                            <td><%=product.getPrice() %>원</td>                           
                            <th>교환여부</th>
                            <td><%= exchange%></td>
                        </tr>
                        <tr>
                        	<th>판매자</th>
	                        <%
	                           String seller = "";
	                           seller = dao.getSeller(product.getMemidx());
	                           
	                        %>
	                        <td><%= seller %></td>
                            <th>배송비</th>
                            <td><%= delcharge %></td>
                        </tr>
                        <tr>
                            <th>판매상태</th>
                            <td><%=product.getSalesStatus() %></td>
                            <th>거래지역</th>
                            <td><%=product.getDeallocation() %></td>
                        </tr>
                        <tr>
                            <th>등록일</th>
                            <td><%=product.getRegdate() %></td>
                            <th>찜</th>
                            <td><%=product.getZzim() %></td>
                        </tr>
                    </table>
                </div>
                <div class="pro_detail2">
                    <input type="radio" name="tab_group" id="tab01" checked><label for="tab01">상품정보</label>


                    <input type="radio" name="tab_group" id="tab02" ><label for="tab02">상품문의</label>

                    <div class="conbox con1"><p><%= product.getContent()%></p></div>
                    <div class="conbox con2">
                        <table>
                            <tr>
                                <th>상품 문의 관련</th>
                                <th>상점명</th>
                                <th>등록일자</th>
                                <th>삭제</th>
                            </tr>
    <%   
  
List<HashMap<String, String>> inquireList = InquireDAO.inquire(p_idx);
int inquireCnt = inquireList.size();
for(HashMap inq : inquireList){

 %>                 
                            <tr>
                                <td><%=inq.get("i_content") %></td>
                                <td><%=InquireDAO.inquire1(String.valueOf(inq.get("i_memidx"))) %></td>
                                <td><%=inq.get("i_regdate") %></td>
                                <td><input type="button" value="삭제" onclick="location.href='./product_inquire_delete.jsp?p_idx=<%=product.getIdx()%>'"></td>
                            </tr>
                            <%
}
                            %>

                        </table>
                        <table>
                            <tr>
                                <th>상점후기 관련</th>
                                <th>상점명</th>
                                <th>등록일자</th>
                                <th>삭제</th>
                             </tr> 

<%   
  System.out.println(product.getMemidx());

List<HashMap<String, String>> reviewList = reviewDAO.review(p_idx);
int reviewCnt = reviewList.size();

for(HashMap rev : reviewList){
	
 %>  
                           <tr>
                                <td><%=rev.get("rv_content") %> </td>
                                <td><%=reviewDAO.review1(String.valueOf(rev.get("rv_memidx"))) %></td>
                                <td><%=rev.get("rv_regdate") %></td>
                                <td><input type="button" value="삭제"></td>
                            </tr>
                            <%
}
                            %>
                            
                        </table>
                    </div>
                </div>
            </div>
            <div class="buttons">
                <p><input type="button" value="상품수정" onclick="location.href='./product_detail_edit.jsp?p_idx=<%=product.getIdx()%>'"></p>
                <p><input type="button" value="상품삭제" onclick="location.href='./product_delete.jsp?p_idx=<%=product.getIdx()%>'"></p>
                <p><input type="button" value="계정차단" id="popOpenBtn"></p>
                <p><input type="button" value="돌아가기" onclick="history.back(-1);"></p>
            </div>
            <div id ="popup_mask"></div>
                <div id="popupDiv"> <!-- 팝업창 -->
                   <form method="post" action="product_block_ok.jsp?p_memidx=<%=product.getMemidx()%>">
                    <div>
                        <p><img src="../images/arrow.png">회원차단</p>
                        <hr>
                        <h2>회원을 차단하시겠습니까?</h2>
                        <textarea name="b_blockreason" placeholder="차단사유를 작성해주세요."></textarea>
                    </div>
                    <input type="submit" class="popCloseBtn" value="차단">
                    <input type="button" class="popCloseBtn" value="취소">
                    </form>	
                </div>
            
        </div>
    </div>
</body>
</html>
<%
}
	
%>