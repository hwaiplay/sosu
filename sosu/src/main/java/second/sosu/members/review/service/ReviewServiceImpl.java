package second.sosu.members.review.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import second.sosu.common.domain.CommandMap;
import second.sosu.common.util.FileUtils;
import second.sosu.members.review.dao.ReviewDAO;




@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
   
   Logger log = Logger.getLogger(this.getClass());
   
   @Resource(name = "reviewDAO")
   private ReviewDAO reviewDAO;
   
   @Resource(name="fileUtils")
   private FileUtils fileUtils;
   
//   리뷰 전체 보기
   @Override 
   public List<Map<String, Object>> reviewList(Map<String, Object> map,  HttpSession session) throws Exception {
      
      return reviewDAO.reviewList(map, session);
   }
   
//   리뷰 상세보기
   @Override
   public Map<String, Object> reviewDetail(Map<String, Object> map) throws Exception {
      
      return reviewDAO.reviewDetail(map);
   }
   
//   리뷰 상세보기(사진)
   @Override 
   public List<Map<String, Object>> reviewPhotoList(Map<String, Object> map) throws Exception {
      
      return reviewDAO.reviewPhotoList(map);
   }
   
//   리뷰 상세보기(프로필사진)
   @Override
   public Map<String, Object> memberProfile(Map<String, Object> map) throws Exception {
      
      return reviewDAO.memberProfile(map);
   }
   
//   리뷰 작성(이미지)
   @Override
   public void insertReview(Map<String, Object> map, HttpServletRequest request) throws Exception {
      
      reviewDAO.insertReview(map);
      
      List<Map<String, Object>> list = fileUtils.fileInsert(map, request);
      
      for(int i=0, size=list.size(); i<size; i++) {
         
         reviewDAO.imgInsert(list.get(i));
      }
   }


//   리뷰 수정
	/*
	 * @Override public void updateReview(Map<String, Object> map,
	 * HttpServletRequest request) throws Exception {
	 * 
	 * reviewDAO.updateReview(map);
	 * 
	 * reviewDAO.deletePhotoReview(map);
	 * 
	 * List<Map<String,Object>> list = fileUtils.fileUpdate(map, request);
	 * 
	 * Map<String,Object> tempMap = null;
	 * 
	 * for(int i=0, size=list.size(); i<size; i++){ tempMap = list.get(i);
	 * 
	 * if(tempMap.get("IS_NEW").equals("Y")){ reviewDAO.imgInsert(tempMap); } else{
	 * reviewDAO.updatePhotoReview(tempMap); } } }
	 */
//   리뷰 삭제
   @Override
   public void deleteReview(Map<String, Object> map) throws Exception {
      
      reviewDAO.deleteReview(map);
   }

}