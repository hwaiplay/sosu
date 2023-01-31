<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="/resources/css/detail.css" rel="stylesheet">

<body>
<%   //개행을 위한..(구현X)
      pageContext.setAttribute("crcn", "\r\n");
      pageContext.setAttribute("br", "<br>"); 
%> 

<div class="container" style="text-align: center; width: 1000px; margin: 50px auto;">

<input type="hidden" name = "MO_IDX" value="${MO_IDX}">
<main>
		<div class="detailBody">
			<div class="imgArea">

				<c:if test="${Detail.F_SVNAME eq null }">
					<img src="/resources/img/sample.jpg"
						style="width: 1000px; height: auto;">
				</c:if>

				<!-- 진짜 사진 -->
				<c:if test="${Detail.F_SVNAME ne null }">
					<!-- <img src="${pageContext.request.contextPath}/resources/assets/img/image/${Detail.F_SVNAME }" style="width: 1000px; height: auto;"> -->
				</c:if>

			</div>

			<div class="detailArea">
				<!-- 모임 제목 -->
				<p class="dtitle">${Detail.MO_TITLE}</p>
				<hr>

				<!-- 세부 정보 -->
				<p id="MO_IDX">
					☀︎
					<c:if test="${Detail.MO_CATEGORY == 'culture' }">
      문화/예술
      </c:if>
					<c:if test="${Detail.MO_CATEGORY == 'sports' }">
      운동/스포츠
      </c:if>
					<c:if test="${Detail.MO_CATEGORY == 'outdoor' }">
      아웃도어/여행
      </c:if>
					<c:if test="${Detail.MO_CATEGORY == 'game' }">
      게임/오락
      </c:if>
					<c:if test="${Detail.MO_CATEGORY == 'food' }">
      음식
      </c:if>
					<c:if test="${Detail.MO_CATEGORY == 'etc' }">
      기타
      </c:if>
				</p>
				<p>♫ ${Detail.MO_DETAILCATEGORY}</p>
				<p>⚑ ${Detail.MO_DETAILREGION}</p>
				<p>
					✎
					<fmt:formatDate value="${Detail.MO_DEADLINE}" pattern="yyyy/MM/dd" />

					<fmt:parseDate value="${Detail.MO_DEADTIME}" var="deadtime"
						pattern="HH:mm" />
					<fmt:formatDate value="${deadtime}" pattern="HH:mm" />
				</p>
				<p>
					❖
					<c:if test="${Detail.MO_MINAGE != '0'}">
      ${Detail.MO_MINAGE}~${Detail.MO_MAXAGE}세  
      </c:if>

					<c:if test="${Detail.MO_MINAGE == '0'}">
      연령 제한 없음 /
      </c:if>
				<div id="gender">
					<c:if test="${Detail.MO_GENDER == 'W'}">
       여자만
      </c:if>
					<c:if test="${Detail.MO_GENDER == 'M'}">
       남자만
      </c:if>
					<c:if test="${Detail.MO_GENDER == '0'}">
      성별 제한 없음
      </c:if>
     
				</div>
				 </p>
				<p>
					☺
					<c:if test="${Detail.MO_MAXPEOPLE != '0'}">
      현재${Detail.MOMEM_COUNT}명/인원 ${Detail.MO_MAXPEOPLE}명
      </c:if>
					<c:if test="${Detail.MO_MAXPEOPLE == '0'}">
      인원 제한 없음
      </c:if>
				</p>
			</div>
		</div>
		<br> <br>
		<p>참여 인원 리스트</p>
		<table>
			<thead>
				<tr align="center">
					<th>참여자 프로필</th>
					<th>참여자 닉네임</th>
					<c:if test="${sessionss eq Detail.M_IDX}">
						<th>강퇴</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach items="${list}" var="m" varStatus="status">
						<input type="hidden" value="${m.M_IDX}" name="M_IDX" id = "pmidx${status.index}">
							<tr align="center">
								<td>${m.PROFILE}</td>
								<td><form action="/members/usermypage.sosu">
										<input type="hidden" value="${m.M_NICKNAME}" name="M_NICKNAME">
										<button type="submit">${m.M_NICKNAME}</button>
									</form></td>
								<c:if test="${sessionss eq Detail.M_IDX}">
									<td><form action=/moim/moimMemberBan.sosu>
											<input type="hidden" value="${m.P_IDX}" name="P_IDX" id = "pmidx${status.index}">
											<input type="hidden" name="MO_IDX" value="${MO_IDX}">
											<button type="submit" class="btn normal"
												onclick="alert('강퇴완료.')">강퇴하기</button>
										</form></td>
								</c:if>

							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
						
							<td colspan="4"><br>현재 참여한 인원이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<br> <br>
		
		<!-- 참여 대기자 리스트 (안보임) -->
		<div style="display: none;">
			<table>
					<c:choose>
						<c:when test="${fn:length(list2) > 0 }">
							<c:forEach items="${list2}" varStatus="status" var = "w">
							<tr>
							<td>${w.M_IDX}</td>
							</tr>
						    <input type="hidden" value="${w.M_IDX}" name="M_IDX" id = "wmidx${status.index}">
							</c:forEach>
						</c:when>
					</c:choose>
			</table>
		</div>
		<!-- 강퇴자 리스트 (안보임) -->
		<div style="display: none;">
			<table>
					<c:choose>
						<c:when test="${fn:length(list3) > 0 }">
							<c:forEach items="${list3}" varStatus="status" var = "b">
							<tr>
							<td>${b.M_IDX}</td>
							</tr>
								<input type="hidden" name="M_IDX" value="${b.M_IDX}" id = "bmidx${status.index}">
							</c:forEach>
						</c:when>
					</c:choose>
			</table>
		</div>

		<c:if test="${sessionss eq Detail.M_IDX and Detail.MO_PERMIT eq 'Y'}">
			<p>참여대기 인원</p>
			<table>
				<thead>
					<tr align="center">
						<th>대기자 프로필</th>
						<th>대기자 닉네임</th>
						<th>승인 허가</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(list2) > 0 }">
							<c:forEach items="${list2}" var="w"  varStatus="status">
								<tr align="center">
									<c:if test="${w.P_FINAL_YN eq 'N'}">
										<td>${w.PROFILE}</td>
										<td><form action="/members/usermypage.sosu">
												<input type="hidden" value="${w.M_NICKNAME}"
													name="M_NICKNAME">
												<button type="submit">${w.M_NICKNAME}</button>
											</form></td>
										<td>
											<form action="/moim/moimWaitApprove.sosu">
												<input type="hidden" value="${w.P_IDX}" name="P_IDX">
												<input type="hidden" name="MO_IDX" value="${MO_IDX}">
												<button type="submit" class="btn normal"
													onclick="alert('참여승인이 완료되었습니다.')">참여승인</button>
											</form>
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</c:if>
		<!-- 버튼들.. -->
		<div align="center" id="btndiv">
			<c:if
				test="${sessionss ne null and sessionss ne Detail.M_IDX and Detail.MO_PERMIT eq 'N'}">
				<form action="/moim/moimJoin.sosu" onsubmit="return checkJoin();">
					<button class="btn normal" type="submit">참여하기</button>
					<input type="hidden" name="MO_IDX" value="${MO_IDX}"> <input
						type="hidden" name="M_GENDER" value="${sessgender}" id="ssgender">
					<input type="hidden" name="M_IDX" value="${sessionss}"
						id="sessionss">
				</form>
			</c:if>
			<c:if
				test="${sessionss ne null and sessionss ne Detail.M_IDX and Detail.MO_PERMIT eq 'Y'}">
				<form action="/moim/moimJoinPermit.sosu"
					onsubmit="return checkJoin2();">
					<button class="btn normal" type="submit">참가요청</button>
					<input type="hidden" name="MO_IDX" value="${MO_IDX}"> <input
						type="hidden" name="M_GENDER" value="${sessgender}" id="ssgender">
					<input type="hidden" name="M_IDX" value="${sessionss}"
						id="sessionss">
				</form>
			</c:if>
			<a href="/moim/${MO_CATEGORY}.sosu" class="btn normal">목록으로</a> <input
				type="hidden" name="MO_CATEGORY" value="${Detail.MO_CATEGORY}" />
			<c:if test="${sessionss ne null and sessionss eq Detail.M_IDX}">
				<a href="/moimModify/${MO_IDX}.sosu" class="btn normal">수정하기</a>
				<input type="hidden" value="${MO_IDX}" name="MO_IDX">
				<form action="/moim/moimDelete.sosu">
					<button type="submit" onclick="check();" class="btn normal">삭제하기</button>
				</form>
			</c:if>
		</div>
	</main>
	</div>
