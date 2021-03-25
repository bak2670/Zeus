<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject" %>
<jsp:useBean id="dto" class="com.koreait.category.categoryDTO"/>
<jsp:useBean id="cateDAO" class="com.koreait.category.categoryDAO"/>
<% 
	// 선택한 대분류 문자열이 넘어옴
	String big_category = request.getParameter("big");

	// big_category로 sql돌리기
	List<String> middleList = cateDAO.selectMiddle(big_category);

	// list -> json 객체
	JSONArray jArray = new JSONArray();
	for(int i=0;i<middleList.size();i++){
		JSONObject data = new JSONObject();
		data.put("middle",middleList.get(i));
		jArray.add(i,data);
	}
	
	out.println(jArray);

%>