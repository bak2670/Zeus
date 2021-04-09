<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.koreait.admin.product.ProductDTO" %>
<jsp:useBean id="dao" class="com.koreait.admin.product.ProductDAO"/>
<jsp:useBean id="dto" class="com.koreait.admin.product.ProductDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
   request.setCharacterEncoding("UTF-8");
   int totalCount = 0;
   int pagePerCount = 10;
   int start = 0;
   
   String pageNum = request.getParameter("pageNum");
   String m_idx = request.getParameter("m_idx");
   List<ProductDTO> productList = dao.mem_detail(start, pagePerCount, m_idx);
   if(pageNum != null && !pageNum.equals("")){
      start = (Integer.parseInt(pageNum)-1) * pagePerCount;
   }else{
      pageNum = "1";
      start = 0;
   } 
   int int_idx = Integer.parseInt(m_idx);
   int proCnt = dao.proCnt(int_idx); 
   
   totalCount = proCnt;
%>
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
                    <h3>상품 <span class="redtxt"></span></h3>
                    <%
                    for(ProductDTO product : productList){
                       

                    %>
                    
                    <div onclick="location.href='../product/product_detail.jsp?p_idx=%=product.getIdx()%>'"><img src="../../uploads/<%=product.getPicture()%>"><p><%= product.getName() %></p><p><%= product.getPrice() %></p></div>
<%
                    }
               int pageNums = 0;
               if(totalCount % pagePerCount == 0){
                  pageNums = (totalCount / pagePerCount);
                  
               }else{
                  pageNums = (totalCount / pagePerCount) + 1;
               }
%>
                    <input type="button" value="돌아가기" onclick="location.href='./mem_detail.jsp?m_idx=<%=m_idx%>'">
                    <p class="pageNum">
                    <%
            for(int i=1;i<=pageNums;i++){
               out.print("<a href='mem_products.jsp?pageNum=" + i + "'>[" + i + "]</a>" + "&nbsp;&nbsp;");
            }
         %></p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
