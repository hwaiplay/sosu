package second.sosu.moim.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import second.sosu.common.domain.CommandMap;
import second.sosu.moim.service.MoimService;

@Controller
public class MoimController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "moimService")
	private MoimService moimService;

	// 모임 리스트
	@RequestMapping(value = "/moim/{MO_CATEGORY}.sosu")
	public ModelAndView moimList(@PathVariable String MO_CATEGORY,
			@RequestParam(value = "MO_REGION", required = false) String MO_REGION, CommandMap commandMap,
			HttpSession session) throws Exception {

		commandMap.getMap().put("MO_CATEGORY", MO_CATEGORY);

		ModelAndView mv = new ModelAndView("/moim/moimlist");
		mv.setViewName("moim/moimlist");

		moimService.moimClose();

		if (MO_REGION != null) {
			System.out.println("바보" + MO_REGION);
			commandMap.put("MO_REGION", MO_REGION);
		}
		mv.addObject("list", moimService.moimList(commandMap.getMap(), session, commandMap, MO_REGION));

		mv.addObject("sessionss", session.getAttribute("M_IDX"));

		return mv;
	}

	// 모임 찜
	@RequestMapping("/moim/moimZzimInsert.sosu")
	public ModelAndView moimZzimInsert(CommandMap commandMap, HttpSession session) throws Exception {

		List<Map<String, Object>> list = moimService.moimMemberList(commandMap.getMap(), commandMap);

		for (int i = 0; i < list.size(); i++) {
			list.get(i).get("MO_IDX");

			commandMap.put("MO_IDX", list.get(i).get("MO_IDX"));
		}

		commandMap.put("M_IDX", Integer.parseInt(String.valueOf(session.getAttribute("M_IDX"))));

		String cate = commandMap.get("MO_CATEGORY").toString();

		ModelAndView mv = new ModelAndView("redirect:/moim/" + cate + ".sosu");

		moimService.moimZzimInsert(commandMap.getMap(), commandMap, session);

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

		// 모임에 참여 대기중인 인원 리스트
		List<Map<String, Object>> list2 = moimService.moimMemberWait(commandMap.getMap(), commandMap);

		// 모임에서 강퇴 혹은 승인 거절된 인원 리스트
		List<Map<String, Object>> list3 = moimService.moimMemberBanList(commandMap.getMap(), commandMap);

		// 모임이미지 상세보기
		List<Map<String, Object>> Flist = moimService.selectMoimImg(commandMap.getMap(), commandMap);

		ModelAndView mv = new ModelAndView("/moim/moimDetail");
		mv.setViewName("moim/moimDetail");

		mv.addObject("list", list);
		mv.addObject("list2", list2);
		mv.addObject("list3", list3);
		mv.addObject("Flist", Flist);
		mv.addObject("Detail", map);
		mv.addObject("sessionss", session.getAttribute("M_IDX")); // 맴버 시퀀스
		mv.addObject("sessgender", session.getAttribute("M_GENDER")); // 맴버 성별
		mv.addObject("sessage", session.getAttribute("M_JUMIN")); // 맴버 나이

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

	// 모임 조기 마감
	@RequestMapping("/moim/moimSelfClose.sosu")
	public ModelAndView moimSelfClose(CommandMap commandMap) throws Exception {

		Map<String, Object> map = moimService.moimDetail(commandMap.getMap());

		String cate = map.get("MO_CATEGORY").toString();

		String idx = map.get("MO_IDX").toString();

		ModelAndView mv = new ModelAndView("redirect:/moim/" + cate + "/" + idx + ".sosu");

		moimService.moimSelfClose(commandMap.getMap());

		return mv;
	}

	// 모임작성 폼
	@RequestMapping(value = "/moim/moimRegister.sosu")
	public ModelAndView insertForm(CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("/moim/moimRegister");
		mv.setViewName("moim/moimRegister");

		mv.addObject("M_IDX", session.getAttribute("M_IDX"));

		return mv;
	}

	// 모임작성 구동
	@RequestMapping("/moim/moimRegister.pro")
	public ModelAndView moimRegister(@RequestParam("MO_CATEGORY") String MO_CATEGORY, CommandMap commandMap,
			HttpSession session, MultipartHttpServletRequest multiRequest) throws Exception {
		// ajax로 받아오기 위해 @RequestParam 사용

		commandMap.put("M_IDX", Integer.parseInt(String.valueOf(session.getAttribute("M_IDX"))));
		// 개행을 위한...(구현 안됨)
		String MO_DETAIL = (String) (commandMap.getMap().replace("\r\n", "<br>"));
		commandMap.setMap(MO_DETAIL);

		ModelAndView mv = new ModelAndView("redirect:/moim/" + MO_CATEGORY + ".sosu");

		moimService.moimRegister(commandMap.getMap(), session, multiRequest);

		return mv;
	}

	// 모임 수정 폼
	@RequestMapping("/moimModify/{MO_IDX}.sosu")
	public ModelAndView modifyForm(@PathVariable int MO_IDX, CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("/moim/moimModify");
		mv.setViewName("moim/moimModify");

		commandMap.put("MO_IDX", MO_IDX);

		Map<String, Object> map = moimService.moimDetail(commandMap.getMap());

		mv.addObject("modify", map);

		return mv;
	}

	// 모임 수정 구동
	@RequestMapping("/moim/moimModify.pro")
	public ModelAndView moimModify(@RequestParam("MO_CATEGORY") String MO_CATEGORY,
			@RequestParam(value = "chbox[]", required = false) String[] chArr, CommandMap commandMap) throws Exception {
		// ajax로 받아오기 위해 @RequestParam 사용

		Map<String, Object> map = moimService.moimDetail(commandMap.getMap());

		String idx = map.get("MO_IDX").toString();

		ModelAndView mv = new ModelAndView("redirect:/moim/" + MO_CATEGORY + "/" + idx + ".sosu");

		String f_svname = null;

		if (f_svname == null) {
			for (int i = 0; i < chArr.length; i++) {
				f_svname = chArr[i];
				moimService.MoimImgDelete(commandMap.getMap(),f_svname);
			}
		}
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

	// 모임 참가(승인요청이 필요한 경우)
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

	// 모임 탈퇴하기
	@RequestMapping("/moim/moimExit.sosu")
	public ModelAndView moimExit(CommandMap commandMap, HttpSession session) throws Exception {

		Map<String, Object> map = moimService.moimDetail(commandMap.getMap());

		// 모임에 참여한 인원 리스트
		// List<Map<String, Object>> list =
		// moimService.moimMemberList(commandMap.getMap(), commandMap);
		// 탈퇴할 회원의 p_idx
		// int p_idx = Integer.parseInt(list.get(0).get("P_IDX").toString());

		commandMap.put("M_IDX", Integer.parseInt(String.valueOf(session.getAttribute("M_IDX"))));
		commandMap.put("MO_IDX", commandMap.get("MO_IDX"));

		String cate = map.get("MO_CATEGORY").toString();
		String idx = map.get("MO_IDX").toString();

		ModelAndView mv = new ModelAndView("redirect:/moim/" + cate + "/" + idx + ".sosu");

		moimService.moimExit(commandMap.getMap(), session);

		return mv;
	}

}