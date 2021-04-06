package com.koreait.payment;

public class paymentDTO {
	private int idx;
	private int sellerIdx;
	private int buyerIdx;
	private int productIdx;
	private String regdate;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getSellerIdx() {
		return sellerIdx;
	}
	public void setSellerIdx(int sellerIdx) {
		this.sellerIdx = sellerIdx;
	}
	public int getBuyerIdx() {
		return buyerIdx;
	}
	public void setBuyerIdx(int buyerIdx) {
		this.buyerIdx = buyerIdx;
	}
	public int getProductIdx() {
		return productIdx;
	}
	public void setProductIdx(int productIdx) {
		this.productIdx = productIdx;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "paymentDTO [idx=" + idx + ", sellerIdx=" + sellerIdx + ", buyerIdx=" + buyerIdx + ", productIdx="
				+ productIdx + ", regdate=" + regdate + "]";
	}

	
}
