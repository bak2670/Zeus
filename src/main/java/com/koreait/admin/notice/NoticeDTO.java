package com.koreait.admin.notice;

public class NoticeDTO {
	private int idx;
	private String title;
	private String content;
	private String regdate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
		return "NoticeDTO [idx=" + idx + ", title=" + title + ", content=" + content + ", regdate=" + regdate + "]";
	}
	
	
	
}
