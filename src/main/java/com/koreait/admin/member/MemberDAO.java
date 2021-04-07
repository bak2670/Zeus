package com.koreait.admin.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.koreait.admin.db.Dbconn;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	String sql = "";
	
	List<MemberDTO> memberList = new ArrayList<>();
	
	public List<MemberDTO> selectMember(int start, int pagePerCount){
		
		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_member order by m_idx desc limit ?, ?";
			pstmt = conn.prepareStatement(sql); 
            pstmt.setInt(1, start);
            pstmt.setInt(2, pagePerCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setIdx(rs.getInt("m_idx"));
				member.setUsername(rs.getString("m_username"));
				member.setKakaoemail(rs.getString("m_kakaoemail"));
				member.setNaveremail(rs.getString("m_naveremail"));
				member.setHp(rs.getString("m_hp"));
				member.setSsn1(rs.getString("m_ssn1"));
				member.setSsn2(rs.getString("m_ssn2"));
				member.setStore(rs.getString("m_store"));
				member.setJoindate(rs.getString("m_joindate").substring(0,10));
				member.setLastlogin(rs.getString("m_lastlogin").substring(0,10));
				member.setIntro(rs.getString("m_intro"));
				member.setProfile(rs.getString("m_profile"));
				memberList.add(member);
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}

	
	public List<MemberDTO> searchMember(String mem_search, String searchMem) {
		try {
			conn = Dbconn.getConnection();
			if (mem_search.equals("이름")) {
				sql = "select * from tb_member where m_username LIKE '%' ? '%' order by m_idx desc"; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchMem);
				rs = pstmt.executeQuery();
			} else if (mem_search.equals("상점명")) {
				sql = "select * from tb_member where m_store like '%' ? '%' order by m_idx desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchMem);
				rs = pstmt.executeQuery();
			}
			
			while (rs.next()) {
				System.out.println(rs.getInt("m_idx"));
				MemberDTO member = new MemberDTO();
				member.setIdx(rs.getInt("m_idx"));
				member.setUsername(rs.getString("m_username"));
				member.setKakaoemail(rs.getString("m_kakaoemail"));
				member.setNaveremail(rs.getString("m_naveremail"));
				member.setHp(rs.getString("m_hp"));
				member.setSsn1(rs.getString("m_ssn1"));
				member.setSsn2(rs.getString("m_ssn2"));
				member.setStore(rs.getString("m_store"));
				member.setJoindate(rs.getString("m_joindate").substring(0, 10));
				member.setLastlogin(rs.getString("m_lastlogin").substring(0, 10));
				member.setIntro(rs.getString("m_intro"));
				member.setProfile(rs.getString("m_profile"));
				
				memberList.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberList;
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
	
	public int birth(int idx) {
		try {
			conn = Dbconn.getConnection();
			
			sql = "select m_Ssn1,m_Ssn2 from tb_member where m_idx = ?";
			pstmt = conn.prepareStatement(sql); 
            pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int birthMsg =  Integer.parseInt(rs.getString("m_ssn2").substring(0,1));

				return birthMsg;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int setStorename(int m_idx) {
		try {
			conn = Dbconn.getConnection();
			sql = "update tb_member set m_store=? where m_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "상점"+m_idx+"호");
			pstmt.setInt(2, m_idx);
			if(pstmt.executeUpdate() >= 1) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int edit(String username, String store, String kakaoemail, String naveremail, String hp, String intro, String m_idx) {
		try {
			conn = Dbconn.getConnection();
			sql = "update tb_member set m_username=?, m_store=?, m_kakaoemail=?, m_naveremail=?, m_hp=?, m_intro=? where m_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, store);
			pstmt.setString(3, kakaoemail);
			pstmt.setString(4, naveremail);
			pstmt.setString(5, hp);
			pstmt.setString(6, intro);
			pstmt.setString(7, m_idx);
			if(pstmt.executeUpdate() >= 1) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int blockMem(String m_idx, String blockReason) {
		try {
			conn = Dbconn.getConnection();
			sql = "insert into tb_block(b_memidx,b_blockreason) values (?, ?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_idx);
			pstmt.setString(2, blockReason);
			if(pstmt.executeUpdate() >= 1) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int delMem(String m_idx) {
		try {
			conn = Dbconn.getConnection();
			sql = "delete from tb_member where m_idx = ?";
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
	
	
	public int gender(int idx) {
		try {
			conn = Dbconn.getConnection();
			
			sql = "select m_Ssn2 from tb_member where m_idx = ?";
			pstmt = conn.prepareStatement(sql); 
            pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int genderNum =  Integer.parseInt(rs.getString("m_ssn2").substring(0,1));

				return genderNum;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public MemberDTO view(String m_idx) {
		MemberDTO member = new MemberDTO();
		sql = "select * from tb_member where m_idx=?";
		try{
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,m_idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member.setIdx(rs.getInt("m_idx"));
				member.setUsername(rs.getString("m_username"));
				member.setKakaoemail(rs.getString("m_kakaoemail"));
				member.setNaveremail(rs.getString("m_naveremail"));
				member.setHp(rs.getString("m_hp"));
				member.setSsn1(rs.getString("m_ssn1"));
				member.setSsn2(rs.getString("m_ssn2"));
				member.setStore(rs.getString("m_store"));
				member.setJoindate(rs.getString("m_joindate").substring(0,10));
				member.setLastlogin(rs.getString("m_lastlogin"));
				member.setIntro(rs.getString("m_intro"));
				member.setProfile(rs.getString("m_profile"));
				return member;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	
	
	public int page() {
		int totalCount = 0;
		try { 
			conn = Dbconn.getConnection();
			
			sql = "select count(m_idx) as total from tb_member";
			
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
