<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String username= null;
	String m_idx = null;
	if(session.getAttribute("username") != null){
		username= (String)session.getAttribute("username");
		m_idx = String.valueOf(session.getAttribute("idx"));
	}
%>
<jsp:useBean id="inquire" class="com.koreait.inquire.inquireDTO"/>
<jsp:useBean id="dao" class="com.koreait.inquire.inquireDAO"/>
<jsp:setProperty property="*" name="inquire"/>
    
<%

	if(dao.reply(inquire, m_idx) == 1){
%>
	<script>
		alert('등록되었습니다.');
		location.href='myshop2.jsp';
	</script>
<%			
	}else{
%>
	<script>
		alert('실패했습니다.'); 
		history.back();
	</script>
<%
	}
	
%>