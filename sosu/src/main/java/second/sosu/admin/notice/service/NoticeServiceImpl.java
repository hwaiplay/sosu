package second.sosu.admin.notice.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import second.sosu.admin.notice.dao.NoticeDAO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "noticeDAO")
	private NoticeDAO noticeDAO;
	
	//리뷰 페이징 리스트
	@Override 
	public List<Map<String,Object>>noticeList(Map<String, Object> map) throws Exception {
		
		return noticeDAO.noticeList(map);
	  }

	@Override
	public void noticeWrite(Map<String, Object> map, HttpSession session) throws Exception {
		
		noticeDAO.noticeWrite(map);
	}

	@Override
	public void noticeUpdate(Map<String, Object> map, HttpSession session) throws Exception {
		
		noticeDAO.noticeUpdate(map);
	}

	@Override
	public void noticeDelete(Map<String, Object> map, HttpSession session) throws Exception {
		
		noticeDAO.noticeDelete(map);
	}
}
