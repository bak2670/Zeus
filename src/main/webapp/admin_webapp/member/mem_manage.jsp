<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.koreait.admin.member.MemberDTO" %>
<jsp:useBean id="dao" class="com.koreait.admin.member.MemberDAO"/>

<%
   if(session.getAttribute("adminid") == null){
%>
   <script>
      alert('로그인 후 이용하세요');
      location.href='../login.jsp';
   </script>
<%
   }else{
	int totalCount = 0;
	int pagePerCount = 10;
	int start = 0;
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum != null && !pageNum.equals("")){
		start = (Integer.parseInt(pageNum)-1) * pagePerCount;
	}else{
		pageNum = "1";
		start = 0;
	}
	
	String mem_search = request.getParameter("mem_search");
	String searchMem = request.getParameter("searchMem");


	List<MemberDTO> memberList = dao.selectMember(start, pagePerCount);

	
	totalCount = dao.page();
	 //전체를 받아옴
	
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
    <div id="container" >
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
            <div id="mem_manage">
                <div class="mem_search">
                    <form method="post" action="./mem_manage_search.jsp">
	                    <p>
	                        <select name="mem_search">
	                            <option value="이름">이름</option>
	                            <option value="상점명">상점명</option>
	                        </select>
	                    </p>
	                    <p><input type="text" name="searchMem"></p>
	                    <p><input type="submit" value="검색"></p>
                    </form>
                </div>
                <div class="mem_list">
                    <p> </p> <!-- 총 4명의 사용자가 검색되었습니다 -->
                    <p> </p><!-- 오늘 가입자수 : 4명 -->
                    <table id="mem_table">
                        <tr>
                            <th>회원번호</th>
                            <th>기본정보(상점명)</th>
                            <th>성별</th>
                            <th>휴대전화</th>
                            <th>생년월일</th>
                            <th>SNS 연동(kakao)</th>
                            <th>SNS 연동(naver)</th>
                            <th>상품</th>
                            <th>가입일</th>
                            <th>마지막 로그인 시각</th>
                        </tr>
<%
						for(MemberDTO member : memberList){
							int cnt = dao.proCnt(member.getIdx());
							
							if(cnt > 0){
								proCnt = cnt + "" ;	   
							}else{
								proCnt = cnt + "";
							}
			           		
							int genderNum = dao.gender(member.getIdx());
							
							if(genderNum % 2 == 0){
								m_gender = "여" ;	   
							}else{
								m_gender = "남";
							}
							
							String store = "";
							if(member.getStore()==null){/* 
								store = "상점"+Integer.toString(member.getIdx())+"호"; */
								int num = member.getIdx();
								if(dao.setStorename(num)==1) {
									%><script> 
									location.href='./mem_manage.jsp';
									</script>
									<%
								}
                            }else{
                            	store = member.getStore();
                            }
							
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
						<tr><!-- input에 id를 getIdx로 줘서  스크립트에서 배열형태로 가져와서  -->
                            <td><%= member.getIdx() %></td>
                            <td><a href="./mem_detail.jsp?m_idx=<%=member.getIdx()%>"><%=member.getUsername() %>(<%=store %>)</a></td>
                            <td><%= m_gender %></td>
                            <td><%= member.getHp() %></td>
                            <td><%= member.getSsn1() %></td>
                            <td><%= mem_kakao %></td>
                            <td><%= mem_naver %></td>
                            <td><%= proCnt %></td>
                            <td><%= member.getJoindate() %></td>
                            <td><%= member.getLastlogin() %></td>
                        </tr>
<%
						}

						int pageNums = 0;
						if(totalCount % pagePerCount == 0){
							pageNums = (totalCount / pagePerCount);
							
						}else{
							pageNums = (totalCount / pagePerCount) + 1;
						}
%>
                    </table>
                </div>
                <p><!-- <input type="button" value="선택차단" id="popOpenBtn"> --></p>
                <div id ="popup_mask"></div>
                <div id="popupDiv"> <!-- 팝업창 -->
                    <div>
                        <p><img src="./images/arrow.png">회원차단</p>
                        <hr>
                        <h2>선택하신 회원을 차단하시겠습니까?</h2>
                        <textarea>차단사유를 작성해주세요.</textarea>
                    </div>
                    <button class="popCloseBtn">차단</button>
                    <button class="popCloseBtn">취소</button>
                </div>
            </div>
            <p class="pageNum">
            <%
				for(int i=1;i<=pageNums;i++){
					out.print("<a href='mem_manage.jsp?pageNum=" + i + "'>[" + i + "]</a>" + "&nbsp;&nbsp;");
				}
			%>
			</p>
        </div>
    </div>
</body>
</html>
<%} %>
