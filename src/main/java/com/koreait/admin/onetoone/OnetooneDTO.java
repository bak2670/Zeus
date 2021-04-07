package com.koreait.admin.onetoone;

public class OnetooneDTO {
	
	private int idx;
	private int memidx;
	private String bigCate;
	private String midCate;
	private String content;
	private String regdate;
	private String answerOK;
	private String answer;
	private String ansdate;
	
	

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
	
	public String getBigCate() {
		return bigCate;
	}
	public void setBigCate(String bigCate) {
		this.bigCate = bigCate;
	}
	public String getMidCate() {
		return midCate;
	}
	public void setMidCate(String midCate) {
		this.midCate = midCate;
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
	public String getAnswerOK() {
		return answerOK;
	}
	public void setAnswerOK(String answerOK) {
		this.answerOK = answerOK;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	public String getAnsdate() {
		return ansdate;
	}
	public void setAnsdate(String ansdate) {
		this.ansdate = ansdate;
	}
	
	
	@Override
	public String toString() {
		return "OnetooneDTO [idx=" + idx + ", memidx=" + memidx + ", bigCate=" + bigCate + ", midCate=" + midCate
				+ ", content=" + content + ", regdate=" + regdate + ", answerOK=" + answerOK + ", answer=" + answer
				+ ", ansdate=" + ansdate + "]";
	}

	
	
}
	
	