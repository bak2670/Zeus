package com.koreait.report;

public class reportDTO {

	private int idx;
	private int memidx;
	private int reporteridx;
	private String reason;
	private int productidx;
	private String regdate;
	private int count;
	
	
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
	public int getReporteridx() {
		return reporteridx;
	}
	public void setReporteridx(int reporteridx) {
		this.reporteridx = reporteridx;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getProductidx() {
		return productidx;
	}
	public void setProductidx(int productidx) {
		this.productidx = productidx;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "reportDTO [idx=" + idx + ", memidx=" + memidx + ", reporteridx=" + reporteridx + ", reason=" + reason
				+ ", productidx=" + productidx + ", regdate=" + regdate + ", count=" + count + "]";
	}
	
	
}
