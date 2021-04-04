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
		//System.out.println(member.getKakaoemail());

		if ((Integer) sqlsession.selectOne("member.kakaoCheck", dataMap) == 1) {
			return true;
		}
		return false;
	}

	public boolean naverCheck(memberDTO member) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("m_naveremail", member.getNaveremail());
		//System.out.println(member.getNaveremail());

		if ((Integer) sqlsession.selectOne("member.naverCheck", dataMap) == 1) {
			return true;
		}
		return false;
	}

	public boolean phoneCheck(memberDTO member) {
		HashMap<String, String> dataMap = new HashMap<>();

		dataMap.put("m_username", member.getUsername());
		dataMap.put("m_ssn1", member.getSsn1());
		dataMap.put("m_ssn2", member.getSsn2());
		dataMap.put("m_hp", member.getHp());
		//System.out.println(member.getHp());

		if ((Integer) sqlsession.selectOne("member.phoneCheck", dataMap) == 1) {
			return true;
		}
		return false;
	}

	public boolean duplicate(memberDTO member) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("m_hp", member.getHp());
		//System.out.println(member.getHp());

		if ((Integer) sqlsession.selectOne("member.duplicate", dataMap) == 1) {
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

		if (dataMap != null) {
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

		if (dataMap != null) {
			member.setIdx(Integer.parseInt(String.valueOf(dataMap.get("m_idx"))));
			member.setUsername(dataMap.get("m_username"));
			return member;
		}
		return null;
	}

	public memberDTO phonejoin(memberDTO member) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("m_hp", member.getHp());
		dataMap = sqlsession.selectOne("member.phonelogin", dataMap);

		if (dataMap != null) {
			member.setIdx(Integer.parseInt(String.valueOf(dataMap.get("m_idx"))));
			member.setUsername(dataMap.get("m_username"));
			return member;
		}
		return null;
	}

	public int kakaoupdate(memberDTO member) {
		HashMap<String, String> dataMap = new HashMap<>();

		dataMap.put("m_kakaoemail", member.getKakaoemail());
		dataMap.put("m_hp", member.getHp());

		return sqlsession.update("member.kakaoupdate", dataMap);
	}

	public int naverupdate(memberDTO member) {
		HashMap<String, String> dataMap = new HashMap<>();

		dataMap.put("m_naveremail", member.getNaveremail());
		dataMap.put("m_hp", member.getHp());

		return sqlsession.update("member.naverupdate", dataMap);
	}
	
	
	// 10이 들어있는데 1이 포함된다고 판단되서 갈아엎어야함
	public int zzimYN(int p_idx, String m_idx) {
		
		// m_idx가 찜한 리스트 스트링으로 받아오기
		String zzimStr = sqlsession.selectOne("member.zzimString",m_idx);
		
		System.out.println(zzimStr);
		
		String[] zzimArr = zzimStr.split(" ");

		if(zzimStr != null) {
			for(String str : zzimArr) {
				if(str.equals(String.valueOf(p_idx))) {
					return 1;
				}
				
			}
			return 0;
		}
		
		return 0;

		
	}
}