package com.koreait.admin.withdraw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.koreait.admin.db.Dbconn;
import com.koreait.admin.member.MemberDTO;

public class WithdrawDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	String sql = "";
	
	List<MemberDTO> memberList = new ArrayList<>();
	List<WithdrawDTO> withdrawList = new ArrayList<>();
	
	public List<MemberDTO> withdrawMember(int start, int pagePerCount){
		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_member join tb_withdraw on tb_member.m_idx = tb_withdraw.w_memidx limit ?,?";
			pstmt = conn.prepareStatement(sql); 
            pstmt.setInt(1, start);
            pstmt.setInt(2, pagePerCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setIdx(rs.getInt("m_idx"));
				member.setUsername(rs.getString("m_username"));
				member.setStore(rs.getString("m_store"));
				member.setHp(rs.getString("m_hp"));
				member.setJoindate(rs.getString("m_joindate").substring(0,10));
				memberList.add(member);
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}
	public List<WithdrawDTO> withdrawDetail(int start, int pagePerCount){
		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_withdraw limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
            pstmt.setInt(2, pagePerCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				WithdrawDTO withdraw = new WithdrawDTO();
				withdraw.setIdx(rs.getInt("w_idx"));
				withdraw.setMemidx(rs.getInt("w_memidx"));
				withdraw.setWdate(rs.getString("w_wdate"));
				withdraw.setReason(rs.getString("w_reason"));
				withdrawList.add(withdraw);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return withdrawList;
	}
	
	// 검색부분
	public List<MemberDTO> withdrawSearchMember(String mem_search, String searchMem){
		try {
			conn = Dbconn.getConnection();
			if (mem_search.equals("이름")) {
				sql = "select * from tb_member join tb_withdraw on tb_member.m_idx = tb_withdraw.w_memidx where m_username LIKE '%' ? '%' order by m_idx desc"; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchMem);
				rs = pstmt.executeQuery();
			} else if (mem_search.equals("상점명")) {
				sql = "select * from tb_member join tb_withdraw on tb_member.m_idx = tb_withdraw.w_memidx where m_store like '%' ? '%' order by m_idx desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchMem);
				rs = pstmt.executeQuery();
			}
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setIdx(rs.getInt("m_idx"));
				member.setUsername(rs.getString("m_username"));
				member.setStore(rs.getString("m_store"));
				member.setHp(rs.getString("m_hp"));
				member.setJoindate(rs.getString("m_joindate").substring(0,10));
				memberList.add(member);
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}
	
	public String getWdate(int mem_idx) {
		String date = "";
		try {
			conn = Dbconn.getConnection();
			sql = "select w_wdate as date from tb_withdraw where w_memidx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				date = rs.getString("date").substring(0,10);
			} 
		}catch(Exception e) { 
			e.printStackTrace();
		}
		return date; 
	}
	public String getReason(int mem_idx) {
		String reason = "";
		try {
			conn = Dbconn.getConnection();
			sql = "select w_reason as reason from tb_withdraw where w_memidx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				reason = rs.getString("reason");
			} 
		}catch(Exception e) { 
			e.printStackTrace();
		}
		return reason; 
	}
	
	
	public int proCnt(int p_memidx) {
		try { 
			conn = Dbconn.getConnection();
			
			sql = "select count(p_idx) as cnt from tb_product where p_memidx = ?"; 
			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, p_memidx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				int cnt = rs.getInt("cnt");
				return cnt;
			} 
		}catch(Exception e) { 
			e.printStackTrace();
		
		} 
		return -1; 
	}
	
	public int page() {
		int totalCount = 0;
		try { 
			conn = Dbconn.getConnection();
			
			sql = "select count(w_idx) as total from tb_withdraw";
			
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
