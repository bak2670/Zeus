<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<jsp:useBean id="pDTO" class="com.koreait.product.productDTO"/>
<jsp:useBean id="pDAO" class="com.koreait.product.productDAO"/>
<%
	String p_idx = request.getParameter("p_idx");

	// 찜 +1
	
	// 회원 번호는 임의 지정
	int m_idx = 1;	

	//pDAO.zzimUp(Integer.parseInt(p_idx), m_idx)


%>