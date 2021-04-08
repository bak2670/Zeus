package com.koreait.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		System.out.println("productDAO 마이바티스 설정 성공");
	}
	
	// String을 db에서 찾아서 해당하는 productDTO를 여러개 리턴 받아야함
	public List<HashMap<String,String>> searchProduct(String searchText) {
		List<HashMap<String,String>> searchList = sqlsession.selectList("product.searchProduct", searchText);
	
		
		return searchList;
	}
	
	// 검색어랑 지역 입력받아서 해당 상품들 리턴하기
	public List<HashMap<String, String>> searchProductArea(String searchText, String cLocation){
		
		HashMap<String, String> conditionMap = new HashMap<>();
		conditionMap.put("searchText", searchText);
		conditionMap.put("cLocation", cLocation);
		
		List<HashMap<String, String>> LocSearchList = sqlsession.selectList("product.searchProductArea", conditionMap);
		
		return LocSearchList;
		
		
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
		return productList;
	}
	
	public List<HashMap<String, String>> cateProduct(int c_idx){
		List<HashMap<String, String>> productList = sqlsession.selectList("product.cateProduct", c_idx);
		
		return productList;
	}
	
	
	// 지헌님 상품상세 dao 시작
	// select 결과 중 null도 있어서 예외 발생 가능
	public productDTO info(String p_idx) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap = sqlsession.selectOne("product.info", p_idx);

		productDTO product = new productDTO();
		
		// null이면 dataMap에 없음
		
		
		if (dataMap != null) {
			product.setIdx(Integer.parseInt(String.valueOf(dataMap.get("p_idx"))));
			product.setName(dataMap.get("p_name"));
			product.setPrice(dataMap.get("p_price"));
			product.setState(dataMap.get("p_state"));
			product.setDelcharge(dataMap.get("p_delcharge"));
			product.setDeallocation(dataMap.get("p_deallocation"));
			product.setRegdate(String.valueOf(dataMap.get("p_regdate"))); 
			product.setZzim(Integer.parseInt(String.valueOf(dataMap.get("p_zzim"))));
			product.setHit(Integer.parseInt(String.valueOf(dataMap.get("p_hit"))));
			product.setCategory(Integer.parseInt(String.valueOf(dataMap.get("p_category"))));
			product.setContent(dataMap.get("p_content"));
			product.setMemidx(Integer.parseInt(String.valueOf(dataMap.get("p_memidx"))));
			product.setTag(dataMap.get("p_tag"));
			product.setPicturepath(dataMap.get("p_picturepath"));
			product.setPicture(dataMap.get("p_picture"));
			product.setExchange(String.valueOf(dataMap.get("p_exchange")));
			product.setPriceConsult(dataMap.get("p_priceConsult"));
			product.setSalesStatus(dataMap.get("p_salesStatus"));
			product.setQuantity(Integer.parseInt(String.valueOf(dataMap.get("p_quantity"))));
			
			
			
			return product;
		}
		return null;

	}
	
	
	public int zzimUp(int p_idx, int m_idx) {
		int zzimOk = sqlsession.update("product.productZzimUp", p_idx);
		
		// 현재 유저의 찜 리스트를 받아와야함
		String zzim = sqlsession.selectOne("product.selectZzim",m_idx);

		System.out.println("before zzim : " + zzim);
		
		// m_zzim이 null인 경우에도 string이 null로 받아와진다

		if(zzim == null) {
			zzim = (String.valueOf(p_idx)) + " "; 
		}else {
			zzim = zzim + (String.valueOf(p_idx)) + " "; 
		}
		System.out.println("after zzim : " + zzim);
		
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("zzimStr", zzim);
		dataMap.put("m_idx", String.valueOf(m_idx));
		//System.out.println(dataMap);
		sqlsession.update("product.updateZzim",dataMap);
		
		return sqlsession.selectOne("product.zzimCnt", p_idx);
		
	}
	
	public int zzimDown(int p_idx, int m_idx) {
		int zzimOk = sqlsession.update("product.productZzimDown", p_idx);
		
		// 현재 유저의 찜 리스트를 받아와야함
		String zzim = sqlsession.selectOne("product.selectZzim",m_idx);
		
		String target = p_idx + " ";
		// zzim에서 p_idx를 지워야함
		System.out.println("before : " + zzim);
		zzim = zzim.replace(target, "");
		System.out.println("after : " + zzim);
		//System.out.println(zzim);
		if(zzim.equals("")) {
			zzim = null;
		}
		
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("zzimStr", zzim);
		dataMap.put("m_idx", String.valueOf(m_idx));
		System.out.println(dataMap);
		
		sqlsession.update("product.updateZzim",dataMap);
		
		return sqlsession.selectOne("product.zzimCnt", p_idx);
		
	}

	/* 승철님 내상점 */
	// 회원 인덱스 -> 회원이 올린 상품 리스트
	public List<HashMap<String,String>> myshop_product(String m_idx) {
		List<HashMap<String,String>> dataMap = sqlsession.selectList("member.myshop_product", m_idx);
		return dataMap;
	}
	
	public String storeNum(String p_idx) {
		String m_idx = sqlsession.selectOne("product.storeNum", p_idx);
				
		return m_idx;
	}
	
	public String hpcall(String p_memidx) {
		String m_hp = sqlsession.selectOne("member.hpcall", p_memidx);
		
		
				
		return m_hp;

	}
	
	
