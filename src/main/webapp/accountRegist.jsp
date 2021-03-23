<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계좌등록</title>
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
        <div class="aCntJBox1">
            <div class="aCntJBox2">
                <div class="aCntJTitle">
                    <h1>계좌 등록</h1><a href="accountManage.jsp"><span class="aCntJBack"></a></span>
                </div>
                <main class="aCntJBox3">
                    <form id="form" class="aCntJForm">
                        <div class="aCntJBox4">
                            <div class="aCntJBox5"><label for="holder_name" class="aCntLabel">예금주</label><input
                                    id="holder_name" type="text" name="holder_name" placeholder="예금주명 입력"
                                    autocomplete="off" class="aCntHolder" value="">
                                <aside class="aCntSide"></aside>
                                <div class="aCntJSty"></div>
                            </div>
                        </div>
                        <div data-value="on" class="aCntJBox6">
                            <div><span>은행선택</span>
                                <p id="address1">은행 선택</p><img
                                    src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiIgdmlld0JveD0iMCAwIDMyIDMyIj4KICAgIDxnIGZpbGw9IiMzMzMiIGZpbGwtcnVsZT0ibm9uemVybyI+CiAgICAgICAgPHBhdGggZD0iTTIxLjMyIDE5LjQwNmw0LjMzNyA0LjMzN2ExIDEgMCAxIDEtMS40MTQgMS40MTRsLTQuMzM3LTQuMzM3YTggOCAwIDEgMSAxLjQxNC0xLjQxNHpNMTUgMjAuNWE2IDYgMCAxIDAgMC0xMiA2IDYgMCAwIDAgMCAxMnoiLz4KICAgICAgICA8cGF0aCBkPSJNMjEuMzIgMTkuNDA2bDQuMzM3IDQuMzM3YTEgMSAwIDEgMS0xLjQxNCAxLjQxNGwtNC4zMzctNC4zMzdhOCA4IDAgMSAxIDEuNDE0LTEuNDE0ek0xNSAyMC41YTYgNiAwIDEgMCAwLTEyIDYgNiAwIDAgMCAwIDEyeiIvPgogICAgPC9nPgo8L3N2Zz4K"
                                    alt="">
                            </div>
                        </div>
                        <div class="aCntJBox7">
                            <div class="aCntJBox8"><label for="account_number" class="aCntLabel">계좌번호</label><input
                                    id="account_number" class="aCntBank" inputmode="numeric" placeholder="-없이 숫자만 입력"
                                    autocomplete="off" type="text" value="">
                                <aside class="bankSide"></aside>
                                <div class="bankSty"></div>
                            </div>
                        </div>
                    </form>
                </main>
                <footer class="kYmvzG"></footer>
            </div>
            <div class="aCntJoinOk">
                <button type="submit" form="form" class="aCntJok">등록 완료</button></div>
            <div class="aCntJBox9">
                <div class="aCntJBox10"></div>
            </div>
        </div>
    </div>
</body>

</html>