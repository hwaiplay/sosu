/* ===================== DOM 로딩 완료 시 실행 함수 ===================== */
$(document).ready(function() {
	$("#search .types input").on("click", function(){
		document.getElementById("search").submit();
	});
});

/* ===================== 지하철 검색 세팅 함수 ===================== */
var _jsonFile;
var _loc_key, _loc_value, _line_key, _line_value, _subway_key, _subway_value;
var _search_keyword;
//지하철 정보 Json 데이터 불러오기
fetch("/resources/js/subway.json").then(response => { return response.json(); }).then(jsondata => _jsonFile = jsondata);

function re_html(obj, target){//전달받는 자료에 따라 li 출력함수
    let _tag = "";
    let _target = document.querySelector(".select_list").querySelector("."+target);
    for (const key in obj) {
        _tag += `<li><input type="button" onclick="set_${target}(this)" value="${key}"></li>`;
    }
    _target.innerHTML = _tag;
}

//지하철역 검색 박스 클릭시 클래스 추가/제거
function show_subway_lines(param){
	param.classList.toggle("on");
    let _target = document.querySelector(".select_list .loc");
    if(_target.innerHTML == "" && param.classList.contains("on")){
        re_html(_jsonFile, "loc");
    }
}
function set_loc(param){//지역 선택 시 작동 함수
    _loc_key = param.value;
    _loc_value = _jsonFile[_loc_key];
    $(param).parent().siblings().removeClass("on");
    $(param).parent().addClass("on");
    re_html(_loc_value, "line");
}
function set_line(param){//호선 선택 시 작동 함수
    _line_key = param.value;
    _line_value = _loc_value[_line_key];
    $(param).parent().siblings().removeClass("on");
    $(param).parent().addClass("on");
    re_html(_line_value, "search_keyword");
}
function set_search_keyword(param){//지하철역 선택 시 작동 함수
	_subway_key = param.value;
    _subway_value = _line_value[_subway_key];
	$(param).parent().siblings().removeClass("on");
    $(param).parent().addClass("on");
    console.log(_subway_value);
    //지하철역의 위도 경도 세팅
    $(param).val(_subway_value);
    document.getElementById("search").submit();
    //위도 경도 기준으로 지도 API를 통해 지역명을 가져온 후
    //서버로 지역명 데이터를 보내주고
    //서버에서는 지역명 기준으로 카페를 가져와
    //메인 리스트에 출력해주면 되지 않을까요?
}