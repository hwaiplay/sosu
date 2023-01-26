package second.sosu.members.review.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface ReviewService {

	
	Map<String, Object> selectReview(Map<String, Object> map, HttpSession session) throws Exception;
	
	Map<String, Object> reviewDetail(Map<String, Object> map) throws Exception;
	
	void insertReview(Map<String, Object> map) throws Exception;
	
	void updateReview(Map<String, Object> map) throws Exception;
		
	void deleteReview(Map<String, Object> map) throws Exception;
	
}
