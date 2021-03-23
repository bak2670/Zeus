package com.koreait.category;

public class categoryDTO {

	private int idx;
	private String big;
	private String middle;
	private String small;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getBig() {
		return big;
	}
	public void setBig(String big) {
		this.big = big;
	}
	public String getMiddle() {
		return middle;
	}
	public void setMiddle(String middle) {
		this.middle = middle;
	}
	public String getSmall() {
		return small;
	}
	public void setSmall(String small) {
		this.small = small;
	}
	
	@Override
	public String toString() {
		return "categoryDTO [idx=" + idx + ", big=" + big + ", middle=" + middle + ", small=" + small + "]";
	}
	
	
}
