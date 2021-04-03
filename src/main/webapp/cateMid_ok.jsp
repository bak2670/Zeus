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
	// 중분류 문자열 넘어온 경우
	String mid_category = request.getParameter("mid");
	String big_category = request.getParameter("big");		// 대분류도 받아옴
	// mid_category로 sql돌리기
	List<String> smallList = cateDAO.selectSmall(mid_category, big_category);

	// list -> json 객체
	JSONArray jArray = new JSONArray();
	for(int i=0;i<smallList.size();i++){
		JSONObject data = new JSONObject();
		data.put("small", smallList.get(i));
		jArray.add(i,data);
	}
	out.println(jArray);

%>