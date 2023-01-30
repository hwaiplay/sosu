<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/admin-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>
		<input type="text" value="${MO_CATEGORY}" />
	</h1>
	<button type="button" onclick="location.href='/moim/moimRegister.sosu'">개설하기</button>

	<table>
		<thead>
			<tr align="center">
				<th>모임번호</th>
				<th>모임제목</th>
				<th>모임지역</th>
				<th>모임상세지역</th>
				<th>현재참여인원</th>
				<th>스크랩수</th>
				<%
				if (session.getAttribute("M_IDX") != null) {
				%>
				<th>스크랩유무</th>
				<%
				} else {
				%>
				<%
				}
				%>
				<th>파일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0 }">
					<c:forEach items="${list}" var="m" end="3">
							 <tr align="center" onclick= "location.href='/moim/${m.MO_CATEGORY}/${m.MO_IDX}.sosu'">
								<td>${m.MO_IDX}<input type="hidden" name="MO_IDX"
									value="${m.MO_IDX}"></td>
								<td>${m.MO_TITLE}<input type="hidden" name="M_IDX"
									value="${m.M_IDX}"></td>
								<td>${m.MO_REGION}</td>
								<td>${m.MO_DETAILREGION}</td>
								<td>${m.MOMEM_COUNT}</td>
								<td>${m.MZ_COUNT}</td>
								<c:if test="${sessionss ne null}">
									<td>${m.MZ_CHECK}</td>
								</c:if>
								<c:if test="${sessionss eq null}">
								</c:if>
								<td>${m.MF_SVNAME}</td>
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
</body>
</html>