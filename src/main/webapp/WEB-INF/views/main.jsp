<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.parent{
    width: 90%;
    margin: 10px auto;
}

#c1 {
   float: left;
    width:30%;
    box-sizing: border-box;
}

#c2{
    float: left;
    margin-left: 5%;
    width:30%;
    box-sizing: border-box;
}

#c3{
    float: right;
    width:30%;
    box-sizing: border-box;
}

#c4 {
    float: left;
    width:30%;
    box-sizing: border-box;
    margin-top: 20px;
}

#c5{
    float: left;
    margin-left: 5%;
    width:30%;
    box-sizing: border-box;
    margin-top: 20px;
}

#c6{
    float: right;
    width:30%;
    box-sizing: border-box;
    margin-top: 20px;
}
</style>
</head>
<body>
   <h1>메인이지롱</h1>
   
<%if(session.getAttribute("M_IDX")==null){ %>


<a href="/members/loginform.sosu">로그인</a>

<%}else{ %>
<a href="/members/mypage.sosu">마이페이지</a>
<a href="/members/logout.sosu">로그아웃</a>
<%} %>
   <div class="parent">
         <div id="c1">
         	<a href ="/culture.sosu">
            <img alt="cate1" src="/resources/images/pic01.jpg" style="cursor: pointer;">
            </a>
         </div>
         <div id="c2">
         	<a href ="/sports.sosu">
            <img alt="cate2" src="/resources/images/pic01.jpg" style="cursor: pointer;">
            </a>
         </div>
         <div id="c3">
         	<a href ="/game.sosu">
            <img alt="cate3" src="/resources/images/pic01.jpg" style="cursor: pointer;">
            </a>
         </div>
          <div id="c4">
         	<a href ="/outdoor.sosu">
            <img alt="cate4" src="/resources/images/pic01.jpg" style="cursor: pointer;">
            </a>
         </div>

          <div id="c5">
         	<a href ="/food.sosu">
            <img alt="cate5" src="/resources/images/pic01.jpg" style="cursor: pointer;">
            </a>
         </div>
          <div id="c6">
         	<a href ="/etc.sosu">
            <img alt="cate6" src="/resources/images/pic01.jpg" style="cursor: pointer;">
            </a>
         </div>
         </div>

   <!-- <script>
      /* Main Page Redirect by Readiz */
      var urlAddr = decodeURIComponent(location.href);
      urlAddr = urlAddr.replace('http://', '').replace('https://', '');
      urlAddr = urlAddr.split('#')[0];
      urlAddr = urlAddr.split('?')[0];
      var url = urlAddr.split('/');
      if (url[1] == '') {
         location.href = '/category'
      }
   </script> -->
</body>
</html>