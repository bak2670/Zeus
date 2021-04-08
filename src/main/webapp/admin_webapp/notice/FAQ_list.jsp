<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.koreait.admin.faq.FaqDTO" %>
<jsp:useBean id="dao" class="com.koreait.admin.faq.FaqDAO"/>
<%
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
	
	List<FaqDTO> faqList = dao.selectFaq(start, pagePerCount);

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
                        <li><a href="../product/product_list.jsp">- 상품목록</a></li>
                        <li><a href="../product/payment_list.jsp">- 결제내역</a></li>
                    </ul>
                </li>
                <!-- <li><a href="../category.jsp">카테고리관리</a></li> -->
                <li>
                    게시판
                    <ul>
                        <li ><a href="../notice/notice_list.jsp">- 공지사항</a></li>
                        <li class="title"><a href="../notice/FAQ_list.jsp">- 자주묻는질문</a></li>
                    </ul>
                </li>
                <!-- <li><a href="../inquiry/inquiry_list.jsp">문의내역</a></li> -->
            </ul>
        </div>
        <div class="contents">
            <h1><img src="../images/arrow.png">자주묻는질문</h1>
            <div class="notice_list">
                <table class="notice_table">
                    <tr>                        
                        <th>분류</th>
                        <th>제목</th>
                        <th>삭제</th>
                    </tr>
<%
					for(FaqDTO faq : faqList){
%>
                    <tr>
                        <td><%= faq.getCategory() %></td>
                        <td><a href="./FAQ_detail.jsp?q_idx=<%=faq.getIdx()%>"><%= faq.getTitle() %></a></td>
                        <td><input type="button" value="삭제" class="faqDel" onclick="location.href='FAQ_delete.jsp?q_idx=<%=faq.getIdx()%>'"></td>
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
                <p><input type="button" value="글 추가" onclick="location.href='./FAQ_add.jsp'"> </p>
            </div>
            <p></p>
            <p class="pageNum">
<%
				for(int i=1;i<=pageNums;i++){
					out.print("<a href='FAQ_list.jsp?pageNum=" + i + "'>[" + i + "]</a>" + "&nbsp;&nbsp;");
				}
%>
			</p>
        </div>
    </div>
</body>

</html>