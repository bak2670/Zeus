package com.koreait.block;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.SqlMapConfig;
import com.koreait.product.productDTO;

public class blockDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public blockDAO() {
		sqlsession = ssf.openSession(true);	// openSession(true) 설정시 자동 commit
		//System.out.println("마이바티스 설정 성공");
	}
	
	public int blockidx(String b_memidx) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("b_memidx", b_memidx);

		return sqlsession.selectOne("block.blockidx", dataMap);
	}
	
	public blockDTO blockinfo(String b_memidx) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap = sqlsession.selectOne("block.blockinfo", b_memidx);

		blockDTO block = new blockDTO();
		
		if (dataMap != null) {
			block.setMemidx(Integer.parseInt(String.valueOf(dataMap.get("b_memidx"))));
			block.setBlockdate(String.valueOf(dataMap.get("b_blockdate")));
			block.setBlockreason(String.valueOf(dataMap.get("b_blockreason")));
		
			return block;
		}
		return null;
	}
	
}
