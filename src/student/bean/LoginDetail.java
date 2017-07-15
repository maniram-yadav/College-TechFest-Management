package student.bean;

import java.io.Serializable;

public class LoginDetail implements Serializable {
	private static final long serialVersionUID = 1L;
	private int stuid;
	private String userid,password;
	private StudentDetail studetail;
	
	public StudentDetail getStudetail() {
		return studetail;
	}

	public void setStudetail(StudentDetail studetail) {
		this.studetail = studetail;
	}

	public int getStuid() {
		return stuid;
	}

	public void setStuid(int stuid) {
		this.stuid = stuid;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	

}
