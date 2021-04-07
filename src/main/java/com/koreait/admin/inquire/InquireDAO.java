package com.koreait.admin.inquire;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.admin.db.Dbconn;
import com.koreait.admin.db.SqlMapConfig;

public class InquireDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public InquireDAO() {
		sqlsession = ssf.openSession(true); // openSession(true) 설정시 자동 commit
		System.out.println("마이바티스 설정 성공!");
	}
	
	
	

	public List<HashMap<String,String>> inquire(String idx) {
		List<HashMap<String,String>> inquireList = sqlsession.selectList("Member.inquire", idx);
		
			
		return inquireList;
			
	}

	public String inquire1(String idx){
		String inquire1_name = sqlsession.selectOne("Member.inquire1", idx);
			
		return inquire1_name;
	}
	
	
	
	public int inqdel(String p_idx) {
		
		sql = "delete from tb_inquire where i_productidx=?";
		try{
			
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_idx);
			if(pstmt.executeUpdate() != 0) {
				return 1;
			}
			
			
			
	}catch(Exception e) {
		e.printStackTrace();
	}
		return 0;
	}
	
}
