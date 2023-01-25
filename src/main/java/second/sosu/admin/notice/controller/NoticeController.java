package second.sosu.admin.notice.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import second.sosu.admin.notice.service.NoticeService;
import second.sosu.admin.qna.service.QnAService;
import second.sosu.common.domain.CommandMap;

@Controller
public class NoticeController {
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	@Resource(name="qnaService")
	private QnAService qnaService;
	
	/** 관리자 페이지의 공지사항 호출
	 * 
	 * @param commandMap
	 * @param session
	 * @return
	 * @throws Exception
	 */
	
	@GetMapping("/admin/notice") 
	public ModelAndView adNoticeList(CommandMap commandMap, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView("/admin/notice/notice");
	  
		return mv; 
	}
	
	/** 일반 이용자들이 볼 수 있는 공지사항 페이지 호출
	 * 
	 * @param commandMap
	 * @param session
	 * @return
	 * @throws Exception
	 */
	
	@GetMapping("/notice") 
	public ModelAndView noticeList(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("/com/notice/notice");
		
		List<Map<String, Object>> list = noticeService.noticeList(commandMap.getMap());
		
		List<Map<String, Object>> qlist = qnaService.qnaList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		mv.addObject("qlist", qlist);
	  
		return mv; 
	}

}
