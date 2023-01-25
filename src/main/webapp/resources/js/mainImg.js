const slides = document.querySelector('.main_img');//전체 슬라이드 컨테이너
const slideimg = document.querySelectorAll('.main_img li');//모든 슬라이드들
let currentIdx = 0;//현재 슬라이드
const slideCount = slideimg.length;//슬라이드 개수
const prev = document.querySelector('.prev');//이전버튼
const next = document.querySelector('.next');//다음버튼
const slideWidth= 450;//한개의 슬라이드 넓이
const slideMargin = 50;//한개의 슬라이드의 마진값

//전체 슬라이더 컨테이너 넓이 설정
slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

function moveSlide(num){
	slides.style.left = -num*500 + 'px';
	currentIdx = num;
}

prev.addEventListener('click', function(){
//첫번째 슬라이드로 표시 됐을때는 이전 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx!=0일때만 moveSlide 함수 불러옴
	if(currentIdx!==0) moveSlide(currentIdx -1);
});

next.addEventListener('click', function(){
//마지막 슬라이드도 마찬가지
	if(currentIdx!==slideCount -1){
		moveSlide(currentIdx + 1);
		}
});
