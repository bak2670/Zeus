<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.koreait.admin.member.MemberDTO" %>
<%@ page import="com.koreait.admin.withdraw.WithdrawDTO" %>
<jsp:useBean id="dao" class="com.koreait.admin.withdraw.WithdrawDAO"/>

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
	
	List<MemberDTO> memberList = dao.withdrawMember(start, pagePerCount);
	List<WithdrawDTO> withdrawList = dao.withdrawDetail(start, pagePerCount);

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
                        <li class="title"><a href="../member/mem_withdrawal.jsp">- 탈퇴신청회원관리</a></li>
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
            <h1><img src="../images/arrow.png">탈퇴신청회원관리</h1>
            <div id="mem_withdrawal">
                <div class="mem_search">
                <form method="post" action="./mem_withdrawal_search.jsp">
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
                    <table id="mem_table">
<%
                    if(!withdrawList.isEmpty()){
%>
                        <tr>
                            <th>회원번호</th>
                            <th>회원이름(상점명)</th>
                            <th>휴대전화</th>
                            <th>상품갯수</th>
                            <th>가입일</th>
                            <th>탈퇴신청일</th>
                            <th>탈퇴신청이유</th>
                            <th>삭제</th>
                        </tr>
<%
						for(int i=0; i<memberList.size(); i++){
							memberList.get(i);
							int cnt = dao.proCnt(memberList.get(i).getIdx());
							
							if(cnt > 0){
								proCnt = cnt + "" ;	   
							}else{
								proCnt = cnt + "";
							}
%>
                        <tr>
                            <td><%= memberList.get(i).getIdx() %></td>
                            <td><a href="./mem_detail.jsp?m_idx=<%=memberList.get(i).getIdx()%>"><%= memberList.get(i).getUsername() %>(<%= memberList.get(i).getStore() %>)</a></td>
                            <td><%= memberList.get(i).getHp() %></td>
                            <td><%= proCnt %></td>
                            <td><%= memberList.get(i).getJoindate() %></td>
<%
							withdrawList.get(i);
							
%>
                            <td><%= withdrawList.get(i).getWdate() %></td>
                            <td><%= withdrawList.get(i).getReason() %></td>
                            <td><input type="button" value="삭제" class="userDel" onclick="location.href='./mem_delete_ok.jsp?m_idx=<%= memberList.get(i).getIdx() %>&&page=mem_withdrawal'"></td>
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
					out.print("<a href='mem_withdrawal.jsp?pageNum=" + i + "'>[" + i + "]</a>" + "&nbsp;&nbsp;");
				}
                    }else{
    					%>
    					<p>탈퇴신청한 회원이 존재하지 않습니다</p>
    				<%
    							}
%>
			</p>
        </div>
    </div>
</body>
</html>