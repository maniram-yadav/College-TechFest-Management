package student.bean;

import java.util.List;
import java.util.Set;

public class Participation {
	
	private int id;
	private String userid;
	private String eventname;



	public String getEventname() {
		return eventname;
	}

	public void setEventname(String eventname) {
		this.eventname = eventname;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

		public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
}
