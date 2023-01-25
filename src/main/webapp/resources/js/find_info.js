let inputs = {};
function set_inputs(){
	//인풋 세팅
	let _input = document.querySelectorAll(".user_info input:not([id$='_chk'])");
	for(let i=0; i<_input.length; i++){
		inputs[_input[i].id] = _input[i];
	}
}
let helptxt = {
	ok: "인증이 완료되었습니다.",
	fail: "인증에 실패하셨습니다. 다시 인증을 시도해 주세요!",
	npattern: "유효한 값을 입력해 주세요!",
	req: "필수 입력사항 입니다!",
	chk_need: "인증이 필요한 항목입니다!",
	chk_p_neq: "인증번호가 일치하지 않습니다!",
	chk_p_timeout: "인증번호 입력 시간을 초과하였습니다.",
	chk_cell: "핸드폰 번호 인증이 필요합니다!",
	pw_min: "비밀번호는 최소 8자리 이상이어야 합니다!",
	pw_neq: "비밀번호가 일치하지 않습니다!",
	p_count: "핸드폰 번호 10자리를 입력해 주세요!",
};
$(document).ready(function() {
	set_inputs();//인풋 세팅
	//회원 유형 라디오 클릭에 따라 입력폼 변경
	$(".tab_radio input").on("click", function(){
		location.href="/login/"+$(this).attr("id");
	});

	/* =========입력값 감시========= */
	$(".user_info input:not([id$='_chk'])").on("change keyup paste input", function() {
		_this = $(this)[0];
		let type = _this.type;//타입 확인
		if(!isNull(_this.dataset.checkType)){ type = _this.dataset.checkType; }//입력값 제한 타입이 있다면 타입에 대입

		if(_this == inputs.check_p_num){//만약 인증번호일 때
			chk_input_filter(type, _this);
			chk_p_num(inputs.m_cellphone, inputs.check_p_num);
			return;
		}
		//그 외
		chk_input_filter(type, _this);
		return;
	});
});
//입력값 제한 함수
function chk_input_filter(type, target){
	if(type == 'alphabet'){//영문만 허용
		target.value = target.value.replace(/[^a-zA-Z]/gi,""); return false;
	}else if(type == 'number'){//숫자만 허용
		target.value = target.value.replace(/[^0-9]/gi,""); return false;
	}else if(type == 'alphabet_number'){//영문 , 숫자만 허용
		target.value = target.value.replace(/[^a-zA-Z0-9]/gi,""); return false;
	}else if(type == 'non_spec'){//특수문자 비허용
		target.value = target.value.replace(/[~!@#$%^&*()_+|<>?:;{}`\-\=\\\,.'"\[\]/]/gi,""); return false;
	}else if(type == 'name'){//특수문자, 숫자 비허용
		target.value = target.value.replace(/[~!@#$%^&*()_+|<>?:;{}`\-\=\\\,.'"\[\]/0-9]/gi,""); return false;
	}else if(type == 'non_ko'){//한글 비허용
		target.value = target.value.replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/gi,""); return false;
	}
	return true;
}
//비밀번호값 입력 시
function chk_pw(target){
	if(target.value.length < inputs.m_pw.minLength){
		help(inputs.m_pw2, helptxt.pw_min);
	}else { remove_help(inputs.m_pw2); }
	return;
}
//인증번호 입력 시
function chk_p_num(target, num){
	if(num.value == chk_phone_num) {//인증번호 입력 값이 랜덤 생성된 번호와 일치하게 되면
		remove_help(target);//도움말 제거
		target.readOnly = "true";//데이터 수정 불가하도록 변경
		target.nextElementSibling.value = target.value;//~_chk 인풋 값 리셋
		num.parentElement.classList.add("displaynone");
		clearInterval(countDown);//카운트 다운 종료
		alert(helptxt.ok);
		return;
	}else{//일치하지 않는다면
		help(num, helptxt.chk_p_neq);
	}
}

//핸드폰번호 인증 버튼 클릭
let chk_phone_num = 0;//랜덤 인증번호
let countDown;//카운트다운 함수
function check_phone(){
	let target = inputs.m_cellphone;
	let chk_num = inputs.check_p_num;//인증번호 입력 인풋
	if(!isNull(target.value) && target.value.length == 11){
		chk_phone_num = parseInt(Math.random()*10000);//랜덤 번호 생성
		alert(chk_phone_num);
		chk_num.textContent = "";//입력값 초기화
		chk_num.parentElement.classList.remove("displaynone");//인증번호 입력란 보이게 변경
		chk_num.focus();//포커싱
		chk_num.nextElementSibling.textContent = "1:00";//카운트다운값 초기화 변경
		//1초마다 카운트다운
		countDown = setInterval(function(){
			let num = document.querySelector(".time").textContent.split(":");
			if(num[1] == "00"){
				if(num[0] == "0") {
					alert(helptxt.chk_p_timeout);
					clearInterval(countDown);//카운트 다운 종료
					help(chk_num, helptxt.fail);
					return false;
				}
				num[1] = 60;
				num[0] = num[0] - 1;
			}
			num[1] = num[1] - 1;
			num[1] = (parseInt(num[1]/10) == 0)?"0"+num[1]:num[1];
			chk_num.nextElementSibling.textContent = num[0]+":"+num[1];
		}, 1000);
	}else{
		help(target, helptxt.p_count);
	}
}

/* =========정보 찾기 제출 전 유효성 검증========= */
function check_form(_form){
	if(!check_confirm()) return false;//인증 여부 검사
	if(!check_req()) return false;//필수 입력값 입력 여부 검사
	$.ajax({
		url: location.href,
		type: "POST",
		data: "&"+$(_form).serialize(),
		async: false,
		success: function(result){
			alert(result.msg);//알럿 출력
			if(result.result == "success"){
				let target = _form.querySelector(".user_info");
				let tag = "";
				tag += "<li class='result txt_center flexCenter'><div>";
				if(_form.querySelector(".find_type input:checked").value == "id"){
					tag += "<p class='info'>회원님의 아이디는 <strong class='color'>"+result.find_result.substr(0, result.find_result.length-2)+"**</strong> 입니다.</p>";
					tag += "<p class='help'>개인정보 도용에 대한 피해 방지를 위해 아이디 끝 두자리는 ** 처리합니다.</p>";
				}else if(_form.querySelector(".find_type input:checked").value == "pw"){
					tag += "<p class='info'>회원님의 임시 비밀번호는 <strong class='color'>"+result.find_result+"</strong> 입니다.</p>";
				}
				tag += "</div></li>";
				target.innerHTML = tag;
				return true;
			}
			//일치하는 정보가 없을 경우 입력한 값 리셋
			let remove_input = _form.querySelectorAll(".user_info input:not([type='button']):not([type='submit'])");
			for (let i = 0; i < remove_input.length; i++) {
				remove_input[i].value = "";
				remove_input[i].readOnly = false;
			}
			return false;
		},
		error: function(result){
			console.log(result.responseText); //responseText의 에러메세지 확인
		}
	});
	return false;//폼이 제출되지 않도록 세팅
}
//필수 입력값 검사
function check_req(){
	let req_input = document.querySelectorAll("input.req");
	let flag = true;
	let focus = 0;
	if(!isNull(req_input) && req_input.length > 0){
		for(let i=0; i< req_input.length; i++){
			if(isNull(req_input[i].value)){
				focus++;
				if(focus == 1) req_input[i].focus();
				help(req_input[i], helptxt.req);
				flag = false;
			}else{
				remove_help(req_input[i]);
			}
		}
	}
	return flag;
}
//인증 여부 검사
function check_confirm(){
	let confirm_input = document.querySelectorAll("input[id$='_chk']");
	let flag = true;
	let focus = 0;
	if(!isNull(confirm_input) && confirm_input.length > 0){
		for(let i=0; i< confirm_input.length; i++){
			if(confirm_input[i].value.length <=0 ){
				let text = helptxt.chk_need;
				if(confirm_input[i].id.lastIndexOf("cell") > 0){
					text = helptxt.chk_cell; flag = false;
				}
				focus++;
				help(confirm_input[i], text);
			}
			if(focus == 1) document.getElementById(confirm_input[i].id.split("_chk")[0]).focus();
		}
	}
	return flag;
}

/* =========검증 결과 출력========= */
//안내문구 생성 함수
function help(target, text){
	target = target.closest("li");
	let warn = target.querySelector(".warn");
	if(warn != null){
		warn.textContent = text;
	}else{
		let help = document.createElement("p");//안내문구
		help.classList.add("help");
		help.classList.add("warn");
		help.textContent = text;
		target.append(help);
	}
}
function remove_help(target){
	let warn = target.closest("li").querySelector(".warn");
	if(warn != null) warn.remove();
}