package com.koreait.following;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.SqlMapConfig;

public class followingDAO {
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public followingDAO() {
		sqlsession = ssf.openSession(true);	// openSession(true) 설정시 자동 commit
		System.out.println("followingDAO 마이바티스 설정 성공");
	}
	
	// m_idx : 내상점의 idx
	// followingList : m_idx가 팔로잉하는 상점 인덱스들의 리스트
	public List<String> followingIdx(String m_idx){
		List<String> followingList = sqlsession.selectList("follow.followingList", m_idx);
		
		return followingList;
	}
	
	// 
	public List<HashMap<String,String>> followingInfo(String m_idx){
		List<HashMap<String,String>> followingInfo = sqlsession.selectList("follow.followingInfo", m_idx);
		
		
		return followingInfo;
	}
	public String storeName(int m_idx) {
		String store = sqlsession.selectOne("product.storeName", m_idx);
		if(store == null) {
		
			store = "상점" + String.valueOf(m_idx)+"호";
		}
		
		return store;
	}

	public int followingcnt(String idx) {
		HashMap<Object, Object> dataMap = new HashMap<>();
		int followcnt = sqlsession.selectOne("follow.followingcnt",idx);
		System.out.println(idx);
		return followcnt;
	}
	
	public int followcnt(String idx) {
		HashMap<Object, Object> dataMap = new HashMap<>();
		int followcnt = sqlsession.selectOne("follow.followcnt",idx);
		System.out.println(idx);
		return followcnt;
	}
	
	public List<HashMap<String,String>> followingphoto(String m_idx){
		List<HashMap<String,String>> followingphoto = sqlsession.selectList("follow.followingphoto", m_idx);
		
		
		return followingphoto;
	}
	
	public String productcnt(int m_idx) {
		HashMap<Object, Object> dataMap = new HashMap<>();
		String followcnt = sqlsession.selectOne("follow.productcnt",m_idx);
		
		return followcnt;
	}
	
	public String youfollow(int m_idx) {
		HashMap<Object, Object> dataMap = new HashMap<>();
		String youfollow = sqlsession.selectOne("follow.youfollow",m_idx);

		return youfollow;
	}
	

	
	public int followingdel(int m_idx) {
		HashMap<Object, Object> dataMap = new HashMap<>(); 
		dataMap.put("f_follow",m_idx);

		
		return sqlsession.delete("follow.followingdel", dataMap); 
	}
	
	public List<String> followIdx(String m_idx){
		List<String> followList = sqlsession.selectList("follow.followList", m_idx);
		
		return followList;
	}
	
	
	public int followingup(int f_memidx, int f_follow) {		
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("f_memidx", String.valueOf(f_memidx));
		dataMap.put("f_follow", String.valueOf(f_follow));
	
		return sqlsession.insert("follow.followingup", dataMap);
		
	}
	
	public int followingdown(int f_memidx, int f_follow) {
		HashMap<String, String> dataMap = new HashMap<>(); 
		dataMap.put("f_memidx", String.valueOf(f_memidx));
		dataMap.put("f_follow", String.valueOf(f_follow));

		
		return sqlsession.delete("follow.followingdown", dataMap); 
	}
	
	
	public int followingYN(String f_memidx, int f_follow) {
		
		HashMap<String, String> dataMap = new HashMap<>(); 
		
		dataMap.put("f_memidx", String.valueOf(f_memidx));
		dataMap.put("f_follow", String.valueOf(f_follow));
			
				
		if(sqlsession.selectOne("follow.followingYN", dataMap) == null) {
			return -1;
		}

		return sqlsession.selectOne("follow.followingYN", dataMap); 
	}

}
