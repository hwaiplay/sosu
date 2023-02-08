//== 리뷰 작성 및 수정 폼 유효성 검증 ==//

function check() 
{
    let title = document.querySelector("#rv_title").value; // 제목
    let contents = document.querySelector("#rv_content").value; //내용
   // let imgFile = document.querySelector("#review_file").value; //이미지 파일
    let Category = $('#rate1');

    if($(':radio[name="RV_STAR"]:checked').length < 1)
    {
        alert('별점을 선택해주세요.');           
        
        return false;
    }
    
    if(title == "" || title == null)
    {
        alert('제목을 입력해주세요.');
        
        return false;
    }

    if (contents == "" || contents == null) 
    {
        alert("리뷰를 작성해주세요.");

        return false;
    }

    // if(imgFile == "" || imgFile == null)
    // {
    //     alert("이미지를 등록해주세요!");
    //     return false;
    // }
}
//=====================================================================//

//== 리뷰 수정 ==//
$("#rvModify").on("click", function(e){
    let mo_cate = $("input[name='mo_cate']").val();
    
    $.ajax({
        url : "/review/reviewModify.sosu",
        type : "post",
        data : { MO_CATEGORY : mo_cate },
        success : function(data)
        {
            alert("수정이 완료되었습니다!");
            console.log(data);
        }
    }); 
});
//=====================================================================//

//== 등록날짜 포멧 ==//
$(function () 
{
    review_timeBefore();// 등록시간 표현 ex) "10분 전"
});

/* 등록날짜 시간 포맷 */
function review_timeBefore()
{
    let rvHeader = document.querySelectorAll(".reviewHeader"); // class="rvSum"을 가진 값 = 리뷰

    for (let i = 0; i < rvHeader.length; i++) // 리뷰 갯수만큼 반복
    {
        let rt = timeBefore($(rvHeader[i]).find(".review_regdate").val()); // 시간 값 포맷
        // let rt = timeBefore($(rvSum[i]).find(".v_reg_date").val().substring(0, 16));

        $(rvHeader[i]).find(".review_date").html(rt); //rvSum의 i번째 배열값을 모든 자식 class="SP"에 값을 출력해준다.
        // $(rvSum[i]).find(".SP").html(rt + "전");
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
    let difference = now.getTime() - writeDay.getTime();
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

    const relativeFormatter = new Intl.RelativeTimeFormat("ko", 
    {
        numeric: "always"
    });

    if (difference < seconds) {
        ResultTime = "바로"
    } else if (difference < minute) {
        // ResultTime = Math.trunc(difference / seconds) + '초 ';
        ResultTime = relativeFormatter.format(-Math.trunc(difference / seconds), 'second');
    } else if (difference < hour) {
        // ResultTime = Math.trunc(difference / minute) + '분 ';
        ResultTime = relativeFormatter.format(-Math.trunc(difference / minute), 'minute');
    } else if (difference < day) {
        // ResultTime = Math.trunc(difference / hour) + '시간 ';
        ResultTime = relativeFormatter.format(-Math.trunc(difference / hour), 'hour');
    } else if (difference < mon) {
        // ResultTime = Math.trunc(difference / day) + '일 ';
        ResultTime = relativeFormatter.format(-Math.trunc(difference / day), 'day');
    } else if (difference < year) {
        // ResultTime = Math.trunc(difference / mon) + '달 ';
        ResultTime = relativeFormatter.format(-Math.trunc(difference / mon), 'month');
    } else {
        // ResultTime = Math.trunc(difference / year) + '년 ';
        ResultTime = relativeFormatter.format(-Math.trunc(difference / year), 'year');
    }

    return ResultTime;
}
