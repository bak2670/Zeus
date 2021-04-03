<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean class="com.koreait.member.memberDTO" id="member"/>
<jsp:useBean class="com.koreait.member.memberDAO" id="dao"/>
<jsp:setProperty property="*" name="member"/>

<%
if(dao.phoneCheck(member)){
	   if(member.getKakaoemail() != null){
		   if(dao.kakaoupdate(member) == 1){
			   if(dao.phonejoin(member) != null){
				   session.setAttribute("username" ,member.getUsername());
					session.setAttribute("idx" ,member.getIdx());
			   }
	   		}
	   }
	   if(member.getNaveremail() != null){
		   if(dao.naverupdate(member) == 1){
			   if(dao.phonejoin(member) != null){
				   session.setAttribute("username" ,member.getUsername());
					session.setAttribute("idx" ,member.getIdx());
			   }
	   		}
	   }
	   if(dao.phonejoin(member) != null){
		   session.setAttribute("username" ,member.getUsername());
			session.setAttribute("idx" ,member.getIdx());
	   }
%>
<script>
   location.href='main.jsp';
</script>
<%
   }else if(dao.duplicate(member)){
	   %>
	   <script>
      alert('존재하는 계정입니다.')
      location.href='login.jsp';
   </script>
	<%    
}else if(dao.join(member) == 1){
	   if(dao.phonejoin(member) != null){
		   session.setAttribute("username" ,member.getUsername());
			session.setAttribute("idx" ,member.getIdx());
	   }
%>
<script>
   location.href='main.jsp';
</script>
<%
   }else{
%>
   <script>
      alert('회원가입 실패되었습니다.')
      history.back();
   </script>
<%
   }
%>