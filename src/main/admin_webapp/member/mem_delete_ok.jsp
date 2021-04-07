<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="com.koreait.admin.member.MemberDTO" id="member"/>
<jsp:useBean class="com.koreait.admin.member.MemberDAO" id="dao"/>
<jsp:setProperty property="*" name="member"/>

<%
	String m_idx = request.getParameter("m_idx");
	String paging = request.getParameter("page");
	
	if(dao.delMem(m_idx) == 1){
		if(paging.equals("mem_reported")){
%>
	<script>
		alert('계정 삭제되었습니다');
		location.href='./mem_reported.jsp';
	</script>
<%
		}else if(paging.equals("mem_withdrawal")){
%>
			<script>
				alert('계정 삭제되었습니다');
				location.href='./mem_withdrawal.jsp';
			</script>
<%
		}else if(paging.equals("mem_block")){
%>
			<script>
				alert('계정 삭제되었습니다');
				location.href='./mem_block.jsp';
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