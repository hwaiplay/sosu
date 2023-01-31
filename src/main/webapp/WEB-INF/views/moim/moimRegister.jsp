<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/form.css" rel="stylesheet">
<meta charset="UTF-8" name="viewport"
   content="width=device-width, initial-scale=1">
<script type="text/javascript">
history.replaceState({}, null, location.pathname);
</script>

</head>
<body>
<div class="container" style="text-align:center; margin-bottom: 100px;">
<h2 style=" margin-top: 90px; margin-bottom: 50px;">모임 개설하기</h2>
	<form action="/moim/moimRegister.pro" method="post" id="f" encType="multipart/form-data" name="moimR">
            
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
                  placeholder="제목 입력(4-70)" style="width: 754px;" required="required"></td>
   			</tr>
   			
   			<tr>
   				<th class="header"><label for="MO_CATEGORY" >카테고리</label><span style="color:#fd8731;">*</span></th>
            	<td class="contents">
	            	<select name="MO_CATEGORY" class="mo_cate" id="MO_CATEGORY">
	                     <option value="culture">문화/예술</option>
	                     <option value="sports">운동/스포츠</option>
	                     <option value="game">게임/오락</option>
	                     <option value="outdoor">아웃도어/여행</option>
	                     <option value="food">음식</option>
	                     <option value="etc">기타</option>
	                  </select>
	                  
	            	<label for="mo_detailca" style="padding:0 5px 0 25px; font-size: 15px;">세부 카테고리</label>
	                <input type="text" name="MO_DETAILCATEGORY" class="mo_detailca" placeholder="예) 뮤지컬" required="required">
            	</td>
   			</tr>
   			
   			<tr>
   				<th class="header"><label for="selectRegion" >지역</label><span style="color:#fd8731;">*</span></th>
            	<td class="contents">
	            	<select name="MO_REGION" id="selectRegion" class="selectRegion" onchange="addressKindChange(this)">
                     <option>지역을 선택해주세요.</option>
                     <option value="중부">중부</option>
                     <option value="동부">동부</option>
                     <option value="서부">서부</option>
                     <option value="남부">남부</option>
                     <option value="북부">북부</option>
                  </select>
	                  
	            	<label for="selectRDetail" style="padding:0 5px 0 25px; font-size: 15px;">세부 지역</label>
                    	<select name="MO_DETAILREGION" class="form-control" id="selectRDetail">
                                <option>선택해주세요.</option>
                            </select>
               </td>
   			</tr>
			
			<tr>
   				<th class="header"><label for="MO_PERMIT" >승인 허가 여부</label></th>
            	<td class="gc"><input type="checkbox" name="MO_PERMIT" id="MO_PERMIT">
            	</td>
   			</tr>
			<tr>
				<th></th>
            	<td style="text-align: left; font-size: small; color: red; padding-bottom: 15px;">*체크 하시면 직접 승인하셔야 합니다.</td>
   			</tr>
   			
			<tr>
   				<th class="header"><label for="MO_GENDER" >참가 성별</label><span style="color:#fd8731;">*</span></th>
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
            <td class="contents" style="padding-bottom: 0px;">
            	<input type="text" class="form-control" name="MO_MINAGE" id="MO_MINAGE"
                  placeholder="최소(숫자 입력)" maxlength="100">
                 <input type="text" class="form-control" name="MO_MAXAGE" id="MO_MAXAGE"
                 placeholder="최대(숫자 입력)" maxlength="100">
            </td>
       		</tr>   
    		<tr>
	    		<th></th>
	    		<td><button type="button" id="ageNoLimit" name="MO_MINAGE" class="noLB">제한 없음</button></td>
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
	    	<td><button type="button" id="peopleNoLimit" name="MO_MAXPEOPLE" class="noLB">제한 없음</button></td>
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
            	<input type="date" class="form-control" name="MO_DEADLINE" id="date" required>
            </td>
         </tr>  
            
         <tr>
            <th class="header"><label for="MO_DEADTIME" >모임 시간</label><span style="color:#fd8731;">*</span></th>
            <td class="contents">
            	<input type="time" class="form-control" name="MO_DEADTIME" id="MO_DEADTIME" required>
            </td>
         </tr>  
            
         <tr>
         	<th class="header"><label for="textArea_byteLimit" >내용</label><span style="color:#fd8731;">*</span></th>
            <td class="contents">
            	<textarea style="width: 373px;" rows="17" class="form-control" name="MO_DETAIL" placeholder="내용 작성" class="form-control" id="textArea_byteLimit" name="textArea_byteLimit" onkeyup="fn_checkByte(this)" wrap="hard" cols = ""></textarea>
                 <sup>(<span id="nowByte">0</span>/1400bytes)</sup>
            </td>
         </tr> 
            
         <tr>
         	<th class="header"><label for="file" >이미지 첨부</label><span style="color:#fd8731;">*</span></th>
            <td class="contents" id="fileDiv">
            	<span><input type="file" id="file" name="file_0"> <a
                  href="#this" class="btn" id="delete" name="delete">삭제</a> <a
                  href="#this" class="btn" id="addFile">파일 추가</a></span>
            </td>
         </tr>   
	</tbody>
	</table>
	
         <button class="btn" type="submit" onclick="check();" >등록</button>
         </form>
      </div>
</body>
 
<script>

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

/* alert 기능 */
function check() {
   if (document.moimR.MO_TITLE.value.trim() == "") {
      alert("제목를 입력해 주세요.");
      document.moimR.MO_TITLE.focus();
      return false;
   } else if (document.moimR.MO_DETAIL.value.trim() == "") {
      alert("내용를 입력해 주세요.");
      document.moimR.MO_DETAIL.focus();
      return false;
   } else {
      alert("게시글이 등록되었습니다.")
      document.moimR.submit();
   }
}

/* 파일 추가 버튼 + 제한 없음 버튼 구동 */
var gfv_count = 1;

   $(document).ready(function() {
	   
	    /* 체크박스 제어 */ 
	    $("input:checkbox").change(function(){
	      if(this.checked){
	        $(this).attr('value', 'Y');
	        
	       /* 0120 기준 이거 안됨 */ 
	      }else{
	        $(this).attr('value', 'N');
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