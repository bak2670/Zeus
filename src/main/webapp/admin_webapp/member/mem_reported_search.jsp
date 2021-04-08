<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.koreait.admin.report.ReportDTO" %>
<jsp:useBean id="dao" class="com.koreait.admin.report.ReportDAO"/>

<%
	request.setCharacterEncoding("UTF-8");
	int totalCount = 0;
	int pagePerCount = 10;
	int start = 0;

	String mem_search = request.getParameter("mem_search");
	String searchMem = request.getParameter("searchMem");
	
	List<ReportDTO> reportList = dao.searchMember(mem_search, searchMem); 

	
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
                        <li class="title"><a href="../member/mem_reported.jsp">- 신고회원관리</a></li>
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
            <h1><img src="../images/arrow.png">신고회원관리</h1>
            <div id="mem_withdrawal">
                <div class="mem_search">
                    <form method="post" action="./mem_reported_search.jsp">
	                    <p>
	                        <select name="mem_search">
	                            <option value="이름">이름</option>
	                            <option value="상점명">상점명</option>
	                        </select>
	                    </p>
	                    <p><input type="text" name="searchMem"></p>
	                    <p><input type="submit" value="검색"></p>
                    </form>
                </div>
                <div class="mem_list">
                    <p> </p>
                    <p> </p>
                    <%
                    if(!reportList.isEmpty()){
                    %>
                    <table id="mem_table">
                        <tr>
                            <th><input type="checkbox" name="checkAll" id="checkAll"></th>
                            <th>신고번호</th>
                            <th>회원이름(상점명)</th>
                            <th>신고이유</th>
                            <th>신고상품</th>
                            <th>신고일</th>
                            <th>신고자</th>
                            <th>신고횟수</th>
                            <th>계정차단</th>
                            <th>계정삭제</th>
                        </tr>
<%								
						for(ReportDTO report : reportList){
							String memname = dao.getMemname(report.getMemidx()); 
							String memstore = dao.getMemstore(report.getMemidx()); 
							String reportername = dao.getMemname(report.getReporteridx());
							String reporterstore = dao.getMemstore(report.getReporteridx()); 
							String product = dao.getProduct(report.getProductidx());
%>
                        <tr>
                            <td><input type="checkbox" name="check"></td>
                            <td><%= report.getIdx() %></td>
                            <td class="redtxt"><%= memname %>(<%= memstore %>의상점)</a></td>
                            <td><%= report.getReason() %></td>
                            <td><%= product %></td>
                            <td><%= report.getRegdate() %></td>
                            <td><%= reportername %>(<%= reporterstore %>상점)</td>
                            
<%
							if(report.getCount() >= 3){
%>
							<td class="redtxt"><%= report.getCount() %></td>
<%
							}else{
%>
							<td><%= report.getCount() %></td>
<%
							}
%>
                            
                            <td><input type="button" value="차단" class="block" onclick="location.href='./mem_block_ok.jsp?m_idx=<%= report.getMemidx() %>&&page=mem_reported'"></td>
                            <td><input type="button" value="삭제" class="userDel" onclick="location.href='./mem_delete_ok.jsp?m_idx=<%= report.getMemidx() %>&&page=mem_reported'"></td>
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
                <p> </p>
            </div>
            <p class="pageNum">
<%
				for(int i=1;i<=pageNums;i++){
					out.print("<a href='mem_manage.jsp?pageNum=" + i + "'>[" + i + "]</a>" + "&nbsp;&nbsp;");
				}			}else{
					%>
					<p>신고된 회원이 존재하지 않습니다</p>
				<%
							}
				%>

			</p>
        </div>
    </div>
</body>
</html>