package com.koreait.block;

public class blockDTO {

	private int idx;
	private int memidx;
	private String blockdate;
	private String blockreason;
	
	
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
	public String getBlockdate() {
		return blockdate;
	}
	public void setBlockdate(String blockdate) {
		this.blockdate = blockdate;
	}
	public String getBlockreason() {
		return blockreason;
	}
	public void setBlockreason(String blockreason) {
		this.blockreason = blockreason;
	}
	
	@Override
	public String toString() {
		return "blockDTO [idx=" + idx + ", memidx=" + memidx + ", blockdate=" + blockdate + ", blockreason="
				+ blockreason + "]";
	}
	
	
}
