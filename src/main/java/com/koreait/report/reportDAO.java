package com.koreait.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.SqlMapConfig;
import com.koreait.member.memberDTO;

public class reportDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public reportDAO() {
		sqlsession = ssf.openSession(true);	// openSession(true) 설정시 자동 commit
		//System.out.println("마이바티스 설정 성공");
	}
	
	public int reportInsert(String rp_memidx, String rp_reporteridx, String rp_reason, String rp_productidx, String rp_count) {
		HashMap<String, String> dataMap = new HashMap<>();

		dataMap.put("rp_memidx", rp_memidx);
		dataMap.put("rp_reporteridx", rp_reporteridx);
		dataMap.put("rp_reason", rp_reason);
		dataMap.put("rp_productidx", rp_productidx);
		dataMap.put("rp_count", rp_count);


		return sqlsession.insert("report.reportInsert", dataMap);

	}
	
	
	
}
