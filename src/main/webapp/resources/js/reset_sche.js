function sche_reset(){
	$.ajax({
		url: "/admin/reset_sche",
		type: "POST",
		data: "",
		async: false,
		success: function(result){
			if(result.result == "success"){
				msg = "이전 날짜의 스케쥴 테이블이 업데이트 되었습니다!";
			}else{
				msg = "스케쥴 테이블 업데이트에 실패했습니다!";
			}
			if(!isNull(msg)) alert(msg);//알럿 출력
			return;
		},
		error: function(result){
			console.log(result.responseText); //responseText의 에러메세지 확인
		}
	});
}