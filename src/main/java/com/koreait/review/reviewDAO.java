package com.koreait.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.SqlMapConfig;

public class reviewDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public reviewDAO() {
		sqlsession = ssf.openSession(true);	// openSession(true) 설정시 자동 commit
		//System.out.println("마이바티스 설정 성공");
	}
	
	
	
	public List<HashMap<String,String>> myshop_question(String questionText) {
		List<HashMap<String,String>> questionList = sqlsession.selectList("member.myshop_question", questionText);
	
		
		return questionList;
	}
	
	
	public List<HashMap<String,String>> myshop_question1(String idx) {
		List<HashMap<String,String>> questionList = sqlsession.selectList("member.myshop_question1", idx);
	
		
		return questionList;
		
	}
	
	public String myshop_question3(String idx){
		String myshop_question3_name = sqlsession.selectOne("member.myshop_question3", idx);
		
		return myshop_question3_name;
	}
	
	
	public int myshop_question_update(reviewDTO review) {
		HashMap<String, String> dataMap = new HashMap<>();   
	     // key, value
	      dataMap.put("rv_idx", (String.valueOf(review.getIdx())));
	      dataMap.put("rv_memidx", (String.valueOf(review.getMemidx())));
	      dataMap.put("rv_productidx", (String.valueOf(review.getProductidx())));
	      dataMap.put("rv_storeidx", (String.valueOf(review.getStoreidx())));
	      dataMap.put("rv_title", review.getTitle()); 
	      dataMap.put("rv_content", review.getContent()); 
	      dataMap.put("rv_regdate", (String.valueOf(review.getRegdate())));
	 
	      
	     
	      return sqlsession.insert("member.uploadproduct", dataMap); 
	}
	
	
	
	

	
}