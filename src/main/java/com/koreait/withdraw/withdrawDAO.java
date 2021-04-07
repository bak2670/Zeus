package com.koreait.withdraw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.koreait.db.Dbconn;

public class withdrawDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	String sql = "";
	
	/* 회원탈퇴 신청 */
	public int memdraw(String m_idx, String w_reason) {
		try {
			sql = "insert into tb_withdraw(w_memidx, w_reason) values (?,?)";
			conn = Dbconn.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_idx);
			pstmt.setString(2, w_reason);

			if(pstmt.executeUpdate() >= 1) {
				return 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}
