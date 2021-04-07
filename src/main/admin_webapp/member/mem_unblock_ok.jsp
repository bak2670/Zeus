<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="com.koreait.admin.block.BlockDTO" id="block"/>
<jsp:useBean class="com.koreait.admin.block.BlockDAO" id="dao"/>
<jsp:setProperty property="*" name="block"/>

<%
	String b_memidx = request.getParameter("b_memidx");
	
	if(dao.unblock(b_memidx) == 1){
%>
	<script>
		alert('해제되었습니다');
		location.href='./mem_block.jsp';
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