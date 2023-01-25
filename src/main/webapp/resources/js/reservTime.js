// 변수선언 옵션 op
let op; // 옵션
let totalPrice; // 총액

$(function () {
    op = $("#goodsReg_Idx").val(); //옵션 번호
    totalPrice = $("#totalPrice").text(); // 가격

    
    // 시작 날짜
    let startDate = new Date().toLocaleDateString("ko-KR",
    {
        month:"numeric",
        day:"2-digit",
        weekday:"short"
    }); // ex) 12. 19. (월)


    // id 값이 selectedDate1, selectedDate2 인 태그 안에 해당값 출력
    $("#selectedDate1, #selectedDate2").html(startDate
        + "<input type='hidden' name='selectedDate' value='" + startDate + "'>");

    $("input[name='selectedDate']").val(startDate);

    $("#selectTimes details summary").trigger("click");

     // DATEPICKER
    $("#datepicker").datepicker({
        // 날짜 범위 지정 오늘부터 ~ 1주이후까지
        minDate: 0,
        maxDate: "+6D",
        defaultDate: 0,

        // 날짜 선택 시 데이터 값 가져오기
        onSelect: function () {
            
            // 선택한 날짜 포맷
            const selectedDate = 
            $(this).datepicker('getDate').toLocaleDateString("ko-KR",
            {
                month:"numeric",
                day:"2-digit",
                weekday:"short"
            });

            // id="selectedDate1", "selectedDate2" 선택한 날짜 텍스트 출력
            $("#selectedDate1, #selectedDate2").html(selectedDate
                + "<input type='hidden' name='selectedDate' value='" + selectedDate + "'>");
                //console.log(selectedDate);
            console.log("선택날짜(일): " + selectedDate.substring(4,6));
            //날짜만 선택
            console.log("옵션번호: " + op);
            // 날짜 선택시 포맷
            selectDay(selectedDate.substring(4,6)); //selectDay 함수 param 값 "선택날짜(일)"
            // 날짜 선택시 서머리 태그 클릭 트리거 작동(닫힘)
            $(this).siblings("summary").trigger("click");
        },
    });
    selectDay(startDate.substring(4,6)); //며칠인지 값 추출 selectDay 함수 param 값
});

// 영업시간 종료 시 다음 날로 변경
function closeTomorrowDay()
{
    // 달력 다음 날짜 클릭 트리거 강제 발동
    $(".ui-datepicker-current-day").next("td").find("a").trigger("click");
    // 선택 시 닫힘
    $("#datepicker").siblings("summary").trigger("click");
}

// DATEPICKER 한글화
$.datepicker.setDefaults({
    dateFormat: 'mm월dd일',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년',
});

