<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="product" class="com.koreait.admin.product.ProductDTO"/>
<jsp:useBean id="dao" class="com.koreait.admin.product.ProductDAO"/>
<%-- <jsp:setProperty property="*" name="product"/> --%>


<%
	String p_idx = request.getParameter("p_idx");
	String name = request.getParameter("p_name");
	String price = request.getParameter("p_price");
	String state = request.getParameter("p_state");
	String delcharge = request.getParameter("p_delcharge");
	String content = request.getParameter("p_content");
	String exchange = request.getParameter("p_exchange");
	String salesStatus = request.getParameter("p_salesStatus");
	if(delcharge.length() < 6){
		delcharge = "N";
	}else{
		delcharge = "Y";
	}
	if(exchange.length() < 5){
		exchange = "Y";
	}else{
		exchange = "N";
	}
	
	if(dao.update(name, price, state, delcharge, content, exchange, salesStatus, p_idx) == 1){
%>
			<script>
				alert('수정되었습니다');
				location.href='product_detail.jsp?p_idx=<%=p_idx%>';
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