<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/form.css" rel="stylesheet">
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.3/moment.min.js"></script>
<script type="text/javascript">

history.replaceState({}, null, location.pathname);
</script>

</head>
<body>
<div class="container" style="text-align:center; margin-bottom: 100px;">
<h2 style=" margin-top: 90px; margin-bottom: 50px;">모임 개설하기</h2>
   <form action="/moim/moimRegister.pro" method="post" id="f" encType="multipart/form-data" name="moimR" onSubmit="return check(this)">
            
    <input type="hidden" name="M_IDX" value = "${M_IDX}">
            
    <table class="input-form" >
      <colgroup>
      <col style="width:150px;">
      <col style="width:auto;"> 
      </colgroup>
   
         <tbody>
            <tr>
               <th class="header"><label for="MO_TITLE" >제목</label><span style="color:#fd8731;">*</span></th>
               <td class="contents"><input type="text" class="form-control" name="MO_TITLE" id="MO_TITLE"
                  placeholder="제목 입력(4-70)" style="width: 754px;"></td>
            </tr>
            
            <tr>
               <th class="header"><label for="MO_CATEGORY" >카테고리</label><span style="color:#fd8731;">*</span></th>
               <td class="contents">
                  <select name="MO_CATEGORY" class="mo_cate" id="MO_CATEGORY" required>
                        <option value="culture">문화/예술</option>
                        <option value="sports">운동/스포츠</option>
                        <option value="game">게임/오락</option>
                        <option value="outdoor">아웃도어/여행</option>
                        <option value="food">음식</option>
                        <option value="etc">기타</option>
                     </select>
                     
                  <label for="mo_detailca" style="padding:0 5px 0 25px; font-size: 15px;">세부 카테고리</label>
                  <span style="color:#fd8731;">*</span>
                   <input type="text" name="MO_DETAILCATEGORY" class="mo_detailca" placeholder="예) 뮤지컬">
               </td>
            </tr>
            
            <tr>
               <th class="header"><label for="selectRegion" >지역</label><span style="color:#fd8731;">*</span></th>
               <td class="contents">
                  <select name="MO_REGION" id="selectRegion" class="selectRegion" onchange="addressKindChange(this)" required="required">
                     <option>지역을 선택해주세요.</option>
                     <option value="중부">중부</option>
                     <option value="동부">동부</option>
                     <option value="서부">서부</option>
                     <option value="남부">남부</option>
                     <option value="북부">북부</option>
                  </select>
                     
                  <label for="selectRDetail" style="padding:0 5px 0 25px; font-size: 15px;">세부 지역</label>
                  <span style="color:#fd8731;">*</span>
                    <select name="MO_DETAILREGION" class="form-control" id="selectRDetail" required="required">
                       <option>선택해주세요.</option>
                    </select>
               </td>
            </tr>
         
         <tr>
               <th class="header"><label for="MO_PERMIT">승인 허가 여부</label><span style="color:#fd8731;">*</span></th>
               <td class="gc" style="padding: 15px 0px 15px 0px;">
               <label for="MO_PERMIT" style="vertical-align: middle;">필요</label><input style="vertical-align: middle;" type="radio" name="MO_PERMIT" value="Y">
                  <label for="MO_PERMIT" style="vertical-align: middle;">불필요</label><input style="vertical-align: middle;" type="radio" name="MO_PERMIT" value="N">
               </td>
            </tr>
         <tr>
               <th class="header"><label for="MO_GENDER">참가 성별</label><span style="color:#fd8731;">*</span></th>
               <td class="gc">
               <label for="MO_GENDER" style="vertical-align: middle;">여성</label><input style="vertical-align: middle;" type="radio" name="MO_GENDER" value="W">
                  <label for="MO_GENDER" style="vertical-align: middle;">남성</label><input style="vertical-align: middle;" type="radio" name="MO_GENDER" value="M">
                  <label for="MO_GENDER" style="vertical-align: middle;">제한없음</label><input style="vertical-align: middle;" type="radio" name="MO_GENDER" value="0">
               </td>
            </tr>
            <tr>
               <th></th>
               <td style="text-align: left; font-size: small; color: red; padding-bottom: 15px;">
               *참가 성별은 모임 개설 후 수정이 불가능합니다.
               </td>
            </tr>
            
            <tr>
            <th class="header"><label for="MO_MINAGE" >참가 연령</label><span style="color:#fd8731;">*</span></th>
            <td class="contents" id="agetd" style="padding-bottom: 0px;">
               <input type="text" class="form-control" name="MO_MINAGE" id="MO_MINAGE"
                  placeholder="최소(숫자 입력)" >
                 <input type="text" class="form-control" name="MO_MAXAGE" id="MO_MAXAGE"
                 placeholder="최대(숫자 입력)">
                
            </td>
             </tr>   
          <tr>
             <th></th>
             <td>
             <input type="button" id="ageNoLimit" class="noLB" value="제한없음" style="cursor: pointer;">
             <input type="button" id="Limit" class="noLB" value="되돌리기" style="cursor: pointer; display: none;">
             </td>
          </tr>
       
            <tr>
            <th class="header"><label for="MO_MAXPEOPLE" >참가 인원</label><span style="color:#fd8731;">*</span></th>
            <td class="contents" style="padding-bottom: 0px;">
            <input type="text" class="form-control" name="MO_MAXPEOPLE" id="MO_MAXPEOPLE"
                  placeholder="최대(숫자 입력)" maxlength="100">
              </td>
         </tr> 
         <tr>
          <th></th>
          <td><button type="button" id="peopleNoLimit" class="noLB" style="cursor: pointer;">제한 없음</button></td>
       </tr>
         
            
           <tr>
            <th class="header"><label for="MO_COST" >참가 비용</label></th>
            <td class="contents" style="padding-bottom: 0px;">
            <input type="text" class="form-control" name="MO_COST" id="MO_COST"
                  placeholder="0" maxlength="100">
            </td>
         </tr>   
         <tr>
            <th></th>
            <td style="text-align: left; font-size: small; color: red; padding-bottom: 15px;">
               *참가 비용이 있다면 숫자로만 작성 해주세요.(ex.1000)
            </td>
         </tr>
         
           <tr>
            <th class="header"><label for="date" >모임 날짜</label><span style="color:#fd8731;">*</span></th>
            <td class="contents">
               <input type="date" class="form-control" name="MO_DEADLINE" id="date">
            </td>
         </tr>  
            
         <tr>
            <th class="header"><label for="MO_DEADTIME" >모임 시간</label><span style="color:#fd8731;">*</span></th>
            <td class="contents">
               <input type= "time" class="form-control" name = "MO_DEADTIME" id="MO_DEADTIME">
            </td>
         </tr>
            
         <tr>
            <th class="header"><label for="textArea_byteLimit" >내용</label></th>
            <td class="contents">
               <textarea style="width: 100%;" rows="17" class="form-control" name="MO_DETAIL" placeholder="내용 작성" class="form-control" id="textArea_byteLimit" name="textArea_byteLimit" onkeyup="fn_checkByte(this)" wrap="hard" cols = ""></textarea>
                 <sup>(<span id="nowByte">0</span>/1400bytes)</sup>
            </td>
         </tr> 
            
         <tr>
            <th class="header"><label for="file" >이미지 첨부</label></th>
            <td class="contents" id="fileDiv">
               <span><input type="file" id="file" name="file_0">
               <a
                  href="#this" class="btn" id="delete" name="delete">삭제</a>
                  <a
                  href="#this" class="btn" id="addFile">파일 추가</a></span>
            </td>
         </tr>   
   </tbody>
   </table>
   
         <button class="btn" type="submit" id="regB">등록</button>
         </form>
      </div>
