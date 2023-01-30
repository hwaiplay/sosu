package second.sosu.moim.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import second.sosu.common.domain.CommandMap;
import second.sosu.moim.service.MoimService;

@Controller
public class MoimController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "moimService")
	private MoimService moimService;

	// 모임 리스트
	@RequestMapping("/moim/{MO_CATEGORY}.sosu")
	public ModelAndView moimList(@PathVariable String MO_CATEGORY, CommandMap commandMap, HttpSession session)
			throws Exception {

		commandMap.getMap().put("MO_CATEGORY", MO_CATEGORY);

		ModelAndView mv = new ModelAndView("/moim/moimlist");
		System.out.println("+++++++++++++++++" + commandMap.getMap());

		List<Map<String, Object>> list = moimService.moimList(commandMap.getMap(), session, commandMap);
		mv.addObject("list", list);
		mv.addObject("sessionss", session.getAttribute("M_IDX"));

		return mv;
	}

	// 모임 상세보기
	@RequestMapping("/moim/{MO_CATEGORY}/{MO_IDX}.sosu")
	public ModelAndView moimDetail(@PathVariable int MO_IDX, @PathVariable String MO_CATEGORY, CommandMap commandMap,
			HttpSession session) throws Exception {

		commandMap.getMap().put("MO_CATEGORY", MO_CATEGORY);
		commandMap.getMap().put("MO_IDX", MO_IDX);

		Map<String, Object> map = moimService.moimDetail(commandMap.getMap());

		// 모임에 참여한 인원 리스트
		List<Map<String, Object>> list = moimService.moimMemberList(commandMap.getMap(), commandMap);
		List<Map<String, Object>> list2 = moimService.moimMemberWait(commandMap.getMap(), commandMap);

		ModelAndView mv = new ModelAndView("/moim/moimDetail");
		mv.addObject("list", list);
		mv.addObject("list2", list2);
		mv.addObject("Detail", map);
		mv.addObject("sessionss", session.getAttribute("M_IDX"));  //맴버 시퀀스
		mv.addObject("sessgender", session.getAttribute("M_GENDER"));  //맴버 성별
		mv.addObject("sessage", session.getAttribute("M_IDX"));  //맴버 나이
		

		return mv;
	}

	// 모임 참여승인 구동
	@RequestMapping("/moim/moimWaitApprove.sosu")
	public ModelAndView moimWaitApprove(CommandMap commandMap) throws Exception {
		// ajax로 받아오기 위해 @RequestParam 사용

		Map<String, Object> map = moimService.moimDetail(commandMap.getMap());

		String cate = map.get("MO_CATEGORY").toString();

		String idx = map.get("MO_IDX").toString();

		ModelAndView mv = new ModelAndView("redirect:/moim/" + cate + "/" + idx + ".sosu");

		moimService.moimWaitApprove(commandMap.getMap());

		return mv;
	}

	// 모임 강퇴 구동
	@RequestMapping("/moim/moimMemberBan.sosu")
	public ModelAndView moimMemberBan(CommandMap commandMap) throws Exception {
		// ajax로 받아오기 위해 @RequestParam 사용

		Map<String, Object> map = moimService.moimDetail(commandMap.getMap());

		String cate = map.get("MO_CATEGORY").toString();

		String idx = map.get("MO_IDX").toString();

		ModelAndView mv = new ModelAndView("redirect:/moim/" + cate + "/" + idx + ".sosu");

		moimService.moimMemberBan(commandMap.getMap());

		return mv;
	}

	// 모임작성 폼
	@RequestMapping(value = "/moim/moimRegister.sosu")
	public ModelAndView insertForm(CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("/moim/moimRegister");
		mv.addObject("M_IDX", session.getAttribute("M_IDX"));

		return mv;
	}

	// 모임작성 구동
	@RequestMapping("/moim/moimRegister.pro")
	public ModelAndView moimRegister(CommandMap commandMap, HttpSession session) throws Exception {

		List<Map<String, Object>> list = moimService.moimList(commandMap.getMap(), session, commandMap);

		commandMap.put("M_IDX", Integer.parseInt(String.valueOf(session.getAttribute("M_IDX"))));
		// 개행을 위한...(구현 안됨)
		String MO_DETAIL = (String) (commandMap.getMap().replace("\r\n", "<br>"));
		commandMap.setMap(MO_DETAIL);

		String cate = list.get(0).get("MO_CATEGORY").toString();// 리스트에서 카테고리 값 스트링으로 가져오기

		ModelAndView mv = new ModelAndView("redirect:/moim/" + cate + ".sosu");

		moimService.moimRegister(commandMap.getMap(), session);

		return mv;
	}

	// 모임 수정 폼
	@RequestMapping("/moimModify/{MO_IDX}.sosu")
	public ModelAndView modifyForm(@PathVariable int MO_IDX, CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("/moim/moimModify");

		commandMap.put("MO_IDX", MO_IDX);

		Map<String, Object> map = moimService.moimDetail(commandMap.getMap());

		mv.addObject("modify", map);

		return mv;
	}

	// 모임 수정 구동
	@RequestMapping("/moim/moimModify.pro")
	public ModelAndView moimModify(@RequestParam("MO_CATEGORY") String MO_CATEGORY, CommandMap commandMap)
			throws Exception {
		// ajax로 받아오기 위해 @RequestParam 사용

		Map<String, Object> map = moimService.moimDetail(commandMap.getMap());

		String idx = map.get("MO_IDX").toString();

		ModelAndView mv = new ModelAndView("redirect:/moim/" + MO_CATEGORY + "/" + idx + ".sosu");

		moimService.moimModify(commandMap.getMap());

		return mv;
	}

	// 모임 삭제
	@RequestMapping("/moim/moimDelete.sosu")
	public ModelAndView moimDelete(CommandMap commandMap) throws Exception {

		Map<String, Object> map = moimService.moimDetail(commandMap.getMap());

		String cate = map.get("MO_CATEGORY").toString();

		ModelAndView mv = new ModelAndView("redirect:/moim/" + cate + ".sosu");

		moimService.moimDelete(commandMap.getMap());

		return mv;
	}

	// 모임 참가(승인요청이 필요 없는 경우)
	@RequestMapping("/moim/moimJoin.sosu")
	public ModelAndView moimJoin(CommandMap commandMap, HttpSession session) throws Exception {

		Map<String, Object> map = moimService.moimDetail(commandMap.getMap());

		commandMap.put("M_IDX", Integer.parseInt(String.valueOf(session.getAttribute("M_IDX"))));

		commandMap.put("MO_IDX", commandMap.get("MO_IDX"));

		String cate = map.get("MO_CATEGORY").toString();
		String idx = map.get("MO_IDX").toString();

		ModelAndView mv = new ModelAndView("redirect:/moim/" + cate + "/" + idx + ".sosu");

		moimService.moimJoin(commandMap.getMap(), session, commandMap);

		return mv;
	}

	// 모임 참가(승인요청이 필요 없는 경우)
	@RequestMapping("/moim/moimJoinPermit.sosu")
	public ModelAndView moimJoinPermit(CommandMap commandMap, HttpSession session) throws Exception {

		Map<String, Object> map = moimService.moimDetail(commandMap.getMap());

		commandMap.put("M_IDX", Integer.parseInt(String.valueOf(session.getAttribute("M_IDX"))));

		commandMap.put("MO_IDX", commandMap.get("MO_IDX"));

		String cate = map.get("MO_CATEGORY").toString();
		String idx = map.get("MO_IDX").toString();

		ModelAndView mv = new ModelAndView("redirect:/moim/" + cate + "/" + idx + ".sosu");

		moimService.moimJoinPermit(commandMap.getMap(), session, commandMap);

		return mv;
	}

}
