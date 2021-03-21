/*공용해더부분 */
$(document).ready(function () {
    var jbOffset = $('#headertop').offset();
    $(window).scroll(function () {
        if ($(document).scrollTop() > jbOffset.top) {
            $('#headertop').addClass('jbFixed');
        }
        else {
            $('#headertop').removeClass('jbFixed');
        }
    });
});
// 이미지 슬라이드
$(document).ready(function () {

    //좌우버튼, 동그라미 버튼 연동 //

    var wid = $(".photo").width();
    var i = $(".photoOrder button").index();
    var len = $("#slider li").length;

    $("#slider li:first").css("display", "block");

    $(".prevButton").click(function () {
        if (i == 0) {
            i = len - 1;
        } else {
            i = i - 1;
        }
        showSlide();
    });

    $(".nextButton").click(function () {
        if (i == 3) {
            i = 0;
        } else {
            i = i + 1;
        }
        showSlide();
    });

    $(".photoOrder button").click(function () {
        i = $(this).index();
        showSlide();
    });

    function showSlide() {
        $(".photoOrder button").removeClass("ptClickOn");
        $(".photoOrder button").eq(i).addClass("ptClickOn");
        $("#slider li").stop(true, true).fadeOut();
        $("#slider li").eq(i).stop(true, true).fadeIn();
    }
});
// 이미지 슬라이드 끝

// 리뷰 이미지 모달창
$(document).ready(function () {

    $(".zoomButton").click(function (event) {  //팝업 Open 버튼 클릭 시 

        $(".reImgBox2").css({
            "top": (($(window).height() - $(".reImgBox2").outerHeight()) / 2 + $(window).scrollTop()) + "px",
            "left": (($(window).width() - $(".reImgBox2").outerWidth()) / 2 + $(window).scrollLeft()) + "px"
            //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정

        });

        $(".reImgModal").css("display", "block"); //팝업 뒷배경 display block
        $(".reImgBox2").css("display", "block"); //팝업창 display block

        $("body").css("overflow", "hidden");//body 스크롤바 없애기
    });

    $(".reImgCancle").click(function (event) {
        $(".reImgModal").css("display", "none"); //팝업창 뒷배경 display none
        $(".reImgBox2").css("display", "none"); //팝업창 display none
        $("body").css("overflow", "auto");//body 스크롤바 생성
    });
});
// 리뷰 이미지 모달창 끝

// 확대 이미지 슬라이드
$(document).ready(function () {

    //좌우버튼, 동그라미 버튼 연동 //

    var wid = $(".reImgBox2").width();
    var i = $(".reSuButton button").index();
    var len = $(".reImgBox4 img").length;

    $(".reImgBox4 img").click(function () {
        if (i == 0) {
            i = len - 1;
        } else {
            i = i - 1;
        }
        showSlide();
    });

    $(".reImgBox4 img").click(function () {
        if (i == 3) {
            i = 0;
        } else {
            i = i + 1;
        }
        showSlide();
    });

    $(".reSuButton button").click(function () {
        i = $(this).index();
        showSlide();
    });

    function showSlide() {
        $(".reSuButton button").removeClass("reImgCOk");
        $(".reSuButton button").eq(i).addClass("reImgCOk");
        $(".reImgBox4 img").stop(true, true).slideDown();
        $(".reImgBox4 img").eq(i).stop(true, true).slideDown();
    }
});
// 확대 이미지 슬라이드

/* 로그인 팝업 */
$(document).ready(function () {
    $("#modal_btn").click(function (event) {

        $(".modal_wrap").css({
            "top": (($(window).height() - $(".modal_wrap").outerHeight()) / 2 + $(window).scrollTop()) + "px",
            "left": (($(window).width() - $(".modal_wrap").outerWidth()) / 2 + $(window).scrollLeft()) + "px"
            //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정

        });
        $(".modal_wrap").css("display", "block");
        $(".black_bg").css("display", "block");

        $("body").css("overflow", "hidden");//body 스크롤바 없애기
    })

    $(".modal_close").click(function (event) {
        $(".black_bg").css("display", "none"); //팝업창 뒷배경 display none
        $(".modal_wrap").css("display", "none"); //팝업창 display none
        $("body").css("overflow", "auto");//body 스크롤바 생성
    });

    $(".black_bg").click(function (event) {
        $(".black_bg").css("display", "none"); //팝업창 뒷배경 display none
        $(".modal_wrap").css("display", "none"); //팝업창 display none
        $("body").css("overflow", "auto");//body 스크롤바 생성
    });

})

