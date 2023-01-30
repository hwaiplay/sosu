<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
   content="width=device-width, initial-scale=1">
<style type="text/css">
.MR { 
   padding:50;
   margin-top: 190px;
   margin-bottom: 150px;
   text-align: center;
} 
</style>
</head>
<body>

   <section class="MR">
      <div class="container">
         <h3>모임 수정하기</h3>
      </div>

      <div class="container" style="align: left; width: 700px">
         <form action="/moim/moimModify.pro" method="post"
            encType="multipart/form-data" name="moimR" id="f">
            
            <p style="font-weight: bold;">회원 번호</p>
            <input type="text" name="M_IDX" value="${modify.M_IDX}">
            
            <div class="form-group" style="margin-bottom: 30px;">
               <p style="font-weight: bold;">제목</p>
               <input type="text" class="form-control" name="MO_TITLE"
                  placeholder="제목 입력(4-70)" maxlength="100"  value="${modify.MO_TITLE}">
            </div>
            <div class="form-group" style="margin-bottom: 30px;">
               <span>
               <label for="mo_cate">카테고리</label>
                  <select name="MO_CATEGORY" class="mo_cate">
                     <option value="culture">문화/예술</option>
                     <option value="sports">운동/스포츠</option>
                     <option value="game">게임/오락</option>
                     <option value="outdoor">아웃도어/여행</option>
                     <option value="food">음식</option>
                     <option value="etc">기타</option>
                  </select>
                  </span>
               <span>
                  <label for="mo_detailca">카테고리</label>
                  <input type="text" name="MO_DETAILCATEGORY" class="mo_detailca" value="${modify.MO_DETAILCATEGORY}">
               </span>   
            </div>         
            
            <!-- 지역과 세부지역 선택  -->
            <div class="form-group" style="margin-bottom: 30px;">
               <span>
                  <label for="selectRegion">지역</label>
                  <select name="MO_REGION" id="selectRegion" class="selectRegion" onchange="addressKindChange(this)">
                     <option>지역을 선택해주세요.</option>
                     <option value="중부">중부</option>
                     <option value="동부">동부</option>
                     <option value="서부">서부</option>
                     <option value="남부">남부</option>
                     <option value="북부">북부</option>
                  </select>
               </span>
               <span>
                  <label for="selectRDetail">세부 지역</label>
                    	<select name="MO_DETAILREGION" class="form-control" id="selectRDetail">
                                <option>선택해주세요.</option>
                            </select>
               </span>   
            </div>         
            
            <div class="form-group" style="margin-bottom: 30px;">
               <p style="font-weight: bold;">승인 허가 여부</p>
               <input type="checkbox" name="MO_PERMIT" value="N">
               <p style="font-size: small; color: red;">*체크 하시면 직접 승인하셔야 합니다. </p>
            </div>
            
            <div class="form-group" style="margin-bottom: 30px;">
               <p style="font-weight: bold;">참가 성별</p>
               
               <c:if test="${modify.MO_GENDER eq 'W' }">
               	<p>여성</p>
               </c:if>
               <c:if test="${modify.MO_GENDER eq 'M' }">
               	<p>남성</p>
               </c:if>
               <c:if test="${modify.MO_GENDER eq '0' }">
               	<p>제한없음</p>
               </c:if>
            </div>
            
            <div class="form-group" style="margin-bottom: 30px;">
               <p style="font-weight: bold;">참가 연령</p>
               <span>
                  <input type="text" class="form-control" name="MO_MINAGE" id="MO_MINAGE"
                   value="${modify.MO_MINAGE}" maxlength="100">
               </span>
               <span>
                  <input type="text" class="form-control" name="MO_MAXAGE" id="MO_MAXAGE"
                   value="${modify.MO_MAXAGE}" maxlength="100">
               </span>
               <br/>
               <button type="button" id="ageNoLimit" name="MO_MINAGE">제한 없음</button>
            </div>
            
            <div class="form-group" style="margin-bottom: 30px;">
               <p style="font-weight: bold;">참가 인원</p>
               <span>
                  <input type="text" class="form-control" name="MO_MAXPEOPLE" id="MO_MAXPEOPLE"
                   value="${modify.MO_MAXPEOPLE}" maxlength="100">
               </span>
               <br/>
               <button type="button" id="peopleNoLimit" name="MO_MAXPEOPLE">제한 없음</button>
            </div>
            
            <div class="form-group" style="margin-bottom: 30px;">
               <p style="font-weight: bold;">참가 비용</p>
               <input type="text" class="form-control" name="MO_COST"
                   value="${modify.MO_COST}" maxlength="100">
            </div>
            
            <div class="form-group" style="margin-bottom: 30px;">
               <p style="font-weight: bold;">모임 날짜</p>
               <input type="date" class="form-control" name="MO_DEADLINE" id="date" value="${modify.MO_DEADLINE}">
            </div>
            
            <div class="form-group" style="margin-bottom: 30px;">
               <p style="font-weight: bold;">모임 시간</p>
               <input type="time" class="form-control" name="MO_DEADTIME" value="${modify.MO_DEADTIME}">
            </div>
            
            <div class="form-group" style="margin-bottom: 30px;">
               <div class="textLengthWrap"></div>
               <p style="font-weight: bold;">내용</p>
                  <textarea rows="17" class="form-control" name="MO_DETAIL" class="form-control" id="textArea_byteLimit" name="textArea_byteLimit" onkeyup="fn_checkByte(this)" wrap="hard" cols = "">${modify.MO_DETAIL}</textarea>
                  <sup>(<span id="nowByte">0</span>/1400bytes)</sup>
            </div>

            <div id="fileDiv" style="text-align: left;">
               <span><input type="file" id="file" name="file_0"> <a
                  href="#this" class="btn" id="delete" name="delete">삭제</a> <a
                  href="#this" class="btn" id="addFile">파일 추가</a></span>
            </div>

			<input type="hidden" name="MO_IDX" value="${modify.MO_IDX}">

         <button type="submit" id="delB">등록</button>

         </form>
      </div>
   </section>
</body>
 
<script>
/* url에 카테고리 파라미터 적용을 위한 ajax */
$("#delB").on("click", function(e){
var mo_cate = $(".mo_cate option:selected").val();

$.ajax({
	url : "/moim/moimModify.pro",
	type : "post",
	data : { MO_CATEGORY : mo_cate },
	success : function(data){
		}
	}); 
});

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

/* 파일 추가 버튼 + 제한 없음 버튼 구동 */
var gfv_count = 1;

   $(document).ready(function() {
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
                  
                /* 체크박스 제어 */ 
               $("#MO_PERMIT").change(function(){
                    if($("#MO_PERMIT").is(":checked")){
                    	$("#MO_PERMIT").val('Y');
                    }else{
                    	$("#MO_PERMIT").val('N');
                    }
                }); 
                
                /* 제한 없음 버튼 제어 */
                /* 참가 연령 */
                $('#ageNoLimit').click(function() {
                   $("#MO_MAXAGE").val('0');
                   $("#MO_MINAGE").val('0');
                });
                
                /* 참가 인원 */
                $('#peopleNoLimit').click(function() {
                   $("#MO_MAXPEOPLE").val('0');
                });
               
   });
   
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