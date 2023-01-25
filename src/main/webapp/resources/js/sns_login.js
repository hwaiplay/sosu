$(document).ready(function() {
	naverLogin.init();
	if(!isNull(logout)){ naverLogin.logout(); location.href = "/main"; }
	naverLogin.getLoginStatus(function (status) {
		if (status) {//만약에 상태값이 있다면
			console.log(status);
			sns_callback("/login", naver_login,
				{m_id: "n"+naverLogin.user.id,
				m_name: naverLogin.user.name,
				m_email: naverLogin.user.email,
				m_cellphone: naverLogin.user.mobile});
		}
    });
});

/* =========sns로그인========= */
var naverLogin = new naver.LoginWithNaverId({
	clientId: "LJZztVV25FDG0CX25J7Z",
	callbackUrl: "http://localhost:8080/login",
	loginButton: {color: "green", type: 4, height: 40}
});
function sns_callback(_url, _fn, _data){
	$.ajax({
		url: _url,
		type: "POST",
		data: {
			m_id: _data.m_id.slice(0, 12),
			m_pw: _data.m_id.slice(12, 27),
			m_name: _data.m_name,
			m_email: _data.m_email,
			m_cellphone: _data.m_cellphone.replaceAll("-",""),
			m_type: "0", sns: 1
		},
		async: false,
		success: function(result){
			_fn(result, _data);
		},
		error: function(result){
			snsflag = false;
			console.log(result.responseText); //responseText의 에러메세지 확인
		}
	});
}
function naver_login(result, _data){
	if(result.result == "success"){//로그인 성공
		alert(result.resultMsg);
		return location.href = "/main";
	}else{//로그인 실패
		let areYouJoin = confirm("가입된 정보가 없습니다!\n회원가입하시겠습니까?");
		if(areYouJoin){//가입한다면
			return sns_callback("/join", naver_join, _data);
		}else{//가입 안한다면
			naverLogin.logout();
			alert("다시 로그인해주세요!");
			return false;
		}
	}
}
function naver_join(result){
	if(result.result == "success"){//회원가입 성공
		alert("가입에 성공하셨습니다! 다시 로그인해 주세요!");
		return true;
	}else{ alert("가입에 실패하셨습니다! 다시 시도해 주세요!"); }
}
function google_login(){
    console.log(this);
}