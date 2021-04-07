package com.koreait.admin.faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.koreait.admin.db.Dbconn;

public class FaqDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	String sql = "";
	
	List<FaqDTO> faqList = new ArrayList<>();
	
	public int add(String category, String title, String content) {
		try {
			conn = Dbconn.getConnection();
			sql = "insert into tb_faq(q_category, q_title, q_content) values (?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			
			if(pstmt.executeUpdate() >= 1) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public List<FaqDTO> selectFaq(int start, int pagePerCount){
		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_faq order by q_idx desc limit ?, ?";
			pstmt = conn.prepareStatement(sql); 
            pstmt.setInt(1, start);
            pstmt.setInt(2, pagePerCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FaqDTO faq = new FaqDTO();
				faq.setIdx(rs.getInt("q_idx"));
				faq.setCategory(rs.getString("q_category"));
				faq.setTitle(rs.getString("q_title"));
				faq.setContent(rs.getString("q_content"));
				faqList.add(faq);
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return faqList;
	}
	
	public FaqDTO view(String q_idx) {
		FaqDTO faq = new FaqDTO();
		sql = "select * from tb_faq where q_idx=?";
		try{
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,q_idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				faq.setIdx(rs.getInt("q_idx"));
				faq.setCategory(rs.getString("q_category"));
				faq.setTitle(rs.getString("q_title"));
				faq.setContent(rs.getString("q_content"));
				
				return faq;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int delete(String q_idx) {	
		sql = "delete from tb_faq where q_idx=?";
		try{
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,q_idx);
			int result = pstmt.executeUpdate();
			if(result >= 1) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int edit(String category, String title, String content, String idx) {
		try {
			conn = Dbconn.getConnection();
			sql = "update tb_faq set q_category=?, q_title=?, q_content=? where q_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, idx);
			
			if(pstmt.executeUpdate() >= 1) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	
	
	
	public int page() {
		int totalCount = 0;
		try { 
			conn = Dbconn.getConnection();
			sql = "select count(q_idx) as total from tb_faq";
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
}
