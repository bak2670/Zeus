<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="notice" class="com.koreait.admin.notice.NoticeDTO"/>
<jsp:useBean id="dao" class="com.koreait.admin.notice.NoticeDAO"/>

<%
	if(request.getParameter("n_idx") == null || request.getParameter("n_idx").equals("")){
%>
	<script>
		alert("잘못된 접근입니다.");
		location.href='./notice_list.jsp';
	</script>
<%
	}else{
		String n_idx = request.getParameter("n_idx");
		notice = dao.view(n_idx);
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
                        <li class="title"><a href="../notice/notice_list.jsp">- 공지사항</a></li>
                        <li><a href="../notice/FAQ_list.jsp">- 자주묻는질문</a></li>
                    </ul>
                </li>
                <!-- <li><a href="../inquiry/inquiry_list.jsp">문의내역</a></li> -->
            </ul>
        </div>
        <div class="contents">
            <h1><img src="../images/arrow.png">공지사항</h1>
            <div class="notice_box1">
               <input type="text" id="h_tit" value="<%=notice.getTitle() %>"readonly>
               <p><%=notice.getRegdate() %></p>
            </div>
            <div class="notice_box2">
                <div class="notice_text">
                    <%=notice.getContent() %>
                </div>


                <div class="notice_btn"><input type="button" value="글 수정" onclick="location.href='./notice_edit.jsp?n_idx=<%=notice.getIdx()%>'"> 
                <input type="button" value="글 삭제" onclick="location.href='./notice_delete.jsp?n_idx=<%=notice.getIdx()%>'">
                    <input type="button" value="뒤로가기" onclick="location.href='./notice_list.jsp'"></div>
            </div>

        </div>
    </div>
    </div>
</body>
</html>
<%
	}
%>