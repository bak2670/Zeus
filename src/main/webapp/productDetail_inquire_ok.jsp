<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="inquire" class="com.koreait.inquire.inquireDTO"/>
<jsp:useBean id="dao" class="com.koreait.inquire.inquireDAO"/>
<jsp:useBean id="mdao" class="com.koreait.member.memberDAO"/>
<jsp:useBean id="member" class="com.koreait.member.memberDTO"/>
<jsp:setProperty property="*" name="inquire"/>
    


<%
	String p_memidx = request.getParameter("p_memidx");
	String p_idx = request.getParameter("p_idx");
	String m_idx = request.getParameter("m_idx");
	String i_content = request.getParameter("i_content");
	System.out.println(p_memidx);
		if(dao.proinq(m_idx, p_idx, p_memidx, i_content) == 1){
%>
			<script>
				alert('등록되었습니다.');
				location.href='productDetail.jsp?p_idx=<%=p_idx%>';
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