<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String adminid = null;
	if(session.getAttribute("adminid") != null){
		adminid = (String)session.getAttribute("adminid");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login | 번개장터 관리자 사이트</title>
    <link href="./css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div id="adminLogin">
<%
	if(adminid == null){
%>
        <form method="post" action="login_ok.jsp">
            <p><img src="./images/번개장터.png"></p>
            <h2>관리자 페이지</h2>
            <p><input type="text" name="adminid" placeholder="아이디를 입력하세요"></p>
            <p><input type="password" name="adminpw" placeholder="비밀번호를 입력하세요"></p>
            <p><input type="submit" value="로그인"></p>
        </form>
<%
	}else{
%>
	<script>
	location.href='./member/mem_manage.jsp';
	</script>
	<%} %>
    </div>
</body>
</html>