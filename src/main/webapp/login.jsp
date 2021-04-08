<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link href="./css/title.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="./js/script.js"></script>
    <style>
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        div{
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        *{
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
            </style>

</head>

<body>
    <div id="container">
		<form name="regform" id="regform" method="post" action="login_ok.jsp" onsubmit="return sendit()">
            <input type="hidden" name="isSsn" id="isSsn" value="n">
            
            <h1>본인인증으로<br>번개장터를 시작합니다.</h1>
            <p>안전한 거래를 위해 약관동의 후<br>본인인증을 완료해주세요.</p>
            <div class="login_1">
                <div class="member_name">
                    <input type="text" maxlength="20" name="username" id="userid" placeholder="이름을 입력하세요.">
                </div>
                <div class="member_ssn">
                    <input type="text" maxlength="6" onkeydown="ssnChange()" placeholder="생년월일을 입력하세요." name="ssn1" id="ssn1"> <span class="sun">-</span>
                    <input type="password" maxlength="7" name="ssn2" onkeydown="ssnChange()" id="ssn2" placeholder="* * * * * * *"> <input type="button" id="ssnBtn"
                        value="검  증"></p>
                </div>

                <div class="member_hp">
                    <div class="member_skt">
                    <input type="hidden" id="hpselect_hidden" value="2">
                        <select name="select" id="hpselect">
                            <option value="#">통신사 선택</option>
                            <option value="SKT"  id="hpselect1">SKT</option>
                            <option value="KT" id="hpselect2">KT</option>
                            <option value="LG" id="hpselect3">LG</option>
                        </select>
                    </div>
                    <input type="text" name="hp" id="hp" placeholder=" ' - ' 없이 휴대폰번호를 입력해주세요.">
                	<input type="button" value="인증번호 받기" id="injeung" onclick="hpbtn()"></input>
                </div>
                <input type="hidden" id="injeung_hidden" value="2">
                <div class="hp_injeung">
                    <input type="text" name="injeung_num" id="injeung_num" placeholder="인증번호를 입력하세요.">
                    <input type="button" value="인증번호 확인" id="injeung_check" name="injeung_check" onclick="hpjoin()">
                </div>
            </div>
            <table id="table1">
                <tr>
                    <td><input type="checkbox" id="custom" name="normal" class="image_checkbox"><label for="custom"
                            class="image_checkbox"></label></td>
                    <td>전체 동의하기</td>
                    <td></td>
                </tr>
            </table>
            <table id="table2">
                <tr>
                    <td><input type="checkbox" id="custom1" name="normal" class="image_checkbox">
                    <label for="custom1" class="image_checkbox"></label></td>
                     <input type="hidden" id="custom1_hidden" value="2">
                    <td>번개장터 필수 항목 모두 동의</td>
                    <td><img src="./img/번개장터이미지/down.png"></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="custom2" name="normal" class="image_checkbox"><label for="custom2"
                            class="image_checkbox"></label></td>
                    <td>개인정보 수집 이용 동의(선택)</td>
                    <td><img src="./img/번개장터이미지/down.png"></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="custom3" name="normal" class="image_checkbox"><label for="custom3"
                            class="image_checkbox"></label></td>
                    <td>위치정보 이용약관 동의(선택)</td>
                    <td><img src="./img/번개장터이미지/down.png"></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="custom4" name="normal" class="image_checkbox"><label for="custom4"
                            class="image_checkbox"></label></td>
                    <td>마케팅 수신 동의(선택)</td>
                    <td><img src="./img/번개장터이미지/down.png"></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="custom5" name="normal" class="image_checkbox"><label for="custom5"
                            class="image_checkbox"></label></td>
                    <td>개인정보 광고활용 동의(선택)</td>
                    <td><img src="./img/번개장터이미지/down.png"></td>
                </tr>
            </table>
            <p><input type="submit" value="다음"></p>
        </form>
    </div>
</body>

</html>