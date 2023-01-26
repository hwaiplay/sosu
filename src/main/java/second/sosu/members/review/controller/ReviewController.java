package second.sosu.members.review.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import second.sosu.common.domain.CommandMap;
import second.sosu.members.review.service.ReviewService;

@Controller
public class ReviewController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	/** 리뷰 상세보기
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
		
		Map<String, Object> map = reviewService.reviewDetail(commandMap.getMap());
		
		mv.addObject("detail", map);
		
		return mv;
	}
	
	/** 리뷰 작성폼
	 * 
	 * @category review
	 * @param commandMap
	 * @throws Exception
	 * @author seungju han
	 */
	@GetMapping("/members/reviewForm")
	public ModelAndView reviewForm(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("/members/review/reviewForm");
		
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
	@PostMapping("/members/reviewForm")
	public ModelAndView reviewForm_insert(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/members/mypage");
		
		reviewService.insertReview(commandMap.getMap());
		
		return mv;
	}
}
