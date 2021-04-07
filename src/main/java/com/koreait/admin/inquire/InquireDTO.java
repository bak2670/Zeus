package com.koreait.admin.inquire;

public class InquireDTO {

	private int idx;
	private int memidx;
	private int productidx;
	private int storeidx;
	private String content;
	private String regdate;
	
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
	
	public int getProductidx() {
		return productidx;
	}
	public void setProductidx(int productidx) {
		this.productidx = productidx;
	}
	public int getStoreidx() {
		return storeidx;
	}
	public void setStoreidx(int storeidx) {
		this.storeidx = storeidx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "InquireDTO [idx=" + idx + ", memidx=" + memidx + ", productidx=" + productidx + ", storeidx=" + storeidx
				+ ", content=" + content + ", regdate=" + regdate + "]";
	}
	

	
	
}
