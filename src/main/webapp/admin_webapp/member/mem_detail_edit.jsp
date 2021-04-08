<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List"%>
<%@ page import="com.koreait.admin.product.ProductDTO" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" class="com.koreait.admin.member.MemberDTO"/>
<jsp:useBean id="dao" class="com.koreait.admin.member.MemberDAO"/>
<jsp:useBean id="pdao" class="com.koreait.admin.product.ProductDAO"/>
<%
   if(session.getAttribute("adminid") == null){
%>
   <script>
      alert('로그인 후 이용하세요');
      location.href='../login.jsp';
   </script>
<%
   }else{
	if(request.getParameter("m_idx") == null || request.getParameter("m_idx").equals("")){
%>
	<script>
		alert("잘못된 접근입니다.");
		location.href='./mem_manage.jsp';
	</script>
<%
	}else{
		int pagePerCount = 5;
		int start = 0;
		String m_idx = request.getParameter("m_idx");
		List<ProductDTO> productList = pdao.mem_detail(start, pagePerCount, m_idx);
		
		member = dao.view(m_idx); 
		String proCnt = "";
		String m_gender="";
		
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전체회원관리 - 사용자관리 | 관리자페이지</title>
    <link href="../css/templete.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
    <div id="container">
        <div class="sidebar">
            <ul>
                <li>
                    사용자관리
                    <ul>
                        <li class="title"><a href="../member/mem_manage.jsp">- 전체회원관리</a></li>
                        <li><a href="../member/mem_withdrawal.jsp">- 탈퇴신청회원관리</a></li>
                        <li><a href="../member/mem_block.jsp">- 계정차단회원관리</a></li>
                        <li><a href="../member/mem_reported.jsp">- 신고회원관리</a></li>
                    </ul>
                </li>
                <li>
                    상품관리
                    <ul>
                        <li><a href="../product/product_list.jsp">- 상품목록</a></li>
                        <li><a href="../product/payment_list.jsp">- 결제내역</a></li>
                    </ul>
                </li>
                <!-- <li><a href="../category.jsp">카테고리관리</a></li> -->
                <li>
                    게시판
                    <ul>
                        <li ><a href="../notice/notice_list.jsp">- 공지사항</a></li>
                        <li><a href="../notice/FAQ_list.jsp">- 자주묻는질문</a></li>
                    </ul>
                </li>
                <!-- <li><a href="../inquiry/inquiry_list.jsp">문의내역</a></li> -->
            </ul>
        </div>
        <div class="contents">
            <h1><img src="../images/arrow.png">전체회원관리</h1>
            <div class="mem_detail">
                <div class="mem_info">
                    <h3><%=member.getUsername() %>님의 회원정보입니다.</h3>
                    <form method="post" action="mem_detail_edit_ok.jsp?m_idx=<%=member.getIdx()%>">
                    <table>
                        <tr>
                            <td rowspan="6"><img src='../images/mem_profile.png'></td>
                            <th>회원번호</th>
                            <td><%=member.getIdx() %></td>
                            <th>가입일시</th>
                            <td><%=member.getJoindate() %></td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><input type=text" name="m_username" value="<%=member.getUsername() %>"></td>
                            <th>마지막 로그인 시간</th>
                            <td><%=member.getLastlogin() %></td>
                        </tr>
                        <tr>
                            <th>상점명</th>
                            <td><input type=text" name="m_store" value="<%=member.getStore() %>"></td>
                            <th>Kakao 계정 연동</th>
<%
							String mem_kakao = "";
							String mem_naver = "";
							if(member.getKakaoemail()==null){
								mem_kakao = "-";                            	
							}else{
								mem_kakao = member.getKakaoemail();
							}
							if(member.getNaveremail()==null){
								mem_naver = "-";
							}else{
								mem_naver = member.getNaveremail();
							}
%>
                            <td><input type=text" name="m_kakaoemail" value="<%=mem_kakao %>"></td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td><%=member.getSsn1() %></td>
                            <th>Naver 계정 연동</th>
                            <td><input type=text" name="m_naveremail" value="<%=mem_naver %>"></td>
                        </tr>
                        <tr>
                            <th>성별</th>
                            <td>
<%
                                int genderNum = dao.gender(member.getIdx());
    							
    							if(genderNum % 2 == 0){
    								m_gender = "여자" ;	   
    							}else{
    								m_gender = "남자";
    							}
%>
							<%=m_gender %>
                            </td>
                            <th>휴대전화</th>
                            <td><input type=text" name="m_hp" value="<%=member.getHp() %>"></td>
                        </tr>
                    </table>
                    <div class="info_product">
                    
<%							
                    int cnt = dao.proCnt(member.getIdx());
							if(cnt > 0){
								proCnt = cnt + "개" ;	   
							}else{
								proCnt = cnt + "개";
							}
%>
                        <h3>상품 <span class="redtxt"><%= proCnt %></span></h3>
                        
<%
						for(ProductDTO product : productList){
%>
                        
                        <div onclick="location.href='../product/product_detail.jsp?p_idx=<%=product.getIdx()%>'"><img src='../uploads/<%=product.getPicture()%>' alt="상품이미지"><p><%= product.getName() %></p><p><%= product.getPrice() %>원</p></div>
<%
						}
%>
                        <div>
                        <%
					if(cnt > 5){

%>
                        <a href="./mem_products.html"><img src="../images/더보기.png"><p>더보기</p></a>
<%
					}
%>
                        </div>
                    </div>
                    <div class="mem_intro">
                        <h3>소개글</h3>
                        <p><textarea name="m_intro"><%=member.getIntro() %></textarea></p>
                    </div>
                </div>
                <div class="buttons">
                    <p><input type="submit" value="저장하기"></p>
                    <p><input type="button" value="돌아가기" onclick="location.href='./mem_detail.jsp?m_idx=<%=member.getIdx()%>'"></p>
                </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
<%
	}}
%>