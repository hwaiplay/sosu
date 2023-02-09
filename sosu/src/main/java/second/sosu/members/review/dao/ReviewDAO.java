package second.sosu.members.review.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import second.sosu.common.dao.AbstractDAO;

@Repository("reviewDAO")
public class ReviewDAO extends AbstractDAO {

//	리뷰 리스트
	@SuppressWarnings("unchecked") 
	public List<Map<String, Object>> selectAllReview(Map<String, Object> map) throws Exception {
		
		return(List<Map<String, Object>>)selectList("review.selectAllReview", map); 
	}
	
//	리뷰 상세보기 리스트
	@SuppressWarnings("unchecked") 
	public Map<String, Object> reviewDetail(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>)selectOne("review.reviewDetail", map);
	}
	
//	리뷰 후기 개수
	@SuppressWarnings("unchecked") 
	public Map<String, Object> selectAllReviewCount(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>)selectOne("review.selectAllReviewCount", map);
	}
	
//	리뷰 작성
	public void insertReview(Map<String, Object> map) throws Exception {
		
		insert("review.insertReview", map);
	}
	
//	리뷰 사진 파일 등록
	public void insertPhotoReview(Map<String, Object> map) throws Exception {
		insert("review.insertPhotoReview", map);
	}
	
//	리뷰 수정
	public void updateReview(Map<String, Object> map) throws Exception {
		
		update("review.updateReview", map);
	}
	
//	리뷰 사진 파일 수정
	public void updatePhotoReview(Map<String, Object> map) throws Exception {
		update("review.updatePhotoReview", map);
	}
	
//	리뷰 삭제
	public void deleteReview(Map<String, Object> map) throws Exception {
		
		update("review.deleteReview", map);
	}
	


}