</body>
 
<script type="text/javascript">
//date-format
function nowAsDuration(){
    return moment.duration({
        hours:   moment().hour(),
        minutes: moment().minute(),
    });
}


$("input").on("change", function() {
    var a = moment(this.value);
    var b = nowAsDuration();
    var c = a.add(b);
    
        
    this.setAttribute("my-date", c.format( this.getAttribute("my-date-format") )
    )
}).trigger("change")

//카테고리 값 넘기기
$("#regB").on("click", function(e){
   var mo_cate = $(".mo_cate option:selected").val();

   $.ajax({
      url : "moim/moimRegister.pro",
      type : "post",
      data : { MO_CATEGORY : mo_cate },
      success : function(data){
         }
      }); 
   });

/* 파일 추가 버튼 + 제한 없음 버튼 구동 */
var gfv_count = 1;

     
      /* 제한 없음 버튼 제어 */
      /* 참가 연령 */
      $('#ageNoLimit').click(function() {
        var min = $('#MO_MINAGE').detach();
        var max = $('#MO_MAXAGE').detach();
         $('#ageNoLimit').css('display', 'none');
         $('#Limit').css('display', 'block');
         
         var str = "<input type='hidden' name='MO_MINAGE' id='MO_MINAGE2' value='0'>"
               + "<input type='hidden' name='MO_MAXAGE' id='MO_MAXAGE2' value='200'>"
               + "<div id='ll'>제한없음</div>";
         
         $('#agetd').append(str);
         
         /* 되돌리기 버튼 */
         $('#Limit').click(function() {
            $("#agetd").append(min);
            $("#agetd").append(max);
              $("#ll").remove();
              $("#MO_MINAGE2").remove();
              $("#MO_MAXAGE2").remove();
              $('#ageNoLimit').css('display', 'block');
             $('#Limit').css('display', 'none');
         });
       });
                
      /* 참가 인원 */
      $('#peopleNoLimit').click(function() {
         $("#MO_MAXPEOPLE").val('0');
       });
     
      
     $("#addFile").on("click", function(e) { //파일 추가 버튼
        e.preventDefault();
        fn_addFile();

     });

     $("a[name='delete']").on("click", function(e) { //삭제 버튼
        e.preventDefault();
        fn_deleteFile($(this));
     });

     function fn_addFile() {
        var str = "<p><input type='file' id='file' name='file_"
                  + (gfv_count++)
                  + "'><a href='#this' class='btn' name='delete'>삭제</a></p>";

      $("#fileDiv").append(str);
        
      $("a[name='delete']").on("click", function(e) { //삭제 버튼
           e.preventDefault();
           fn_deleteFile($(this));
        });
    }

     function fn_deleteFile(obj) {
       obj.parent().remove();
     }
     
     /* alert 기능 */
     function check() {
        
        if (document.moimR.MO_TITLE.value.trim() == "") {
           alert("제목를 입력해 주세요.");
           document.moimR.MO_TITLE.focus();
           return false;
           
        } else if (document.moimR.MO_DETAILCATEGORY.value.trim() == "") {
           alert("세부 카테고리를 입력해 주세요.");
           document.moimR.MO_DETAIL.focus();
           return false;
           
        } else if ($("input[name=MO_PERMIT]:radio:checked").length < 1) {
           alert("승인 허가 여부를 선택해 주세요.");
           return false;
           
        } else if ($("input[name=MO_GENDER]:radio:checked").length < 1) {
           alert("참가 성별을 선택해 주세요.");
           return false;
           
        } else if ($("input[name=MO_MINAGE]").val() == "") {
           alert("참가 연령을 입력해 주세요.");
           $("#MO_MINAGE").focus();
           return false; 
           
        } else if ($("input[name=MO_MAXPEOPLE]").val() == "") {
           alert("참가 인원을 입력해 주세요.");
           $("#MO_MAXPEOPLE").focus();
           return false; 
           
        } else if (document.moimR.MO_DETAIL.value.trim() == "") {
           alert("내용을 입력해 주세요.");
           document.moimR.MO_DETAIL.focus();
           return false;
           
        } else {
           alert("게시글이 등록되었습니다.")
           return true;
        }
     }

