package com.koreait.payment;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.SqlMapConfig;

public class paymentDAO {	
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public paymentDAO() {
		sqlsession = ssf.openSession(true);
		System.out.println("마이바티스 설정 성공");
	}
	
	public int buyProduct(String m_idx, String p_idx) {

		// 구매 리스트 추가
		HashMap<String, String> buyInfo = new HashMap<>();
		buyInfo.put("buyerIdx", m_idx);
		int sellerIdx = sqlsession.selectOne("product.storeIdx", Integer.parseInt(p_idx));
		buyInfo.put("sellerIdx", String.valueOf(sellerIdx));
		buyInfo.put("productIdx", p_idx);
		if (sqlsession.insert("payment.buyProduct", buyInfo) != 0) {
		
			// 상품 상태 업데이트
			if(sqlsession.update("payment.updateProduct", p_idx) != 0) {
				return 1;
			};
			
		}
		return 0;
	
	}
	
	public List<HashMap<String,String>> tradeList(String select, String m_idx){
		// select : 구매 / 판매
		// m_idx의 거래 내역
		List<HashMap<String, String>> tList = null;
		
		if(select.equals("구매")) {
			tList = sqlsession.selectList("payment.selectBuy", m_idx);

			
		}else if(select.equals("판매")) {
			tList = sqlsession.selectList("payment.selectSell", m_idx);
			
			
		}else {
			// 에러
		}

		return tList;
	}
}
