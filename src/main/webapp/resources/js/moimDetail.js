    var cate = $("#cate").val();
    var idx = $("#idx").val();
    var gender = $("#gender").html();
    var jumin1 = $('#sessage').val();
    var jumin2 = $('#ssgender').val();
    var sessmidx = $('#sessionss').val();
    var iiib = 0;
    var iiip = 0;
    var bbb = '#bmidx' + iiib++;
    var ppp = '#pmidx' + iiip++;
    var bmidx = $(bbb).val(); //강퇴당한사람이자 승인거부
    var pmidx = $(ppp).val(); //참여중인사람
    var presentP =  $('#presentP').val();
    var maxP =  $('#maxP').val();
    var minAge =  $('#minAge').val();
    var maxAge =  $('#maxAge').val();
    var curDateObj = new Date(); // 날짜 Object 생성
    var curDate = ""; // 현재일자
    var tmpAge = 0; // 임시나이
    var curYear = curDateObj.getFullYear(); // 현재년도
    var curMonth = curDateObj.getMonth() + 1; // 현재월
    
    var iiiw = 0;
    var www = '#wmidx' + iiiw++;
    var wmidx = $(www).val(); //참여대기중인사람
    
    //만 나이 계산
    if(curMonth < 10){ curMonth = "0" + curMonth;} // 현재 월이 10보다 작을경우 '0' 문자 합한다

    var curDay = curDateObj.getDate(); // 현재일

    if(curDay < 10) {curDay = "0" + curDay;} // 현재 일이 10보다 작을경우 '0' 문자 합한다

    curDate = curYear + curMonth + curDay;

    if(jumin2 <= 2) {

     tmpAge = curYear - (1900 + parseInt(jumin1.substring(0, 2))); // 1, 2 일경우

    } else {

     tmpAge = curYear - (2000 + parseInt(jumin1.substring(0, 2))); // 그 외의 경우

    }

     var tmpBirthday = jumin1.substring(2, 6); // 주민번호 4자리 생일문자 추출

     if(curDate < (curYear + tmpBirthday)) {

     tmpAge += 1;

    }
	
    // 모임에 참여 했다면 참여하기 버튼 없애고 탈퇴하기 버튼 띄움
    if(pmidx == sessmidx) {
      $("#cham").css('display', 'none');
      $("#tal").css('display', 'block'); 
    }
    
//모임 탈퇴
 function exit() {
    
    if (confirm("모임에서 탈퇴 하시겠습니까?")) {
      alert("탈퇴 되었습니다.");
      location.href = "/moim/" + cate + "/" + idx + ".sosu";
      
      $("#tal").css('display', 'none'); //탈퇴 버튼 다시 숨기기
      
    } else {
      location.href = "/moim/" + cate + "/" + idx + ".sosu";
      return false;
    }
 } 
  
  function checkJoin() {
  
    if(bmidx == sessmidx) {
    alert('이미 강퇴당한 모임입니다.');
    return false;
    }

    if(presentP >= maxP) {
      alert('현재 참여인원이 꽉 찼습니다.');
      return false;
    }
    
    if(minAge < tmpAge < maxAge) {
      alert('회원님의 나이가 모임의 연령대에 맞지 않습니다.');
      return false;
    }

    if(gender.trim() == '여자만' && jumin2 == '1' || gender.trim() == '여자만' && jumin2 == '3') {
      alert('여성회원만 참여가능한 모임입니다');
      return false;
    }
    
    if(gender.trim() == '남자만' && jumin2 == '2' || gender.trim() == '남자만' && jumin2 == '4') {
      alert('남성회원만 참여가능한 모임입니다');
      return false;
    }
    
    
    if (confirm("모임에 참여하시겠습니까?")) {
      alert("참여완료.");
    } else {
      location.href = "/moim/" + cate + "/" + idx + ".sosu";
      return false;
    }
  }

  function checkJoin2() {
  
    if(bmidx == sessmidx) {
      alert('이미 강퇴 당하거나 승인 거부 된 모임입니다.');
      return false;
    }
    
    if(wmidx == sessmidx) {
      alert('참여승인을 기다리는 중입니다.');
      return false;
    } 
    
    if(pmidx == sessmidx) {
     
      alert('이미 참여한 모임입니다.');
      return false;
    } 
    
    if(presentP >= maxP) {
      alert('참여인원이 꽉 찼습니다.');
      return false;
    }
    
   if(minAge < tmpAge < maxAge) {
      alert('회원님의 나이가 모임의 연령대에 맞지 않습니다.');
      return false;
    }
    if(gender.trim() == '여자만' && jumin2 == '1' || gender.trim() == '여자만' && jumin2 == '3') {
      alert('여성회원만 참여가능한 모임입니다');
      return false;
    }
    
    if(gender.trim() == '남자만' && jumin2 == '2' || gender.trim() == '남자만' && jumin2 == '4') {
      alert('남성회원만 참여가능한 모임입니다');
      return false;
    }
    
    if (confirm("모임에 참여하시겠습니까??")) {
      alert("참여완료.");
      
    } else {
      location.href = "/moim/" + cate + "/" + idx + ".sosu";
      return false;
    }
  }