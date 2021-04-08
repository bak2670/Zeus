package com.koreait.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.SqlMapConfig;

public class memberDAO {

	Connection conn;
	PreparedStatement pstmt;
	String sql = "";
	ResultSet rs;

	List<memberDTO> memberList = new ArrayList<>();
	List<memberDTO> memberList1 = new ArrayList<>();
	
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
		
		if(zzimStr != null) {
			String[] zzimArr = zzimStr.split(" ");
			
			for(String str : zzimArr) {
				if(str.equals(String.valueOf(p_idx))) {
					return 1;
				}
				
			}
			return 0;
		}
		
		return 0;
	}
	
	// 내상점 찜부분
	public List<HashMap<String, String>> zzimList(String m_idx){
		List<HashMap<String,String>> zzimList= new ArrayList<>();
		// 찜한 번호들 받아서 배열로 만들기
		String zzimStr = sqlsession.selectOne("member.zzimString",m_idx);
		if(zzimStr != null) {
			String[] zzimArr = zzimStr.split(" ");
			
			for(String str : zzimArr) {
				HashMap<String, String> dataMap = sqlsession.selectOne("product.info", str);
				zzimList.add(dataMap);
			}
		}else {
			return null;
		}
		return zzimList;
	}
	// 회원번호 입력 받아서 회원 정보 DTO 리턴
	public memberDTO info(String m_idx) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap = sqlsession.selectOne("member.meminfo", m_idx);
		
		memberDTO member = new memberDTO();
		
		// null이면 dataMap에 없음
		
		if (dataMap != null) {
			member.setIdx(Integer.parseInt(String.valueOf(dataMap.get("m_idx"))));
			member.setUsername(dataMap.get("m_username"));
			member.setKakaoemail(dataMap.get("m_kakaoemail"));
			member.setNaveremail(dataMap.get("m_naveremail"));
			member.setHp(dataMap.get("m_hp"));
			member.setSsn1(dataMap.get("m_ssn1"));
			member.setSsn2(dataMap.get("m_ssn2"));
			member.setStore(dataMap.get("m_store"));
			member.setIntro(dataMap.get("m_intro"));
			member.setJoindate(String.valueOf(dataMap.get("m_joindate")));
			return member;
		}
		return null;
	}
	
	// 회원번호 입력받아서 해당 회원이 올린 상품 개수 리턴
	public int memProductCnt(String m_idx) {
		int cnt = sqlsession.selectOne("product.productCnt", Integer.parseInt(m_idx));
		return cnt;
	}
	// 회원번호 입력받아서 해당 회원의 팔로워 수 리턴
	public int memFollowerCnt(String m_idx) {
		int cnt = sqlsession.selectOne("product.productCnt", Integer.parseInt(m_idx));
		return cnt;
	}
	
	// 회원번호 입력받아서 상점명 리턴(null이라면 인덱스로 호 붙여주기)
	public String storeName(int m_idx) {
		String store = sqlsession.selectOne("product.storeName", m_idx);
		if(store == null) {
		
			store = "상점" + String.valueOf(m_idx)+"호";
		}
		
		return store;
	}
	
	
	public memberDTO myshop(memberDTO member, String m_idx) {
		HashMap<String, String> dataMap = new HashMap<>();
		try {
			
			dataMap.put("m_idx", m_idx);
			System.out.print(dataMap);
			dataMap = sqlsession.selectOne("member.myshop", dataMap);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (dataMap != null) {
			member.setIdx(Integer.parseInt(String.valueOf(dataMap.get("m_idx"))));
			member.setUsername(dataMap.get("m_name"));
			member.setKakaoemail(dataMap.get("m_kakaoemail"));
			member.setNaveremail(dataMap.get("m_naveremail"));
			member.setHp(dataMap.get("m_hp"));
			member.setSsn1(dataMap.get("m_ss1"));
			member.setSsn2(dataMap.get("m_ssn2"));
			member.setStore(dataMap.get("m_store"));
			member.setJoindate(String.valueOf(dataMap.get("m_joindate")));
			member.setLastlogin(String.valueOf(dataMap.get("m_lastlogin")));
			member.setIntro(dataMap.get("m_intro"));
			member.setProfilepath(dataMap.get("m_profilepath"));
			member.setProfile(dataMap.get("m_profile"));
			member.setZzim(dataMap.get("m_zzim"));
			return member;
		}
		return null;
	}

	public List<memberDTO> getMemberList() {

		memberList = sqlsession.selectList("member.update_myshop");

		return memberList;
	}

	// 받아온 데이터로 update 시키고 return 해주자
	public int member_edit(memberDTO member) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("m_idx", String.valueOf(member.getIdx()));
		dataMap.put("m_username", member.getUsername());
		dataMap.put("m_kakaoemail", member.getKakaoemail());
		dataMap.put("m_naveremail", member.getNaveremail());
		dataMap.put("m_hp", member.getHp());
		dataMap.put("m_ssn1", member.getSsn1());
		dataMap.put("m_ssn2", member.getSsn2());
		dataMap.put("m_store", member.getStore());
		dataMap.put("m_joindate", String.valueOf(member.getJoindate()));
		dataMap.put("m_lastlogin", String.valueOf(member.getLastlogin()));
		dataMap.put("m_intro", (member.getIntro()));
		dataMap.put("m_profilepath", member.getProfilepath());
		dataMap.put("m_profile", (member.getProfile()));
		dataMap.put("m_zzim", (member.getZzim()));
		return sqlsession.update("member.update_myshop", dataMap);
	}

	public List<memberDTO> getMemberList1() {

		memberList1 = sqlsession.selectList("member.update_intro_myshop");

		return memberList1;
	}

	// 받아온 데이터로 update 시키고 return 해주자
	public int member_edit1(memberDTO member1) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("m_idx", String.valueOf(member1.getIdx()));
		dataMap.put("m_username", member1.getUsername());
		dataMap.put("m_kakaoemail", member1.getKakaoemail());
		dataMap.put("m_naveremail", member1.getNaveremail());
		dataMap.put("m_hp", member1.getHp());
		dataMap.put("m_ssn1", member1.getSsn1());
		dataMap.put("m_ssn2", member1.getSsn2());
		dataMap.put("m_store", member1.getStore());
		dataMap.put("m_joindate", String.valueOf(member1.getJoindate()));
		dataMap.put("m_lastlogin", String.valueOf(member1.getLastlogin()));
		dataMap.put("m_intro", (member1.getIntro()));
		dataMap.put("m_profilepath", member1.getProfilepath());
		dataMap.put("m_profile", (member1.getProfile()));
		dataMap.put("m_zzim", (member1.getZzim()));
		return sqlsession.update("member.update_intro_myshop", dataMap);
	}

	// 데이터를 삭제시켜주자
	public int del(memberDTO member) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("m_idx", String.valueOf(member.getIdx()));

		return sqlsession.delete("member.update_myshop", dataMap);
	}
	
	// 20210405 zzim dao 추가
	public String zzimcnt(String m_idx) {
		HashMap<Object, Object> dataMap = new HashMap<>();
		String followcnt = sqlsession.selectOne("member.zzimcnt",m_idx);
		
		return followcnt;
	}
	
	// 20210405 로그인 시간 없데이트
	public int lastlogin(String m_idx) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("m_idx", m_idx);
		
		return sqlsession.update("member.lastlogin", dataMap);
	}
}
