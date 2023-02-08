package second.sosu.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import second.sosu.common.domain.CommandMap;
import second.sosu.main.sevice.MainService;

@Controller
public class MainController {
	

	@Resource(name="mainService")
	private MainService mainService;
	

	/*
	 * @Resource(name = "moimService") private MoimService moimService;
	 */

	/*
	 * @RequestMapping("/category/{category}") public ModelAndView
	 * main(@RequestParam String category, CommandMap commandMap) throws Exception {
	 * 
	 * ModelAndView mv = new ModelAndView("/moim/moimlist"); List<Map<String,
	 * Object>> list = moimService.moimList(commandMap.getMap()); Map<String,
	 * Object> map = new HashMap<>(); map.put("category", category);
	 * mv.addObject("list", list);
	 * 
	 * return mv; }
	 */

	@RequestMapping(value = "/main.sosu")
	public String main(HttpSession session) {
		if(session.getAttribute("M_TYPE") != null) {
			if(session.getAttribute("M_TYPE").equals("A")) {
				return "redirect:/admin/memberlist.sosu";
			}
		}
		 return "main_layout";
	}
	
	@RequestMapping( "/{MO_CATEGORY}.sosu")
	public ModelAndView mainList(@PathVariable String MO_CATEGORY, CommandMap commandMap, HttpSession session) throws Exception {
		
		commandMap.getMap().put("MO_CATEGORY", MO_CATEGORY);
		
		ModelAndView mv = new ModelAndView("/mainlist");
		mv.setViewName("mainlist");
		
				
		List<Map<String, Object>> molist  = mainService.moimList(commandMap.getMap(), session, commandMap);
		List<Map<String, Object>> frlist  = mainService.freeList(commandMap.getMap(), session);
		List<Map<String, Object>> relist  = mainService.reviewList(commandMap.getMap(), session);
		mv.addObject("molist", molist);
		mv.addObject("frlist", frlist);
		mv.addObject("relist", relist);
		mv.addObject("sessionss",session.getAttribute("M_IDX"));
		
		return mv;
	}

//	@RequestMapping( "/{MO_CATEGORY}.sosu")
//	public String mainList(@PathVariable String MO_CATEGORY, ModelMap model, CommandMap commandMap) throws Exception {
//		
//		commandMap.getMap().put("MO_CATEGORY", MO_CATEGORY);
//		
//		model.addAttribute("molist",mainService.moimList(commandMap.getMap()));
//		model.addAttribute("frlist",mainService.freeList(commandMap.getMap()));
//		model.addAttribute("relist",mainService.reviewList(commandMap.getMap()));
//		
//		return "mainlist";
//	}
}