package com.koreait.yourshop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.SqlMapConfig;
import com.koreait.product.productDTO;

public class YourshopDAO {

	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public YourshopDAO() {
		sqlsession = ssf.openSession(true);		// openSession(true) 설정시 자동 commit
		System.out.println("마이바티스 설정 성공");
	}

	public YourshopDTO selectData(int m_idx) {
		YourshopDTO yourshop = new YourshopDTO();
		yourshop.setM_idx(m_idx);
		yourshop.setM_store(String.valueOf(sqlsession.selectOne("Yourshop.select_storename", m_idx)));
		yourshop.setP_count(Integer.parseInt(String.valueOf(sqlsession.selectOne("Yourshop.select_pCount", m_idx))));
		yourshop.setF_count(Integer.parseInt(String.valueOf(sqlsession.selectOne("Yourshop.select_fCount", m_idx))));
		return yourshop;

	}

}
