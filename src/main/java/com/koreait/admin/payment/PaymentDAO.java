package com.koreait.admin.payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.koreait.admin.db.Dbconn;

public class PaymentDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	String sql = "";
	
	List<PaymentDTO> paymentList = new ArrayList<>();
	
	public List<PaymentDTO> selectPayment(int start, int pagePerCount){
		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_payment order by pm_idx desc limit ?, ?";
			pstmt = conn.prepareStatement(sql); 
            pstmt.setInt(1, start);
            pstmt.setInt(2, pagePerCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PaymentDTO payment = new PaymentDTO();
				payment.setIdx(rs.getInt("pm_idx"));
				payment.setSellerIdx(rs.getInt("pm_sellerIdx"));
				payment.setBuyerIdx(rs.getInt("pm_buyerIdx"));
				payment.setProductIdx(rs.getInt("pm_productIdx"));
				payment.setRegdate(rs.getString("pm_regdate").substring(0,10));
				paymentList.add(payment);
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return paymentList;
	}
	
	public List<PaymentDTO> searchPayment(String payment_search, String searchPayment) {
		try {
			conn = Dbconn.getConnection();
			if (payment_search.equals("판매자이름")) {
				sql = "select * from tb_payment join tb_member on tb_payment.pm_sellerIdx = tb_member.m_idx where m_username like '%' ? '%' order by m_idx desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchPayment);
				rs = pstmt.executeQuery();
			} else if (payment_search.equals("구매자이름")) {
				sql = "select * from tb_payment join tb_member on tb_payment.pm_buyerIdx = tb_member.m_idx where m_username like '%' ? '%' order by m_idx desc"; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchPayment);
				rs = pstmt.executeQuery();
			}else if (payment_search.equals("상품명")) {
				sql = "select * from tb_payment join tb_product on tb_payment.pm_productIdx = tb_product.p_idx where p_name like '%' ? '%' order by p_idx desc"; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchPayment);
				rs = pstmt.executeQuery();
			}
			
			while(rs.next()) {
				PaymentDTO payment = new PaymentDTO();
				payment.setIdx(rs.getInt("pm_idx"));
				payment.setSellerIdx(rs.getInt("pm_sellerIdx"));
				payment.setBuyerIdx(rs.getInt("pm_buyerIdx"));
				payment.setProductIdx(rs.getInt("pm_productIdx"));
				payment.setRegdate(rs.getString("pm_regdate").substring(0,10));
				paymentList.add(payment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paymentList;
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
	public String getProduct(int p_idx) {
		String product = "";
		
		try {
			conn = Dbconn.getConnection();
			sql = "select p_name as product from tb_product where p_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString("product")!=null) {
					product = rs.getString("product");
					
				}else {
					product = "삭제된 상품";
				}
			} 
		}catch(Exception e) { 
			e.printStackTrace();
		}
		return product; 
	}
	
	public String getPrice(int p_idx) {
		String price = "";
		
		try {
			conn = Dbconn.getConnection();
			sql = "select p_price from tb_product where p_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				int p_price = rs.getInt("p_price");
				price = String.valueOf(p_price) + "원";
			} 
		}catch(Exception e) { 
			e.printStackTrace();
		}
		return price; 
	}
		
	public int page() {
		int totalCount = 0;
		try { 
			conn = Dbconn.getConnection();
			sql = "select count(pm_idx) as total from tb_payment";
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
