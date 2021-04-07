package com.koreait.admin.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.koreait.admin.db.Dbconn;
import com.koreait.admin.member.MemberDTO;



public class ReportDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	String sql = "";
	
	List<ReportDTO> reportList = new ArrayList<>();
	
	public List<ReportDTO> selectMember(int start, int pagePerCount){
		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_report order by rp_idx desc limit ?, ?";
			pstmt = conn.prepareStatement(sql); 
            pstmt.setInt(1, start);
            pstmt.setInt(2, pagePerCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReportDTO report = new ReportDTO();
				report.setIdx(rs.getInt("rp_idx"));
				report.setMemidx(rs.getInt("rp_memidx"));
				report.setReporteridx(rs.getInt("rp_reporteridx"));
				report.setReason(rs.getString("rp_reason"));
				report.setProductidx(rs.getInt("rp_productidx"));
				report.setRegdate(rs.getString("rp_regdate").substring(0,10));
				report.setCount(rs.getInt("rp_count"));
				reportList.add(report);
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return reportList;
	}
	
	// 검색
	public List<ReportDTO> searchMember(String mem_search, String searchMem){
		try {
			conn = Dbconn.getConnection();
			System.out.print(searchMem);
			if (mem_search.equals("이름")) {
				sql = "select * from tb_report join tb_member on tb_report.rp_memidx = tb_member.m_idx where m_username like '%' ? '%' order by m_idx desc"; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchMem);
				rs = pstmt.executeQuery();
			} else if (mem_search.equals("상점명")) {
				sql = "select * from tb_report join tb_member on tb_report.rp_memidx = tb_member.m_idx where m_store like '%' ? '%' order by m_idx desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchMem);
				rs = pstmt.executeQuery();
			}
			
			while(rs.next()) {
				ReportDTO report = new ReportDTO();
				report.setIdx(rs.getInt("rp_idx"));
				report.setMemidx(rs.getInt("rp_memidx"));
				report.setReporteridx(rs.getInt("rp_reporteridx"));
				report.setReason(rs.getString("rp_reason"));
				report.setProductidx(rs.getInt("rp_productidx"));
				report.setRegdate(rs.getString("rp_regdate").substring(0,10));
				report.setCount(rs.getInt("rp_count"));
				reportList.add(report);
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return reportList;
	}
	
	
	public String getMemname(int mem_idx) {
		String memname = "";
		try {
			conn = Dbconn.getConnection();
			sql = "select m_username as memname from tb_member where m_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				memname = rs.getString("memname");
			} 
		}catch(Exception e) { 
			e.printStackTrace();
		}
		return memname; 
	}
	public String getMemstore(int mem_idx) {
		String memstore = "";
		try {
			conn = Dbconn.getConnection();
			sql = "select m_store as memstore from tb_member where m_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString("memstore")!=null) {
					memstore = rs.getString("memstore");
				}else {
					memstore = "상점"+Integer.toString(mem_idx)+"호";
				}
			} 
		}catch(Exception e) { 
			e.printStackTrace();
		}
		return memstore; 
	}
	public String getProduct(int productIdx) {
		String product = "";
		try {
			conn = Dbconn.getConnection();
			sql = "select p_name as product from tb_product where p_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productIdx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				product = rs.getString("product");
			} 
		}catch(Exception e) { 
			e.printStackTrace();
		}
		return product; 
	}
	
	
	public int page() {
		int totalCount = 0;
		try { 
			conn = Dbconn.getConnection();
			
			sql = "select count(rp_idx) as total from tb_report";
			
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
