package model;

import java.sql.Date;

public class HospitalDTO {

	private String hp_name;
	private String hp_num;
	private Date hp_regiDate;
	private String hp_email;
	private String hp_username;
	private String index;
	private String hp_id;
	//대쉬보드 차트이용 추가
	private String hp_type;
	private String hp_typeCount;
	
	public String getHp_name() {
		return hp_name;
	}
	public void setHp_name(String hp_name) {
		this.hp_name = hp_name;
	}
	public String getHp_num() {
		return hp_num;
	}
	public void setHp_num(String hp_num) {
		this.hp_num = hp_num;
	}
	public Date getHp_regiDate() {
		return hp_regiDate;
	}
	public void setHp_regiDate(Date hp_regiDate) {
		this.hp_regiDate = hp_regiDate;
	}
	public String getHp_email() {
		return hp_email;
	}
	public void setHp_email(String hp_email) {
		this.hp_email = hp_email;
	}
	public String getHp_username() {
		return hp_username;
	}
	public void setHp_username(String hp_username) {
		this.hp_username = hp_username;
	}
	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	public String getHp_id() {
		return hp_id;
	}
	public void setHp_id(String hp_id) {
		this.hp_id = hp_id;
	}
	public String getHp_type() {
		return hp_type;
	}
	public void setHp_type(String hp_type) {
		this.hp_type = hp_type;
	}
	public String getHp_typeCount() {
		return hp_typeCount;
	}
	public void setHp_typeCount(String hp_typeCount) {
		this.hp_typeCount = hp_typeCount;
	}
	
	
	
	
	
	
}