// 신고하기 모달창

$(document).ready(function () {

    $(".report").click(function (event) {  //팝업 Open 버튼 클릭 시 

        $(".reBox1").css({
            "top": (($(window).height() - $(".reBox1").outerHeight()) / 2 + $(window).scrollTop()) + "px",
            "left": (($(window).width() - $(".reBox1").outerWidth()) / 2 + $(window).scrollLeft()) + "px"
            //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정

        });

        $(".rpModal").css("display", "block"); //팝업 뒷배경 display block
        $(".reBox1").css("display", "block"); //팝업창 display block

        $("body").css("overflow", "hidden");//body 스크롤바 없애기
    });

    $(".reCancle").click(function (event) {
        $(".rpModal").css("display", "none"); //팝업창 뒷배경 display none
        $(".reBox1").css("display", "none"); //팝업창 display none
        $("body").css("overflow", "auto");//body 스크롤바 생성
    });

    $(".rpModal").click(function (event) {
        $(".rpModal").css("display", "none"); //팝업창 뒷배경 display none
        $(".reBox1").css("display", "none"); //팝업창 display none
        $("body").css("overflow", "auto");//body 스크롤바 생성
    });
});

$(document).ready(function () {
    $(".reportBox1 button").click(function () { // 
        $(".reSubBox1").fadeIn(1000);
        $(".reSubBox2").fadeOut(1000).css("display", "none");
        $(".reSubBox3").fadeOut(1000).css("display", "none");
        $(".reSubBox4").fadeOut(1000).css("display", "none");
        $(".reSubBox5").fadeOut(1000).css("display", "none");

        $(".reBox1").css({
            "top": (($(window).height() - $(".reBox1").outerHeight()) / 2 + $(window).scrollTop()) + "px",
            "left": (($(window).width() - $(".reBox1").outerWidth()) / 2 + $(window).scrollLeft()) + "px"
            //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
        });
    })

    $(".reportBox2 button").click(function () { // 
        $(".reSubBox2").fadeIn(1000);
        $(".reSubBox1").fadeOut(1000).css("display", "none");
        $(".reSubBox3").fadeOut(1000).css("display", "none");
        $(".reSubBox4").fadeOut(1000).css("display", "none");
        $(".reSubBox5").fadeOut(1000).css("display", "none");

        $(".reBox1").css({
            "top": (($(window).height() - $(".reBox1").outerHeight()) / 2 + $(window).scrollTop()) + "px",
            "left": (($(window).width() - $(".reBox1").outerWidth()) / 2 + $(window).scrollLeft()) + "px"
            //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정

        });
    })
    $(".reportBox3 button").click(function () { // 
        $(".reSubBox3").fadeIn(1000);
        $(".reSubBox1").fadeOut(1000).css("display", "none");
        $(".reSubBox2").fadeOut(1000).css("display", "none");
        $(".reSubBox4").fadeOut(1000).css("display", "none");
        $(".reSubBox5").fadeOut(1000).css("display", "none");

        $(".reBox1").css({
            "top": (($(window).height() - $(".reBox1").outerHeight()) / 2 + $(window).scrollTop()) + "px",
            "left": (($(window).width() - $(".reBox1").outerWidth()) / 2 + $(window).scrollLeft()) + "px"
            //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정

        });
    })
    $(".reportBox4 button").click(function () { // 
        $(".reSubBox4").fadeIn(1000);
        $(".reSubBox1").fadeOut(1000).css("display", "none");
        $(".reSubBox2").fadeOut(1000).css("display", "none");
        $(".reSubBox3").fadeOut(1000).css("display", "none");
        $(".reSubBox5").fadeOut(1000).css("display", "none");

        $(".reBox1").css({
            "top": (($(window).height() - $(".reBox1").outerHeight()) / 2 + $(window).scrollTop()) + "px",
            "left": (($(window).width() - $(".reBox1").outerWidth()) / 2 + $(window).scrollLeft()) + "px"
            //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정

        });
    })
    $(".reportBox5 button").click(function () { // 
        $(".reSubBox5").fadeIn(1000);
        $(".reSubBox1").fadeOut(1000).css("display", "none");
        $(".reSubBox2").fadeOut(1000).css("display", "none");
        $(".reSubBox3").fadeOut(1000).css("display", "none");
        $(".reSubBox4").fadeOut(1000).css("display", "none");

        $(".reBox1").css({
            "top": (($(window).height() - $(".reBox1").outerHeight()) / 2 + $(window).scrollTop()) + "px",
            "left": (($(window).width() - $(".reBox1").outerWidth()) / 2 + $(window).scrollLeft()) + "px"
            //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정

        });
    })

    $(".rpModal").click(function () {
        $(".reSubBox1").css("display", "none");
        $(".reSubBox2").css("display", "none");
        $(".reSubBox3").css("display", "none");
        $(".reSubBox4").css("display", "none");
        $(".reSubBox5").css("display", "none");
    })

    $(".reCancle").click(function () {
        $(".reSubBox1").css("display", "none");
        $(".reSubBox2").css("display", "none");
        $(".reSubBox3").css("display", "none");
        $(".reSubBox4").css("display", "none");
        $(".reSubBox5").css("display", "none");
    })


});



