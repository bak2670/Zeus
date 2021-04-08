<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.File" %>
<%
	request.setCharacterEncoding("UTF-8");
%> 
<%
	String username= null;
	String m_idx = null;
	if(session.getAttribute("username") != null){
		username= (String)session.getAttribute("username");
		m_idx = String.valueOf(session.getAttribute("idx"));
	}
	System.out.println(m_idx);
%>
<jsp:useBean id="fs" class="com.koreait.db.FileService"/>  
<jsp:useBean id="dao" class="com.koreait.category.categoryDAO"/> 
<% 
	int maxSize = 10 * 1024 * 1024;		// 10MB
	String savePath = fs.SAVE_PATH;
	String format = "UTF-8";
	String uploadFile = "";
	try{
		// MULTI 객체 생성
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format, new DefaultFileRenamePolicy());
		
		// product.jsp에서 넘어온 데이터 저장. 일단 다 string에 넣어둠. 

		String name = multi.getParameter("p_name");
		String price = multi.getParameter("p_price");
		String state = multi.getParameter("p_state");
		String delcharge = multi.getParameter("p_delcharge");   
		if(delcharge == null || delcharge.equals("")){
			delcharge = "N";
		}else{
			delcharge="Y";
		}
		String deallocation = multi.getParameter("p_deallocation");
		String regdate = multi.getParameter("p_regdate");
		
		String cateStr = multi.getParameter("p_category");

		// category가 string이니까 얘를 db에서 찾아서 인덱스를 넣어줘야함
		int category = dao.getCateIdx(cateStr);
		String content = multi.getParameter("p_content");
		
		int memidx = Integer.parseInt(m_idx);
		String tag = multi.getParameter("p_tag");
		String priceConsult = multi.getParameter("p_priceConsult");
		if(priceConsult == null || priceConsult.equals("")){
			priceConsult = "N";
		}else{
			priceConsult = "Y";
		}		
		String exchange = multi.getParameter("p_exchange");
		//System.out.println(exchange);
		int quantity = Integer.parseInt(multi.getParameter("p_quantity"));
		uploadFile = multi.getFilesystemName("p_picture");
		
		
		// 파일 객체 생성
		File file = new File(savePath + "/" + uploadFile);
		
		// DB에 넣기 위해서 DTO에 넣으러 가는 부분
		// FileService의 dataUpload 메소드
		if(fs.dataUpload(name, price, state, delcharge, deallocation , category , content, memidx, tag, priceConsult, exchange, quantity, file)){
 
%>
	<script>
		alert("상품이 등록되었습니다.")
		location.href="main.jsp" // 임의, 정해진 곳으로 고쳐줘야함
		
	</script>
			
<% 	
			
		}else{
%>
	<script>
		alert("상품 등록에 실패했습니다.")
		history.back(); 
				
	</script>
					
<%
		}
		
	
	}catch(Exception e){
		e.printStackTrace();
	}
	
		
%>
