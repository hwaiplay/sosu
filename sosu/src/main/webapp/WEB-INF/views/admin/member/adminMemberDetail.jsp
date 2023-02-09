<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
/*파라미터 없애기*/
history.replaceState({},null,location.pathname);

/*신고내역 관리자가 삭제시키기(허위 신고와 같은 경우)*/
$(document).ready(function(){
   $("button[id^='deleteReport']").on('click', function(){
      //버튼 클릭한 것의 부모 찾기 =>현재는 button 감싸고 있는 td 태그 말함
      var report_content = $(this).parent();
      //td 태그 안의 ridx 찾기
      var report_ridx = report_content.find("#ridx").val();
      console.log(report_content);
      console.log(report_ridx);
      $.ajax({ url : "/admin/reportdelete.sosu", type: "post", contentType: "application/json",data : JSON.stringify({R_IDX : report_ridx}), dataType:'json', 
    	  success :function(result, status, xhr) { if (result == 0) {alert("성공적으로 삭제되었습니다."); report_content.parents("#member").css("background-color", "black"); //삭제 클릭 시, css 주는 것! 나중에 변경하면 댐~
      		} else {alert("삭제할 수 없습니다.")}}, error : function(){alert("서버요청실패!!!")}});});
   
   /*정지 or 정지취소 버튼 클릭 시 정지시키거나 정지 취소 시키기*/
   $("#stopBtn").on('click', function(){
	      var stop = $('#stopBtn').val(); //정지, 정지취소인지
	      var stop_idx = $('#memberIdx').val(); //정지하는 회원의 회원번호
	      var del = $('#mDelYn').val(); //ajax로 돌리고 나서, '정지'로 html 추가하기 위함
			if(stop == '정지'){ var stop="Y";} 
			else{ var stop="N";}
		      $.ajax({
		      url : "/admin/memberstop.sosu", type: "post", contentType: "application/json",
		      data : JSON.stringify({STOP_YN:stop, M_IDX : stop_idx}), dataType:'json',
		      success :function(result, status, xhr) {
		      if (result == 0) { 
		    	  if(stop == "Y"){ $('#mDelYn').html("정지"); $('#stopBtn').val("정지 해제");alert("정지 처리 되었습니다.")
		    	  } else{$('#mDelYn').html("정상");$('#stopBtn').val("정지"); alert("정지 상태가 해제되었습니다. ") }
		      } else {alert("실행할 수 없습니다.")}}, error : function(){alert("서버요청실패!!!")}}); });
   
   /*신고 내역이 20회 이상인 회원인 경우 탈퇴 시키기*/
  	$('#deleteMem').on('click', function(){
	   var deleteBtn = $('#deleteMem').val();
	   var delfrm = document.getElementById('delfrm');
	   var result = confirm('탈퇴 시키겠습니까?');
       if(result) {
          //yes
    	   alert("확인(예)을 누르셨습니다.");
    	   delMember(delfrm);
		}else{
			alert("노를 누르셨습니다.");
			return false;
		}
	   
   });
   
   
});



</script>

<script>
function popup(frm)
{
  var url    ="/members/usermypage.sosu";
  var title  = "M_NICKNAME";
  var status = "top=10, left=120, width=800, height=900, status=no, menubar=no, toolbar=no, resizable=no"; 
  window.open("", title,status); 
  frm.target = title;                   
  frm.action = url;                    
  frm.method = "get";
  frm.submit();     
  }
  
function delMember(delfrm){
	var url = "/admin/memberdelete.sosu"
	delfrm.title="M_IDX";
	delfrm.method = "get"
	delfrm.submit();
}

</script>

<body>

