package second.sosu.moim.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import second.sosu.common.domain.CommandMap;

public interface MoimService {
	
	//모임 리스트
	List<Map<String, Object>> moimList(Map<String, Object> map, HttpSession session, CommandMap commandMap) throws Exception;
	
	//모임 상세보기
	Map<String, Object> moimDetail(Map<String, Object> map) throws Exception;
	
	//모임 개설
	void moimRegister(Map<String, Object> map, HttpSession session) throws Exception; // 추후 세션추가
	
	//모임 참가
	void moimJoin(Map<String, Object> map, HttpServletRequest request) throws Exception; // 추후 세션추가

	// 모임 수정
	void moimModify(Map<String, Object> map) throws Exception; // 추후 세션추가

	// 모임 삭제
	void moimDelete(Map<String, Object> map) throws Exception; // 추후 세션추가
}
