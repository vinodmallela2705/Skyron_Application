package com.Database;

import java.time.LocalDate;
import java.time.Period;

public class DateOperations {
	
	public String getDurationDays (String sdate) throws Exception{
		String[] joiningDateS = sdate.split("/");
		int year  = Integer.parseInt(joiningDateS[2]);
		int month = Integer.parseInt(joiningDateS[1]);
		int date  = Integer.parseInt(joiningDateS[0]);
		LocalDate dob = LocalDate.of(year, month, date);
		LocalDate curDate = LocalDate.now();
		Period period = Period.between(dob, curDate);
		StringBuffer experience = new StringBuffer() ;
		if(experience.length()==0){
			if(period.getYears()>0)
				experience.append(period.getYears()+" years ");
			if(period.getMonths()>0)
				experience.append(period.getMonths()+" months  ");
			if(period.getDays()>0)
				experience.append(period.getDays()+" days");
		}
		
		return experience.toString();
		
	}

}
