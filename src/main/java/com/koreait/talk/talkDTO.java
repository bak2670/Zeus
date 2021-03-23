package com.koreait.talk;

public class talkDTO {

	private int idx;
	private int senderidx;
	private String senderIP;
	private String senderPort;
	private int receiveridx;
	private String receiverIP;
	private String receiverPort;
	private String content;
	private String file;
	private String filepath;
	private String time;
	private String read;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getSenderidx() {
		return senderidx;
	}
	public void setSenderidx(int senderidx) {
		this.senderidx = senderidx;
	}
	public String getSenderIP() {
		return senderIP;
	}
	public void setSenderIP(String senderIP) {
		this.senderIP = senderIP;
	}
	public String getSenderPort() {
		return senderPort;
	}
	public void setSenderPort(String senderPort) {
		this.senderPort = senderPort;
	}
	public int getReceiveridx() {
		return receiveridx;
	}
	public void setReceiveridx(int receiveridx) {
		this.receiveridx = receiveridx;
	}
	public String getReceiverIP() {
		return receiverIP;
	}
	public void setReceiverIP(String receiverIP) {
		this.receiverIP = receiverIP;
	}
	public String getReceiverPort() {
		return receiverPort;
	}
	public void setReceiverPort(String receiverPort) {
		this.receiverPort = receiverPort;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	
	@Override
	public String toString() {
		return "talkDTO [idx=" + idx + ", senderidx=" + senderidx + ", senderIP=" + senderIP + ", senderPort="
				+ senderPort + ", receiveridx=" + receiveridx + ", receiverIP=" + receiverIP + ", receiverPort="
				+ receiverPort + ", content=" + content + ", file=" + file + ", filepath=" + filepath + ", time=" + time
				+ ", read=" + read + "]";
	}
	
	
}
