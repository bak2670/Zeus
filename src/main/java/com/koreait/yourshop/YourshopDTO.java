package com.koreait.yourshop;

public class YourshopDTO {
	private int m_idx;
	private String m_store;  //상점이름
	private int p_count;     //상품개수
	private int f_count;	 //팔로워수
	
	
	public int getM_idx() {
		return m_idx;
	}	
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public String getM_store() {
		return m_store;
	}
	public void setM_store(String m_store) {
		this.m_store = m_store;
	}
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}
	public int getF_count() {
		return f_count;
	}
	public void setF_count(int f_count) {
		this.f_count = f_count;
	}
	
	
	
	

}