// 날짜 선택 후 시간 선택
function selectDay(param)
{
    $.ajax({
        url: "/user/reserv/getTime",
        type: "POST",
        data: 
        {
            // 옵션번호, 날짜
            sche_good_idx: op, 
            sche_date: param //두자리수 날짜 숫자값 ex) 12.29 -> 29
            
        },
        // 비동기 방식
        async: false,
        success: function(result)
        {
            // 변수 선언 
            let times = result.time; //선택 날짜에 담겨있는 데이터
            // selectTime 클래스의 tbody 태그를 table 변수에 저장
            let table = $(".selectTime tbody"); //시간선택 
            table.html("");

            // 옵션 사용시간
            let optionUsetime = $("#goodsReg_usetime").val();

            // 선택날짜의 옵션 시간 + 옵션 사용 시간이 20:30시가 넘으면 출력 x

            // 행 추가
            // 9시부터 20시 까지
            let currentTime = new Date();
            let day = parseInt(('0' + currentTime.getDate()).slice(-2));
            let hours = parseInt(('0' + currentTime.getHours()).slice(-2)) + 1; // 현재 시간에서 +1
            let offday_flag = false;
            
            // 휴무일 검증 로직
            for(let i = 9; i <= 20; i++)
            {
                // 삼항연산 i가 10보다 작을경우(참) "0" + i, 거짓일 경우 i
                let time = ( i < 10) ? "0" + i : i;
                // _time 변수에 저장 "T_{time}00" ex) T_0900
                let _time = "T_" + time + "00";
                // _time_30 변수에 저장 "T_{time}30" ex) T_0930
                let _time_30 = "T_" + time + "30";

                if(times[_time] != -1) offday_flag = true;
                if(times[_time_30] != -1) offday_flag = true;
            }
            if(!offday_flag)
            {
                alert(selectContents.offDay);
                let next_date = parseInt(param) + 1;
                let next_date_a = document.querySelectorAll(".ui-datepicker-current-day, a[data-date='"+next_date+"']");
                if(isNull(next_date_a)) 
                {
                    $(".ui-datepicker-next").trigger("click");
                    next_date_a = document.querySelectorAll(".ui-datepicker-current-day a[data-date='1']");
                }
                $(next_date_a).trigger("click");
                return false;
            }

            //휴무일이 아닐 경우
            if(day == param) //day 는 날짜 값 ex) 12.29 -> 29 현재 날짜일때
            {

                if(hours < 9) hours = 9; // hours 는 시간 값 + 1 ex) 현재시간 19:50 -> 20 현재 시간이 9시 전일 때
//9시부터 2030까지 -> 24개
//숫자로 반복 -> 9 ~ 20. 시간별 30분 단위 같이 출력
//선택한 시간 옵션: optionUsetime -> 30 -1 60 -2 90 -3
                if(hours <= 20) // 현재 시간이 21시 전일 때
                {
                    for(let i = hours; i <= 20; i++)
                    {   
                        // time = 선택가능한 시간
                        // 삼항연산 i가 10보다 작을경우(참) "0" + i, 거짓일 경우 i
                        let time = ( i < 10) ? "0" + i : i;
                        // _time 변수에 저장 "T_{time}00" ex) T_0900
                        let _time = "T_" + time + "00";
                        // _time_30 변수에 저장 "T_{time}30" ex) T_0930
                        let _time_30 = "T_" + time + "30";
                        let str = "";
                        let str2 = "";
                        let _time30 = time + "30";
                        let _time_ = time + "00";
                        let offTime = 2030;
                        // optionUsetime;
        
                        // 받아온 값이 0, -1 아닐 때(-1은 영업시간이 아님, 0은 매진)
                        // 선택한 옵션 시간 영업종료시간 이후에는 선택 불가능해야함
                        if(times[_time] > 0) //&& _time30 + optionUsetime < offTime
                        
                        {
                            str = "<tr><td>" 
                            + "<span class='selectTime'>" 
                            +time + ":00 </span>" 
                            + "<span>" + times[_time] + 
                            "</span>명</td></tr>";
                        }
                        
                        if(times[_time_30] > 0) //&& _time_ + optionUsetime < offTime
                        {
                            str2 = "<tr><td>" 
                            + "<span class='selectTime'>" 
                            +time + ":30 </span>" 
                            + "<span>" + times[_time_30] 
                            +"</span>명</td></tr>";
                        }

                        table.append
                        (
                            str + str2
                        );
        
                    }
                } else // 21시 이후 일 때
                {
                    alert("영업시간이 종료되었습니다.");
                    closeTomorrowDay();
                }
            } else // 현재날짜가 선택 날짜와 다를때
            {
                for(let i = 9; i <= 20; i++)
                    {
                        // 삼항연산 i가 10보다 작을경우(참) "0" + i, 거짓일 경우 i
                        let time = ( i < 10) ? "0" + i : i;
                        // _time 변수에 저장 "T_{time}00" ex) T_0900
                        let _time = "T_" + time + "00";
                        // _time_30 변수에 저장 "T_{time}30" ex) T_0930
                        let _time_30 = "T_" + time + "30";
                        let str = "";
                        let str2 = "";
                        
        
                        // 받아온 값이 0, -1 아닐 때(-1은 영업시간이 아님, 0은 매진)
                        if(times[_time] > 0)
                        
                        {
                            str = "<tr><td>" 
                            + "<span class='selectTime'>" 
                            +time + ":00 </span>" 
                            + "<span>" + times[_time] + 
                            "</span>명</td></tr>";
                        }
        
                        if(times[_time_30] > 0)
                        {
                            str2 = "<tr><td>" 
                            + "<span class='selectTime'>" 
                            +time + ":30 </span>" 
                            + "<span>" + times[_time_30] 
                            +"</span>명</td></tr>";
                        }
        
                        table.append //테이블 생성
                        (
                            str + str2
                        );
                    }
            }

            //시간표가 만들어진 다음에 옵션 단위별 제거
            let tr_length = document.querySelectorAll(".selectTime tr").length;
            for (let i = 0; i < Math.ceil(optionUsetime/30); i++) {
                $(".selectTime tr:nth-child("+(tr_length-i)+")")[0].remove();
            }
            /* 클릭 시 닫히고 다음 선택 열리기 */
            // 시간선택 옵션 클릭시
            table.children("tr").on("click", function()
            {
                // 
                $(this).siblings().removeClass("on");
                $(this).addClass("on");

                // 시간선택 옵션을 클릭하면 서머리를 한번 더 클릭해서 닫아줌
                table.parent().siblings("summary").trigger("click");
                // 닫히는 동시에 인원 선택 서머리를 클릭하는 트리거 작동
                $("#selectPeople details summary").trigger("click");
            });

            // selectPerson 함수 실행
            selectPerson();

            return result;
        },

        error: function(result)
        {
            // 오류 발생 시 처리
            console.log(result); //에러메세지 확인
        }
    });
}

