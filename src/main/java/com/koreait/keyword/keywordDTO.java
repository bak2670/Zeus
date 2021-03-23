package com.koreait.keyword;

public class keywordDTO {

	private int idx;
	private String name;
	private int memidx;
	private int cateidx;
	private String alert;
	private String lists;
	private String selarea;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMemidx() {
		return memidx;
	}
	public void setMemidx(int memidx) {
		this.memidx = memidx;
	}
	public int getCateidx() {
		return cateidx;
	}
	public void setCateidx(int cateidx) {
		this.cateidx = cateidx;
	}
	public String getAlert() {
		return alert;
	}
	public void setAlert(String alert) {
		this.alert = alert;
	}
	public String getLists() {
		return lists;
	}
	public void setLists(String lists) {
		this.lists = lists;
	}
	public String getSelarea() {
		return selarea;
	}
	public void setSelarea(String selarea) {
		this.selarea = selarea;
	}
	
	@Override
	public String toString() {
		return "keywordDTO [idx=" + idx + ", name=" + name + ", memidx=" + memidx + ", cateidx=" + cateidx + ", alert="
				+ alert + ", lists=" + lists + ", selarea=" + selarea + "]";
	}
	
	
}
