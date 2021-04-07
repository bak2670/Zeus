package com.koreait.admin.onetoone;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.admin.db.Dbconn;
import com.koreait.admin.db.SqlMapConfig;



public class OnetooneDAO {	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	String sql = "";

     

	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public OnetooneDAO() {
		sqlsession = ssf.openSession(true); // openSession(true) 설정시 자동 commit
		
	}
	
    List<OnetooneDTO> inquiryList = new ArrayList<>();
    List<OnetooneDTO> inqList = new ArrayList<>();
	
    
    
	public List<OnetooneDTO> selectInquiry(int start, int pagePerCount){
		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_onetoone order by o_idx desc limit ?, ?";
			pstmt = conn.prepareStatement(sql); 
            pstmt.setInt(1, start);
            pstmt.setInt(2, pagePerCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OnetooneDTO inquiry = new OnetooneDTO();
				inquiry.setIdx(rs.getInt("o_idx"));
				inquiry.setMemidx(rs.getInt("o_memidx"));
				inquiry.setBigCate(rs.getString("o_bigCate"));
				inquiry.setMidCate(rs.getString("o_midCate"));
				inquiry.setContent(rs.getString("o_content"));
				inquiry.setRegdate(rs.getString("o_regdate").substring(0,10));
				inquiry.setAnswerOK(rs.getString("o_answerOK"));
				inquiry.setAnswer(rs.getString("o_answer"));
				inquiry.setAnsdate(rs.getString("o_ansdate"));
				
				inquiryList.add(inquiry);
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return inquiryList;
	}
	
	public int page() {
		int totalCount = 0;
		try { 
			conn = Dbconn.getConnection();
			sql = "select count(o_idx) as total from tb_onetoone";
			pstmt = conn.prepareStatement(sql); 
			rs = pstmt.executeQuery();
			if(rs.next()){
				totalCount = rs.getInt("total");
			}        	
		}catch(Exception e) { 
			e.printStackTrace();
		}
		return totalCount;
		
	}
	
	
	public String getinq(int inquiry) {
		String inqStr = "";
		try {
	         conn = Dbconn.getConnection();
	         sql = "select m_store as store from tb_member where m_idx = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, inquiry);
	         rs = pstmt.executeQuery();
	         if(rs.next()){
	        	 inqStr = rs.getString("store");
	         } 
	      }catch(Exception e) { 
	         e.printStackTrace();
	      }
	      return inqStr; 
	}
	
	public String getinq1(int inquiry) {
		String inqStr = "";
		try {
	         conn = Dbconn.getConnection();
	         sql = "select m_username as name from tb_member where m_idx = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, inquiry);
	         rs = pstmt.executeQuery();
	         if(rs.next()){
	        	 inqStr = rs.getString("name");
	         } 
	      }catch(Exception e) { 
	         e.printStackTrace();
	      }
	      return inqStr; 
	}

	
	public OnetooneDTO inqview(String o_idx) {
		OnetooneDTO inquiry = new OnetooneDTO();
		sql = "select * from tb_onetoone where o_idx=?";
		try{
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, o_idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				inquiry.setIdx(rs.getInt("o_idx"));
				inquiry.setMemidx(rs.getInt("o_memidx"));
				inquiry.setBigCate(rs.getString("o_bigCate"));
				inquiry.setMidCate(rs.getString("o_midCate"));
				inquiry.setContent(rs.getString("o_content"));
				inquiry.setRegdate(rs.getString("o_regdate").substring(0,10));
				inquiry.setAnswerOK(rs.getString("o_answerOK"));
				inquiry.setAnswer(rs.getString("o_answer"));
				inquiry.setAnsdate(rs.getString("o_ansdate"));
				return inquiry;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public int oneEdit(String answer, String ansdate, String o_idx) {
		try {
			conn = Dbconn.getConnection();
			sql = "UPDATE tb_onetoone SET o_answer=?,o_answerOK='Y', o_ansdate=? WHERE o_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, answer);
			pstmt.setString(2, ansdate);
			pstmt.setString(3, o_idx);

			if(pstmt.executeUpdate() >= 1) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	

	public String oneMemName(int o_idx) {
		int m_idx = sqlsession.selectOne("onetoone.oneName", o_idx);				
		String mem = sqlsession.selectOne("onetoone.oneMemName", m_idx);
						
		return mem;
	}

	public String oneMemStore(int o_idx) {
		int m_idx = sqlsession.selectOne("onetoone.oneName", o_idx);				
		String mem = sqlsession.selectOne("onetoone.oneMemStore", m_idx);
						
		return mem;
	}
	
	
	public String oneMemHp(int o_idx) {
		int m_idx = sqlsession.selectOne("onetoone.oneName", o_idx);				
		String mem = sqlsession.selectOne("onetoone.oneMemHp", m_idx);
						
		return mem;
	}
	
	public String oneMemEmail1(int o_idx) {
		int m_idx = sqlsession.selectOne("onetoone.oneName", o_idx);				
		String mem = sqlsession.selectOne("onetoone.oneMemEmail1", m_idx);
						
		return mem;
	}
	
	public String oneMemEmail2(int o_idx) {
		int m_idx = sqlsession.selectOne("onetoone.oneName", o_idx);				
		String mem = sqlsession.selectOne("onetoone.oneMemEmail2", m_idx);
						
		return mem;
	}
	
	
	
	public List<OnetooneDTO> searchinquiry(String mem_search, String searchMem) {
		try {
			conn = Dbconn.getConnection();
			if (mem_search.equals("이름")) {
				sql = "select * from tb_onetoone join tb_member on tb_onetooen.o_memidx = tb_member.m_idx where m_username like '%' ? '%' order by m_idx desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchMem);
				rs = pstmt.executeQuery();
			} else if (mem_search.equals("상점명")) {
				sql = "select * from tb_onetoone join tb_member on tb_onetooen.o_memidx = tb_member.m_idx where m_store like '%' ? '%' order by m_idx desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchMem);
				rs = pstmt.executeQuery();
			}
			
			while (rs.next()) {
				OnetooneDTO inq = new OnetooneDTO();
				inq.setIdx(rs.getInt("o_idx"));
				inq.setMemidx(rs.getInt("o_memidx"));
				inq.setBigCate(rs.getString("o_bigCate"));
				inq.setMidCate(rs.getString("o_midCate"));
				inq.setContent(rs.getString("o_content"));
				inq.setRegdate(rs.getString("o_regdate").substring(0,10));
				inq.setAnswerOK(rs.getString("o_answerOK"));
				inq.setAnswer(rs.getString("o_answer"));
				inq.setAnsdate(rs.getString("o_ansdate"));
				
				inqList.add(inq);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return inqList;
	}
	
	
	
	
	
	
 }     

