package com.koreait.admin.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.admin.db.Dbconn;
import com.koreait.admin.db.SqlMapConfig;

public class CategoryDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	List<CategoryDTO> inquireList = new ArrayList<>();

	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public CategoryDAO() {
		sqlsession = ssf.openSession(true); // openSession(true) 설정시 자동 commit

	}

	public String categoryBig(int p_idx) {
		int c_idx = sqlsession.selectOne("category.categoryIdx", p_idx);
		String cate = sqlsession.selectOne("category.categoryBig", c_idx);

		return cate;
	}

	public String categoryMiddle(int p_idx) {
		int c_idx = sqlsession.selectOne("category.categoryIdx", p_idx);
		String cate = sqlsession.selectOne("category.categoryMiddle", c_idx);

		return cate;
	}

	public String categorySmall(int p_idx) {
		int c_idx = sqlsession.selectOne("category.categoryIdx", p_idx);
		String cate = sqlsession.selectOne("category.categorySmall", c_idx);

		return cate;
	}

}
