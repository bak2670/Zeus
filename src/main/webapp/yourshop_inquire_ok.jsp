<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String username= null;
	String m_idx = null;
	if(session.getAttribute("username") != null){
		username= (String)session.getAttribute("username");
		m_idx = String.valueOf(session.getAttribute("idx"));
	}
%>
<jsp:useBean id="inquire" class="com.koreait.inquire.inquireDTO"/>
<jsp:useBean id="dao" class="com.koreait.inquire.inquireDAO"/>
<%-- <jsp:setProperty property="*" name="inquire"/> --%>
  
<%
	String rContent = request.getParameter("content");
	inquire.setContent(rContent);
	
	// yourshop
	if(request.getParameter("storeIdx") != null){
		System.out.println("yourshop");
		String storeIdx = request.getParameter("storeIdx");
		System.out.println(storeIdx);
		
		if(dao.reply(inquire, m_idx, storeIdx) == 1){
			%>
				<script>
					alert('등록되었습니다.');
					/* location.href='myshop2.jsp'; */
					/* window.location=document.referrer; */
					location.href="yourshop2.jsp?m_idx=<%=storeIdx%>";
				</script>
			<%			
		}else{
			%>
		<script>
			alert('실패했습니다.'); 
			history.back();
		</script>
			<%
		}
		
	
	}else{
		%>
	<script>
		alert('실패했습니다.'); 
		history.back();
	</script>
		<%
	}
%>