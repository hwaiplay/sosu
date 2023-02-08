package second.sosu.members.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import second.sosu.common.dao.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO{
   
   
   //아이디 중복 확인
   public int checkId(Map<String, Object> map) throws Exception{
      return Integer.parseInt(selectOne("members.checkId", map).toString());
   }
   
   //닉네임 중복 확인
   public int checkNickname(Map<String, Object> map) throws Exception{
      return Integer.parseInt(selectOne("members.checkNickname", map).toString());
   }
   
   //회원가입
   public void join(Map<String, Object> map) throws Exception{
      insert("members.join", map);
   }
   
   //프로필 이미지 등록
   public void profileRegister(Map<String, Object> map) throws Exception{
      insert("members.profileRegister", map);
   }
   
   //프로필 이미지 업로드
   public void profileUpdate(Map<String, Object> map) throws Exception{
      update("members.profileUpdate", map);
   }
   
   //로그인 시, 비밀번호 유효성 검사
   @SuppressWarnings("unchecked") 
   public Map<String,Object> checkPassword(Map<String,Object> map) throws Exception{
      return (Map<String,Object>)selectOne("members.checkPassword",map);
   }
   
   //로그인
   @SuppressWarnings("unchecked") 
   public Map<String,Object> login(Map<String,Object> map) throws Exception{
      return (Map<String,Object>)selectOne("members.login",map);
   }
   
   //프로필 체크
   @SuppressWarnings("unchecked") 
   public List<Map<String,Object>> profileCheck(Map<String,Object> map) throws Exception{
      
      return (List<Map<String,Object>>)selectList("members.profileGet",map);
   }
   
   //아이디찾기
   @SuppressWarnings("unchecked")
   public Map<String,Object> findId(Map<String,Object> map) throws Exception{
      return (Map<String,Object>)selectOne("members.findId",map);
   }
   
   
   //비밀번호찾기
   @SuppressWarnings("unchecked")
   public Map<String,Object> findPw(Map<String,Object> map) throws Exception{
      return (Map<String,Object>)selectOne("members.findPw",map);
   }
   
   //마이페이지
   @SuppressWarnings("unchecked")
   public List<List<Map<String,Object>>> mypage(Map<String, Object> map) throws Exception{
      
      List<List<Map<String,Object>>> mypageInfo = new ArrayList<>();
      
      //공통 목록
      mypageInfo.add(selectList("members.mypageNE",map)); //mypageInfo[0]
      mypageInfo.add(selectList("members.mypageStarFloat",map)); //mypageInfo[1]
      mypageInfo.add(selectList("members.mypageStarInt",map)); //mypageInfo[2]
      
      //내가 개설한 모임
      mypageInfo.add(selectList("members.mypageOpenMoim", map)); //mypageInfo[3]
      //내가 개설한 모임 현재 인원 수
      for(int i=0 ; i<mypageInfo.get(3).size() ; i++) {   
         Map<String,Object> openMoimMember = (Map<String,Object>)selectOne("members.mypageMoimMember",mypageInfo.get(3).get(i).get("MO_IDX"));
         mypageInfo.get(3).get(i).put("MOIMMEMBER", openMoimMember.get("MOIMMEMBER"));
      }
      
      //참여한 모임
      mypageInfo.add(selectList("members.mypagePartyMoim", map));//mypageInfo[4]
      //내가 참여한 모임 현재 인원 수 
      for(int i=0 ; i<mypageInfo.get(4).size() ; i++) {   
         Map<String,Object> partyMoimMember = (Map<String,Object>)selectOne("members.mypageMoimMember",mypageInfo.get(4).get(i).get("MO_IDX"));
         mypageInfo.get(4).get(i).put("MOIMMEMBER", partyMoimMember.get("MOIMMEMBER"));
      }
      
      //내가 남긴 리뷰
      mypageInfo.add(selectList("members.mypageMyReview", map)); //mypageInfo[5]
      
      //나에게 남긴 리뷰
      mypageInfo.add(selectList("members.mypageToMeReview", map)); //mypageInfo[6]
      
      //모임 찜
      mypageInfo.add(selectList("members.mypageZzimMoim", map)); //mypageInfo[7]
      //내가 찜한 모임 현재 인원 수 
      for(int i=0 ; i<mypageInfo.get(7).size() ; i++) {   
         Map<String,Object> partyMoimMember = (Map<String,Object>)selectOne("members.mypageMoimMember",mypageInfo.get(7).get(i).get("MO_IDX"));
         mypageInfo.get(7).get(i).put("MOIMMEMBER", partyMoimMember.get("MOIMMEMBER"));
      }
      
      mypageInfo.add(selectList("members.mypageZzimFree",map)); //mypageInfo[8]
      
      //프로필 사진 가져오기
      mypageInfo.add(selectList("members.profileGet",map)); //mypageInfo[9]
      
      return mypageInfo;
   }
   
   //다른 사람 마이페이지
   @SuppressWarnings("unchecked")
   public List<Map<String,Object>> userMypage(Map<String,Object> map) throws Exception{
      return  (List<Map<String,Object>>)selectList("members.userMypage",map);
   }
   
   //수정하기
   public void mypageModify(Map<String,Object> map) throws Exception{
      update("members.mypageModify",map);
   }
   
   //탈퇴
   public void mypageDelete(Map<String,Object> map) throws Exception{
      update("members.mypageDelete", map);
   }
   
   //비공개
   public void mypagePrivate(Map<String,Object> map) throws Exception{
      update("members.mypagePrivate", map);
   }
   
   //신고하기
   public void insertReport(Map<String,Object> map) throws Exception{
      insert("members.insertReport", map);
   }
   
   //찜 삭제 -1/31 변경
   public void deleteZzim(Map<String,Object> map) throws Exception{
      if(map.get("ZZIM_YN").equals("N")) {
         update("members.deleteZzim",map);
      }else{
         update("members.reinsertZzim", map);
      }
   }
   
   
   //관리자 - 회원 기본 리스트 : 페이징 이후
   @SuppressWarnings("unchecked")
   public Map<String, Object> adminMemberList(Map<String, Object> map) throws Exception{
	   
	   if(map.get("listType").equals("adminMemberList")) {
		   return (Map<String, Object>)selectPagingList("members.adminMemberList", map);
	   }else if(map.get("listType").equals("adminReportMemberList")) {
		   return (Map<String, Object>)selectPagingList("members.adminReportMemberList", map);
	   }else {
		   return (Map<String, Object>)selectPagingList("members.adminStopMemberList", map);
	   }
   }
   
   //관리자 - 정지처리
   public void adminMemberStop(Map<String, Object> map) throws Exception{
      if(map.get("STOP_YN").equals("Y")) {
         update("members.adminMemberStop", map);
      }else {
         update("members.adminMemberStopCancle", map);
      }      
   }
   
   // 관리자 - 회원 상세보기
   @SuppressWarnings("unchecked")
   public List<Map<String,Object>> adminMemberDetail(Map<String,Object> map) throws Exception{
      return (List<Map<String,Object>>)selectList("members.adminMemberDetail", map);
   }
   
   // 관리자 - 회원 신고 내역
   @SuppressWarnings("unchecked")
   public List<Map<String,Object>> adminMemberReport(Map<String,Object> map) throws Exception{

      List<Map<String,Object>> reportMap = (List<Map<String,Object>>)selectList("members.adminMemberReport", map);
      
      for(int i=0 ; i<reportMap.size() ; i++) {
         Map<String,Object> m = new HashMap<>();
         m.put("M_IDX", reportMap.get(i).get("R_MEM"));
         List<Map<String,Object>> list = (List<Map<String,Object>>)selectList("members.adminMemberDetail", m.get("M_IDX"));
         reportMap.get(i).put("M_NICKNAME",list.get(0).get("M_NICKNAME"));
      }
      return reportMap;
   }
   
   // 관리자 - 신고 내역 삭제
   public void adminMemberReportDelete(Map<String,Object> map) throws Exception{
      update("members.adminMemberReportDelete",map);
   }
}