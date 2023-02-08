package second.sosu.moim.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import second.sosu.common.domain.CommandMap;
import second.sosu.common.util.FileUtils;
import second.sosu.moim.dao.MoimDao;

@Service("moimService")
public class MoimServiceImpl implements MoimService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "moimDao")
	private MoimDao moimDao;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	// 모임 리스트
	@Override
	public List<Map<String, Object>> moimList(Map<String, Object> map, HttpSession session, CommandMap commandMap,
			String MO_REGION) throws Exception {
		// TODO Auto-generated method stub
		return moimDao.moimList(map, session, commandMap);
	}

	// 모임 상세보기
	@Override
	public Map<String, Object> moimDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = moimDao.moimDetail(map);

		return resultMap;
	}

	// 모임 상세 이미지
	@Override
	public List<Map<String, Object>> selectMoimImg(Map<String, Object> map, CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return moimDao.selectMoimImg(map, commandMap);
	}

	// 모임 이미지 삭제
	@Override
	public void MoimImgDelete(Map<String, Object> map, String f_svname) throws Exception {
		moimDao.MoimImgDelete(map, f_svname);
	}

	// 모임에 참가한 인원 리스트
	@Override
	public List<Map<String, Object>> moimMemberList(Map<String, Object> map, CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return moimDao.moimMemberList(map, commandMap);
	}

	// 모임참여에 대기중인 인원 리스트
	@Override
	public List<Map<String, Object>> moimMemberWait(Map<String, Object> map, CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return moimDao.moimMemberWait(map, commandMap);
	}

	// 모임에서 강퇴당한 인원 리스트
	@Override
	public List<Map<String, Object>> moimMemberBanList(Map<String, Object> map, CommandMap commandMap)
			throws Exception {
		// TODO Auto-generated method stub
		return moimDao.moimMemberBanList(map, commandMap);
	}

	// 모임 작성
	@Override
	public void moimRegister(Map<String, Object> map, HttpSession session, MultipartHttpServletRequest multiRequest)
			throws Exception {

		moimDao.moimRegister(map, session);

		if (multiRequest != null) {
			List<Map<String, Object>> list = fileUtils.fileInsert(map, multiRequest);

			for (int i = 0, size = list.size(); i < size; i++) {
			}
		}
	}

	// 모임 참가
	@Override
	public void moimJoin(Map<String, Object> map, HttpSession session, CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub

		moimDao.moimJoin(map, session, commandMap);

	}

	// 모임 참가 (승인이 필요한 경우)
	@Override
	public void moimJoinPermit(Map<String, Object> map, HttpSession session, CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub

		moimDao.moimJoinPermit(map, session, commandMap);

	}

	// 모임 수정
	@Override
	public void moimModify(Map<String, Object> map) throws Exception {
		moimDao.moimModify(map);
	}

	// 모임 참여승인
	@Override
	public void moimWaitApprove(Map<String, Object> map) throws Exception {
		moimDao.moimWaitApprove(map);
	}

	// 모임 맴버 강퇴
	@Override
	public void moimMemberBan(Map<String, Object> map) throws Exception {
		moimDao.moimMemberBan(map);
	}

	// 모임 삭제
	@Override
	public void moimDelete(Map<String, Object> map) throws Exception {
		moimDao.moimDelete(map);
	}

	// 모임 조기 마감
	@Override
	public void moimSelfClose(Map<String, Object> map) throws Exception {
		moimDao.moimSelfClose(map);
	}

	// 모임 자동 마감
	@Override
	public void moimClose() throws Exception {
		moimDao.moimClose();
	}

	// 모임 탈퇴하기
	@Override
	public void moimZzimInsert(Map<String, Object> map, CommandMap commandMap, HttpSession session) throws Exception {
		moimDao.moimZzimInsert(map, session, commandMap);
	}

	// 모임 탈퇴하기
	@Override
	public void moimExit(Map<String, Object> map, HttpSession session) throws Exception {
		moimDao.moimExit(map);
	}

}