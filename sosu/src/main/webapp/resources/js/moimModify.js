/* url에 카테고리 파라미터 적용을 위한 ajax */
    var mo_cate = $(".mo_cate option:selected").val();
    var m = $("#MO_IDX").val();
    var mF = $("#mImg").val();
       
    if(mF == 'N') {
        $('#main').css('display', 'block');
    }
    var fnameList = [];
     
    $(document).ready(function(){
    
        $("#input1").change(function(){
            if($("#input1").is(":checked")){
                    $('#main').css('display', 'block');               
            }else{
                $('#main').css('display', 'none');
            }
        });
    });

$("#delB").on("click", function(e){
   
    $("input[name=item0]:checked").each(function(i) {
   
        fnameList.push($(this).val());
   
   });
   $("input[name=item1]:checked").each(function(i) {
   
        fnameList.push($(this).val());
   
   });
    
    console.log(fnameList);

    $.ajax({
        url : "/moim/moimModify.pro",
        type : "post",
        data : { MO_CATEGORY : mo_cate, MO_IDX : m},
        success : function(result){
            }
        }); 

    $.ajax({
        url : "/moim/moimImgDel.pro", 
		type : "get",
		data : { chbox : fnameList },
		dataType : 'json',
		success : function(result) {
		}
    });
    alert("수정 되었습니다.");
});


//세부지역 선택 유지를 위한
var jung = ["종로", "인사동", "동대문", "서울역", "이태원", "을지로"];
var dong = ["잠실/송파", "왕십리", "건대", "청량리", "올림픽공원", "천호", "하남"];
var seo = ["홍대/신촌", "연신내", "마포", "영등포/여의도", "구로", "고양"];
var nam = ["강남/역삼/삼성", "신사", "청담", "서초/교대", "성남"];
var book = ["강북", "노원/중계", "중랑", "의정부"];
var target = document.getElementById("selectRDetail");
        
var rr = $("#selectRegion").val();
        
if(rr == "중부") {
	var d = jung;
            
    target.options.length = 0;
            
    for (x in d) {
		var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
	}
} else if (rr == "동부") {
	var d = dong;
            
	target.options.length = 0;
            
    for (x in d) {
		var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
	}
} else if(rr == "서부") {
            var d = seo;
            
            target.options.length = 0;
            
            for (x in d) {
                var opt = document.createElement("option");
                opt.value = d[x];
                opt.innerHTML = d[x];
                target.appendChild(opt);
            }
        }
        if(rr == '남부') {
            var d = nam;
            
            target.options.length = 0;
            
            for (x in d) {
                var opt = document.createElement("option");
                opt.value = d[x];
                opt.innerHTML = d[x];
                target.appendChild(opt);
            }
        }
        
        if(rr == '북부') {
            var d = book;
            
            target.options.length = 0;
            
            for (x in d) {
                var opt = document.createElement("option");
                opt.value = d[x];
                opt.innerHTML = d[x];
                target.appendChild(opt);
            }
        } 
        
//연령이 있을 때
/* 참가 연령 제한 없음 버튼 클릭 이벤트 */
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
/* 참가 연령 제한 없음 버튼 클릭 이벤트 끝 */   

var maxp = $("#MO_MAXPEOPLE").val(); //인원제한 있음
var maxp2 = $("#MO_MAXPEOPLE2").val(); //(maxpeople=0)
var str = "<input type='text' class='form-control' name='MO_MAXPEOPLE' id='MO_MAXPEOPLE'>";

if(maxp != '0') { //참가 인원이 있다면
   
}

if(maxp2 == '0') { //참가 인원이 제한 없다면
    $("#pepolemodi").css('display', 'block'); //수정하기 버튼 띄움

    //수정하기 버튼 누르면
    $('#pepolemodi').click(function() {
        $("#l2").remove();
        $("#padd").append(str);
        $("#MO_MAXPEOPLE2").remove();
       	$('#peopleNoLimit').css('display', 'block');
        $('#pepolemodi').css('display', 'none');
    }); 
}


/* 참가 인원 제한 없음 버튼*/
$('#peopleNoLimit').click(function() {
    $("#MO_MAXPEOPLE").val('0');
});       

         
        var gfv_count = 1;

         /* 파일 추가 버튼 */ 
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
    
    /* 오늘 날짜 이전 날짜는 선택 불가 기능  */
    var now_utc = Date.now() // 지금 날짜를 밀리초로
    //getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
    var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
    //new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
    var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
    document.getElementById("date").setAttribute("min", today);
       
    /* 세부 지역 선택을 위한 스크립트 */
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
           
        } else if (document.moimR.MO_DETAILCATEGORY.value.trim() == "") {
           alert("세부 카테고리를 입력해 주세요.");
           document.moimR.MO_DETAILCATEGORY.focus();
           return false;

        } else if ($("input[name=MO_MINAGE]").val() == "") {
           alert("참가 연령을 입력해 주세요.");
           $("#MO_MINAGE").focus();
           return false; 
           
        } else if ($("input[name=MO_MAXPEOPLE]").val() == "") {
           alert("참가 인원을 입력해 주세요.");
           $("#MO_MAXPEOPLE").focus();
           return false; 
           
        } else if ($("input[name=MO_DEADLINE]").val() == "") {
           alert("모임 날짜를 선택해 주세요.");
           $("#MO_MAXPEOPLE").focus();
           return false; 
           
        } else if ($("input[name=MO_DEADTIME]").val() == "") {
           alert("모임 시간을 선택해 주세요.");
           $("#MO_MAXPEOPLE").focus();
           return false; 
           
        } else if (document.moimR.MO_DETAIL.value.trim() == "") {
           alert("내용을 입력해 주세요.");
           document.moimR.MO_DETAIL.focus();
           return false;
           
        } else {
           alert("게시글이 수정 되었습니다.")
           return true;
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