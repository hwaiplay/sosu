package second.sosu.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface FreeBoardService {
	
	//리뷰 페이징 리스트
	List<Map<String, Object>>freeList(Map<String, Object> map, HttpSession session) throws Exception; 
	
	List<Map<String, Object>>freeDetail(Map<String, Object> map, HttpSession session) throws Exception; 
	
	void insertFree(Map<String, Object> map, HttpSession session) throws Exception;
	
	void insertFreeFile(Map<String, Object> map, HttpSession session) throws Exception;
		
	void freeMemberList(Map<String, Object> map, HttpSession session) throws Exception;
	
	void updateFree(Map<String, Object> map, HttpSession session) throws Exception;
	
	void updateFreeFile(Map<String, Object> map, HttpSession session) throws Exception;
	
	void deleteFree(Map<String, Object> map, HttpSession session) throws Exception;
	
	void deleteFreeFile(Map<String, Object> map, HttpSession session) throws Exception;

}
