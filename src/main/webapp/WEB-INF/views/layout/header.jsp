<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/include-header.jspf"%>

<link href="/resources/css/main.css" rel="stylesheet">

<div style="height: 90px;"
	class="parent fixed-top">

	<!--============== 로고  ==============-->
	<div class="first">
		<a href="/main.sosu"><img class="logo" src="/resources/img/logo.png"></a>
	</div>

	<!--============== 통합검색 ==============-->
	<div class="second">
		<form id="searchList" action="/goods/search.toy" method="get">
			<input type="text" name="keyword" placeholder="통합 검색"
				style="border: 1px solid #e6e6e6;">
			<button type="submit">
			<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
			</button>
			
		</form>
	</div>

	<!--============== 로그인 메뉴 ==============-->
	<div class="third">

		<!-- 비로그인 -->
		<!-- 세션 바꿀 것!!! -->
		
		<%if(session.getAttribute("M_IDX")==null){ %>
		<ul id="header_navi">
			<li>
				<a href="/members/loginform.sosu">
					<img class="imgg" alt="mypage" src="/resources/img/icons/login.png"><span>LOGIN</span>
				</a>
			</li>
			<li>
				<a>
					<img class="imgg" alt="cs" src="/resources/img/icons/cs.png"><span>CS</span>
				</a>
			</li>
		</ul>
		
		<!-- 로그인 되었을시 보이는 -->
		
		<%}else{ %>
		<ul id="header_navi">
         <li><a href="/members/logout.sosu"><img class="imgg" src="/resources/img/icons/logout.png"><span>LOGOUT</span></a></li>
         <li><a href="/members/mypage.sosu"><img class="imgg" src="/resources/img/icons/login.png"><span>MY</span></a></li>
         <li><a href="#"><img class="imgg" src="/resources/img/icons/mail.png">
         <!-- 임시로 넣어놓음 쪽지 값 받아와야함 -->
         <span>0</span>
         </a>
         </li>
         <li><a href="#"><img class="imgg" src="/resources/img/icons/bell.png">
         <!-- 임시로 넣어놓음 알림 값 받아와야함 -->
         <span>0</span></a></li>
         <li><a href="#"><img class="imgg" src="/resources/img/icons/cs.png"><span>CS</span></a></li>
       </ul>
       <%} %>
	</div>
	
</div>
</html>