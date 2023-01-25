package second.sosu.admin.qna.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface QnAService {
	
	//리뷰 페이징 리스트
	List<Map<String,Object>>qnaList(Map<String, Object> map) throws Exception; 
	
	void qnaWrite(Map<String, Object> map, HttpSession session) throws Exception;
	
	void qnaUpdate(Map<String, Object> map, HttpSession session) throws Exception;
		
	void qnaDelete(Map<String, Object> map, HttpSession session) throws Exception;

}