$(document).ready(function () {
    $('#content').on('keyup', function () {
        $('#counter').html($(this).val().length + "/2000");

        if ($(this).val().length > 2000) {
            $(this).val($(this).val().substring(0, 2000));
            $('#counter').html("2000/2000");
        }
    });
});


$(document).ready(function () {
    $('#titleCon').on('keyup', function () {
        $('.txtcount').html($(this).val().length + "/40");

        if ($(this).val().length > 40) {
            $(this).val($(this).val().substring(0, 40));
            $('.txtcount').html("40/40");
        }
    });
    $(document).on("click", ".tradeCancle", function () {
        $('.txtcount').html($(this).val().length + "/40");
        $("#titleCon").val("")
    });
});



$(document).ready(function () {
    $('#enquiryTxt').on('keyup', function () {
        $('.enquiryCnt').html($(this).val().length + "/40");

        if ($(this).val().length > 40) {
            $(this).val($(this).val().substring(0, 40));
            $('.enquiryCnt').html("40/40");
        }
    });
});

// 연관태그 글자 수 제한
$(document).ready(function () {
    $('#tag').on('keyup', function () {
        if ($(this).val().length > 9) {
            $(this).val($(this).val().substring(0, 9));
        }
    });
});

// 제목 입력 시 거래금지 및 삭제버튼 숨기기(보이기)
$(document).ready(function () {
    $('#titleCon').on('keyup', function () {
        if ($('#titleCon').val() != "") {
            $('.noTrade').hide();
            $(".tradeCancle").show();
        } else if ($('#titleCon').val() == "") {
            $('.noTrade').show();
            $(".tradeCancle").hide();
        }
    });
});

// 탭 메뉴 시작
$(document).ready(function () {
    $(".m1 a").click(function () { // m1 a 클릭 시 
        $(".m1 a").removeClass("click"); // a 클래스 click 클래스 삭제
        $(this).addClass("click"); // 클릭 된 m1 a태그에 click 클래스 추가
    })
});

