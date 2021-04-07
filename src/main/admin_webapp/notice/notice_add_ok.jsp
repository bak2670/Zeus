<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="com.koreait.admin.notice.NoticeDTO" id="notice"/>
<jsp:useBean class="com.koreait.admin.notice.NoticeDAO" id="dao"/>
<jsp:setProperty property="*" name="notice"/>

<%
	String title = request.getParameter("n_title");
	String content = request.getParameter("n_content");
	content = content.replace("\r\n","<br>");
	
	if(dao.add(title, content) == 1){
%>
	<script>
		alert('작성되었습니다');
		location.href='./notice_list.jsp';
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