<div class="container">
<form enctype="multipart/form-data">
       <img src="${pageContext.request.contextPath}/resources/img/upload/${memberDetail[0].F_SVNAME}"><br/>
    </form>
   <table>
   <tbody>
   
   
      <tr>
         <th>이름</th>
         <td>${memberDetail[0].M_NAME}</td>
      </tr>
      
      <tr>
         <th>닉네임</th>
         <td>${memberDetail[0].M_NICKNAME}</td>
      </tr>
      
      <tr>
         <th>아이디</th>
         <td>${memberDetail[0].M_EMAIL}</td>
      </tr>
      
      <tr>
         <th>휴대전화</th>
         <td>${memberDetail[0].M_PHONE}</td>
      </tr>
      
      <tr>
         <th>주민번호</th>
         <td>${memberDetail[0].M_JUMIN} - ${memberDetail[0].M_GENDER}******</td>
      </tr>
      
      <tr>
         <th>신고횟수</th>
         <td>${RECOUNT}</td>
      </tr>
      
      <tr>
      		<th>회원상태</th>
			<td id="mDelYn"> 
      		<c:if test="${memberDetail[0].M_DEL_YN eq 'N'}"> 정상 </c:if>
			<c:if test="${memberDetail[0].M_DEL_YN eq 'S'}"> 정지 </c:if>
			<c:if test="${memberDetail[0].M_DEL_YN eq 'Y'}"> 탈퇴 </c:if>
       		</td>
      </tr>
      <tr>
         <th>정지/해제</th>
         <td >
         <input type="hidden" value="${memberDetail[0].M_IDX}" name="M_IDX" id="memberIdx">
         <c:if test="${memberDetail[0].M_DEL_YN eq 'N'}"> 
         <input type="button" value="정지" id="stopBtn"></c:if>
         <c:if test="${memberDetail[0].M_DEL_YN eq 'S'}"> 
         <input type="button" value="정지 해제" id="stopBtn"></c:if>
         </td>
      </tr>
      
      <c:if test="${RECOUNT ge 0}">
      <tr>
         <th>탈퇴시키기</th>
         <td>
         <form action="/admin/memberdelete.sosu" method="get" id="delfrm"> 
	         <input type="hidden" value="${memberDetail[0].M_IDX}" name="M_IDX" id="memberIdx"> 
	         <input type="button" value="탈퇴" id="deleteMem">
         </form>
         </td>
      </tr>
	</c:if>
      
   </tbody>
   </table>
   
    <table>
      <thead>
         <tr>
            <th>r_idx 신고 기본 번호</th>
            <th>신고한 회원번호</th>
            <th>신고사유</th>
            <th>신고상세내용</th>
            <th>신고일자</th>
         <tr>
      </thead>
      <tbody>
         <c:forEach items="${memberReport }" begin="0" end="${fn:length(memberReport)}" var="memReport" >
         
         <tr id="member" >
            <td>${memReport.R_IDX}</td>
            <td>
            <form action="/members/usermypage.sosu" name="frm">
               <input type="hidden" value="${memReport.M_NICKNAME}" name="M_NICKNAME">
               <input type="button" name="userInfo" value="${memReport.R_MEM}" onclick="javascript:popup(this.form);">
            </form></td>
            <td>
               <c:if test="${memReport.R_REASON eq '1'}"> 폭언/욕설</c:if>
               <c:if test="${memReport.R_REASON eq '2'}"> 개인정보 노출 게시물</c:if>
               <c:if test="${memReport.R_REASON eq '3'}"> 도배, 불법 광고</c:if>
               <c:if test="${memReport.R_REASON eq '4'}"> 음란물</c:if>
               <c:if test="${memReport.R_REASON eq '5'}"> 기타</c:if>
            </td>
            <td>${memReport.R_DETAIL}</td>
            <td>${memReport.R_DATE}</td>
            <td>
               <input type="hidden" id="ridx" value="${memReport.R_IDX}">
               <button id="deleteReport">삭제</button>
            </td>
         </tr>
         
   </c:forEach>
   </tbody>
   
   </table> 


<a href="/admin/memberlist.sosu">회원리스트로~</a>
</div>
</body>
</html>