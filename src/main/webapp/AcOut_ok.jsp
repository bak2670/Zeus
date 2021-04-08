<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" class="com.koreait.member.memberDTO" scope="page"/>
<jsp:useBean id="dao" class="com.koreait.member.memberDAO"/>
<jsp:useBean id="withdraw" class="com.koreait.withdraw.withdrawDTO"/>
<jsp:useBean id="wdao" class="com.koreait.withdraw.withdrawDAO"/>
<%
	String m_idx = request.getParameter("m_idx");
	String w_reason = request.getParameter("w_reason");

	if(wdao.memdraw(m_idx, w_reason) == 1){
%>
	<script>
		alert('탈퇴신청되었습니다');
		location.href='logout.jsp';
	</script>
<%
	}else{	
%>
	<script>
		alert('탈퇴신청에 실패했습니다');
		history.back();
	</script>
<%
}
%>