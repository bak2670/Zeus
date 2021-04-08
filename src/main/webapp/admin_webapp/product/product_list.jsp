<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   if(pageNum != null && !pageNum.equals("")){
      start = (Integer.parseInt(pageNum)-1) * pagePerCount;
   }else{
      pageNum = "1";
      start = 0;
   }
   
   totalCount = dao.page();
   List<ProductDTO> proList = dao.proList(start, pagePerCount); 
   String proCnt = "";
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
                        <form method="post" action="./product_list_search.jsp">
                        <tr>
                            <th><select name="pro_search">
                               <option value="상품명">상품명</option>
                               <option value="상점명">상점명</option>
                           </select></th>
                            <td><input type="text" name="searchPro"></td>
                            <td><input type="submit" value="검색"></td>
                        </tr>
                       <!--  <tr>
                            <td colspan=3>
                                <p>선택된 상품 총 34개 | 총 등록상품 80개</p> 
                            </td>
                        </tr> -->
                         </form>
                    </table>

                </div>
                <div id="product_lists">
                    <div id="lists1">
                        <table>
                            <tr>
                                <th colspan="2">상품정보</th>
                                <th>판매상태</th>
                            </tr>
<%
						int productCnt = proList.size() % 10;
					// 10로 나눠 떨어지면 걍 다 보여주고
					if(productCnt == 0){
						
						for(int i=0; i<5; i++){
							proList.get(i);
							
%>                     
                            <tr>
                                <th><a href="./product_detail.jsp?p_idx=<%=proList.get(i).getIdx()%>"><img src='../../uploads/<%=proList.get(i).getPicture()%>' width="100" alt="상품이미지"></a></th>
                                <td><span class="bold"><a href="./product_detail.jsp?p_idx=<%=proList.get(i).getIdx()%>"><%=proList.get(i).getName() %></a></span><br><%= proList.get(i).getPrice() %>원
                                <br>
<%
							String cate1 = dao.getCate1(proList.get(i).getCategory());
							String cate2 = dao.getCate2(proList.get(i).getCategory());
							String cate3 = dao.getCate3(proList.get(i).getCategory());
							String seller = dao.getSeller(proList.get(i).getMemidx());
%> 
									<%=cate1 %> > <%=cate2 %> > <%=cate3 %>
									<br>판매자 : <%=seller %></td>
                                <td><%=proList.get(i).getSalesStatus()%></td>
                            </tr>
                            <%
						}
                            %>
                        </table>
                    </div>
                    
                    <div id="lists2">
                        <table>
                            <tr>
                                <th colspan="2">상품정보</th>
                                <th>판매상태</th>
                            </tr>
<%
						for(int i=5; i<10; i++){
							proList.get(i);
							String seller = dao.getSeller(proList.get(i).getMemidx());
%>       
                            <tr>
                                <th><a href="./product_detail.jsp?p_idx=<%=proList.get(i).getIdx()%>"><img src='../../uploads/<%=proList.get(i).getPicture()%>' width="100" alt="상품이미지"></th>
                                <td><span class="bold"><a href="./product_detail.jsp?p_idx=<%=proList.get(i).getIdx()%>"><%=proList.get(i).getName() %></a></span><br><%= proList.get(i).getPrice() %>원<br>디지털/가전 > 모바일 > 케이스/범퍼<br>판매자 : <%=seller %></td>
                                <td><%=proList.get(i).getSalesStatus()%></td> 
<%
						}


				}else{
					
					// 10으로 나눴는데 나머지 있으면
					// 5로 나눴을 때 또 몫이 있으면 한번 돌리고 나머지 보여줘야해
					int temp = productCnt / 5;
					
					if(temp == 1){
						
					
					for(int i=0; i<5; i++){
						proList.get(i);
						
%>                     
                        <tr>
                            <th><a href="./product_detail.jsp?p_idx=<%=proList.get(i).getIdx()%>"><img src='../../uploads/<%=proList.get(i).getPicture()%>' width="100" alt="상품이미지"></a></th>
                            <td><span class="bold"><a href="./product_detail.jsp?p_idx=<%=proList.get(i).getIdx()%>"><%=proList.get(i).getName() %></a></span><br><%= proList.get(i).getPrice() %>원
                            <br>
<%
						String cate1 = dao.getCate1(proList.get(i).getCategory());
						String cate2 = dao.getCate2(proList.get(i).getCategory());
						String cate3 = dao.getCate3(proList.get(i).getCategory());
						String seller = dao.getSeller(proList.get(i).getMemidx());
%> 
								<%=cate1 %> > <%=cate2 %> > <%=cate3 %>
								<br>판매자 : <%=seller %></td>
                            <td><%=proList.get(i).getSalesStatus()%></td>
                        </tr>
                        <%
					}
                        %>
                    </table>
                </div>
                
                <div id="lists2">
                        <table>
                            <tr>
                                <th colspan="2">상품정보</th>
                                <th>판매상태</th>
                            </tr>
<%
						for(int i=5; i<proList.size(); i++){
							proList.get(i);
							String seller = dao.getSeller(proList.get(i).getMemidx());
%>       
                            <tr>
                                <th><a href="./product_detail.jsp?p_idx=<%=proList.get(i).getIdx()%>"><img src='../../uploads/<%=proList.get(i).getPicture()%>' width="100" alt="상품이미지"></th>
                                <td><span class="bold"><a href="./product_detail.jsp?p_idx=<%=proList.get(i).getIdx()%>"><%=proList.get(i).getName() %></a></span><br><%= proList.get(i).getPrice() %>원<br>디지털/가전 > 모바일 > 케이스/범퍼<br>판매자 : <%=seller %></td>
                                <td><%=proList.get(i).getSalesStatus()%></td> 
                          
<%
						}
                
				}else{
					// 5로 나눴는데 몫이 1이 아니면 그냥 나머지애들만 돌려주면돼
				
					for(int i=0; i<proList.size(); i++){
						proList.get(i);
						
%>                     
                        <tr>
                            <th><a href="./product_detail.jsp?p_idx=<%=proList.get(i).getIdx()%>"><img src='../../uploads/<%=proList.get(i).getPicture()%>' width="100" alt="상품이미지"></a></th>
                            <td><span class="bold"><a href="./product_detail.jsp?p_idx=<%=proList.get(i).getIdx()%>"><%=proList.get(i).getName() %></a></span><br><%= proList.get(i).getPrice() %>원
                            <br>
<%
						String cate1 = dao.getCate1(proList.get(i).getCategory());
						String cate2 = dao.getCate2(proList.get(i).getCategory());
						String cate3 = dao.getCate3(proList.get(i).getCategory());
						String seller = dao.getSeller(proList.get(i).getMemidx());
%> 
								<%=cate1 %> > <%=cate2 %> > <%=cate3 %>
								<br>판매자 : <%=seller %></td>
                            <td><%=proList.get(i).getSalesStatus()%></td>
                        </tr>
                        <%
					}
                        %>

<%

					
				}
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
                </div>
            </div>
            <p class="pageNum">  
            <%
				for(int i=1;i<=pageNums;i++){
					out.print("<a href='product_list.jsp?pageNum=" + i + "'>[" + i + "]</a>" + "&nbsp;&nbsp;");
				}
			%> 
			</p>
        </div>
    </div>
</body>
</html>