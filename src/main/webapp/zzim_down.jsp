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
	String username= null;
	String m_idx = null;
	if(session.getAttribute("username") != null){
		username= (String)session.getAttribute("username");
		m_idx = String.valueOf(session.getAttribute("idx"));
	}
	// 찜 +1
	
	if(m_idx == null){
	%>
	<script>
		alert('로그인이 필요한 서비스입니다.')
	</script>
	<%
	}else {
		out.println(pDAO.zzimDown(Integer.parseInt(p_idx), Integer.parseInt(m_idx)));
	
	}

%>