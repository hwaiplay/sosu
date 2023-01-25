package second.sosu.admin.qna.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import second.sosu.admin.qna.service.QnAService;
import second.sosu.board.service.FreeBoardService;
import second.sosu.common.domain.CommandMap;

@Controller
public class QnAController {
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaService")
	private QnAService qnaService;
	
	//리뷰 페이징 리스트
	@RequestMapping(value="/admin/qna") 
	public ModelAndView freeList(CommandMap commandMap, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView("/admin/qna/qna");
	  
		return mv; 
	}

}
