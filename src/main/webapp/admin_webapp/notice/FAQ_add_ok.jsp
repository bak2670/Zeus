<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="com.koreait.admin.faq.FaqDTO" id="faq"/>
<jsp:useBean class="com.koreait.admin.faq.FaqDAO" id="dao"/>
<jsp:setProperty property="*" name="faq"/>

<%
	String category = request.getParameter("q_category");
	String title = request.getParameter("q_title");
	String content = request.getParameter("q_content");
	content = content.replace("\r\n","<br>");
	
	if(dao.add(category, title, content) == 1){
%>
	<script>
		alert('작성되었습니다');
		location.href='./FAQ_list.jsp';
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