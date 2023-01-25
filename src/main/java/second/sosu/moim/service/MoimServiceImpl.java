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

	@Override
	public List<Map<String, Object>> moimList(Map<String, Object> map, HttpSession session, CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return moimDao.moimList(map, session, commandMap);
	}

	@Override
	public Map<String, Object> moimDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = moimDao.moimDetail(map);
		return resultMap;
	}

	@Override
	public void moimRegister(Map<String, Object> map, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		// String m_idx = (String)session.getAttribute("m_idx");

		// map.put("m_idx", m_id);
		moimDao.moimRegister(map, session);
	}

	@Override
	public void moimJoin(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub

		moimDao.moimJoin(map, request);

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
