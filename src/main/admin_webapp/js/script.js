$(document).ready(function () {
    //최상단 체크박스 클릭
    $("#checkAll").click(function () {
        //클릭되었으면
        if ($("#checkAll").prop("checked")) {
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked", true);
            //클릭이 안되있으면
        } else {
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked", false);
        }
    })
})
$(document).ready(function () {
    //최상단 체크박스 클릭
    $("#checkAll2").click(function () {
        //클릭되었으면
        if ($("#checkAll2").prop("checked")) {
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check2]").prop("checked", true);
            //클릭이 안되있으면
        } else {
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check2]").prop("checked", false);
        }
    })
})

$(document).ready(function(){
    $("#popOpenBtn").click(function(event){  //팝업 Open 버튼 클릭 시 
    $("#popupDiv").css({
        "top": (($(window).height() - $("#popupDiv").outerHeight()) / 2 + $(window).scrollTop()) + "px",
        "left": (($(window).width() - $("#popupDiv").outerWidth()) / 2 + $(window).scrollLeft()) + "px"
        //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
    });

        $("#popup_mask").css("display", "block"); //팝업 뒷배경 display block
        $("#popupDiv").css("display", "block"); //팝업창 display block

        $("body").css("overflow", "hidden");//body 스크롤바 없애기
    });
    $(".popCloseBtn").click(function (event) {
        $("#popup_mask").css("display", "none"); //팝업창 뒷배경 display none
        $("#popupDiv").css("display", "none"); //팝업창 display none
        $("body").css("overflow", "auto");//body 스크롤바 생성
    });
});


// 대분류
var firstList = new Array("여성의류", "패션잡화", "남성의류", "디지털/가전", "도서/티켓/취미/애완");
// 중분류
var secondList1 = new Array("원피스", "스커트/치마", "자켓", "니트/스웨터", "야상/점퍼/패딩");
var secondList2 = new Array("여성가방", "운동화/캐주얼화", "여성화", "지갑", "모자");
var secondList3 = new Array("맨투맨/후드티", "반팔 티셔츠", "트레이닝", "니트/스웨터", "자켓");
var secondList4 = new Array("모바일", "가전제품", "음반/영상/관려기기", "게임/타이틀", "노트북/넷북");
var secondList5 = new Array("도서/책", "취미/키덜트", "희귀/수집품", "반려동물용품", "상품권");
// 소분류
var lastList1_1 = new Array("롱 원피스", "캐주얼 원피스", "미니 원피스", "럭셔리 원피스", "기타(원피스)");
var lastList1_2 = new Array("미니 스커트", "롱 스커트", "청 스커트", "플레어 스커트", "모직/니트 스커트");
var lastList1_3 = new Array("기타(자켓)", "기본/테일러드 자켓", "트위드/체크 자켓", "가죽/라이더", "청/데님자켓");
var lastList1_4 = new Array("라운드넥 니트", "기타(니트/스웨터)", "브이넥 니트", "롱 니트", "오프숄더 니트");
var lastList1_5 = new Array("패딩", "기타(야상/점퍼/패딩)", "바람막이", "야상/사파리", "야구점퍼/항공점퍼/블루종");
var lastList2_1 = new Array("솔더백", "크로스백", "토트백", "기타(여성가방)", "미니백");
var lastList2_2 = new Array("캐주얼화", "기타(운동화)", "런닝화/워킹화", "농구화");
var lastList2_3 = new Array("샌들/슬리퍼", "단화/플랫슈즈", "하이힐", "미들굽 펌프스");
var lastList2_4 = new Array("카드/명함 지갑", "여성 장지갑", "남자 중/반지갑", "남자 장지갑");
var lastList2_5 = new Array("패션모자", "야구모자", "비니", "스냅백/힙합모자", "털/방울/귀달이모자");
var lastList3_1 = new Array("맨투맨 티셔츠", "후드 티셔츠", "후드 집업", "기타(맨투맨/후드티)");
var lastList3_2 = new Array("라운드넥 티셔츠", "카라넥 티셔츠", "민소매/나시 티셔츠", "브이넥 티셔츠");
var lastList3_3 = new Array("트레이닝 상의", "트레이닝 하의", "트레이닝 세트", "기타(트레이닝)");
var lastList3_4 = new Array("라운드넥 니트", "집업 니트", "브이넥 니트", "카라넥 니트");
var lastList3_5 = new Array("캐주얼 자켓/블레이져", "청/데님 자켓", "가죽 자켓", "후드/져지 자켓", "린넨/마 자켓");
var lastList4_1 = new Array("스마트폰", "케이스/범퍼", "태블릿", "배터리/충전기");
var lastList4_2 = new Array("기타(가전제품)", "소형가전(밥솥/다리미 등)", "대형가전(냉장고/세탁기 등)", "TV(LCD/LED/PDP)");
var lastList4_3 = new Array("이어폰/헤드폰", "스피커/앰프", "비디오/프로젝터", "오디오/홈시어터");
var lastList4_4 = new Array("PC게임", "소니/플레이스테이션", "게임 타이틀", "XBOX");
var lastList4_5 = new Array("노트북/넷북", "노트북 가방/액세서리", "노트북 주변기기", "기타(노트북/넷북)", "전자사전");
var lastList5_1 = new Array("학습/사전/참고서", "만화", "아동/어린이", "경영/경제/자기계발");
var lastList5_2 = new Array("피규어/인형", "레고/블럭", "프라모델/건담", "보드게임/다트/체스");
var lastList5_3 = new Array("수집품", "기타(희귀/수집품)", "골동품", "휘귀품");
var lastList5_4 = new Array("강아지 용품", "고양이 용품", "강아지 먹거리", "고양이 먹거리");
var lastList5_5 = new Array("기타(상품권/이용권)", "문화/도서 상품권", "백화점 상품권", "외식 상품권");