</body>

<!-- 삭제 컨펌 alert 1/20기준 미완 -->
<script type="text/javascript">
	function check() {

		var cate = $("#cate");
		var idx = $("#MO_IDX");

		if (confirm("게시글을 삭제 하시겠습니까?")) {
			alert("삭제 되었습니다.");
			location.href = "/moim/moimDelete.sosu";
		} else {
			location.href = "/moim/" + cate + "/" + idx + ".sosu";
			return false;
		}
	}
	function checkJoin() {

		var cate = $("#cate");
		var idx = $("#MO_IDX");
		var gender = $("#gender").html();
		var ssgender = $('#ssgender').val();
		var sessmidx = $('#sessionss').val();
		var iiib = 0;
		var iiip = 0;
		var bbb = '#bmidx' + iiib++;
		var ppp = '#pmidx' + iiip++;
		var bmidx = $(bbb).val(); //강퇴당한사람
		var pmidx = $(ppp).val(); //참여중인사람
		var presentP = "<c:out value = '${Detail.MOMEM_COUNT}'/>";
		var maxP = "<c:out value = '${Detail.MO_MAXPEOPLE}'/>";
		
		if(gender.trim() == '여자만' && ssgender == '1' || gender.trim() == '여자만' && ssgender == '3') {
			alert('여성회원만 참여가능한 모임입니다');
			return false;
		}
		
		if(gender.trim() == '남자만' && ssgender == '2' || gender.trim() == '남자만' && ssgender == '4') {
			alert('남성회원만 참여가능한 모임입니다');
			return false;
		}
		if(presentP >= maxP) {
			alert('참여인원이 꽉 찼습니다.');
			return false;
		}
		
		if(bmidx == sessmidx) {
			alert('이미 강퇴당한 모임입니다.');
			return false;
		}
		
		if(pmidx == sessmidx) {
			alert('이미 참여한 모임입니다.');
			return false;
		} 
		
		if (confirm("모임에 참여하시겠습니까??")) {
			alert("참여완료.");
			
		} else {
			location.href = "/moim/" + cate + "/" + idx + ".sosu";
			return false;
		}
	}
	function checkJoin2() {

		var cate = $("#cate");
		var idx = $("#MO_IDX");
		var gender = $("#gender").html();
		var ssgender = $('#ssgender').val();
		var sessmidx = $('#sessionss').val();
		var iiib = 0;
		var iiiw = 0;
		var iiip = 0;
		var bbb = '#bmidx' + iiib++;
		var www = '#wmidx' + iiiw++;
		var ppp = '#pmidx' + iiip++;
		var bmidx = $(bbb).val(); //강퇴당한사람
		var wmidx = $(www).val(); //참여대기중인사람
		var pmidx = $(ppp).val(); //참여중인사람
		var presentP = "<c:out value = '${Detail.MOMEM_COUNT}'/>";
		var maxP = "<c:out value = '${Detail.MO_MAXPEOPLE}'/>";
		
		if(gender.trim() == '여자만' && ssgender == '1' || gender.trim() == '여자만' && ssgender == '3') {
			alert('여성회원만 참여가능한 모임입니다');
			return false;
		}
		
		if(gender.trim() == '남자만' && ssgender == '2' || gender.trim() == '남자만' && ssgender == '4') {
			alert('남성회원만 참여가능한 모임입니다');
			return false;
		}
		if(presentP >= maxP) {
			alert('참여인원이 꽉 찼습니다.');
			return false;
		}
		
		
		if(bmidx == sessmidx) {
			alert('이미 강퇴당한 모임입니다.');
			return false;
		}
		if(wmidx == sessmidx) {
			alert('참여승인을 기다리는 중입니다.');
			return false;
		} 
		if(pmidx == sessmidx) {
			alert('이미 참여한 모임입니다.');
			return false;
		} 
		
		if (confirm("모임에 참여하시겠습니까??")) {
			alert("참여완료.");
			
		} else {
			location.href = "/moim/" + cate + "/" + idx + ".sosu";
			return false;
		}
	}
</script>