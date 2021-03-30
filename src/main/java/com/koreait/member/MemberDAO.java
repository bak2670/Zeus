package com.koreait.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.SqlMapConfig;

public class MemberDAO {

   Connection conn;
   PreparedStatement pstmt;
   String sql = "";
   ResultSet rs;
   
   SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
   SqlSession sqlsession;
   
   public MemberDAO() {
      sqlsession = ssf.openSession(true);
      System.out.println("마이바티스 설정 성공");
   }
   
   public boolean kakaoCheck(MemberDTO member) {
      HashMap<String, String> dataMap = new HashMap<>();
      dataMap.put("m_kakaoemail", member.getKakaoemail());
      System.out.println(member.getKakaoemail());
      
      if((Integer)sqlsession.selectOne("Member.kakaoCheck",dataMap) == 1) {
         return true;
      }
      return false;
   }
   
   public boolean naverCheck(MemberDTO member) {
	      HashMap<String, String> dataMap = new HashMap<>();
	      dataMap.put("m_naveremail", member.getNaveremail());
	      System.out.println(member.getNaveremail());
	      
	      if((Integer)sqlsession.selectOne("Member.naverCheck",dataMap) == 1) {
	         return true;
	      }
	      return false;
	   }
   
   public int join(MemberDTO member) {
      HashMap<String, String> dataMap = new HashMap<>();
      
      dataMap.put("m_username", member.getUsername());
      dataMap.put("m_naveremail", member.getNaveremail());
      dataMap.put("m_kakaoemail", member.getKakaoemail());
      dataMap.put("m_ssn1", member.getSsn1());
      dataMap.put("m_ssn2", member.getSsn2());
      dataMap.put("m_hp", member.getHp());
      
      return sqlsession.insert("Member.join", dataMap);
      
   }
   
   public MemberDTO kakaojoin(MemberDTO member) {
	      HashMap<String, String> dataMap = new HashMap<>();
	      dataMap.put("m_kakaoemail", member.getKakaoemail());
	      dataMap = sqlsession.selectOne("Member.kakaologin", dataMap);
	      
	      if(dataMap != null) {
		         member.setIdx(Integer.parseInt(String.valueOf(dataMap.get("m_idx"))));
		         member.setUsername(dataMap.get("m_username"));
		         return member;
		      }
	      return null;
	   }
   
   public MemberDTO naverjoin(MemberDTO member) {
	      HashMap<String, String> dataMap = new HashMap<>();
	      dataMap.put("m_naveremail", member.getNaveremail());
	      dataMap = sqlsession.selectOne("Member.naverlogin", dataMap);
	      
	      if(dataMap != null) {
		         member.setIdx(Integer.parseInt(String.valueOf(dataMap.get("m_idx"))));
		         member.setUsername(dataMap.get("m_username"));
		         return member;
		      }
	      return null;
	   }
   
}