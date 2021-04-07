package com.koreait.admin.withdraw;

public class WithdrawDTO {

	private int idx;
	private int memidx;
	private String wdate;
	private String reason;
	
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
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@Override
	public String toString() {
		return "withdrawDTO [idx=" + idx + ", memidx=" + memidx + ", wdate=" + wdate + ", reason=" + reason + "]";
	}
	
	
}