package second.sosu.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import second.sosu.board.service.FreeBoardService;
import second.sosu.common.domain.CommandMap;

@Controller
public class FreeBoardController {
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="freeboardService")
	private FreeBoardService freeboardService;
	
	//리뷰 페이징 리스트
	@RequestMapping(value="/sosuboard") 
	public ModelAndView freeList(CommandMap commandMap, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView("/board/freeboard");
	  
		return mv; 
	}
	
	//자유게시판 리스트(카테고리 포함)
	@RequestMapping(value="/freeboard/{FR_CATEGORY}.sosu") 
	public ModelAndView freeList(@PathVariable String FR_CATEGORY , CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/board/freeboard");
		
		commandMap.put("FR_CATEGORY", FR_CATEGORY);

		List<Map<String,Object>> list= freeboardService.freeList(commandMap.getMap(), session);
		
		
		mv.addObject("list",list);
		
		return mv; 
	}
	
	//게시판 상세보기
	@RequestMapping(value="/freeboard/{FR_CATEGORY}/{FR_IDX}.sosu")
	public ModelAndView freeDetail(@PathVariable String FR_CATEGORY, @PathVariable int FR_IDX, CommandMap commandMap, HttpSession session) throws Exception {
	
		ModelAndView mv = new ModelAndView("/board/freeDetail");
		//상세내용은 리스트가 아니라 하나의 행만 조회하기 때문에 Map형태의 결과값을 받도록 설정
		commandMap.put("FR_IDX", FR_IDX);
		commandMap.put("FR_CATEGORY", FR_CATEGORY);
		
		List<Map<String,Object>> map = freeboardService.freeDetail(commandMap.getMap(), session);
		
		mv.addObject("map", map);
		

		return mv;
	}
	
//		자유게시글 작성
		@RequestMapping(value="/sosuboard/insertfree") 
		public ModelAndView insertfree(CommandMap commandMap, HttpSession session) throws Exception {
			ModelAndView mv = new ModelAndView("redirect:/freeboard/{FR_CATEGORY}.sosu");
			
			freeboardService.insertFree(commandMap.getMap(), session);
			
			return mv; 
		}
		
//		자유게시글 폼
		@RequestMapping(value="/sosuboard/insertForm/{FR_CATEGORY}")
		public ModelAndView insertForm( CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("/board/insertfree");
		
			String FR_CATEGORY = (String)commandMap.get("FR_CATEGORY");
			String M_NICKNAME = (String)commandMap.get("M_NICKNAME");
			mv.addObject("FR_CATEGORY", FR_CATEGORY);
			mv.addObject("M_NICKNAME", M_NICKNAME);
			return mv;
		}
}
