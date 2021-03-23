package com.koreait.following;

public class followingDTO {

	private int idx;
	private int memidx;
	private int follow;
	
	
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
	public int getFollow() {
		return follow;
	}
	public void setFollow(int follow) {
		this.follow = follow;
	}
	
	@Override
	public String toString() {
		return "followingDTO [idx=" + idx + ", memidx=" + memidx + ", follow=" + follow + "]";
	}
	
	
}
