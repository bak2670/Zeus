package com.koreait.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.SqlMapConfig;

public class productDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public productDAO() {
		sqlsession = ssf.openSession(true);	// openSession(true) 설정시 자동 commit
		//System.out.println("마이바티스 설정 성공");
	}
	
	// String을 db에서 찾아서 해당하는 productDTO를 여러개 리턴 받아야함
	public List<HashMap<String,String>> searchProduct(String searchText) {
		List<HashMap<String,String>> searchList = sqlsession.selectList("product.searchProduct", searchText);
	
		
		return searchList;
	}
	
}
