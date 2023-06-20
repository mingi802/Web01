package web01.src;

import java.sql.Date;

public class MemberVO {
	private String MEMBER_ID;
	private String MEMBER_PW;
	private String MEMBER_NAME;
	private String MEMBER_GENDER;
	private String TEL1;
	private String TEL2;
	private String TEL3;
	private String SMSSTS_YN;
	private String EMAIL1;
	private String EMAIL2;
	private String EMAILSTS_YN;
	private String POSTCODE;
	private String ROADADDRESS;
	private String JIBUNADDRESS;
	private String DETAILADDRESS;
	private String MEMBER_BIRTH_Y;
	private String MEMBER_BIRTH_M;
	private String MEMBER_BIRTH_D;
	private String MEMBER_BIRTH_GN;
	private String RRN_FRONT;
	private String RRN_BACK;
	private String DEL_YN;
	private Date JOINDATE;
	private int DEPTNO;	
	private String DNAME;
	
	/**
	 * @return the mEMBER_ID
	 */
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	/**
	 * @param mEMBER_ID the mEMBER_ID to set
	 */
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	/**
	 * @return the mEMBER_PW
	 */
	public String getMEMBER_PW() {
		return MEMBER_PW;
	}
	/**
	 * @param mEMBER_PW the mEMBER_PW to set
	 */
	public void setMEMBER_PW(String mEMBER_PW) {
		MEMBER_PW = mEMBER_PW;
	}
	/**
	 * @return the mEMBER_NAME
	 */
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	/**
	 * @param mEMBER_NAME the mEMBER_NAME to set
	 */
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	/**
	 * @return the mEMBER_GENDER
	 */
	public String getMEMBER_GENDER() {
		return MEMBER_GENDER;
	}
	/**
	 * @param mEMBER_GENDER the mEMBER_GENDER to set
	 */
	public void setMEMBER_GENDER(String mEMBER_GENDER) {
		MEMBER_GENDER = mEMBER_GENDER;
	}
	/**
	 * @return the tEL1
	 */
	public String getTEL1() {
		return TEL1;
	}
	/**
	 * @param tEL1 the tEL1 to set
	 */
	public void setTEL1(String tEL1) {
		TEL1 = tEL1;
	}
	/**
	 * @return the tEL2
	 */
	public String getTEL2() {
		return TEL2;
	}
	/**
	 * @param tEL2 the tEL2 to set
	 */
	public void setTEL2(String tEL2) {
		TEL2 = tEL2;
	}
	/**
	 * @return the tEL3
	 */
	public String getTEL3() {
		return TEL3;
	}
	/**
	 * @param tEL3 the tEL3 to set
	 */
	public void setTEL3(String tEL3) {
		TEL3 = tEL3;
	}
	/**
	 * @return the sMSSTS_YN
	 */
	public String getSMSSTS_YN() {
		return SMSSTS_YN;
	}
	/**
	 * @param sMSSTS_YN the sMSSTS_YN to set
	 */
	public void setSMSSTS_YN(String sMSSTS_YN) {
		SMSSTS_YN = sMSSTS_YN;
	}
	/**
	 * @return the eMAIL1
	 */
	public String getEMAIL1() {
		return EMAIL1;
	}
	/**
	 * @param eMAIL1 the eMAIL1 to set
	 */
	public void setEMAIL1(String eMAIL1) {
		EMAIL1 = eMAIL1;
	}
	/**
	 * @return the eMAIL2
	 */
	public String getEMAIL2() {
		return EMAIL2;
	}
	/**
	 * @param eMAIL2 the eMAIL2 to set
	 */
	public void setEMAIL2(String eMAIL2) {
		EMAIL2 = eMAIL2;
	}
	/**
	 * @return the eMAILSTS_YN
	 */
	public String getEMAILSTS_YN() {
		return EMAILSTS_YN;
	}
	/**
	 * @param eMAILSTS_YN the eMAILSTS_YN to set
	 */
	public void setEMAILSTS_YN(String eMAILSTS_YN) {
		EMAILSTS_YN = eMAILSTS_YN;
	}
	/**
	 * @return the pOSTCODE
	 */
	public String getPOSTCODE() {
		return POSTCODE;
	}
	/**
	 * @param pOSTCODE the pOSTCODE to set
	 */
	public void setPOSTCODE(String pOSTCODE) {
		POSTCODE = pOSTCODE;
	}
	/**
	 * @return the rOADADDRESS
	 */
	public String getROADADDRESS() {
		return ROADADDRESS;
	}
	/**
	 * @param rOADADDRESS the rOADADDRESS to set
	 */
	public void setROADADDRESS(String rOADADDRESS) {
		ROADADDRESS = rOADADDRESS;
	}
	/**
	 * @return the jIBUNADDRESS
	 */
	public String getJIBUNADDRESS() {
		return JIBUNADDRESS;
	}
	/**
	 * @param jIBUNADDRESS the jIBUNADDRESS to set
	 */
	public void setJIBUNADDRESS(String jIBUNADDRESS) {
		JIBUNADDRESS = jIBUNADDRESS;
	}
	/**
	 * @return the dETAILADDRESS
	 */
	public String getDETAILADDRESS() {
		return DETAILADDRESS;
	}
	/**
	 * @param dETAILADDRESS the dETAILADDRESS to set
	 */
	public void setDETAILADDRESS(String dETAILADDRESS) {
		DETAILADDRESS = dETAILADDRESS;
	}
	/**
	 * @return the mEMBER_BIRTH_Y
	 */
	public String getMEMBER_BIRTH_Y() {
		return MEMBER_BIRTH_Y;
	}
	/**
	 * @param mEMBER_BIRTH_Y the mEMBER_BIRTH_Y to set
	 */
	public void setMEMBER_BIRTH_Y(String mEMBER_BIRTH_Y) {
		MEMBER_BIRTH_Y = mEMBER_BIRTH_Y;
	}
	/**
	 * @return the mEMBER_BIRTH_M
	 */
	public String getMEMBER_BIRTH_M() {
		return MEMBER_BIRTH_M;
	}
	/**
	 * @param mEMBER_BIRTH_M the mEMBER_BIRTH_M to set
	 */
	public void setMEMBER_BIRTH_M(String mEMBER_BIRTH_M) {
		MEMBER_BIRTH_M = mEMBER_BIRTH_M;
	}
	/**
	 * @return the mEMBER_BIRTH_D
	 */
	public String getMEMBER_BIRTH_D() {
		return MEMBER_BIRTH_D;
	}
	/**
	 * @param mEMBER_BIRTH_D the mEMBER_BIRTH_D to set
	 */
	public void setMEMBER_BIRTH_D(String mEMBER_BIRTH_D) {
		MEMBER_BIRTH_D = mEMBER_BIRTH_D;
	}
	/**
	 * @return the mEMBER_BIRTH_GN
	 */
	public String getMEMBER_BIRTH_GN() {
		return MEMBER_BIRTH_GN;
	}
	/**
	 * @param mEMBER_BIRTH_GN the mEMBER_BIRTH_GN to set
	 */
	public void setMEMBER_BIRTH_GN(String mEMBER_BIRTH_GN) {
		MEMBER_BIRTH_GN = mEMBER_BIRTH_GN;
	}
	/**
	 * @return the rRN_FRONT
	 */
	public String getRRN_FRONT() {
		return RRN_FRONT;
	}
	/**
	 * @param rRN_FRONT the rRN_FRONT to set
	 */
	public void setRRN_FRONT(String rRN_FRONT) {
		RRN_FRONT = rRN_FRONT;
	}
	/**
	 * @return the rRN_BACK
	 */
	public String getRRN_BACK() {
		return RRN_BACK;
	}
	/**
	 * @param rRN_BACK the rRN_BACK to set
	 */
	public void setRRN_BACK(String rRN_BACK) {
		RRN_BACK = rRN_BACK;
	}
	/**
	 * @return the dEL_YN
	 */
	public String getDEL_YN() {
		return DEL_YN;
	}
	/**
	 * @param dEL_YN the dEL_YN to set
	 */
	public void setDEL_YN(String dEL_YN) {
		DEL_YN = dEL_YN;
	}
	/**
	 * @return the dEPTNO
	 */
	public int getDEPTNO() {
		return DEPTNO;
	}
	/**
	 * @param dEPTNO the dEPTNO to set
	 */
	public void setDEPTNO(int dEPTNO) {
		DEPTNO = dEPTNO;
	}
	/**
	 * @return the dNAME
	 */
	public String getDNAME() {
		return DNAME;
	}
	/**
	 * @param dNAME the dNAME to set
	 */
	public void setDNAME(String dNAME) {
		DNAME = dNAME;
	}
	/**
	 * @return the jOINDATE
	 */
	public Date getJOINDATE() {
		return JOINDATE;
	}
	/**
	 * @param jOINDATE the jOINDATE to set
	 */
	public void setJOINDATE(Date jOINDATE) {
		JOINDATE = jOINDATE;
	}
	
	
} 