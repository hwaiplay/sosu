<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/js/reviewDetail.js"></script>

<main>
<input type="hidden" name = "MO_IDX" value="${detail.MO_IDX}">
	<article class="container">
	<h1>리뷰</h1>
			<table>
				<tbody>
					<tr>
						<th>카테고리</th>
						<td>
							<strong>${detail.MO_CATEGORY}</strong>
							<input type="hidden" id="category" value="${detail.MO_CATEGORY}">	
						</td>
						<th>리뷰번호</th>
						<td>
							<strong>${detail.RV_IDX}</strong>
							<input type="hidden" id="RV_IDX" value="${detail.RV_IDX}">	
						</td>
						<th>회원번호</th>
						<td>
							<strong>${detail.M_IDX}</strong>
						</td>
						<th>모임번호</th>
						<td>
							<strong>${detail.MO_IDX}</strong>
						</td>
						<th>제목</th>
						<td>${detail.RV_TITLE}</td>
					</tr>
					<tr>
						<th>등록날짜</th>
						<td>${detail.RV_REGDATE}</td>
					</tr>
					<tr>
						<th>별점</th>
						<td>${detail.RV_STAR}</td>
					</tr>
					<tr>
						<td>${detail.RV_CONTENT}</td>
					</tr>
				</tbody>
			</table>
			
			<div align="center" id="btndiv">	
			<a href="/review/${detail.MO_CATEGORY}.sosu" class="btn normal">목록으로</a>
			
			<a href="/reviewModify/${detail.MO_CATEGORY}/${detail.MO_IDX}.sosu" class="btn normal">수정하기</a>
			
			<a href="/review/${detail.MO_CATEGORY}.sosu" onclick="if(check()) move(this, 'in', 'RV_IDX', 'MO_IDX')">
				삭제하기
				<input type="hidden" name="MO_IDX" value="${detail.MO_IDX}">
				<input type="hidden" name="RV_IDX" value="${detail.RV_IDX}">			
			</a>
			
			</div>
	</article>
</main>