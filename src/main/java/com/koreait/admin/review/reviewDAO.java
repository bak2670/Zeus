package com.koreait.admin.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.admin.db.SqlMapConfig;



public class reviewDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public reviewDAO() {
		sqlsession = ssf.openSession(true); // openSession(true) 설정시 자동 commit
		System.out.println("마이바티스 설정 성공!");
	}
	
	
	

	public List<HashMap<String,String>> review(String idx) {
		List<HashMap<String,String>> reviewList = sqlsession.selectList("Member.review", idx);
		
			
		return reviewList;
			
	}

	public String review1(String idx){
		
		String review1_name = sqlsession.selectOne("Member.review1", idx);
		System.out.println(review1_name);	
		return review1_name;
	}
}
