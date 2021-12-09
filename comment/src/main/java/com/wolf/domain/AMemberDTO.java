package com.wolf.domain;

public class AMemberDTO {
	private String memId;
	private String memNm;
	private String email;
	private String phone;
	private String zipcode;
	private String address;
	private String addressSub;
	private String addressReference;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressSub() {
		return addressSub;
	}
	public void setAddressSub(String addressSub) {
		this.addressSub = addressSub;
	}
	public String getAddressReference() {
		return addressReference;
	}
	public void setAddressReference(String addressReference) {
		this.addressReference = addressReference;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
