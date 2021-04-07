<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<jsp:useBean id="rDTO" class="com.koreait.report.reportDTO"/>
<jsp:useBean id="rDAO" class="com.koreait.report.reportDAO"/>
<%
	String rp_productidx = request.getParameter("rp_productidx");
	String rp_memidx = request.getParameter("rp_memidx");
	String rp_reason = request.getParameter("rp_reason");
	String rp_count = "1";
	String rp_reporteridx = null;
	String username= null;
	if(session.getAttribute("username") != null){
		username= (String)session.getAttribute("username");
		rp_reporteridx = String.valueOf(session.getAttribute("idx"));

	}

	if(rp_reporteridx == null){
	%>
	<script>
		alert('로그인이 필요한 서비스입니다.');
		location.href="./main.jsp";
	</script>
	<%
	}else {
		rDAO.reportInsert(rp_memidx, rp_reporteridx, rp_reason, rp_productidx, rp_count);
	}

%>