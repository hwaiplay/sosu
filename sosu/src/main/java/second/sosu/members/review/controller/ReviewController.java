package second.sosu.members.review.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import second.sosu.common.domain.CommandMap;
import second.sosu.members.review.service.ReviewService;

@Controller
public class ReviewController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	/** 리뷰 상세보기 리스트
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
	@GetMapping("/review/{MO_CATEGORY}/{RV_IDX}.sosu")
	public ModelAndView reviewDetail(@PathVariable int RV_IDX, 
			@PathVariable String MO_CATEGORY, CommandMap commandMap) throws Exception {

		commandMap.put("RV_IDX", RV_IDX);
		
		commandMap.put("MO_CATEGORY", MO_CATEGORY);
		
		ModelAndView mv = new ModelAndView("/members/review/reviewDetail");
		
		mv.setViewName("members/review/reviewDetail");
		
		List<Map<String, Object>> list = reviewService.selectAllReview(commandMap.getMap());
		
		Map<String, Object> map = reviewService.selectAllReviewCount(commandMap.getMap());
		
		mv.addObject("detailList", list);
		
		mv.addObject("review_count", map);
		
		return mv;
	}
	
	/** 리뷰 목록
	 * 
	 * @param RV_IDX
	 * @param MO_CATEGORY
	 * @param commandMap
	 * @return reviewList.jsp 경로 반환
	 * @throws Exception
	 */
	@GetMapping("/review/{MO_CATEGORY}.sosu")
	public ModelAndView reviewList(@PathVariable String MO_CATEGORY, CommandMap commandMap) throws Exception {
		
		commandMap.put("MO_CATEGORY", MO_CATEGORY);
		
		ModelAndView mv = new ModelAndView("/members/review/reviewList");
		
		mv.setViewName("members/review/reviewList");
		
		List<Map<String, Object>> list = reviewService.selectAllReview(commandMap.getMap());
		
		mv.addObject("reviewList", list);
		
		return mv;
	}
	
	/** 리뷰 작성 폼
	 * 
	 * @category review
	 * @param commandMap
	 * @throws Exception
	 * @author seungju han
	 */
	@GetMapping("/members/reviewForm.sosu")
	public ModelAndView reviewForm(CommandMap commandMap, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView("/members/review/reviewForm");
		
		mv.setViewName("members/review/reviewForm");
		
		String MO_IDX = (String)commandMap.get("MO_IDX");
		String MO_TITLE = (String)commandMap.get("MO_TITLE");
		
		mv.addObject("MO_IDX", MO_IDX);
		mv.addObject("MO_TITLE", MO_TITLE);
		
		return mv;
	}
	
	/** 리뷰 작성
	 * 
	 * @param commandMap
	 * @param session
	 * @throws Exception
	 * @return insert, update, delete 쿼리문은 int값으로 반환하므로
	 * 리턴타입을 map으로 받으면 안된다. (dao, service, serviceimpl 수정 완료) 
	 * @author seungju han
	 */
	@PostMapping("/members/reviewForm.sosu")
	public ModelAndView reviewForm_insert(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/members/mypage.sosu");
		
		reviewService.insertReview(commandMap.getMap());
		
		return mv;
	}
	
	/** 리뷰 수정 폼
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
	@GetMapping("/reviewModify/{MO_CATEGORY}/{RV_IDX}.sosu")
	public ModelAndView reviewModify(@PathVariable int RV_IDX, @PathVariable String MO_CATEGORY, CommandMap commandMap) throws Exception {
		
		commandMap.put("RV_IDX", RV_IDX);
		
		commandMap.put("MO_CATEGORY", MO_CATEGORY);
				
		ModelAndView mv = new ModelAndView("/members/review/reviewModify");
		
		mv.setViewName("members/review/reviewModify");
		
		Map<String, Object> map = reviewService.reviewDetail(commandMap.getMap());
		
		mv.addObject("reviewMap", map);
		
		return mv;
	}
	
	/** 리뷰 수정
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
	@PostMapping("/review/reviewModify.sosu")
	public ModelAndView reviewModify_(@RequestParam(value="MO_CATEGORY", required=false) String MO_CATEGORY, CommandMap commandMap) throws Exception {
		
		Map<String, Object> map = reviewService.reviewDetail(commandMap.getMap());
		
		String idx = map.get("RV_IDX").toString(); 
		
		ModelAndView mv = new ModelAndView("redirect:/review/"+ MO_CATEGORY +"/"+ idx +".sosu");
		
		reviewService.updateReview(commandMap.getMap());
		
		return mv;
	}
	
	/** 리뷰 삭제
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
	@PostMapping("/review/{MO_CATEGORY}.sosu")
	public ModelAndView reviewDelete(@PathVariable String MO_CATEGORY, CommandMap commandMap) throws Exception {
		
		commandMap.put("MO_CATEGORY", MO_CATEGORY); 
		
		ModelAndView mv = new ModelAndView("redirect:/review/{MO_CATEGORY}.sosu");
		
		reviewService.deleteReview(commandMap.getMap());
		
		return mv;
	}
}
