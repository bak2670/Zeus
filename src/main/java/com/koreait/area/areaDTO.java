package com.koreait.area;

public class areaDTO {

	private int idx;
	private int memidx;
	private String area;
	private String memsel;
	
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
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getMemsel() {
		return memsel;
	}
	public void setMemsel(String memsel) {
		this.memsel = memsel;
	}
	
	@Override
	public String toString() {
		return "areaDTO [idx=" + idx + ", memidx=" + memidx + ", area=" + area + ", memsel=" + memsel + "]";
	}
	
	
}
