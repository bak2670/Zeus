package com.koreait.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.SqlMapConfig;

public class categoryDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public categoryDAO() {
		sqlsession = ssf.openSession(true);	// openSession(true) 설정시 자동 commit
		//System.out.println("마이바티스 설정 성공");
	}



	public List<String> selectMiddle(String big_ct) {
		List<String> middleList = new ArrayList<>();
		middleList = sqlsession.selectList("category.middle", big_ct);
		// 중복제거
		List<String> resultList = new ArrayList<String>();
		int middleSize = middleList.size();

		
		for (int a = 0; a < middleSize; a++) {
			if (!resultList.contains(middleList.get(a))) {
				resultList.add(middleList.get(a));
			}
		}
		
		return resultList;

	}

	//
	public List<String> selectSmall(String mid_ct, String big_ct) {
		HashMap<String, String> cateMap = new HashMap<>();
		cateMap.put("mid_ct", mid_ct);
		cateMap.put("big_ct", big_ct);
		List<String> smallList = new ArrayList<>();
		smallList = sqlsession.selectList("category.small", cateMap);
		return smallList;

	}
	
	public int getCateIdx(String cateStr) {
		int cateIdx = sqlsession.selectOne("category.cateIdx", cateStr);
		
		return cateIdx;
	}
	
	public int searchCateIdx(String big, String mid, String small) {
		HashMap<String, String> cateMap = new HashMap<>();
		cateMap.put("big", big);
		cateMap.put("mid", mid);
		cateMap.put("small", small);
		int cateIdx = sqlsession.selectOne("category.searchCateIdx",cateMap);
		//System.out.println(cateIdx);
		return cateIdx;
	}
	public String categorySmall(int p_idx) {
		int c_idx = sqlsession.selectOne("category.categoryIdx", p_idx);				
		String cate = sqlsession.selectOne("category.categorySmall", c_idx);
						
		return cate;
	}

}