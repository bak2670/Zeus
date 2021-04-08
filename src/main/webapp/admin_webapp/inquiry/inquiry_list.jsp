<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.koreait.admin.onetoone.OnetooneDTO" %>
<jsp:useBean id="dao" class="com.koreait.admin.onetoone.OnetooneDAO"/>

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

	List<OnetooneDTO> inquiryList = dao.selectInquiry(start, pagePerCount);
	
	String o_idx = request.getParameter("o_idx");

%> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의내역 - 사용자관리 | 관리자페이지</title>
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
                        <li><a href="../product/product_detail.jsp">- 상품상세</a></li>
                    </ul>
                </li>
                <li><a href="../category.jsp">카테고리관리</a></li>
                <li>
                    게시판
                    <ul>
                        <li ><a href="../notice/notice_list.jsp">- 공지사항</a></li>
                        <li><a href="../notice/FAQ_list.jsp">- 자주묻는질문</a></li>
                    </ul>
                </li>
                <li class="title"><a href="./inquiry_list.jsp">문의내역</a></li>
            </ul>
        </div>
        <div class="contents">
            <h1><img src="../images/arrow.png">문의내역</h1>
            <div class="notice_list marg">
                <div class="menu_bar">
                    <div class="menu_b"> <input type="text" name="registration" value="등록일기준" class="d_btn1"> <input
                            type="text" name="date1" id="date1"> ~ <input type="text" name="date2" id="date2"> <input
                            type="button" name="d_btn" id="today" value="오늘날짜"> <input type="button" name="d_btn"
                            id="one_week" value="최근1주일"> <input type="button" name="d_btn" id="15th" value="최근15일">
                        <input type="button" name="d_btn" id="one_month" value="최근1개월"> <input type="button"
                            name="d_btn" id="two_month" value="최근2개월"> <input type="button" name="d_btn"
                            id="three_month" value="최근3개월"> </div>
                </div>
                <div class="bar_2">
                    <select class="option" id="option">
                        <option value="">답변상태</option>
                        <option value="">미확인</option>
                        <option value="">처리완료</option>
                    </select>
                    <select class="option2" id="option2">
                        <option value="">이름</option>
                        <option value="">연락처</option>
                        <option value="">이메일</option>
                        <option value="">아이디</option>
                        <option value="">제목</option>
                    </select>
                    <input type="text" id="inSearch"> <input type="submit" value="검색" id="search_btn">
                </div>



                <table class="notice_table">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>질문유형</th>
                        <th>이름(상점명)</th>
                        <th>작성일</th>
                        <th>처리여부</th>
                        <th>답변 일자</th>
                    </tr>
                   
<% 
				for(OnetooneDTO inquiry : inquiryList){
					
			String inq = dao.getinq(inquiry.getMemidx());
			String inq1 = dao.getinq1(inquiry.getMemidx());
%>
                    <tr>
                        <td><%= inquiry.getIdx() %></td>
                        <td><a href="./inquiry_detail.jsp?o_idx=<%=inquiry.getIdx()%>"><%=inquiry.getContent() %></a></td>
                        <td><%=inquiry.getBigCate() %> > <%=inquiry.getMidCate() %></td>
                        <td><%=inq1 %>(<%=inq %>)</td>
                        <td><%=inquiry.getRegdate() %></td>
                        <td class="redtxt"><%
                        if(inquiry.getAnswerOK().equals("N")){
                        	out.println("미처리");
                        }else{
                        	out.println("처리완료");
                        }
                        %></td>
                        <td><input type="submit" value="답변하기"></td>
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
					out.print("<a href='inquiry_list.jsp?pageNum=" + i + "'>[" + i + "]</a>" + "&nbsp;&nbsp;");
				}
%>
			</p>
        </div>
    </div>
</body>

</html>