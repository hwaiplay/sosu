package second.sosu.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import second.sosu.board.dao.FreeBoardDAO;

@Service("freeboardService")
public class FreeBoardServiceImpl implements FreeBoardService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "freeboardDAO")
	private FreeBoardDAO freeboardDAO;
	
	//리뷰 페이징 리스트
	@Override 
	public List<Map<String, Object>>freeList(Map<String, Object> map, HttpSession session) throws Exception {
		
		return freeboardDAO.freeList(map);
	}
	
	@Override
	public List<Map<String, Object>> freeDetail(Map<String, Object> map, HttpSession session) throws Exception {
		
		return freeboardDAO.freeDetail(map);
	}

	@Override
	public void insertFree(Map<String, Object> map, HttpSession session) throws Exception {
		
		freeboardDAO.insertFree(map);
	}

	@Override
	public void insertFreeFile(Map<String, Object> map, HttpSession session) throws Exception {
		
		freeboardDAO.insertFreeFile(map);
	}

	@Override
	public void freeMemberList(Map<String, Object> map, HttpSession session) throws Exception {
		
		freeboardDAO.freeMemberList(map);
	}
	
	@Override
	public void updateFree(Map<String, Object> map, HttpSession session) throws Exception {
		
		freeboardDAO.updateFree(map);
	}

	@Override
	public void updateFreeFile(Map<String, Object> map, HttpSession session) throws Exception {
		
		freeboardDAO.updateFreeFile(map);
	}

	@Override
	public void deleteFree(Map<String, Object> map, HttpSession session) throws Exception {
		
		freeboardDAO.deleteFree(map);
	}
	
	@Override
	public void deleteFreeFile(Map<String, Object> map, HttpSession session) throws Exception {
		
		freeboardDAO.deleteFreeFile(map);
	}

}
