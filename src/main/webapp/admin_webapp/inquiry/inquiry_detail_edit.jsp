<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%     
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="inquiry" class="com.koreait.admin.onetoone.OnetooneDTO"/>
<jsp:useBean id="dao" class="com.koreait.admin.onetoone.OnetooneDAO"/>



<% 
	String o_idx = request.getParameter("o_idx");
	String answer = request.getParameter("o_answer");
	String ansdate = request.getParameter("o_ansdate");

	
	if(dao.oneEdit(answer, ansdate, o_idx) == 1){
%>
		<script>
			alert('수정되었습니다');
			location.href='inquiry_list.jsp';
		</script>
<%
			}else{
%>
		<script>
			alert('실패했습니다');
			history.back();
		</script>
<%
	}


%>	