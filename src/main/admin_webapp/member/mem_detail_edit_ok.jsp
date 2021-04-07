<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="com.koreait.admin.member.MemberDTO" id="member"/>
<jsp:useBean class="com.koreait.admin.member.MemberDAO" id="dao"/>
<jsp:setProperty property="*" name="member"/>

<%
	String m_idx = request.getParameter("m_idx");
	String username = request.getParameter("m_username");
	String store = request.getParameter("m_store");
	String kakaoemail = request.getParameter("m_kakaoemail");
	String naveremail = request.getParameter("m_naveremail");
	
	String hp = request.getParameter("m_hp");
	String intro = request.getParameter("m_intro");
	intro = intro.replace("\r\n","<br>");
	 
	if(dao.edit(username, store, kakaoemail, naveremail, hp, intro, m_idx) == 1){
%>
	<script>
		alert('수정되었습니다');
		location.href='./mem_manage.jsp';
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