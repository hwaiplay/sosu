package second.sosu.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface FreeBoardService {
	
	//자유게시글 리스트
	List<Map<String, Object>>freeList(Map<String, Object> map, HttpSession session) throws Exception; 
	
	//자유게시글 상세
	Map<String, Object>freeDetail(Map<String, Object> map) throws Exception; 
	
	//자유게시글 작성
	void insertFree(Map<String, Object> map, HttpSession session, HttpServletRequest request) throws Exception;
	
	//자유게시글 수정
	void updateFree(Map<String, Object> map, HttpSession session, HttpServletRequest request) throws Exception;
	
	//자유게시글 삭제
	void deleteFree(Map<String, Object> map) throws Exception;
	
	//자유게시글 프로필 리스트
	void freeMemberList(Map<String, Object> map, HttpSession session) throws Exception;
}