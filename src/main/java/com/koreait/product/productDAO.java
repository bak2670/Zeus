package com.koreait.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.SqlMapConfig;

public class productDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public productDAO() {
		sqlsession = ssf.openSession(true);	// openSession(true) 설정시 자동 commit
		//System.out.println("마이바티스 설정 성공");
	}
	
	// String을 db에서 찾아서 해당하는 productDTO를 여러개 리턴 받아야함
	public List<HashMap<String,String>> searchProduct(String searchText) {
		List<HashMap<String,String>> searchList = sqlsession.selectList("product.searchProduct", searchText);
	
		
		return searchList;
	}
	
	// 메인 페이지에서 상품 뿌려주기 위한 mainProduct. 입력값이 없다
	public List<HashMap<String,String>> mainProduct() {
		List<HashMap<String,String>> searchList = sqlsession.selectList("product.mainProduct");
	
		
		return searchList;
	}
	
	public int insertData(productDTO product) {
		HashMap<Object, Object> dataMap = new HashMap<>();   //HashMap클래스, 임포트해서 갖다쓰는거, Object:모든값을 받는다
	     // key, value
	      dataMap.put("p_name", product.getName());
	      dataMap.put("p_price", product.getPrice() );
	      dataMap.put("p_state", product.getState());
	      dataMap.put("p_delcharge", product.getDelcharge());
	      dataMap.put("p_deallocation", product.getDeallocation()); // 지역
	      dataMap.put("p_category", product.getCategory());  //int
	      dataMap.put("p_content", product.getContent());
	      dataMap.put("p_memidx", product.getMemidx());  //int
	      dataMap.put("p_tag", product.getTag());
	      dataMap.put("p_picturepath", product.getPicturepath());
	      dataMap.put("p_picture", product.getPicture());
	      dataMap.put("p_exchange", product.getExchange());
	      dataMap.put("p_priceConsult",product.getPriceConsult());
	      dataMap.put("p_quantity", product.getQuantity());
	      
	      
	      return sqlsession.insert("product.uploadproduct", dataMap); // 마이바티스에 데이터를 보내는 구문
	}
	
	// 상품 번호 입력 받아서 상점 이름 리턴 메소드
	public String storeName(int p_idx) {
		int m_idx = sqlsession.selectOne("product.storeIdx", p_idx);
		
		String store = sqlsession.selectOne("product.storeName", m_idx);
		if(store == null) {
		
			store = "상점" + String.valueOf(m_idx)+"호";
		}
		
		return store;
	}
	
	// 상품 번호 받아서 해당 상점이 올린 상품 개수 리턴
	public int storeProductCnt(int p_idx) {
		int m_idx = sqlsession.selectOne("product.storeIdx", p_idx);
		
		int productCnt = sqlsession.selectOne("product.productCnt",m_idx);
		
		return productCnt;
	}
	
	// 상품 번호 받아서 해당 상점의 팔로워 수 리턴
	public int storeFollwer(int p_idx) {
		int m_idx = sqlsession.selectOne("product.storeIdx", p_idx);
		
		int followCnt = sqlsession.selectOne("product.followCnt",m_idx);
		
		return followCnt;
	}
	
	public List<HashMap<String,String>> recentProduct(int p_idx){
		int m_idx = sqlsession.selectOne("product.storeIdx", p_idx);
		
		List<HashMap<String, String>> productList = sqlsession.selectList("product.recentProduct", m_idx);
		System.out.println(productList);
		return productList;
	}
}
