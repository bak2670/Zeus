package com.koreait.product;

public class productDTO {

	private int idx;
	private String name;
	private String price;
	private String state;
	private String delcharge;
	private String deallocation;
	private String regdate;
	private int zzim;
	private int hit;
	private int category;
	private String content;
	private int memdix;
	private String tag;
	private String picturepath;
	private String picture;
	
	
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDelcharge() {
		return delcharge;
	}
	public void setDelcharge(String delcharge) {
		this.delcharge = delcharge;
	}
	public String getDeallocation() {
		return deallocation;
	}
	public void setDeallocation(String deallocation) {
		this.deallocation = deallocation;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getZzim() {
		return zzim;
	}
	public void setZzim(int zzim) {
		this.zzim = zzim;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getMemdix() {
		return memdix;
	}
	public void setMemdix(int memdix) {
		this.memdix = memdix;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getPicturepath() {
		return picturepath;
	}
	public void setPicturepath(String picturepath) {
		this.picturepath = picturepath;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	@Override
	public String toString() {
		return "productDTO [idx=" + idx + ", name=" + name + ", price=" + price + ", state=" + state + ", delcharge="
				+ delcharge + ", deallocation=" + deallocation + ", regdate=" + regdate + ", zzim=" + zzim + ", hit="
				+ hit + ", category=" + category + ", content=" + content + ", memdix=" + memdix + ", tag=" + tag
				+ ", picturepath=" + picturepath + ", picture=" + picture + "]";
	}
	
}
