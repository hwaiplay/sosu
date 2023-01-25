package second.sosu.admin.notice.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface NoticeService {
	
	//리뷰 페이징 리스트
	List<Map<String,Object>>noticeList(Map<String, Object> map) throws Exception; 
	
	void noticeWrite(Map<String, Object> map, HttpSession session) throws Exception;
	
	void noticeUpdate(Map<String, Object> map, HttpSession session) throws Exception;
		
	void noticeDelete(Map<String, Object> map, HttpSession session) throws Exception;

}
