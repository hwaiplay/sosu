package second.sosu.members.review.service;

import java.util.List;
import java.util.Map;

public interface ReviewService {

	
//	Map<String, Object> selectReview(Map<String, Object> map, HttpSession session) throws Exception;
	
	List<Map<String, Object>> selectAllReview(Map<String, Object> map) throws Exception;
	
	Map<String, Object> reviewDetail(Map<String, Object> map) throws Exception;
	
	void insertReview(Map<String, Object> map) throws Exception;
	
	void updateReview(Map<String, Object> map) throws Exception;
		
	void deleteReview(Map<String, Object> map) throws Exception;
	
}
