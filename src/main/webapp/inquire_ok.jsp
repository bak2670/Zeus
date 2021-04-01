<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="inquire" class="com.koreait.inquire.inquireDTO"/>
<jsp:useBean id="dao" class="com.koreait.product.productDAO"/>
<jsp:setProperty property="*" name="inquire"/>
    


<%
	String i_productidx = request.getParameter("i_productidx");
	String i_content = request.getParameter("i_content");
		if(dao.reply(inquire) == 1){
%>
			<script>
				alert('등록되었습니다.');
				location.href='productDetail.jsp';
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