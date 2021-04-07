package com.koreait.admin.member;

import java.util.Arrays;

public class MemberDTO {
	private int idx;
	private String username;
	private String kakaoemail;
	private String naveremail;
	private String hp;
	private String ssn1;
	private String ssn2;
	private String store;
	private String joindate;
	private String lastlogin;
	private String intro;
	private String profilepath;
	private String profile;
	private String[] zzim = new String[10];
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getKakaoemail() {
		return kakaoemail;
	}
	public void setKakaoemail(String kakaoemail) {
		this.kakaoemail = kakaoemail;
	}
	public String getNaveremail() {
		return naveremail;
	}
	public void setNaveremail(String naveremail) {
		this.naveremail = naveremail;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getSsn1() {
		return ssn1;
	}
	public void setSsn1(String ssn1) {
		this.ssn1 = ssn1;
	}
	public String getSsn2() {
		return ssn2;
	}
	public void setSsn2(String ssn2) {
		this.ssn2 = ssn2;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getLastlogin() {
		return lastlogin;
	}
	public void setLastlogin(String lastlogin) {
		this.lastlogin = lastlogin;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getProfilepath() {
		return profilepath;
	}
	public void setProfilepath(String profilepath) {
		this.profilepath = profilepath;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	public String[] getZzim() {
		return zzim;
	}
	public void setZzim(String[] zzim) {
		this.zzim = zzim;
	}
	@Override
	public String toString() {
		return "MemberDTO [idx=" + idx + ", username=" + username + ", kakaoemail=" + kakaoemail + ", naveremail="
				+ naveremail + ", hp=" + hp + ", ssn1=" + ssn1 + ", ssn2=" + ssn2 + ", store=" + store + ", joindate="
				+ joindate + ", lastlogin=" + lastlogin + ", intro=" + intro + ", profilepath=" + profilepath
				+ ", profile=" + profile + ", zzim=" + Arrays.toString(zzim) + "]";
	}
	

	
	
}
