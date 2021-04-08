<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="com.koreait.admin.onetoone.OnetooneDAO"/>
<jsp:useBean id="inquiry" class="com.koreait.admin.onetoone.OnetooneDTO"/>

<%
	if(request.getParameter("o_idx") == null || request.getParameter("o_idx").equals("")){
%>
	<script>
		alert("잘못된 접근입니다.");
		location.href='./inquiry_list.jsp';
	</script>
<%
	}else{
	
	String o_idx = request.getParameter("o_idx");	
	
	inquiry = dao.inqview(o_idx);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의내역 - 사용자관리 | 관리자페이지</title>
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
        <div class="contents " id="contents_userQ">
            <h1><img src="../images/arrow.png">문의내역 상세보기</h1>

            <div class="userQ_detail">
                <h3 class="userQ_fcol">기본정보</h3>
                <form method="post" action="inquiry_detail_edit.jsp?o_idx=<%=inquiry.getIdx() %>">
                <table class="userQ_detail_table">
                    <tr>
                        <th class="userQ_th">질문 유형</th>
                        <td><%=inquiry.getBigCate() %> > <%=inquiry.getMidCate() %></td>
                        <th class="userQ_th">등록일시</th>
                        <td><%=inquiry.getRegdate() %></td>
                    </tr>
                    <tr>
                        <th class="userQ_th">이름(상점명)</th>
                        <td><%=dao.oneMemName(Integer.parseInt(o_idx))%>(<%=dao.oneMemStore(Integer.parseInt(o_idx))%>)</td>
                        <th class="userQ_th">답변상태</th>
                        <td><%
                        if(inquiry.getAnswerOK().equals("N")){
                        	out.println("미처리");
                        }else{
                        	out.println("처리완료");
                        }
                        %></td>
                      
                    </tr>
                    <tr>
                        <th class="userQ_th">연락처</th>
                        <td><%=dao.oneMemHp(Integer.parseInt(o_idx))%></td>
                        <th class="userQ_th">이메일</th>
                        <td><% if(dao.oneMemEmail1(Integer.parseInt(o_idx)) != null){
                        	out.println(dao.oneMemEmail1(Integer.parseInt(o_idx)));
                        }else{
                        	out.println(dao.oneMemEmail2(Integer.parseInt(o_idx)));
                        }
                        %>
                        </td>
                    </tr>
                    
                </table>
                <h3 class="userQ_fcol">상세정보</h3>
                <table class="userQ_detail_table">
                    <tr>
                        <th class="userQ_th">상담내용</th>
                        <td><%=inquiry.getContent() %></td>
                    </tr>
                </table>
            </div>
            <div class="userA">
                    <textarea class="userA_txt" name="o_answer" placeholder="내용을 입력해주세요">
                    </textarea>
                <div class=" userQ_detail_btn1">
                    <p><input type="submit" value="답변완료">
                    <input type="button" value="뒤로가기" onclick="location.href='./inquiry_list.jsp'"></p>
                </div>
                </form>
            </div>

        </div>
    </div>
    </div>
</body>

</html>
<%
}
%>