/*	public reviewDTO rev(reviewDTO review) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("rv_idx", "5");
		dataMap = sqlsession.selectOne("review.rev", dataMap);

		if (dataMap != null) {
			review.setIdx(Integer.parseInt(String.valueOf(dataMap.get("rv_idx"))));
			review.setMemidx(Integer.parseInt(String.valueOf(dataMap.get("rv_memidx"))));
			review.setProductidx(Integer.parseInt(String.valueOf(dataMap.get("rv_productidx"))));
			review.setStoreidx(Integer.parseInt(String.valueOf(dataMap.get("rv_storeidx"))));
			review.setContent(dataMap.get("rv_content"));
			review.setRegdate(dataMap.get("rv_regdate"));

			System.out.println("----------------------------------");
			return review;
		}
		return null;
	}

	public memberDTO meminfo(memberDTO member) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("m_idx", "2");
		dataMap = sqlsession.selectOne("member.meminfo", dataMap);

		if (dataMap != null) {
			member.setIdx(Integer.parseInt(String.valueOf(dataMap.get("m_idx"))));
			member.setUsername(dataMap.get("m_username"));
			member.setEmail(dataMap.get("m_email"));
			member.setHp(dataMap.get("m_hp"));
			member.setSsn1(dataMap.get("m_ssn1"));
			member.setSsn2(dataMap.get("m_ssn2"));
			member.setStore(dataMap.get("m_store"));
			member.setJoindate(dataMap.get("m_joindate"));
			member.setLastlogin(dataMap.get("m_lastlogin"));
			member.setIntro(dataMap.get("m_intro"));
			member.setProfilepath(dataMap.get("m_profilepath"));
			member.setProfile(dataMap.get("m_profile"));
			member.setZzim(dataMap.get("m_zzim"));

			System.out.println("----------------------------------");
			return member;
		}
		return null;

	}

	public int reply(inquireDTO inquire) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("i_memidx", "1");
		dataMap.put("i_productidx", "1");
		dataMap.put("i_storeidx", "1");
		dataMap.put("i_content", inquire.getContent());

		System.out.println("------------후기----------------------");
		return sqlsession.insert("inquire.reply", dataMap);
	}

	public inquireDTO showReply(inquireDTO inquire) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("i_idx", "1");
		dataMap = sqlsession.selectOne("inquire.rev", dataMap);

		if (dataMap != null) {
			inquire.setIdx(Integer.parseInt(String.valueOf(dataMap.get("i_idx"))));
			inquire.setMemidx(Integer.parseInt(String.valueOf(dataMap.get("i_memidx"))));
			inquire.setProductidx(Integer.parseInt(String.valueOf(dataMap.get("i_productidx"))));
			inquire.setStoreidx(Integer.parseInt(String.valueOf(dataMap.get("i_storeidx"))));
			inquire.setContent(dataMap.get("i_content"));
			inquire.setRegdate(dataMap.get("i_regdate"));

			System.out.println("----------------------------------");
			return inquire;
		}
		return null;
	}

	public productDTO zzim(productDTO product) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = Dbconn.getConnection();
			if (conn != null) {
				sql = "update tb_product set p_zzim = p_zzim + 1 where p_idx=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(p_idx));
				pstmt.executeUpdate();

				sql = "select * from tb_product where p_idx=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(p_idx));
				rs = pstmt.executeQuery();

				if (rs.next()) {
					product.setName(rs.getString("p_name"));
					product.setPrice(rs.getString("p_price"));
					product.setState(rs.getString("p_state"));
					product.setDelcharge(rs.getString("p_delcharge"));
					product.setDeallocation(rs.getString("p_deallocation"));
					product.setRegdate(rs.getString("p_regdate"));
					product.setZzim(rs.getInt("p_zzim"));
					product.setHit(rs.getInt("p_hit"));
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return product;

	}

	public List<inquireDTO> showReply(String i_productidx) {
		List<inquireDTO> replyList = new ArrayList<>();
		try {
			conn = Dbconn.getConnection();

			sql = "select * from tb_inquire where i_pruductidx = ? order by i_idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, i_productidx);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				inquireDTO reply = new inquireDTO();
				reply.setIdx(rs.getInt("i_idx"));
				reply.setMemidx(rs.getInt("i_memidx"));
				reply.setProductidx(rs.getInt("i_productidx"));
				reply.setStoreidx(rs.getInt("i_storeidx"));
				reply.setContent(rs.getString("i_content"));
				reply.setRegdate(rs.getString("i_regdate"));
				replyList.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return replyList;
	}
	 */
	// 지헌님 상품상세 dao 끝
	 
}