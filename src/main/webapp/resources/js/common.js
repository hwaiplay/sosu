/* ===================== 앞/뒤로가기 감시 함수 ===================== */
let form;
window.onpageshow = function(event){
	form = document.querySelector("form#search");//제출 시 사용할 폼
	if(form == null) form = document.querySelector("form#common");

	if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
		//만약 a태그를 이용한 폼 제출 후 앞/뒤로 가기 시
		let lastC = $(form).children("input");//남아있는 a태그를 이용한 추가 전달 값
		if(lastC.length > 0){ lastC.remove(); }//추가 전달값이 있으면 제거
	}
}

/* ===================== DOM 로딩 완료 시 실행 함수 ===================== */
$(document).ready(function() {
	//폼 제출 함수의 대상인 use_move 클래스의 a 태그 클릭 시 href 작동 중지
	$(".use_move").on("click", function(e){ e.preventDefault(); });

	move_nav();//네비게이션 모바일, 탭 화면에서 이동 함수 호출
	set_paging();//페이징 세팅 함수
});

/* ===================== 널값 여부 체크 함수 ===================== */
//널값 여부 체크 함수. null, "NaN", "undefined", ""
function isNull(str) {
	if (str == null) return true;
	if (str == "NaN") return true;
	if (str.valueOf() == "undefined") return true;
	var chkStr = new String(str);
	if (chkStr.valueOf() == "undefined") return true;
	if (chkStr == null) return true;
	if (chkStr.toString().length == 0 ) return true;
	return false;
}

/* ===================== 스크롤 이동 함수 ===================== */
//최상단으로 스크롤 이동 함수
function go_top(){ window.scrollTo(0,0); }

/* ===================== 클래스 추가 함수 ===================== */
//스크롤 시 클래스 on 추가 함수
function scroll_toggle_on(target){
	/* body에 onscroll 속성으로 지정해야 하며 target으로 넘긴 대상에게 클래스를 추가한다 */
	target = document.querySelector(target);
	if(target == null) return;
	if (window.scrollY > 0) { target.classList.add("on"); } else { target.classList.remove("on"); }
}
//클릭 시 클래스 on 추가 함수
function click_toggle_on(target){
	target = document.querySelector(target);
	if(target == null) return;
	target.classList.toggle("on");
}
//클릭 시 클래스 show 추가 함수
function click_toggle_show(target){
	target = document.querySelector(target);
	if(target == null) return;
	target.classList.toggle("show");
}

/* ===================== 폼 제출 함수 ===================== */
/* a태그 클릭 시 form 제출로 바꿔서 이동시키는 함수.
	a 태그 세팅
	클래스 명: use_move
	href: form을 제출할 링크
	onclick: move(파라미터)
*/
function move(target, where, ...param){
	if(form == null) return console.log("제출할 폼이 없습니다");
	/*
	target: 무조건 this
	where: 전달시키려는 input이 a 태그 내부일 경우 in, 부모일 경우 out
	param: 전달시키려는 input의 name을 따옴표(" 또는 ')로 감싸 적어줄것!
	*/
	let tag = "";
	let _to = target.href;
	if(isNull(_to)) _to = target.dataset.href;
	if(_to != "#"){ form.action = _to; }//폼의 제출처 바꾸기
	if(where == "out"){ target = target.parentElement; }
	
	//input 처리
	for(let i=0; i<param.length; i++){
		let _inputs = target.querySelectorAll("input[name='"+param[i]+"']");
		for(let j=0; j<_inputs.length; j++){
			tag += _inputs[j].outerHTML;
		};
	}
	form.innerHTML = form.innerHTML + tag;
	form.submit();
}

/* ===================== 페이징 이동 및 세팅 함수 ===================== */
function paging(pageNo){
	form.action = location.pathname;
	form.innerHTML = form.innerHTML + "<input type='hidden' name='currentPageNo' value='"+pageNo+"'>";
	form.submit();
}
function set_paging(){
	if(!isNull($(".paging"))){
		let pagin_count = document.querySelectorAll(".paging a").length;
		if($(".paging a:nth-child(1)").text() == "[처음]") $(".paging a:nth-child(1)").addClass("first");
		if($(".paging a:nth-child(2)").text() == "[이전]") $(".paging a:nth-child(2)").addClass("before");
		if($(".paging a:nth-child("+pagin_count+")").text() == "[다음]") $(".paging a:nth-child("+pagin_count+")").addClass("next");
		if($(".paging a:nth-child("+(pagin_count+1)+")").text() == "[마지막]") $(".paging a:nth-child("+(pagin_count+1)+")").addClass("end");
	}
}

/* ===================== 네비게이션 모바일, 탭 화면에서 이동 함수 ===================== */
function move_nav(){
	let nav = document.querySelector("nav");
	//헤더에 있는 nav태그의 클래스와 동일한 클래스
	if(nav != null && window.innerWidth <= 1200){
		let target_li = document.querySelector("header .sub_pages ."+nav.classList.value);
		if(target_li != null){
			target_li.parentElement.insertBefore(nav, target_li);//nav 내용을 헤더에 삽입
			return true;
		}
	}
	return false;
}