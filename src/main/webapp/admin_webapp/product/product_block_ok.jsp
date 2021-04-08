<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="block" class="com.koreait.admin.block.BlockDTO"/>
<jsp:useBean id="dao" class="com.koreait.admin.block.BlockDAO"/>
<%
		String p_memidx = request.getParameter("p_memidx");
		String b_blockreason = request.getParameter("b_blockreason");
			
		if(dao.problock(p_memidx, b_blockreason) == 1){
%>  
			<script>
				alert('차단되었습니다.');
				location.href='product_list.jsp';
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
	
%>