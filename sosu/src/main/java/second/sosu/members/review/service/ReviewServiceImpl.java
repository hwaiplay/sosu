package second.sosu.members.review.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import second.sosu.common.util.FileUtils;
import second.sosu.members.review.dao.ReviewDAO;




@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "reviewDAO")
	private ReviewDAO reviewDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
//	리뷰 전체 보기
	@Override 
	public List<Map<String, Object>> selectAllReview(Map<String, Object> map) throws Exception {
		
		return reviewDAO.selectAllReview(map);
	}
	
//	리뷰 상세보기
	@Override
	public Map<String, Object> reviewDetail(Map<String, Object> map) throws Exception {
		
		return reviewDAO.reviewDetail(map);
	}
	
//	리뷰 상세보기 후기 개수
	public Map<String, Object> selectAllReviewCount(Map<String, Object> map) throws Exception {
		
		return reviewDAO.selectAllReviewCount(map);
	}

//	리뷰 작성
	@Override
	public void insertReview(Map<String, Object> map) throws Exception {
		
		reviewDAO.insertReview(map);
	}

//	리뷰 수정
	@Override
	public void updateReview(Map<String, Object> map) throws Exception {
		
		reviewDAO.updateReview(map);
	}

//	리뷰 삭제
	@Override
	public void deleteReview(Map<String, Object> map) throws Exception {
		
		reviewDAO.deleteReview(map);
	}

}
