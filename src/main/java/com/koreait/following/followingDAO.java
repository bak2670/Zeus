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
}
