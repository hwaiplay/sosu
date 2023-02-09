package second.sosu.members.review.service;

import java.util.List;
import java.util.Map;

public interface ReviewService {

//	리뷰 전체 페이지
	List<Map<String, Object>> selectAllReview(Map<String, Object> map) throws Exception;
//	리뷰 상세보기 리스트
	Map<String, Object> reviewDetail(Map<String, Object> map) throws Exception;
//	리뷰 후기 개수
	Map<String, Object> selectAllReviewCount(Map<String, Object> map) throws Exception;
//	리뷰 작성
	void insertReview(Map<String, Object> map) throws Exception;
//	리뷰 수정
	void updateReview(Map<String, Object> map) throws Exception;
//	리뷰 삭제	
	void deleteReview(Map<String, Object> map) throws Exception;
	
}
