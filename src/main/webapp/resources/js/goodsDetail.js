// let regex = /[^0-9]/g; // 숫자가 아닌 문자열 제거식
let reviewTable = $("#RV").val(); // 리뷰 갯수

$(function () {
    //처음 DOM 로딩 시 첫번째 상세보기 내용만 보이도록 처리
    contents.hide();//모든 내용 숨기기
    contents.filter(":first-child").show();//첫번째만 보이기

    show_contents();//라디오 클릭에 따른 보이기

    review_timeBefore();// 등록시간 표현 ex) "10분 전"
});

/* 등록날짜 시간 포맷 */
function review_timeBefore()
{
    let rvSum = document.querySelectorAll(".rvSum"); // class="rvSum"을 가진 값 = 리뷰

    for (let i = 0; i < rvSum.length; i++) // 리뷰 갯수만큼 반복
    {
        let rt = timeBefore($(rvSum[i]).find(".v_reg_date").val().substring(0, 16)); // 시간 값 포맷 

        $(rvSum[i]).find(".SP").html(rt + "전"); //rvSum의 i번째 배열값을 모든 자식 class="SP"에 값을 출력해준다.
    }
    
}

/* 등록날짜 시간 포맷 */
function timeBefore(time) {
    //현재시간
    let now = new Date(); // 현재시간 
    //기준시간 
    let writeDay = new Date(time);

    let ResultTime = "";

    //현재 시간과 기준시간의 차이를 getTime을 통해 구한다 
    var difference = now.getTime() - writeDay.getTime();
    //초로 바꿔준다 
    difference = Math.trunc(difference / 1000);

    // 초 
    const seconds = 1;
    // 분
    const minute = seconds * 60;
    // 시
    const hour = minute * 60;
    // 일
    const day = hour * 24;
    // 달
    const mon = day * 30;
    // 년
    const year = mon * 12;

    if (difference < seconds) {
        ResultTime = "바로"
    } else if (difference < minute) {
        ResultTime = Math.trunc(difference / seconds) + '초 ';
    } else if (difference < hour) {
        ResultTime = Math.trunc(difference / minute) + '분 ';
    } else if (difference < day) {
        ResultTime = Math.trunc(difference / hour) + '시간 ';
    } else if (difference < mon) {
        ResultTime = Math.trunc(difference / day) + '일 ';
    } else if (difference < year) {
        ResultTime = Math.trunc(difference / mon) + '달 ';
    } else {
        ResultTime = Math.trunc(difference / year) + '년 ';
    }

    return ResultTime;
}


/* 라디오 클릭에 따라 상세보기 변경 함수 */
let contents = $(".content_wrap").children();//상세보기 내용들

function show_contents() {
    if (contents.length <= 1) return false;//상세보기 내용이 없다면 함수 종료
    $(".tab_radio label").on("click", function () {//라디오의 라벨 클릭 시
        contents.hide();//모든 내용 숨기기
        //클릭한 라벨의 for 속성값과 동일한 클래스명의 상세보기 내용만 보이게 처리
        contents.filter("." + $(this).attr("for")).show();
    });
}

/* 찜 */
function zzim1() {
    alert("카페가 찜 되었어요!");
    return true;
}

function zzim2() {
    alert("카페 찜이 삭제되었어요!");
    return true;
}

/* 이미지 이동 */
const slides = document.querySelector('.main_img');//전체 슬라이드 컨테이너
const slideimg = document.querySelectorAll('.main_img li');//모든 슬라이드들
let currentIdx = 0;//현재 슬라이드
const slideCount = slideimg.length;//슬라이드 개수
const prev = document.querySelector('.prev');//이전버튼
const next = document.querySelector('.next');//다음버튼
const slideWidth = 600;//한개의 슬라이드 넓이
const slideMargin = 0;//한개의 슬라이드의 마진값

/* 전체 슬라이더 컨테이너 넓이 설정 */
slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

function moveSlide(num) {
    slides.style.left = -num * 600 + 'px';
    currentIdx = num;
}

prev.addEventListener('click', function () {
    //첫번째 슬라이드로 표시 됐을때는 이전 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx!=0일때만 moveSlide 함수 불러옴
    // if (currentIdx !== 0) moveSlide(currentIdx - 1);
    if (currentIdx > 0)
    {
        moveSlide(currentIdx - 1);
    }
});

next.addEventListener('click', function () {
    //마지막 슬라이드도 마찬가지
    if (currentIdx !== slideCount - 1) 
    {
        moveSlide(currentIdx + 1);
    }
});

const btnMore = document.getElementsByClassName("btn-more")[0];

const feedMore = document.getElementsByClassName("longContents")[0];

btnMore.addEventListener("click", feedContentMore);

function feedContentMore() 
{
    feedMore.classList.add("more");
}



// let imageIndex = 0;
// let postion = 0;
// const IMAGE_WIDTH = 600;
// const prev = document.querySelector(".prev");
// const next = document.querySelector(".next");
// const images = document.querySelector(".images");

// function prev()
// {
//     if(imageIndex > 0)
//     {
//         // next.removeAttribute("disabled");
//         postion += IMAGE_WIDTH;
//         imageIndex = imageIndex - 1;
//     }
//     // if(imageIndex == 0)
//     // {
//     //     prev.setAttribute('disabled', 'true');
//     // }
// }

// function next()
// {
//     if(imageIndex < 3)
//     {
//         // prev.removeAttribute("disabled");
//         postion += IMAGE_WIDTH;
//         imageIndex = imageIndex + 1;
//     }
//     // if(imageIndex == 3)
//     // {
//     //     prev.setAttribute('disabled', 'true');
//     // }
// }

// function init()
// {
//     // prev.setAttribute('disabled', 'true');
//     prev.addEventListener("click", prev);
//     next.addEventListener("click", next);
// }

// init();



