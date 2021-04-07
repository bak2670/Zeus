<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="com.koreait.admin.member.MemberDTO" id="member"/>
<jsp:useBean class="com.koreait.admin.member.MemberDAO" id="dao"/>
<jsp:setProperty property="*" name="member"/>

<%
	String m_idx = request.getParameter("m_idx");
	String blockReason = request.getParameter("blockReason");
	String paging = request.getParameter("page");
	
	if(dao.blockMem(m_idx, blockReason) == 1){
		if(paging.equals("mem_detail")){
%>
	<script>
		alert('차단되었습니다');
		location.href='./mem_manage.jsp';
	</script>
<%
		}else if(paging.equals("mem_reported")){
%>
			<script>
				alert('차단되었습니다');
				location.href='./mem_reported.jsp';
			</script>
<%
		}
	}else{
%> 
		<script>
			alert('실패했습니다');
			history.back();
		</script>	
<%		
	}
%>