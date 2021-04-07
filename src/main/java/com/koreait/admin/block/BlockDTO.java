package com.koreait.admin.block;

public class BlockDTO {
	private int idx;
	private int memidx;
	private String blockdate;
	private String blockReason;
	
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
	public String getBlockReason() {
		return blockReason;
	}
	public void setBlockReason(String blockReason) {
		this.blockReason = blockReason;
	}
	
	@Override
	public String toString() {
		return "BlockDTO [idx=" + idx + ", memidx=" + memidx + ", blockdate=" + blockdate + ", blockReason=" + blockReason
				+ "]";
	}
}