$(document).ready(function () {
    $(".clickView2").click(function () { // clickVeiw2 클릭 시
        $(".main").addClass("clickOff"); // main 클래스에 clickOff 클래스 추가 
        $(".viewOn").removeClass("clickOff"); // viewOn 클래스에 clickOff 클래스 삭제
    })
    $(".clickView1").click(function () { // clickView1 클릭 시
        $(".viewOn").addClass("clickOff"); // viewOn 클래스에 clickOff 클래스 추가 
        $(".main").removeClass("clickOff"); // main 클래스에 clickOff 클래스 삭제
    })
});

// 상품 정보 / 상품 문의 부분 
$(document).ready(function () {
    $(".shopbutton a").click(function () {
        $(".shopbutton a").removeClass("shopinfo");
        $(".shopbutton a").addClass("shopQes");
        $(this).addClass("shopinfo");
        $(this).removeClass("shopQes");
    })
});

// trade.html 구매내역 부분
$(document).ready(function () {
    $(".tradeList li").click(function () {
        $(".tradeList li").removeClass("selected");
        $(this).addClass("selected");
    })
});
$(document).ready(function () {
    $(".tradeFilter button").click(function () {
        $(".tradeFilter button").removeClass("checkButton");
        $(this).addClass("checkButton");
    })
});

// trade.html 정산등록 div show
$(document).ready(function () {
    $(".tradeList li:last-child").click(function () {
        $(".filterBox").hide()
        $(".avgBox1").show()
    })
    $(".tradeList li:first-child").click(function () {
        $(".avgBox1").hide()
        $(".filterBox").show()
    })
    $(".tradeList li:nth-child(2)").click(function () {
        $(".avgBox1").hide()
        $(".filterBox").show()
    })
});

// 탭 메뉴 끝


// 연관태그 기능
$(document).ready(function () {

    var tag = {};
    var counter = 0;

    // 태그를 추가한다.
    function addTag(value) {
        tag[counter] = value; // 태그를 Object 안에 추가
        counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
    }

    // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
    function marginTag() {
        return Object.values(tag).filter(function (word) {
            return word !== "";
        });
    }

    // // 서버에 넘기기
    // $("#tag-form").on("submit", function (e) {
    //     var value = marginTag(); // return array
    //     $("#rdTag").val(value); 

    //     $(this).submit();
    // });

    $("#tag").on("keypress", function (e) {
        var self = $(this);

        // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
        if (e.key === "Enter" || e.keyCode == 32) {

            var tagValue = self.val(); // 값 가져오기

            // 값이 없으면 동작 ㄴㄴ
            if (tagValue !== "") {

                // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                var result = Object.values(tag).filter(function (word) {
                    return word === tagValue;
                })

                // 태그 중복 검사
                if (result.length == 0) {
                    $("#tag-list").append("<li class='tagTxt'>" + "#" + tagValue + "<button class='tagCancle' idx='" + counter + "'></button></li>");
                    addTag(tagValue);
                    self.val("");
                } else {
                    alert("태그값이 중복됩니다.");
                }

                // 태그가 5개 이상 등록되면 동작 x 
                if(counter > 4){
                    $("#tag").hide()
                }
            }
            e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
        }
    });


    // 삭제 버튼 
    // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
    $(document).on("click", ".tagCancle", function (e) {
        var index = $(this).attr("idx");
        tag[index] = "";
        $(this).parent().remove();
        counter--;
        if(counter < 6){
            $("#tag").show()
        }
    });
})


// 가격 100원 이상 안 적을 시 경고메세지 보이기
$(document).ready(function () {
    $(".prcienum").blur(function () { // 키보드 포커스를 잃으면
        if ($('.prcienum').val() == "" || $('.prcienum').val() < 100) {
            $(".noNum").show();
            $(".prcienum").css("border-color", "orange");
            $(".prcienum").mouseover(function () {
                $(".prcienum").css("border-color", "orange")
            })
        } else if ($('.prcienum').val() != "") {
            $(".noNum").hide();
            $(".prcienum").css("border-color", "rgb(195, 194, 204)")
            $(".prcienum").mouseover(function () {
                $(".prcienum").css("border-color", "black")
            })
        };
    })
});