// 페이지 로딩시 자동 실행  
window.onload = function () {
    var v_sidoSelect = document.getElementById("sidoSelect"); // SELECT TAG

    for (i = 0; i < firstList.length; i++) {// 0 ~ 3 
        // 새로운 <option value=''>값</option> 태그 생성
        var optionEl = document.createElement("option");

        // option태그에 value 속성 값으로 저장
        optionEl.value = firstList[i];

        // text 문자열을 새로 생성한 <option> 태그의 값으로 추가
        optionEl.appendChild(document.createTextNode(firstList[i]));

        // 만들어진 option 태그를 <select>태그에 추가
        v_sidoSelect.appendChild(optionEl);
    }

    var v_gugunSelect = document.getElementById("gugunSelect"); // SELECT TAG
    v_gugunSelect.style.display = "none";  // 태그 감추기
    var v_gugunSelect = document.getElementById("lastSelect"); // SELECT TAG
    v_gugunSelect.style.display = "none";  // 태그 감추기

}

// 대분류 선택시
function changeSidoSelect() {
    var v_sidoSelect = document.getElementById("sidoSelect"); // SELECT TAG
    var idx = v_sidoSelect.options.selectedIndex;     // 선택값 0 ~ 3


    if (idx < 1 && idx > 3) {
        return;
    }


    gugunSelectFill(idx);   // 중분류 생성
}


function gugunSelectFill(idx) {
    var v_gugunSelect = document.getElementById("gugunSelect"); // SELECT TAG
    var v_secondSelect = document.getElementById("lastSelect");

    var data = null;

    if (idx == 0) {
        v_gugunSelect.style.display = "none";  // 중분류 태그 감추기
        v_secondSelect.style.display = "none";
        return;
    }

    if (idx == 1) {
        data = secondList1

    }
    if (idx == 2) {
        data = secondList2

    }
    if (idx == 3) {
        data = secondList3

    }
    if (idx == 4) {
        data = secondList4

    }
    if (idx == 5) {
        data = secondList5

    }


    v_gugunSelect.innerHTML = "";  // 태그 출력

    for (i = 0; i < data.length; i++) {
        // 새로운 <option value=''>값</option> 태그 생성
        var optionEl = document.createElement("option");

        // value 속성 태그에 저장
        optionEl.value = data[i];

        // text 문자열을 새로 생성한 <option> 태그에 추가
        optionEl.appendChild(document.createTextNode(data[i]));

        // 만들어진 option 태그를 <select>태그에 추가
        v_gugunSelect.appendChild(optionEl);
    }

    v_gugunSelect.style.display = ""; // 중분류 태그 출력


}

