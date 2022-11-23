package DBPKG;

import java.sql.Date;

public class Score {
	String SID;
	String SNAME;
	String JUMIN;
	String DEPT_NAME;
	String PHONE;
	String EMAIL;
	String SUBCODE;
	String SUBNAME;
	String PRONAME;
	String STUID;
//	String SUBCODE;
	Integer MIDSCORE;
	Integer FINALSCORE;
	Integer ATTEND;
	Integer REPORT;
	Integer ETC;
	String GENDER;
	
	
	
	
	public String getGENDER() {
		return GENDER;
	}
	public void setGENDER(String gENDER) {
		GENDER = gENDER;
	}
	public String getSID() {
		return SID;
	}
	public void setSID(String sID) {
		SID = sID;
	}
	public String getSNAME() {
		return SNAME;
	}
	public void setSNAME(String sNAME) {
		SNAME = sNAME;
	}
	public String getJUMIN() {
		return JUMIN;
	}
	public void setJUMIN(String jUMIN) {
		JUMIN = jUMIN;
	}
	public String getDEPT_NAME() {
		return DEPT_NAME;
	}
	public void setDEPT_NAME(String dEPT_NAME) {
		DEPT_NAME = dEPT_NAME;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getSUBCODE() {
		return SUBCODE;
	}
	public void setSUBCODE(String sUBCODE) {
		SUBCODE = sUBCODE;
	}
	public String getSUBNAME() {
		return SUBNAME;
	}
	public void setSUBNAME(String sUBNAME) {
		SUBNAME = sUBNAME;
	}
	public String getPRONAME() {
		return PRONAME;
	}
	public void setPRONAME(String pRONAME) {
		PRONAME = pRONAME;
	}
	public String getSTUID() {
		return STUID;
	}
	public void setSTUID(String sTUID) {
		STUID = sTUID;
	}
	public Integer getMIDSCORE() {
		return MIDSCORE;
	}
	public void setMIDSCORE(Integer mIDSCORE) {
		MIDSCORE = mIDSCORE;
	}
	public Integer getFINALSCORE() {
		return FINALSCORE;
	}
	public void setFINALSCORE(Integer fINALSCORE) {
		FINALSCORE = fINALSCORE;
	}
	public Integer getATTEND() {
		return ATTEND;
	}
	public void setATTEND(Integer aTTEND) {
		ATTEND = aTTEND;
	}
	public Integer getREPORT() {
		return REPORT;
	}
	public void setREPORT(Integer rEPORT) {
		REPORT = rEPORT;
	}
	public Integer getETC() {
		return ETC;
	}
	public void setETC(Integer eTC) {
		ETC = eTC;
	}
	
	
	
}
