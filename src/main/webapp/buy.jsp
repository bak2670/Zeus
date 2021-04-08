<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="paymentDAO" class="com.koreait.payment.paymentDAO"/>
<%
	request.setCharacterEncoding("UTF-8");

	String username= null;
	String m_idx = null;
	
	if(session.getAttribute("username") == null){
%>
	<script>
		alert('로그인이 필요한 서비스 입니다.');
		history.back();
	</script>
<%
	}else{
	
		m_idx = String.valueOf(session.getAttribute("idx"));
	
		String p_idx = request.getParameter("p_idx");

		// m_idx의 사람이 p_idx를 구매
		// tb_payment에 넣어야지
		if(paymentDAO.buyProduct(m_idx, p_idx) == 1){
		%>
             <script>
           	function popupp(){
           		window.open('trade.jsp','asdf','location=yes');
           	}
           </script>
			<script>
				alert('구매되었습니다');
				location.href='./trade.jsp';
				/* popupp(); */
			</script>
		<%	
		}
		
	}
	
%>