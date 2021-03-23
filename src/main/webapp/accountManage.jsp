<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계좌관리</title>
    <link rel="stylesheet" href="./css/title.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
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
    <div id="root">
        <div class="aCntBox1">
            <div class="aCntBox2">
                <header class="aCntTitle">
                    <h1>계좌 관리</h1><a href="trade.jsp"><span class="aCntBack"></a></span>
                </header>
                <main class="aCntBox3">
                    <div class="aCntBox4">
                        <div class="aCntBox5">
                            <div class="aCntBox6"><img
                                    src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1NiIgaGVpZ2h0PSI1NiIgdmlld0JveD0iMCAwIDU2IDU2Ij4KICAgIDxwYXRoIGZpbGw9IiNEQ0RCRTQiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTQ5LjU4IDEyLjAyYy41MjYuNTI1LjgyIDEuMjM3LjgyIDEuOTh2MzkuMmMwIDEuNTQ2LTEuMjU0IDIuOC0yLjggMi44SDguNGMtMS41NDYgMC0yLjgtMS4yNTQtMi44LTIuOFYyLjhDNS42IDEuMjU0IDYuODU0IDAgOC40IDBoMjhjLjc0MyAwIDEuNDU1LjI5NCAxLjk4LjgybDExLjIgMTEuMnpNNDQuOCA1MC40VjE1LjE2TDM1LjI0IDUuNkgxMS4ydjQ0LjhoMzMuNnptLTUuNi0xMS4yYzAgMS41NDYtMS4yNTQgMi44LTIuOCAyLjhIMTkuNmMtMS41NDYgMC0yLjgtMS4yNTQtMi44LTIuOCAwLTEuNTQ2IDEuMjU0LTIuOCAyLjgtMi44aDE2LjhjMS41NDYgMCAyLjggMS4yNTQgMi44IDIuOHptLTE5LjYtMTRoMTYuOGMxLjU0NiAwIDIuOCAxLjI1NCAyLjggMi44IDAgMS41NDYtMS4yNTQgMi44LTIuOCAyLjhIMTkuNmMtMS41NDYgMC0yLjgtMS4yNTQtMi44LTIuOCAwLTEuNTQ2IDEuMjU0LTIuOCAyLjgtMi44em04LjQtNS42aC04LjRjLTEuNTQ2IDAtMi44LTEuMjU0LTIuOC0yLjggMC0xLjU0NiAxLjI1NC0yLjggMi44LTIuOEgyOGMxLjU0NiAwIDIuOCAxLjI1NCAyLjggMi44IDAgMS41NDYtMS4yNTQgMi44LTIuOCAyLjh6Ii8+Cjwvc3ZnPgo="
                                    class="aCntImg">
                                <div class="aCntNo">아직 등록된 계좌가 없습니다.</div><a href="./accountRegist.jsp" class="aCntJoin">계좌 등록하기</a>
                            </div>
                        </div>
                    </div>
                    <div class="aCntSvg"><svg width="16" height="16" viewBox="0 0 16 16">
                            <path fill="#C3C2CC" fill-rule="evenodd"
                                d="M16 8c0 4.411-3.589 8-8 8s-8-3.589-8-8 3.589-8 8-8 8 3.589 8 8zm-1.6 0c0-3.529-2.871-6.4-6.4-6.4-3.529 0-6.4 2.871-6.4 6.4 0 3.529 2.871 6.4 6.4 6.4 3.529 0 6.4-2.871 6.4-6.4zm-4.8 3.2c0 .442-.358.8-.8.8H8c-.442 0-.8-.358-.8-.8V8.8c-.442 0-.8-.358-.8-.8 0-.442.358-.8.8-.8H8c.442 0 .8.358.8.8v2.4c.442 0 .8.358.8.8zM7.12 4.8c0-.486.394-.88.88-.88s.88.394.88.88-.394.88-.88.88-.88-.394-.88-.88z">
                            </path>
                        </svg>계좌는 최대 2개까지 관리할 수 있습니다.</div>
                </main>
            </div>
        </div>
    </div>
</body>
</html>