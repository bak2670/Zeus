<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rpDAO" class="com.koreait.recentProduct.recentProductDAO"/>
<%
	int rcp_memidx;
	rcp_memidx = (Integer.parseInt(String.valueOf(session.getAttribute("idx"))));
	System.out.println(rcp_memidx);
	rpDAO.logoutdel(rcp_memidx);
	session.invalidate();
%>
<!--20210405 수정-->
<script>
	location.href="main.jsp"
	/* window.location=document.referrer; */
</script>