package com.koreait.recentProduct;

public class recentProductDTO {
	
	private int rcpidx;
	private int rcpmemidx;
	private int rcpproductidx;
	
	public int getRcpidx() {
		return rcpidx;
	}
	public void setRcpidx(int rcpidx) {
		this.rcpidx = rcpidx;
	}
	public int getRcpmemidx() {
		return rcpmemidx;
	}
	public void setRcpmemidx(int rcpmemidx) {
		this.rcpmemidx = rcpmemidx;
	}
	public int getRcpproductidx() {
		return rcpproductidx;
	}
	public void setRcpproductidx(int rcpproductidx) {
		this.rcpproductidx = rcpproductidx;
	}
	
	@Override
	public String toString() {
		return "recentProductDTO [rcpidx=" + rcpidx + ", rcpmemidx=" + rcpmemidx + ", rcpproductidx=" + rcpproductidx
				+ "]";
	}
	
	
	
}
