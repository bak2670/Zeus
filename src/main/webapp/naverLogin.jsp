<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<div id="naverIdLogin" > 
<a id="naverIdLogin_loginButton"> 
<img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.0" width="100%" height="auto" style="max-width:400px;max-height:60px"/> 
</a>
</div>
<form method="post" name="naverEmail" action="naverLogin_ok.jsp">
	<input type="hidden" name="email" id="naverEmail" value="">
</form>

<script type="text/javascript"> 
var naverLogin = new naver.LoginWithNaverId({ 
    clientId: "RAkcajQ6qKE9eoL2H2UK", 
    callbackUrl: "http://localhost:9090/ZeusMarket/naverLogin_ok2.jsp", 
    isPopup: false, 
    /* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */ }); 
    /* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */ 
    naverLogin.init(); 
    /* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */ 
    window.addEventListener('load', function () {
        naverLogin.getLoginStatus(function (status) {
            if (status) { 
                /* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */ 
                console.log(naverLogin.accessToken.accessToken)
				var email = document.getElementById("naverEmail")
                email.value = naverLogin.user.getEmail(); 
                var profileImage = naverLogin.user.getProfileImage(); 
                var name = naverLogin.user.getName(); 
                var uniqId = naverLogin.user.getId(); 
                console.log(email)
                naverEmail.submit();
                if (email == undefined || email == null) { 
                    alert("이메일은 필수정보입니다. 정보제공을 동의해주세요."); 
                    /* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */ 
                    naverLogin.reprompt(); 
                    return; 
                } else if (name == undefined || name == null) { 
                    alert("회원이름은 필수정보입니다. 정보제공을 동의해주세요."); 
                    naverLogin.reprompt(); return; 
                } 

                } else { 
                	alert("callback 처리에 실패하였습니다."); 
                    location.href='main.jsp';
                } 
                }); 
            });
    

        </script>
</body>
</html>