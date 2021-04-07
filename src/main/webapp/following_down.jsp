<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<jsp:useBean id="fDTO" class="com.koreait.following.followingDTO"/>
<jsp:useBean id="fDAO" class="com.koreait.following.followingDAO"/>
<%
	String f_follow = request.getParameter("f_memidx");
	String username= null;
	String f_memidx = null;
	if(session.getAttribute("username") != null){
		username= (String)session.getAttribute("username");
		f_memidx = String.valueOf(session.getAttribute("idx"));
		System.out.println(f_follow);
		System.out.println(f_memidx);
	}
	// 팔로잉 + 1

	if(f_memidx == null){
	%>
	<script>
		alert('로그인이 필요한 서비스입니다.');
		location.href="./main.jsp";
	</script>
	<%
	}else {
//		pDAO.zzimUp(Integer.parseInt(p_idx), Integer.parseInt(m_idx));
		out.println(fDAO.followingdown(Integer.parseInt(f_memidx), Integer.parseInt(f_follow)));
	}

%>