<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="product" class="com.koreait.admin.product.ProductDTO"/>
<jsp:useBean id="dao" class="com.koreait.admin.product.ProductDAO"/>

<%
		if(request.getParameter("p_idx") == null || request.getParameter("p_idx").equals("")){
%>
			<script>
				alert('잘못된 접근입니다.');
				location.href='product_list.jsp';
			</script>
<%
		}else{
			String p_idx = request.getParameter("p_idx");
			product = dao.prodel(p_idx); 					
%>
			<script>
				alert('삭제되었습니다');
				location.href='product_list.jsp';
			</script>
<%
		}
%>