package com.koreait.withdraw;

public class withdrawDTO {

	private int idx;
	private int memidx;
	private String wdate;
	private String wreason;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMemidx() {
		return memidx;
	}
	public void setMemidx(int memidx) {
		this.memidx = memidx;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getWreason() {
		return wreason;
	}
	public void setWreason(String wreason) {
		this.wreason = wreason;
	}
	
	@Override
	public String toString() {
		return "withdrawDTO [idx=" + idx + ", memidx=" + memidx + ", wdate=" + wdate + ", wreason=" + wreason + "]";
	}
	
	
}
