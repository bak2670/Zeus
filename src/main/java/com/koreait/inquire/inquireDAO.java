package com.koreait.inquire;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.SqlMapConfig;


public class inquireDAO {
	
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public inquireDAO() {
		sqlsession = ssf.openSession(true);	// openSession(true) 설정시 자동 commit
		//System.out.println("마이바티스 설정 성공");
	}
	
	
	
	
	public List<HashMap<String,String>> myshop_inquire(String idx) {
		List<HashMap<String,String>> inquireList = sqlsession.selectList("member.myshop_inquire", idx);
	
		
		return inquireList;
		
	}
	
	
	public String myshop_inquire1(String idx){
		String myshop_inquire_name = sqlsession.selectOne("member.myshop_inquire2", idx);
		
		return myshop_inquire_name;
	}
	
	
	
	public int reply(inquireDTO inquire) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("i_memidx", "1");
		dataMap.put("i_productidx", "1");
		dataMap.put("i_storeidx", "1");
		dataMap.put("i_content", inquire.getContent());

			
		return sqlsession.insert("member.myshop_inquire3", dataMap);
	}

}
