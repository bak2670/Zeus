package com.koreait.admin.block;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.koreait.admin.member.MemberDTO;
import com.koreait.admin.db.Dbconn;

public class BlockDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	String sql = "";
	
	List<BlockDTO> blockList = new ArrayList<>();
	List<MemberDTO> memberList = new ArrayList<>();
	
	public List<MemberDTO> blockMember(int start, int pagePerCount){
		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_member join tb_block on tb_member.m_idx = tb_block.b_memidx limit ?,?";
			pstmt = conn.prepareStatement(sql); 
            pstmt.setInt(1, start);
            pstmt.setInt(2, pagePerCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setIdx(rs.getInt("m_idx"));
				member.setUsername(rs.getString("m_username"));
				member.setStore(rs.getString("m_store"));
				member.setJoindate(rs.getString("m_joindate").substring(0,10));
				memberList.add(member);
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}
	public List<BlockDTO> blockDetail(int start, int pagePerCount){
		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_block limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
            pstmt.setInt(2, pagePerCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BlockDTO block = new BlockDTO();
				block.setIdx(rs.getInt("b_idx"));
				block.setMemidx(rs.getInt("b_memidx"));
				block.setBlockdate(rs.getString("b_blockdate"));
				block.setBlockReason(rs.getString("b_blockreason"));
				blockList.add(block);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return blockList;
	}
	
	//검색
		public List<MemberDTO> blockSearchMember(String mem_search, String searchMem){
			try {
				conn = Dbconn.getConnection();
				if (mem_search.equals("이름")) {
					sql = "select * from tb_member join tb_block on tb_member.m_idx = tb_block.b_memidx where m_username LIKE '%' ? '%' order by m_idx desc"; 
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, searchMem);
					rs = pstmt.executeQuery();
				} else if (mem_search.equals("상점명")) {
					sql = "select * from tb_member join tb_block on tb_member.m_idx = tb_block.b_memidx where m_store like '%' ? '%' order by m_idx desc";
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
		
		public String getblockdate(int mem_idx) {
			String date = "";
			try {
				conn = Dbconn.getConnection();
				sql = "select b_blockdate as date from tb_block where b_memidx = ?";
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
		public String getBlockreason(int mem_idx) {
			String reason = "";
			try {
				conn = Dbconn.getConnection();
				sql = "select b_blockreason as reason from tb_block where b_memidx = ?";
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
	
		public int unblock(String m_idx) {
			try {
				conn = Dbconn.getConnection();
				sql = "delete from tb_block where b_memidx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_idx);
				if(pstmt.executeUpdate() >= 1) {
					return 1;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return 0;
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
			
			sql = "select count(b_idx) as total from tb_block";
			
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
	
	
	public int problock(String p_memidx, String b_blockreason) {
		try {
			sql = "insert into tb_block(b_memidx, b_blockreason) values (?,?)";
			conn = Dbconn.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_memidx);
			pstmt.setString(2, b_blockreason);

			if(pstmt.executeUpdate() >= 1) {
				return 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}
