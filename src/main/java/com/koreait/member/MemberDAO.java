package com.koreait.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.SqlMapConfig;

public class memberDAO {

   Connection conn;
   PreparedStatement pstmt;
   String sql = "";
   ResultSet rs;
   
   SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
   SqlSession sqlsession;
   
   public memberDAO() {
      sqlsession = ssf.openSession(true);
      System.out.println("마이바티스 설정 성공");
   }
   
   public boolean kakaoCheck(memberDTO member) {
      HashMap<String, String> dataMap = new HashMap<>();
      dataMap.put("m_kakaoemail", member.getKakaoemail());
      System.out.println(member.getKakaoemail());
      
      if((Integer)sqlsession.selectOne("member.kakaoCheck",dataMap) == 1) {
         return true;
      }
      return false;
   }
   
   public boolean naverCheck(memberDTO member) {
	      HashMap<String, String> dataMap = new HashMap<>();
	      dataMap.put("m_naveremail", member.getNaveremail());
	      System.out.println(member.getNaveremail());
	      
	      if((Integer)sqlsession.selectOne("member.naverCheck",dataMap) == 1) {
	         return true;
	      }
	      return false;
	   }
   
   public int join(memberDTO member) {
      HashMap<String, String> dataMap = new HashMap<>();
      
      dataMap.put("m_username", member.getUsername());
      dataMap.put("m_naveremail", member.getNaveremail());
      dataMap.put("m_kakaoemail", member.getKakaoemail());
      dataMap.put("m_ssn1", member.getSsn1());
      dataMap.put("m_ssn2", member.getSsn2());
      dataMap.put("m_hp", member.getHp());
      
      return sqlsession.insert("member.join", dataMap);
      
   }
   
   public memberDTO kakaojoin(memberDTO member) {
	      HashMap<String, String> dataMap = new HashMap<>();
	      dataMap.put("m_kakaoemail", member.getKakaoemail());
	      dataMap = sqlsession.selectOne("member.kakaologin", dataMap);
	      
	      if(dataMap != null) {
		         member.setIdx(Integer.parseInt(String.valueOf(dataMap.get("m_idx"))));
		         member.setUsername(dataMap.get("m_username"));
		         return member;
		      }
	      return null;
	   }
   
   public memberDTO naverjoin(memberDTO member) {
	      HashMap<String, String> dataMap = new HashMap<>();
	      dataMap.put("m_naveremail", member.getNaveremail());
	      dataMap = sqlsession.selectOne("member.naverlogin", dataMap);
	      
	      if(dataMap != null) {
		         member.setIdx(Integer.parseInt(String.valueOf(dataMap.get("m_idx"))));
		         member.setUsername(dataMap.get("m_username"));
		         return member;
		      }
	      return null;
	   }
   
}