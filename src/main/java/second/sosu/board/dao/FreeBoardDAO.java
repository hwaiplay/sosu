package second.sosu.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import second.sosu.common.dao.AbstractDAO;

@Repository("freeboardDAO")
public class FreeBoardDAO extends AbstractDAO {
	
////	페이징
//	@SuppressWarnings("unchecked") 
//	public Map<String,Object>freeList(Map<String, Object> map) throws Exception {
//		
//		return(Map<String, Object>)selectPagingList("freeboard.freeList", map); 
//	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>>freeList(Map<String, Object> map) throws Exception {
	      
		List<Map<String, Object>> freeList = (List<Map<String, Object>>) selectList("freeboard.freeList", map);
		
		  //프사
	      for (int i = 0; i < freeList.size(); i++) {
	         Map<String, Object> freemember = (Map<String, Object>) selectOne("freeboard.freeMemberList",
	        		 freeList.get(i).get("M_IDX"));
	         freeList.get(i).put("PROFILE", freemember.get("PROFILE"));
	      }
	      //찜
	      for (int i = 0; i < freeList.size(); i++) {
	         Map<String, Object> zzimFree = (Map<String, Object>) selectOne("freeboard.zzimFree",
	        		 freeList.get(i).get("FR_IDX"));
	         freeList.get(i).put("FRZ_COUNT", zzimFree.get("FRZ_COUNT"));
	      }

	      return freeList;
	}
	
//// 	프로필 리스트
//	@SuppressWarnings("unchecked")
//	public Map<String, Object> freeMemberList(Map<String, Object> map) throws Exception {
//		
//		
//		return (Map<String, Object>) selectOne("freeboard.freeMemberList", map);
//	}
	
//	자유게시글
	 
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> freeDetail(Map<String, Object> map) throws Exception {
		
		return(List<Map<String, Object>>)selectList("freeboard.freeDetail", map); 
	}
	
//	작성
	public void insertFree(Map<String, Object> map) throws Exception {
		
		insert("freeboard.insertFree", map);
	}
	
//	사진 파일 등록
	public void insertFreeFile(Map<String, Object> map) throws Exception {
		
		insert("freeboard.insertFreeFile", map);
	}
	
// 	프로필 리스트
	public void freeMemberList(Map<String, Object> map) throws Exception {
		
		insert("freeboard.freeMemberList", map);
	}
	
//	수정
	public void updateFree(Map<String, Object> map) throws Exception {
		
		update("freeboard.updateFree", map);
	}
	
//	사진 파일 수정
	public void updateFreeFile(Map<String, Object> map) throws Exception {
		
		update("freeboard.updateFreeFile", map);
	}
	
//	삭제
	public void deleteFree(Map<String, Object> map) throws Exception {
		
		update("freeboard.deleteFree", map);
	}
	
//	이미지 파일 삭제
	public void deleteFreeFile(Map<String, Object> map) throws Exception {
		
		update("freeboard.deleteFreeFile", map);
	}
}
