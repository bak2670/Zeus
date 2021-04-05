<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.koreait.member.memberDTO" scope="page"/>
<jsp:useBean id="dao" class="com.koreait.member.memberDAO"/>

<% 
request.setCharacterEncoding("UTF-8");
String memberIdx = request.getParameter("idx");
String intro_value = request.getParameter("intro_value");


member.setIdx(Integer.parseInt(String.valueOf(memberIdx)));
member.setIntro(intro_value);


System.out.println(memberIdx);
System.out.println(intro_value);
	if(dao.member_edit1(member) != 1){
		System.out.println("인트로데이터없어");
		
	}else{
		System.out.println("인트로데이터넘어왔어");
		
		out.println(intro_value);

	}
	%>
	<script>
	console.log("asdasdsd");
	</script>
	<% 
	
%>
