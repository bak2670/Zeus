package com.koreait.admin.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.koreait.admin.db.Dbconn;

public class NoticeDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	String sql = "";
	
	List<NoticeDTO> noticeList = new ArrayList<>();
	
	public int add(String title, String content) {
		try {
			conn = Dbconn.getConnection();
			sql = "insert into tb_notice(n_title, n_content) values (?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			
			if(pstmt.executeUpdate() >= 1) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public List<NoticeDTO> selectNotice(int start, int pagePerCount){
		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_notice order by n_idx desc limit ?, ?";
			pstmt = conn.prepareStatement(sql); 
            pstmt.setInt(1, start);
            pstmt.setInt(2, pagePerCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setIdx(rs.getInt("n_idx"));
				notice.setTitle(rs.getString("n_title"));
				notice.setContent(rs.getString("n_content"));
				notice.setRegdate(rs.getString("n_regdate").substring(0,10));
				noticeList.add(notice);
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return noticeList;
	}
	
	
	
	public NoticeDTO view(String n_idx) {
		NoticeDTO notice = new NoticeDTO();
		sql = "select * from tb_notice where n_idx=?";
		try{
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,n_idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				notice.setIdx(rs.getInt("n_idx"));
				notice.setTitle(rs.getString("n_title"));
				notice.setContent(rs.getString("n_content"));
				notice.setRegdate(rs.getString("n_regdate").substring(0,10));
				
				return notice;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int delete(String n_idx) {	
		sql = "delete from tb_notice where n_idx=?";
		try{
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,n_idx);
			int result = pstmt.executeUpdate();
			if(result >= 1) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int edit(String title, String content, String n_idx) {
		try {
			conn = Dbconn.getConnection();
			sql = "update tb_notice set n_title=?, n_content=? where n_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, n_idx);
			
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
			sql = "select count(n_idx) as total from tb_notice";
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