// 페이징 / 숫자 클릭 시 배경 색 변경되는 기능(상품관리)
$(document).ready(function () {
    $(".mbnPgBox1 a").click(function () {
        $(".mbnPgBox1 a").removeClass("mbnPgC");
        $(".mbnPgBox1 a").addClass("mbnPg");
        $(this).removeClass("mbnPg");
        $(this).addClass("mbnPgC");
    })
});



// 찜 클릭 시 배경
$(document).ready(function () {
    $(".zzimButton1").click(function () {
        $(".zzimButton1").hide()
        $(".zzimButton2").show()
        $(".zzimNo").fadeIn()
        $(".zzimNoTxt").show().html("상품이 찜")
        $(".zzimNo").fadeOut(2000)
    })
    $(".zzimButton2").click(function () {
        $(".zzimButton2").hide()
        $(".zzimButton1").show()
        $(".zzimNo").fadeIn()
        $(".zzimNoTxt").show().html("찜이 해제")
        $(".zzimNo").fadeOut(2000)
    })
});


// * 카테고리 분류 시작

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
// * 카테고리 분류 끝

// 자주묻는 질문

$(document).ready(function () {
    $(".oftenBox a").click(function () {
        $(".oftenBox a").removeClass("oftenQesOk");
        $(".oftenBox a").addClass("oftenQes");
        $(this).addClass("oftenQesOk");
        $(this).removeClass("oftenQes");
    })
});


$(document).ready(function(){
    $(".oftenBox a").click(function(){ 
        $(".oftenBox a").removeClass("oftenQesOk"); 
        $(".oftenBox a").addClass("oftenQes"); 
        $(this).addClass("oftenQesOk"); 
        $(this).removeClass("oftenQes"); 
    })
});

$(document).ready(function(){
    $(".oftenBox a:first-child").click(function(){ 
        $("#qaBoxList ul").addClass("qaBox"); 
        $("#qaBoxList ul").removeClass("qaBoxOpen"); 
        $("#qaBoxList ul:nth-child(2)").addClass("qaBoxOpen"); 

        $(".qaBoxOpen li:first-child button").click(function(){ 

        })
        
})

    $(".oftenBox a:nth-child(2)").click(function(){ 
        $("#qaBoxList ul").addClass("qaBox"); 
        $("#qaBoxList ul").removeClass("qaBoxOpen"); 
        $("#qaBoxList ul:nth-child(3)").addClass("qaBoxOpen"); 
    })
    $(".oftenBox a:nth-child(3)").click(function(){ 
        $("#qaBoxList ul").addClass("qaBox"); 
        $("#qaBoxList ul").removeClass("qaBoxOpen"); 
        $("#qaBoxList ul:nth-child(4)").addClass("qaBoxOpen"); 
    })
    $(".oftenBox a:nth-child(4)").click(function(){ 
        $("#qaBoxList ul").addClass("qaBox"); 
        $("#qaBoxList ul").removeClass("qaBoxOpen"); 
        $("#qaBoxList ul:nth-child(5)").addClass("qaBoxOpen"); 
    })
    $(".oftenBox a:nth-child(5)").click(function(){ 
        $("#qaBoxList ul").addClass("qaBox"); 
        $("#qaBoxList ul").removeClass("qaBoxOpen"); 
        $("#qaBoxList ul:nth-child(6)").addClass("qaBoxOpen"); 
    })
    $(".oftenBox a:nth-child(6)").click(function(){ 
        $("#qaBoxList ul").addClass("qaBox"); 
        $("#qaBoxList ul").removeClass("qaBoxOpen"); 
        $("#qaBoxList ul:nth-child(7)").addClass("qaBoxOpen"); 
    })
    $(".oftenBox a:nth-child(7)").click(function(){ 
        $("#qaBoxList ul").addClass("qaBox"); 
        $("#qaBoxList ul").removeClass("qaBoxOpen"); 
        $("#qaBoxList ul:nth-child(8)").addClass("qaBoxOpen"); 
    })
    $(".oftenBox a:nth-child(8)").click(function(){ 
        $("#qaBoxList ul").addClass("qaBox"); 
        $("#qaBoxList ul").removeClass("qaBoxOpen"); 
        $("#qaBoxList ul:nth-child(9)").addClass("qaBoxOpen"); 
    })
    $(".oftenBox a:nth-child(9)").click(function(){ 
        $("#qaBoxList ul").addClass("qaBox"); 
        $("#qaBoxList ul").removeClass("qaBoxOpen"); 
        $("#qaBoxList ul:nth-child(10)").addClass("qaBoxOpen"); 
    })
    $(".oftenBox a:nth-child(10)").click(function(){ 
        $("#qaBoxList ul").addClass("qaBox"); 
        $("#qaBoxList ul").removeClass("qaBoxOpen"); 
        $("#qaBoxList ul:nth-child(11)").addClass("qaBoxOpen"); 
    })
    $(".oftenBox a:nth-child(11)").click(function(){ 
        $("#qaBoxList ul").addClass("qaBox"); 
        $("#qaBoxList ul").removeClass("qaBoxOpen"); 
        $("#qaBoxList ul:nth-child(12)").addClass("qaBoxOpen"); 
    })
    $(".oftenBox a:last-child").click(function(){ 
        $("#qaBoxList ul").addClass("qaBox"); 
        $("#qaBoxList ul").removeClass("qaBoxOpen"); 
        $("#qaBoxList ul:last-child").addClass("qaBoxOpen"); 
    })
});

