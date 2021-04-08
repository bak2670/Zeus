package com.koreait.inquire;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.Dbconn;
import com.koreait.db.SqlMapConfig;

public class inquireDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";

	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public inquireDAO() {
		sqlsession = ssf.openSession(true); // openSession(true) 설정시 자동 commit
		// System.out.println("마이바티스 설정 성공");
	}

	// 상점문의
	public List<HashMap<String, String>> myshop_inquire(String idx) {
		List<HashMap<String, String>> inquireList = sqlsession.selectList("member.myshop_inquire", idx);

		return inquireList;

	}

	public String myshop_inquire1(String idx) {
		String myshop_inquire_name = sqlsession.selectOne("member.myshop_inquire2", idx);

		return myshop_inquire_name;
	}

	// 내상점에 내가 남기는 상점문의 i_storeidx에 i_memidx가 i_content로 문의 남김 i_productIdx는 10000으로 통일
	public int reply(inquireDTO inquire, String m_idx, String i_storeidx) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("i_memidx", m_idx);
		dataMap.put("i_storeidx", i_storeidx);
		dataMap.put("i_content", inquire.getContent());

		System.out.println(dataMap);
		
		return sqlsession.insert("member.myshop_inquire3", dataMap);
	}

//	public int replyYourshop(inquireDTO inquire, String m_idx, String i_storeidx, String p_idx) {
//		HashMap<String, String> dataMap = new HashMap<>();
//		dataMap.put("i_memidx", m_idx);
//		dataMap.put("i_storeidx", i_storeidx);
//		dataMap.put("i_productidx", p_idx);
//		dataMap.put("i_content", inquire.getContent());
//
//		System.out.println(dataMap);
//		
//		return sqlsession.insert("member.myshop_inquire3", dataMap);
//	}
	
	// 상품상세 문의하기 입력부분
	public int proinq(String m_idx, String p_idx, String p_memidx, String i_content) {
		try {
			sql = "insert into tb_inquire(i_memidx, i_productidx, i_storeidx, i_content) values (?,?,?,?)";
			conn = Dbconn.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_idx);
			pstmt.setString(2, p_idx);
			pstmt.setString(3, p_memidx);
			pstmt.setString(4, i_content);

			if (pstmt.executeUpdate() >= 1) {
				return 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	
	// 상품상세 문의하기 출력부분
	public List<HashMap<String, String>> inquire(String idx) {
		List<HashMap<String, String>> inquireList = sqlsession.selectList("member.inquire", idx);

		return inquireList;

	}

	public String inquire1(String idx) {
		String inquire1_name = sqlsession.selectOne("member.inquire1", idx);

		return inquire1_name;
	}

}