// 인원수 변수 선언
let selectNum;
// 시간 변수 선언
let selectTime;

// 인원 선택
function selectPerson()
{
    // selectTime 클래스에 tr  td 태그 클릭시 함수 동작
    $(".selectTime tr td").on("click", function()
    {
        // 이 함수 자식 span 태그 텍스트로 변경해서 변수 selectNum 에 저장
        selectNum = $(this).children("span").text(); // ex) 12:00 10
        selectTime = $(this).children(".selectTime").text(); // ex) 12:00

        console.log("인원수: " + selectNum.substring(6,8)); // 10
        console.log("시간: " + selectTime);

        // 예약 내용을 확인해주세요 섹션에 출력
        $("#selectTime").html(", " + selectTime + "<input type='hidden' name='selectTime' value='"+ selectTime +"'> ");

    });
    // 인원선택 서머리 클릭 트리거 작동
    $(this).siblings("summary").trigger("click");
}

// 인원수 count 함수 type
function count(type)  
{
    // 결과를 표시할 element 아이디값 num
    let resultElement = document.getElementById('num');
    
    // 현재 화면에 표시된 값
    let number = resultElement.innerText;
    
    // 더하기
    if(type === 'plus') {
        // 시간선택에서 넘어온 선택가능한 인원수 값 보다 작으면 + 1
        if(number < parseInt(selectNum.substring(6,8)))
        {
            number = parseInt(number) + 1;
        }
    // 빼기    
    }else if(type === 'minus')  
    {
        // 1보다 클 때 -1
    	if(number > 1) {
    		number = parseInt(number) - 1;
    	}
    }
    // 결과 출력
    resultElement.innerText = number;
    console.log(number);
    // 선택한 인원 값 출력
    $("#num2").html(number + "<input type='hidden' name='peopleNum' value='"+ number +"'>");
    // 옵션 가격 * 인원 = 총액
    $("#totalPrice").text(totalPrice*number);
}

// 오류 메세지
let selectContents = 
{
    time: "예약 시간을 선택해 주세요.",
    nullDate: "예약 할 수 없는 날짜입니다.",
    nullTime: "선택 가능한 시간이 아닙니다.",
    notPeople: "예약 가능한 인원수 미만입니다.",
    finalTime: "시간을 선택해 주세요.",
    reservPeople: "예약자를 입력해 주세요.",
    reservTell: "연락처를 입력해주세요.",
    nullTell: "올바른 연락처가 아닙니다. 다시 입력해주세요.",
    nullEmail: "올바른 이메일이 아닙니다. 다시 입력해주세요.",
    offDay: "휴무일입니다."
}


/* ========= 폼 제출 전 유효성 검증========= */
function check_form()
{
	if(!check_reservPeople()) return false;//예약 내용 확인 검사
    if(!check_reservConfirm()) return false;//예약자 정보 확인 검사
	return true;
}

//예약 내용 확인
function check_reservPeople()
{
    // 
    let time = $("input[name='selectTime']").val();
    // 값이 없을때 or 값이 1 보다 작을 때
    if(isNull(time)||time.length < 1)
    {
        alert(selectContents.finalTime);

        // if(!check_reservPeople()) return false 조건 
        return false;
    }
    // true 값 리턴
    return true;
}

//예약자 정보 확인(이메일)
function check_reservConfirm()
{
    // ex) hsj9403@gmail.com
	let email = $("#m_email").val();
    let emailValue = email.split('@');
    let emailBack = emailValue[1]; // @ 이후 

    // 이메일 @ 이후 글자수가 12 보다 클 때
    if(emailBack.length > 12)
    {
        alert(selectContents.nullEmail);

        return false;
    }
    return true;
}



