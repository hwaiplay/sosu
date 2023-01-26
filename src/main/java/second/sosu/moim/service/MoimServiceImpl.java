package second.sosu.moim.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import second.sosu.common.domain.CommandMap;
import second.sosu.moim.dao.MoimDao;

@Service("moimService")
public class MoimServiceImpl implements MoimService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "moimDao")
	private MoimDao moimDao;

	// 모임 리스트
	@Override
	public List<Map<String, Object>> moimList(Map<String, Object> map, HttpSession session, CommandMap commandMap)
			throws Exception {
		// TODO Auto-generated method stub
		return moimDao.moimList(map, session, commandMap);
	}

	// 모임 상세보기
	@Override
	public Map<String, Object> moimDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = moimDao.moimDetail(map);
		return resultMap;
	}

	// 모임에 참가한 인원 리스트
	@Override
	public List<Map<String, Object>> moimMemberList(Map<String, Object> map, CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return moimDao.moimMemberList(map, commandMap);
	}

	// 모임 작성
	@Override
	public void moimRegister(Map<String, Object> map, HttpSession session) throws Exception {
		// TODO Auto-generated method stub

		moimDao.moimRegister(map, session);
	}

	// 모임 참가
	@Override
	public void moimJoin(Map<String, Object> map, HttpSession session, CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub

		moimDao.moimJoin(map, session, commandMap);

	}

	// 모임 수정
	@Override
	public void moimModify(Map<String, Object> map) throws Exception {
		moimDao.moimModify(map);
	}

	// 모임 삭제
	@Override
	public void moimDelete(Map<String, Object> map) throws Exception {
		moimDao.moimDelete(map);
	}

}
