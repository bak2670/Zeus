<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
	String adminid = request.getParameter("adminid");
	String adminpw = request.getParameter("adminpw");
   if(adminid.equals("admin") && adminpw.equals("1234")){	
		session.setAttribute("adminid" ,adminid);
		session.setAttribute("adminpw" ,adminpw);
%>
	<script>
	alert('로그인 완료.');
   	location.href='./member/mem_manage.jsp';
	</script>
<%
   }else{
%>
	<script>
	alert('로그인 실패.')
   	location.href='login.jsp';
	</script>
<%
   }
%>