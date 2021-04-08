<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.koreait.admin.faq.FaqDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
		String q_idx = request.getParameter("q_idx");

		int delOK = dao.delete(q_idx);
		
		if(delOK == 1){
%>
		<script>
			alert('삭제되었습니다.');
			location.href='./FAQ_list.jsp';
		</script>
<%				
		}else{
%>
		<script>
			alert('삭제에 실패했습니다.');
			history.back();
		</script>
<%
		}
%>