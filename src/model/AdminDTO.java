package model;

import java.sql.Date;

public class AdminDTO {
	private String adm_idx;
	private String adm_id;
	private String adm_pw;
	private java.sql.Date adm_regidate;
	
	public AdminDTO() {}
	
	public AdminDTO(String adm_idx, String adm_id, String adm_pw, Date adm_regidate) {
		super();
		this.adm_idx = adm_idx;
		this.adm_id = adm_id;
		this.adm_pw = adm_pw;
		this.adm_regidate = adm_regidate;
	}

	public String getAdm_idx() {
		return adm_idx;
	}

	public void setAdm_idx(String adm_idx) {
		this.adm_idx = adm_idx;
	}

	public String getAdm_id() {
		return adm_id;
	}

	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}

	public String getAdm_pw() {
		return adm_pw;
	}

	public void setAdm_pw(String adm_pw) {
		this.adm_pw = adm_pw;
	}

	public java.sql.Date getAdm_regidate() {
		return adm_regidate;
	}

	public void setAdm_regidate(java.sql.Date adm_regidate) {
		this.adm_regidate = adm_regidate;
	}
	
	
}
