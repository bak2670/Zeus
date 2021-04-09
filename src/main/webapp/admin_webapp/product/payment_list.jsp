<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.koreait.admin.payment.PaymentDTO" %>
<jsp:useBean id="dao" class="com.koreait.admin.payment.PaymentDAO"/>

<%
request.setCharacterEncoding("UTF-8");
   if(session.getAttribute("adminid") == null){
%>
   <script>
      alert('로그인 후 이용하세요');
      location.href='../login.jsp';
   </script>
<%
   }else{
	int totalCount = 0;
	int pagePerCount = 10;
	int start = 0;
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum != null && !pageNum.equals("")){
		start = (Integer.parseInt(pageNum)-1) * pagePerCount;
	}else{
		pageNum = "1";
		start = 0;
	}
	
	List<PaymentDTO> paymentList = dao.selectPayment(start, pagePerCount);
	
	totalCount = dao.page();
	
	String proCnt = "";
	String m_gender="";

%>
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
    <div id="container" >
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
                        <li class="title"><a href="../product/payment_list.jsp">- 결제내역</a></li>
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
            <h1><img src="../images/arrow.png">결제내역</h1>
            <div id="mem_manage">
                <div class="mem_search">
                    <form method="post" action="./payment_list_search.jsp">
	                    <p>
	                        <select name="payment_search" style="width:130px;">
	                            <option value="판매자이름">판매자이름</option>
	                            <option value="구매자이름">구매자이름</option>
	                            <option value="상품명">상품명</option>
	                        </select>
	                    </p>
	                    <p><input type="text" name="searchPayment"></p>
	                    <p><input type="submit" value="검색"></p>
                    </form>
                </div>
                <div class="mem_list">
                    <p> </p> <!-- 총 4명의 사용자가 검색되었습니다 -->
                    <p> </p><!-- 오늘 가입자수 : 4명 -->
                    <table id="mem_table">
                        <tr>
                            <th>판매자</th>
                            <th>상품명</th>
                            <th>구매자</th>
                            <th>가격</th>
                            <th>결제시각</th>
                        </tr>
<%
						for(PaymentDTO payment : paymentList){
							String sellerName = dao.getMemname(payment.getSellerIdx());
							String sellerStore = "("+dao.getMemstore(payment.getSellerIdx())+")";
							String buyerName = dao.getMemname(payment.getBuyerIdx());
							String buyerStore = "("+dao.getMemstore(payment.getBuyerIdx())+")";
							String product = dao.getProduct(payment.getProductIdx());
							String price = dao.getPrice(payment.getProductIdx());
							
							if(sellerName == ""){
								sellerName = "<span class='redtxt'>탈퇴한 유저</span>";
								sellerStore = "";
							}
							if(buyerName == ""){
								buyerName = "<span class='redtxt'>탈퇴한 유저</span>";
								buyerStore = "";
							}
							
							if(product == ""){
								product = "<span class='redtxt'>삭제된 상품</span>";	
							}
%>
						<tr>
                            <td><%= sellerName %><%= sellerStore %></td>
                            <td><%= product %></td>
                            <td><%= buyerName %><%= buyerStore %></td>
                            <td><%= price%></td>
                            <td><%= payment.getRegdate() %></td>
                        </tr>
<%
						}

						int pageNums = 0;
						if(totalCount % pagePerCount == 0){
							pageNums = (totalCount / pagePerCount);
							
						}else{
							pageNums = (totalCount / pagePerCount) + 1;
						}
%>
                    </table>
                </div>
            <p class="pageNum">
            <%
				for(int i=1;i<=pageNums;i++){
					out.print("<a href='payment_list.jsp?pageNum=" + i + "'>[" + i + "]</a>" + "&nbsp;&nbsp;");
				}
			%>
			</p>
        </div>
    </div>
</body>
</html>
<%} %>
