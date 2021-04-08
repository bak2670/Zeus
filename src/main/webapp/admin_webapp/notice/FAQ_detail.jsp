<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="faq" class="com.koreait.admin.faq.FaqDTO"/>
<jsp:useBean id="dao" class="com.koreait.admin.faq.FaqDAO"/>

<%
	if(request.getParameter("q_idx") == null || request.getParameter("q_idx").equals("")){
%>
	<script>
		alert("잘못된 접근입니다.");
		location.href='./FAQ_list.jsp';
	</script>
<%
	}else{
		String q_idx = request.getParameter("q_idx");
		faq = dao.view(q_idx);
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
                        <li><a href="../notice/notice_list.jsp">- 공지사항</a></li>
                        <li class="title"><a href="../notice/FAQ_list.jsp">- 자주묻는질문</a></li>
                    </ul>
                </li>
                <!-- <li><a href="../inquiry/inquiry_list.jsp">문의내역</a></li> -->
            </ul>
        </div>
        <div class="contents">
            <h1><img src="../images/arrow.png">자주묻는질문</h1>

            <form method="#" action="#">
                <div class="asked_wrap">
                    <div class="asked">
                    	<%-- <%=faq.getCategory() %> --%>
                        <select id="asked_sel" name="asked_sel" onFocus='this.initialSelect = this.selectedIndex;'
                        onChange='this.selectedIndex = this.initialSelect;'>
                            <option value="<%=faq.getCategory() %>"  ><%=faq.getCategory() %></option>
                        </select>
                        <input type="text" name="asked_tit" id="asked_tit" class="asked_tit" value="<%=faq.getTitle() %>" readonly>
                    </div>
                    <div class="asked_content">
                        <%=faq.getContent() %>
                    </div>
                    <div class="asked_btn"><input type="button" value="글수정" onclick="location.href='./FAQ_edit.jsp?q_idx=<%=faq.getIdx()%>'"> 
                    <input type="button" value="글삭제" onclick="location.href='./FAQ_delete.jsp?q_idx=<%=faq.getIdx()%>'">
                        <input type="button" value="뒤로가기" onclick="location.href='./FAQ_list.jsp'"></div>
                </div>
            </form>
        </div>
    </div>
    </div>
</body>
</html>
<%
}
%>