/* 오늘 날짜 이전 날짜는 선택 불가  */
var now_utc = Date.now() // 지금 날짜를 밀리초로
//getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
//new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("date").setAttribute("min", today);
   
/* 지역 선택을 위한 스크립트 */
function addressKindChange(e) {
    var jung = ["종로", "인사동", "동대문", "서울역", "이태원", "을지로"];
    var dong = ["잠실/송파", "왕십리", "건대", "청량리", "올림픽공원", "천호", "하남"];
    var seo = ["홍대/신촌", "연신내", "마포", "영등포/여의도", "구로", "고양"];
    var nam = ["강남/역삼/삼성", "신사", "청담", "서초/교대", "성남"];
    var book = ["강북", "노원/중계", "중랑", "의정부"];
    var target = document.getElementById("selectRDetail");

    if(e.value == "중부") var d = jung;
    else if(e.value == "동부") var d = dong;
    else if(e.value == "서부") var d = seo;
    else if(e.value == "남부") var d = nam;
    else if(e.value == "북부") var d = book;

    target.options.length = 0;

    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }   
}

   /* 입력된 바이트(글자수) 값 제어 */
   function fn_checkByte(obj) {
      const maxByte = 1400; //최대 100바이트
      const text_val = obj.value; //입력한 문자
      const text_len = text_val.length; //입력한 문자수

      let totalByte = 0;
      for (let i = 0; i < text_len; i++) {
         const each_char = text_val.charAt(i);
         const uni_char = escape(each_char); //유니코드 형식으로 변환
         if (uni_char.length > 4) {
            // 한글 : 2Byte
            totalByte += 3;
         } else {
            // 영문,숫자,특수문자 : 1Byte
            totalByte += 1;
         }
      }

      if (totalByte > maxByte) {
         alert('최대 1500Byte까지만 입력가능합니다.');
         document.getElementById("nowByte").innerText = totalByte;
         document.getElementById("nowByte").style.color = "red";
      } else {
         document.getElementById("nowByte").innerText = totalByte;
         document.getElementById("nowByte").style.color = "green";
      }
   }
</script>
</html>