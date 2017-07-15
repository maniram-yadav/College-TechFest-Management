package org.admin;

import java.util.List;

import org.events.FestEvent;

public class AdminService {

	
	public FestEvent getEventDetail(FestEvent fe){
		
		return new AdminDao().getEventDetail(fe);
		
	}
	
	public String updateEvent(FestEvent fe){
		
		if(new AdminDao().updateEvent(fe))
	       	return "Event Updated Successfully";
		else
			return "Unable to update event";
	}
	
	public List fetchStudent(){
		return new AdminDao().fetchStudent();
	}
	
	public boolean regAdmin(AdminBean adb){
		
		return new AdminDao().regAdmin(adb);
	}
	
	
	
	public boolean deleteEvent(FestEvent fe){
		return new AdminDao().deleteEvent(fe);
	}
}