// 대분류 선택시
function changeSecondSelect() {
    var v_sidoSelect = document.getElementById("sidoSelect"); // SELECT TAG
    var v_secondSelect = document.getElementById("gugunSelect"); // SELECT TAG
    var idx = v_sidoSelect.options.selectedIndex;
    var idx2 = v_secondSelect.options.selectedIndex;    // 선택값 0 ~ 3

    // alert("select: " + selText);
    if (idx < 1 && idx > 3) {
        return;
    }


    lastSelectFill(idx, idx2);   // 중분류 생성
}

function lastSelectFill(idx, idx2) {
    var v_lastSelect = document.getElementById("lastSelect"); // SELECT TAG
    var data = null;

    if (idx == 0) {
        v_lastSelect.style.display = "none";  // 중분류 태그 감추기
        btnArea.style.display = "none";
        return;
    }

    if (idx == 1 && idx2 == 0) {
        data = lastList1_1
    }
    if (idx == 1 && idx2 == 1) {
        data = lastList1_2
    }
    if (idx == 1 && idx2 == 2) {
        data = lastList1_3
    }
    if (idx == 1 && idx2 == 3) {
        data = lastList1_4
    }
    if (idx == 1 && idx2 == 4) {
        data = lastList1_5
    }
    if (idx == 2 && idx2 == 0) {
        data = lastList2_1
    }
    if (idx == 2 && idx2 == 1) {
        data = lastList2_2
    }
    if (idx == 2 && idx2 == 2) {
        data = lastList2_3
    }
    if (idx == 2 && idx2 == 3) {
        data = lastList2_4
    }
    if (idx == 2 && idx2 == 4) {
        data = lastList2_5
    }


    if (idx == 3 && idx2 == 0) {
        data = lastList3_1
    }
    if (idx == 3 && idx2 == 1) {
        data = lastList3_2
    }
    if (idx == 3 && idx2 == 2) {
        data = lastList3_3
    }
    if (idx == 3 && idx2 == 3) {
        data = lastList3_4
    }
    if (idx == 3 && idx2 == 4) {
        data = lastList3_5
    }

    if (idx == 4 && idx2 == 0) {
        data = lastList4_1
    }
    if (idx == 4 && idx2 == 1) {
        data = lastList4_2
    }
    if (idx == 4 && idx2 == 2) {
        data = lastList4_3
    }
    if (idx == 4 && idx2 == 3) {
        data = lastList4_4
    }
    if (idx == 4 && idx2 == 4) {
        data = lastList4_5
    }

    if (idx == 5 && idx2 == 0) {
        data = lastList5_1
    }
    if (idx == 5 && idx2 == 1) {
        data = lastList5_2
    }
    if (idx == 5 && idx2 == 2) {
        data = lastList5_3
    }
    if (idx == 5 && idx2 == 3) {
        data = lastList5_4
    }
    if (idx == 5 && idx2 == 4) {
        data = lastList5_5
    }


    v_lastSelect.innerHTML = "";  // 태그 출력

    for (i = 0; i < data.length; i++) {
        // 새로운 <option value=''>값</option> 태그 생성
        var optionEl = document.createElement("option");

        // value 속성 태그에 저장
        optionEl.value = data[i];

        // text 문자열을 새로 생성한 <option> 태그에 추가
        optionEl.appendChild(document.createTextNode(data[i]));

        // 만들어진 option 태그를 <select>태그에 추가
        v_lastSelect.appendChild(optionEl);
    }

    v_lastSelect.style.display = ""; // 중분류 태그 출력
}