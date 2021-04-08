package com.koreait.admin.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.koreait.admin.db.Dbconn;

import com.koreait.admin.inquire.InquireDTO;



public class ProductDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	String sql = "";
	
	List<InquireDTO> inquireList = new ArrayList<>();
	List<ProductDTO> proList = new ArrayList<>();
	List<ProductDTO> productList = new ArrayList<>();
	List<ProductDTO> getList = new ArrayList<>();
	

	
	
	public List<ProductDTO> mem_detail(int start, int pagePerCount, String m_idx){
	      try {
	         conn = Dbconn.getConnection();
	         sql = "select * from tb_product where p_memidx = ? order by p_idx desc limit ?, ? ";
	         pstmt = conn.prepareStatement(sql); 
	         pstmt.setString(1, m_idx);
             pstmt.setInt(2, start);
             pstmt.setInt(3, pagePerCount);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            ProductDTO product = new ProductDTO();
	            product.setIdx(rs.getInt("p_idx"));
	            product.setName(rs.getString("p_name"));
	            product.setPrice(rs.getString("p_price"));
	            product.setState(rs.getString("p_state"));
	            product.setDelcharge(rs.getString("p_delcharge"));
	            product.setDeallocation(rs.getString("p_deallocation"));
	            product.setRegdate(rs.getString("p_regdate"));
	            product.setZzim(rs.getInt("p_zzim"));
	            product.setHit(rs.getInt("p_hit"));
	            product.setCategory(rs.getInt("p_category"));
	            product.setContent(rs.getString("p_content"));
	            product.setMemidx(rs.getInt("p_memidx"));
	            product.setTag(rs.getString("p_tag"));
	            product.setPicture(rs.getString("p_picture"));
	            product.setExchange(rs.getString("p_exchange"));
	            product.setPriceConsult(rs.getString("p_priceConsult"));
	            product.setSalesStatus(rs.getString("p_salesStatus"));
				product.setQuantity(rs.getInt("p_quantity"));
	            productList.add(product);
	         }   
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return productList;
	   }
	
	public ProductDTO prodetail(String p_idx) {
		ProductDTO product = new ProductDTO();
		sql = "select * from tb_product where p_idx=?";
		try{
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				product.setIdx(rs.getInt("p_idx"));
				product.setName(rs.getString("p_name"));
				product.setPrice(rs.getString("p_price"));
				product.setState(rs.getString("p_state"));
				product.setDelcharge(rs.getString("p_delcharge"));
				product.setDeallocation(rs.getString("p_deallocation"));
				product.setRegdate(rs.getString("p_regdate"));
				product.setZzim(rs.getInt("p_zzim"));
				product.setHit(rs.getInt("p_hit"));
				product.setCategory(rs.getInt("p_category"));
				product.setContent(rs.getString("p_content"));
				product.setMemidx(rs.getInt("p_memidx"));
				product.setTag(rs.getString("p_tag"));
				product.setPicturepath(rs.getString("p_picturepath"));
				product.setPicture(rs.getString("p_picture"));
				product.setExchange(rs.getString("p_exchange"));
				product.setPriceConsult(rs.getString("p_priceConsult"));
				product.setSalesStatus(rs.getString("p_salesStatus"));
				product.setQuantity(rs.getInt("p_quantity"));
				return product;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getCate1(int category) {
		String cateStr = "";
		try {
	         conn = Dbconn.getConnection();
	         sql = "select c_big as cateBig from tb_category where c_idx = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, category);
	         rs = pstmt.executeQuery();
	         if(rs.next()){
	        	 cateStr = rs.getString("cateBig");
	         } 
	      }catch(Exception e) { 
	         e.printStackTrace();
	      }
	      return cateStr; 
	}
	public String getCate2(int category) {
		String cateStr = "";
		try {
	         conn = Dbconn.getConnection();
	         sql = "select c_middle as cateMiddle from tb_category where c_idx = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, category);
	         rs = pstmt.executeQuery();
	         if(rs.next()){
	        	 cateStr = rs.getString("cateMiddle");
	         } 
	      }catch(Exception e) { 
	         e.printStackTrace();
	      }
	      return cateStr; 
	}
	
	public String getCate3(int category) {
		String cateStr = "";
		try {
	         conn = Dbconn.getConnection();
	         sql = "select c_small as cateSmall from tb_category where c_idx = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, category);
	         rs = pstmt.executeQuery();
	         if(rs.next()){
	        	 cateStr = rs.getString("cateSmall");
	         } 
	      }catch(Exception e) { 
	         e.printStackTrace();
	      }
	      return cateStr; 
	}
	
	public String getSeller(int idx) { 
		String sellerName = "";
		try {
			conn = Dbconn.getConnection();
			sql = "select m_store as sellerName from tb_member where m_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sellerName = rs.getString("sellerName");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return sellerName;
	}
	
	public List<ProductDTO> proList(int start, int pagePerCount) {
		 
		try { 
			conn = Dbconn.getConnection();			
			sql = "select * from tb_product order by p_idx desc limit ?, ?"; 
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, start);
			pstmt.setInt(2, pagePerCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				ProductDTO pro = new ProductDTO(); 
				pro.setIdx(rs.getInt("p_idx"));
				pro.setName(rs.getString("p_name"));
				pro.setPrice(rs.getString("p_price"));
				pro.setState(rs.getString("p_state"));
				pro.setDelcharge(rs.getString("p_delcharge"));
				pro.setDeallocation(rs.getString("p_deallocation"));
				pro.setRegdate(rs.getString("p_regdate"));
				pro.setZzim(rs.getInt("p_zzim"));
				pro.setHit(rs.getInt("p_hit"));
				pro.setCategory(rs.getInt("p_category"));
				pro.setContent(rs.getString("p_content"));
				pro.setMemidx(rs.getInt("p_memidx"));
				pro.setTag(rs.getString("p_tag"));
				pro.setPicturepath(rs.getString("p_picturepath"));
				pro.setPicture(rs.getString("p_picture"));
				pro.setExchange(rs.getString("p_exchange"));
				pro.setPriceConsult(rs.getString("p_priceConsult"));
				pro.setSalesStatus(rs.getString("p_salesStatus"));
				pro.setQuantity(rs.getInt("p_quantity"));
				proList.add(pro); 
			} 
		}catch(Exception e) { 
			e.printStackTrace();
		
		} 
		return proList; 
	}
	
	// 검색
	   public List<ProductDTO> searchProduct(String pro_search, String searchPro, int start, int pagePerCount) {
	       
	      try { 
	         conn = Dbconn.getConnection();
	            //System.out.print(searchPro);
	            if (pro_search.equals("상품명")) {
	               sql = "select * from tb_product where p_name LIKE '%' ? '%' order by p_idx desc limit ?, ?";
	               pstmt = conn.prepareStatement(sql);
	               pstmt.setString(1, searchPro);
		   		   pstmt.setInt(2, start);
				   pstmt.setInt(3, pagePerCount);
	               rs = pstmt.executeQuery();
	            } else if (pro_search.equals("상점명")) {
	               sql = "select * from tb_product join tb_member on tb_product.p_memidx = tb_member.m_idx  where m_store like '%' ? '%' order by m_idx desc limit ?, ?";
	               pstmt = conn.prepareStatement(sql);
	               pstmt.setString(1, searchPro);			
	               pstmt.setInt(2, start);
	               pstmt.setInt(3, pagePerCount);
	               rs = pstmt.executeQuery();
	            }
	         
	         while(rs.next()) { 
	            ProductDTO pro = new ProductDTO(); 
	            pro.setIdx(rs.getInt("p_idx"));
	            pro.setName(rs.getString("p_name"));
	            pro.setPrice(rs.getString("p_price"));
	            pro.setState(rs.getString("p_state"));
	            pro.setDelcharge(rs.getString("p_delcharge"));
	            pro.setDeallocation(rs.getString("p_deallocation"));
	            pro.setRegdate(rs.getString("p_regdate"));
	            pro.setZzim(rs.getInt("p_zzim"));
	            pro.setHit(rs.getInt("p_hit"));
	            pro.setCategory(rs.getInt("p_category"));
	            pro.setContent(rs.getString("p_content"));
	            pro.setMemidx(rs.getInt("p_memidx"));
	            pro.setTag(rs.getString("p_tag"));
	            pro.setPicturepath(rs.getString("p_picturepath"));
	            pro.setPicture(rs.getString("p_picture"));
	            pro.setExchange(rs.getString("p_exchange"));
	            pro.setPriceConsult(rs.getString("p_priceConsult"));
	            pro.setSalesStatus(rs.getString("p_salesStatus"));
				pro.setQuantity(rs.getInt("p_quantity"));
	            proList.add(pro); 
	         } 
	      }catch(Exception e) { 
	         e.printStackTrace();
	      
	      } 
	      return proList; 
	   }
	
	public ProductDTO prodel(String p_idx) {
		ProductDTO prodel = new ProductDTO();
		sql = "delete from tb_product where p_idx=?";
		try{
			
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_idx);
			int rs = pstmt.executeUpdate();
			
			
	}catch(Exception e) {
		e.printStackTrace();
	}
		return prodel;
	}

	public int update(String name, String price, String state, String delcharge, String content, String exchange, String salesStatus, String p_idx) {
		try {
					conn = Dbconn.getConnection();
					sql = "update tb_product set p_name=?, p_price=?, p_state=?, p_delcharge=?, p_content=?, p_exchange=?, p_salesStatus=? where p_idx=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, name);
					pstmt.setString(2, price);
					pstmt.setString(3, state);
					pstmt.setString(4, delcharge);
					pstmt.setString(5, content);
					pstmt.setString(6, exchange);
					pstmt.setString(7, salesStatus);
					pstmt.setString(8, p_idx);		
					
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
			
			sql = "select count(p_idx) as total from tb_product";
			
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
	
	public List<InquireDTO> inq(String i_productidx) {
		try{
			conn = Dbconn.getConnection();
			sql = "select * from tb_inquire where i_productidx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, i_productidx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				InquireDTO inquire = new InquireDTO();
				inquire.setIdx(rs.getInt("i_idx"));
				inquire.setMemidx(rs.getInt("i_memidx"));
				inquire.setProductidx(rs.getInt("i_productidx"));
				inquire.setStoreidx(rs.getInt("i_storeidx"));
				inquire.setContent(rs.getString("i_content"));
				inquire.setRegdate(rs.getString("i_regdate"));
				inquireList.add(inquire);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return inquireList;
	}
	

	
	
	
}
