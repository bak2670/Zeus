<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="inquire" class="com.koreait.admin.inquire.InquireDTO"/>
<jsp:useBean id="InquireDAO" class="com.koreait.admin.inquire.InquireDAO"/>


<%
			String i_idx = request.getParameter("i_idx");
			String p_idx = request.getParameter("p_idx");
			
			
			if(InquireDAO.inqdel(p_idx) == 1){
	
%>
			<script>
				alert('삭제되었습니다');
				location.href='product_list.jsp';
			</script>
<%
			}
%>