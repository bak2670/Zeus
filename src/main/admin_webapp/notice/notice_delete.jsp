<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.koreait.admin.notice.NoticeDAO"/>
<%
		String n_idx = request.getParameter("n_idx");

		int delOK = dao.delete(n_idx);
		
		if(delOK == 1){
%>
		<script>
			alert('삭제되었습니다.');
			location.href='./notice_list.jsp';
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