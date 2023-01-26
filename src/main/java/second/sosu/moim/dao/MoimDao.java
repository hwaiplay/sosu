package second.sosu.moim.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import second.sosu.common.dao.AbstractDAO;
import second.sosu.common.domain.CommandMap;

@Repository("moimDao")
public class MoimDao extends AbstractDAO {

	// 모임리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> moimList(Map<String, Object> map, HttpSession session, CommandMap commandMap)
			throws Exception {

		List<Map<String, Object>> moimList = (List<Map<String, Object>>) selectList("moim.moimList", map);

		// 스크랩 유무
		if (session.getAttribute("M_IDX") != null) {

			for (int i = 0; i < moimList.size(); i++) {

				Map<String, Object> moimZzim = new HashMap<>();
				moimZzim.put("M_IDX", session.getAttribute("M_IDX"));
				moimZzim.put("MO_IDX", moimList.get(i).get("MO_IDX"));

				Map<String, Object> zz = (Map<String, Object>) selectOne("moim.moimZzimCheck", moimZzim);

				moimList.get(i).put("MZ_CHECK", zz.get("MZ_CHECK"));
			}

		}

		// 모임 현재 멤버 수
		for (int i = 0; i < moimList.size(); i++) {
			Map<String, Object> moimMemCount = (Map<String, Object>) selectOne("moim.moimMemberCount",
					moimList.get(i).get("MO_IDX"));
			moimList.get(i).put("MOMEM_COUNT", moimMemCount.get("MOMEM_COUNT"));
		}
		// 모임 스크랩 수
		for (int i = 0; i < moimList.size(); i++) {

			Map<String, Object> moimZzimCount = (Map<String, Object>) selectOne("moim.moimZzimCount",
					moimList.get(i).get("MO_IDX"));
			moimList.get(i).put("MZ_COUNT", moimZzimCount.get("MZ_COUNT"));
		}

		return moimList;
	}

	// 모임 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> moimDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("moim.moimDetail", map);
	}

	// 모임에 참가한 인원 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> moimMemberList(Map<String, Object> map, CommandMap commandMap) throws Exception {

		List<Map<String, Object>> moimMemberList = (List<Map<String, Object>>) selectList("moim.moimMemberList");

		// 프사
		for (int i = 0; i < moimMemberList.size(); i++) {
			Map<String, Object> memberProfile = (Map<String, Object>) selectOne("file.memberProfile",
					moimMemberList.get(i).get("M_IDX"));
			moimMemberList.get(i).put("PROFILE", memberProfile.get("PROFILE"));
		}

		return moimMemberList;
	}

	// 모임 작성
	public void moimRegister(Map<String, Object> map, HttpSession seesion) throws Exception {
		insert("moim.moimRegister", map);
	}

	// 모임 수정
	public void moimModify(Map<String, Object> map) throws Exception {
		update("moim.moimModify", map);
	}

	// 모임 삭제
	public void moimDelete(Map<String, Object> map) throws Exception {
		update("moim.moimDelete", map);
	}

	// 모임 참가
	public void moimJoin(Map<String, Object> map, HttpSession seesion, CommandMap commandMap) throws Exception {
		insert("moim.moimJoin", map);
	}

}
