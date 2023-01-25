$(document).ready(function(){
	$("table tbody tr").on("click", function(){ member_detail(this); });
});

function member_detail(target) {
	let _this = $(target);
	let _id = $(target).children(".m_id").text();
	$.ajax({
		url: "/admin/userDetail",
		type: "POST",
		data: {m_id:_id,},
		async: false,
		success: function(result){
			if(_this.next().hasClass("detail_info")){
				_this.removeClass("bgSubColor");
				$(".detail_info").remove();
			}else{
				//옵션값 세팅
				result.map.M_EMAIL = (isNull(result.map.M_EMAIL))?"":result.map.M_EMAIL;
				result.map.M_OWN_NUM = (isNull(result.map.M_OWN_NUM))?"":result.map.M_OWN_NUM;
				//회원 유형 세팅
				let _m_type = "일반회원 <div class='switch_radio'>"
					+"<input type='radio' name='m_type' value='0'>"
					+"<input type='radio' name='m_type' value='1'></div> 사업주 "
					+" <input type='radio' name='m_type' value='2'> 관리자";
				_m_type = _m_type.replace("value='"+result.map.M_TYPE+"'","value='"+result.map.M_TYPE+"' checked");
				//탈퇴여부 세팅
				let _m_del = "N <div class='switch_radio'>"
					+"<input type='radio' name='m_del_gb' value='N'>"
					+"<input type='radio' name='m_del_gb' value='Y'></div> Y";
				_m_del = _m_del.replace("value='"+result.map.M_DEL_GB+"'","value='"+result.map.M_DEL_GB+"' checked");
				
				_this.siblings().removeClass("bgSubColor");
				_this.siblings(".detail_info:not(this+.detail_info)").remove();
				_this.addClass("bgSubColor");
				
				_this.after("<tr class='detail_info'><td colspan='5'>"
					+"<form id='modifyUser'>"
					+"<table>"
					+"<tr>"
						+"<th>이름</th><td><input name='m_name' type='text' value='"+result.map.M_NAME+"' maxlength='30'></td>"
						+"<th>회원유형</th><td>"+_m_type+"</td>"
					+"</tr>"
					+"<tr>"
						+"<th>아이디</th><td>"+_id+"<input name='m_id' type='hidden' value='"+_id+"'></td>"
						+"<th>사업자 번호</th><td><input name='m_own_num' type='number' value='"+result.map.M_OWN_NUM+"' minlength='10' maxlength='10' placeholder='- 를 제외한 사업자번호 10자리'></td>"
					+"</tr>"
					+"<tr>"
						+"<th>비밀번호</th><td><input name='m_pw' type='password' value='"+result.map.M_PW+"'></td>"
						+"<th>수정일</th><td>"+result.map.M_MOD_DATE+"</td>"
					+"</tr>"
					+"<tr>"
						+"<th>이메일</th><td><input name='m_email' type='text' value='"+result.map.M_EMAIL+"'></td>"
						+"<th>가입일</th><td>"+result.map.M_REG_DATE+"</td>"
					+"</tr>"
					+"<tr>"
						+"<th>전화번호</th><td><input name='m_cellphone' type='tel' value='"+result.map.M_CELLPHONE+"' maxlength='11' placeholder='- 를 제외한 휴대폰번호'></td>"
						+"<th>탈퇴여부</th><td>"+_m_del+"</td>"
					+"</tr></table>"
					+"<button class='btn submit' type='button' onclick='modifyUser()'>수정</button>"
					+"</form>"
					+"</td></tr>"
				);
			}
		},
		error: function(result){
			console.log(result.responseText); //responseText의 에러메세지 확인
		}
	}); //ajax끝
};

function modifyUser() {
	let _form = $("#modifyUser");
	$.ajax({
		url: "/admin/modifyUser",
		type: "POST",
		data: _form.serialize(),
		async: false,
		success: function(data){
			if(data.result == "success"){
				alert("수정되었습니다.");
				$("#modifyUser .btn").removeClass("submit");
				$("#modifyUser .btn").addClass("disable");
				$("#modifyUser .btn").text("수정되었습니다");
			}else{
				alert("수정 중 오류가 발생했습니다.");
			}
		},
		error: function(result){
			console.log(result.responseText); //responseText의 에러메세지 확인
		}
	});
}