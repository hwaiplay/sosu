package second.sosu.members.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface MemberService {
   
   public Map<String,Object> checkPassword(Map<String,Object> map) throws Exception;
   
   // 아이디 중복확인
   int checkId(Map<String, Object> map) throws Exception;
   
   // 닉네임 중복확인
   int checkNickname(Map<String, Object> map) throws Exception;

   // 회원가입
   void join(Map<String, Object> map) throws Exception;

   // 로그인
   Map<String, Object> login(Map<String, Object> map) throws Exception;

   // 프로필 사진 여부
   List<Map<String, Object>> profileCheck(Map<String, Object> map) throws Exception;

   // 프로필 삽입
   void profileRegister(Map<String, Object> map, HttpServletRequest request) throws Exception;

   // 아이디찾기
   Map<String, Object> findId(Map<String, Object> map) throws Exception;

   // 비밀번호찾기
   Map<String, Object> findPw(Map<String, Object> map) throws Exception;

   // 마이페이지
   public List<List<Map<String, Object>>> mypage(Map<String, Object> map) throws Exception;
   
   //다른 사람 마이페이지
   public List<Map<String, Object>> userMypage(Map<String, Object> map) throws Exception;
   
   //마이페이지 수정
   void mypageModify(Map<String, Object> map, HttpServletRequest request, HttpSession session) throws Exception;

   // 탈퇴하기
   public void mypageDelete(Map<String, Object> map) throws Exception;

   // 프로필 비공개
   public void mypagePrivate(Map<String, Object> map) throws Exception;
   
   // 신고하기
   public void insertReport(Map<String, Object> map) throws Exception;
   
   //찜 삭제
   public void deleteZzim(Map<String,Object> map) throws Exception;
   
   
   //관리자 - 회원 기본 리스트
   //페이징 이후 회원 기본 리스트
   public Map<String, Object> adminMemberList(Map<String, Object> map) throws Exception;
   
   //관리자 - 회원 상세보기
   public List<Map<String,Object>> adminMemberDetail(Map<String,Object> map) throws Exception;
   
   //관리자 - 신고내역
   public List<Map<String, Object>> adminMemberReport(Map<String,Object> map) throws Exception;
   
   //관리자 - 신고 내역 삭제
   public void adminMemberReportDelete(Map<String,Object> map) throws Exception;
   
   //관리자 - 회원정지
   public void adminMemberStop(Map<String, Object> map) throws Exception;
      

}