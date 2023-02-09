//package second.sosu.members.member.dao;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.stereotype.Repository;
//
//import lombok.AllArgsConstructor;
//import lombok.Getter;
//import lombok.Setter;
//import lombok.ToString;
//import second.sosu.common.domain.CommandMap;
//import second.sosu.members.member.service.MemberService;
//
//@Getter
//@Setter
//@AllArgsConstructor
//@ToString
//@Repository("mypageQuery")
//public class MypageQuery {
//	
//	private MemberService ms;
//	
//	public List<List<Map<String,Object>>> query(CommandMap command, int check) throws Exception{
//		
//		List<Map<String,Object>> list = new ArrayList<>();
//		List<List<Map<String,Object>>> ob = new ArrayList<>();
//		Map<String,Map<String,Object>> hash = new HashMap<>();
////		Map<String,Object> map = new HashMap<>();
//		
//		//공통부분
//		String[] a1 = {"mypageNE","mypageStarFloat", "mypageStarInt"}; 
//		
//		
//		
//		if(check==1) {
//			for(int i=0 ; i<3 ; i++) {
//				ob.add(ms.mypage(command.getMap(), a1[i]));
////				list.add(ms.mypage(command.getMap(), a1[i]));
////				hash.put(a1[i], ms.mypage(command.getMap(), a1[i]));
//			}
//			
//		}
//		return ob;
//	}
//
//}
//
