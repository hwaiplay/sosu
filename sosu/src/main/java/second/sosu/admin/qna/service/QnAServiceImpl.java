package second.sosu.admin.qna.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import second.sosu.admin.qna.dao.QnADAO;

@Service("qnaService")
public class QnAServiceImpl implements QnAService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "qnaDAO")
	private QnADAO qnaDAO;
	
	//리뷰 페이징 리스트
	@Override 
	public List<Map<String,Object>>qnaList(Map<String, Object> map) throws Exception {
		
		return qnaDAO.qnaList(map);
	  }

	@Override
	public void qnaWrite(Map<String, Object> map, HttpSession session) throws Exception {
		
		qnaDAO.qnaWrite(map);
	}

	@Override
	public void qnaUpdate(Map<String, Object> map, HttpSession session) throws Exception {
		
		qnaDAO.qnaUpdate(map);
	}

	@Override
	public void qnaDelete(Map<String, Object> map, HttpSession session) throws Exception {
		
		qnaDAO.qnaDelete(map);
	}
}
