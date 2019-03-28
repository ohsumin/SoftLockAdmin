package model;

public class MemDTO {
	private int mem_idx;
	private String mem_id;
	private String mem_name;
	private String mem_phone1;
	private String mem_phone2;
	private String mem_phone3;
	private String mem_email1;
	private String mem_email2;
	
	public MemDTO() {}

	public MemDTO(int mem_idx, String mem_id, String mem_name, String mem_phone1, String mem_phone2, String mem_phone3,
			String mem_email1, String mem_email2) {
		super();
		this.mem_idx = mem_idx;
		this.mem_id = mem_id;
		this.mem_name = mem_name;
		this.mem_phone1 = mem_phone1;
		this.mem_phone2 = mem_phone2;
		this.mem_phone3 = mem_phone3;
		this.mem_email1 = mem_email1;
		this.mem_email2 = mem_email2;
	}
	public int getMem_idx() {
		return mem_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public String getMem_phone1() {
		return mem_phone1;
	}
	public String getMem_phone2() {
		return mem_phone2;
	}
	public String getMem_phone3() {
		return mem_phone3;
	}
	public String getMem_email1() {
		return mem_email1;
	}
	public String getMem_email2() {
		return mem_email2;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public void setMem_phone1(String mem_phone1) {
		this.mem_phone1 = mem_phone1;
	}
	public void setMem_phone2(String mem_phone2) {
		this.mem_phone2 = mem_phone2;
	}
	public void setMem_phone3(String mem_phone3) {
		this.mem_phone3 = mem_phone3;
	}
	public void setMem_email1(String mem_email1) {
		this.mem_email1 = mem_email1;
	}
	public void setMem_email2(String mem_email2) {
		this.mem_email2 = mem_email2;
	}
	
	
	
	
	
	
}
