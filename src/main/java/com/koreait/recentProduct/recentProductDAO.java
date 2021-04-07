package com.koreait.recentProduct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.SqlMapConfig;
import com.koreait.member.memberDTO;

public class recentProductDAO {

	Connection conn;
	PreparedStatement pstmt;
	String sql = "";
	ResultSet rs;

	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public recentProductDAO() {
		sqlsession = ssf.openSession(true);
		System.out.println("마이바티스 설정 성공");
	}
	
	public int recentProduct(int rcp_memidx, int rcp_productidx) {
		HashMap<String, Integer> dataMap = new HashMap<>();


		dataMap.put("rcp_memidx", rcp_memidx);
		dataMap.put("rcp_productidx", rcp_productidx);

		return sqlsession.insert("recentproduct.join", dataMap);
	}
	
	public int recentCheck(int rcp_productidx) {
		HashMap<String, Integer> dataMap = new HashMap<>();
		dataMap.put("rcp_productidx", rcp_productidx);

		return sqlsession.selectOne("recentproduct.recentCheck", dataMap);
	}
	
	public int recentdel(int rcp_productidx) {
		HashMap<String, Integer> dataMap = new HashMap<>();
		dataMap.put("rcp_productidx", rcp_productidx);

		return sqlsession.delete("recentproduct.recentdel", dataMap);
	}
	
	public List<String> recentIdx(int rcp_memidx){
		List<String> recentIdx = sqlsession.selectList("recentproduct.recentIdx", rcp_memidx);
		
		return recentIdx;
	}
	
	public HashMap<String,String> recentphoto(String rcp_productidx){
		HashMap<String,String> recentphoto = sqlsession.selectOne("recentproduct.recentphoto", rcp_productidx);
		
		
		return recentphoto;
	}
	
	public int logoutdel(int rcp_memidx) {
		HashMap<String, Integer> dataMap = new HashMap<>();
		dataMap.put("rcp_memidx", rcp_memidx);

		return sqlsession.delete("recentproduct.logoutdel", dataMap);
	}
	
	
}
