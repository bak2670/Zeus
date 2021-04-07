<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.koreait.member.memberDTO" scope="page"/>
<jsp:useBean id="dao" class="com.koreait.member.memberDAO"/>

<% 
request.setCharacterEncoding("UTF-8");

String memberIdx = request.getParameter("idx");
String name_value = request.getParameter("name_value");


member.setIdx(Integer.parseInt(String.valueOf(memberIdx)));
member.setStore(name_value);

System.out.println("member : " + member);

System.out.println(name_value);
System.out.println(memberIdx);

	if(dao.member_edit(member) != 1){
		System.out.println("상점명데이터없어");
	}else{
		System.out.println("상점명데이터넘어왔어");
		out.println(name_value);
	}
%>




    