/*계정설정부분*/ 
/*sns연동버튼*/
function closeLayer( obj ) {
    $('.Acwarp').show();
    $('.AcSnswarp').hide();
};

var btn = document.getElementById('submit'); 

btn.addEventListener('click',function(){
    $('.Acwarp').hide();
    $('.AcSnswarp').show();
    
});

/*로그아웃부분*/
Aclogout.addEventListener('click',function(){
    $('.Aclogoutpage').show();
    $('.warp2').show();
});
/*로그아웃부분*/
logout.addEventListener('click',function(){
    $('.Aclogoutpage').show();
    $('.warp2').show();
});



// // 이미지 로딩
// let $grid = $('.grid').masonry({
//     itemSelector: '.photo-item',
//     columnWidth: '.grid__col-sizer',
//     gutter: '.grid__gutter-sizer',
//     percentPosition: true,
//     stagger: 30,
//     // nicer reveal transition
//     visibleStyle: { transform: 'translateY(0)', opacity: 1 },
//     hiddenStyle: { transform: 'translateY(100px)', opacity: 0 },
// });

// //------------------//

// // Get an API key for your demos at https://unsplash.com/developers
// const unsplashID = '9ad80b14098bcead9c7de952435e937cc3723ae61084ba8e729adb642daf0251';

// // get Masonry instance
// var msnry = $grid.data('masonry');

// $grid.infiniteScroll({
//     path: function () {
//         return `https://api.unsplash.com/photos?client_id=${unsplashID}&page=${this.pageIndex}`;
//     },
//     // load response as JSON
//     responseBody: 'json',
//     outlayer: msnry,
//     status: '.page-load-status',
//     history: false,
// });

// $grid.on('load.infiniteScroll', function (event, body) {
//     // compile body data into HTML
//     let itemsHTML = body.map(getItemHTML).join('');
//     // convert HTML string into elements
//     let $items = $(itemsHTML);
//     // append item elements
//     $items.imagesLoaded(function () {
//         $grid.append($items).masonry('appended', $items);
//     })
// });

// // load initial page
// $grid.infiniteScroll('loadNextPage');

// //------------------//

// function getItemHTML({ user, urls }) {
//     return `<div class="photo-item">
//       <img class="photo-item__image" src="${urls.regular}" alt="Photo by ${user.name}" />
//       <p class="photo-item__caption">
//         <a href="${user.links.html}?utm_source=infinite-scroll-demos&utm_medium=referral&utm_campaign=api-credit">${user.name}</a>
//       </p>
//     </div>`;
// }


