<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main>
	<article class="container">
	<h1>HELP</h1>
	<hr>
	공지사항
	<br>
	<table class="table">
		<tbody>
			<c:choose>
				<c:when test="${list[0].TOTAL_COUNT == 0}">
					<tr>
						<td colspan="4" align="center">조회된 결과가 없습니다.</td>
					</tr>
				</c:when>
				<c:when test="${list[0].TOTAL_COUNT != 0}">
					<c:forEach var="row" items="${list}">
						<tr>
							<td>
								${row.N_TITLE}
								<p>${row.N_CONTENT}</p>
								<p>${row.N_REGDATE}</p>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
		<c:if test="${!empty paginationInfo}">
			<tfoot>
				<tr>
					<td class="paging" colspan="4">
						<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="paging" />
					</td>
				</tr>
			</tfoot>
		</c:if>
	</table>
	<hr>
	QNA
	<br>
	<table>
		<tbody>
			<c:choose>
				<c:when test="${qlist[0].TOTAL_COUNT == 0}">
					<tr>
						<td colspan="4" align="center">조회된 결과가 없습니다.</td>
					</tr>
				</c:when>
				<c:when test="${qlist[0].TOTAL_COUNT != 0}">
					<c:forEach var="rows" items="${qlist}">
						<tr>
							<td>
								${rows.Q_TITLE}
								<p>${rows.Q_CONTENT}</p>
								<p>${rows.Q_REGDATE}</p>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
		<c:if test="${!empty paginationInfo}">
			<tfoot>
				<tr>
					<td class="paging" colspan="4">
						<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="paging" />
					</td>
				</tr>
			</tfoot>
		</c:if>
	</table>
	<hr>
	</article>
</main>
</body>
</html>