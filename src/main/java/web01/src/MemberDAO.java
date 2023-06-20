package web01.src;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.util.ArrayList;

public class MemberDAO {
	private Statement stmt;
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	
	
	public List<MemberVO> listMembers() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			connDB();
			String sql = "SELECT * FROM T_SHOPPING_MEMBER TS LEFT JOIN T_DEPT TD ON TS.DEPTNO = TD.DEPTNO";
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String MEMBER_ID = rs.getString("MEMBER_ID");
				String MEMBER_PW = rs.getString("MEMBER_PW");
				String MEMBER_NAME = rs.getString("MEMBER_NAME");
				String MEMBER_GENDER = rs.getString("MEMBER_GENDER");
				String TEL1 = rs.getString("TEL1");
				String TEL2 = rs.getString("TEL2");
				String TEL3 = rs.getString("TEL3");
				String SMSSTS_YN = rs.getString("SMSSTS_YN");
				String EMAIL1 = rs.getString("EMAIL1");
				String EMAIL2 = rs.getString("EMAIL2");
				String EMAILSTS_YN = rs.getString("EMAILSTS_YN");
				String POSTCODE = rs.getString("POSTCODE");
				String ROADADDRESS = rs.getString("ROADADDRESS");
				String JIBUNADDRESS = rs.getString("JIBUNADDRESS");
				String DETAILADDRESS = rs.getString("DETAILADDRESS");	
				String MEMBER_BIRTH_Y = rs.getString("MEMBER_BIRTH_Y");
				String MEMBER_BIRTH_M = rs.getString("MEMBER_BIRTH_M");
				String MEMBER_BIRTH_D = rs.getString("MEMBER_BIRTH_D");
				String MEMBER_BIRTH_GN = rs.getString("MEMBER_BIRTH_GN");
				Date JOINDATE = rs.getDate("JOINDATE");
				int DEPTNO = rs.getInt("DEPTNO");
				String DNAME = rs.getString("DNAME");
				MemberVO vo = new MemberVO();
				vo.setMEMBER_ID(MEMBER_ID);
				vo.setMEMBER_PW(MEMBER_PW);
				vo.setMEMBER_NAME(MEMBER_NAME);
				vo.setMEMBER_GENDER(MEMBER_GENDER);
				vo.setTEL1(TEL1);
				vo.setTEL2(TEL2);
				vo.setTEL3(TEL3);
				vo.setSMSSTS_YN(SMSSTS_YN);
				vo.setEMAIL1(EMAIL1);
				vo.setEMAIL2(EMAIL2);
				vo.setEMAILSTS_YN(EMAILSTS_YN);
				vo.setPOSTCODE(POSTCODE);
				vo.setROADADDRESS(ROADADDRESS);
				vo.setJIBUNADDRESS(JIBUNADDRESS);
				vo.setDETAILADDRESS(DETAILADDRESS);
				vo.setMEMBER_BIRTH_Y(MEMBER_BIRTH_Y);
				vo.setMEMBER_BIRTH_M(MEMBER_BIRTH_M);
				vo.setMEMBER_BIRTH_D(MEMBER_BIRTH_D);
				vo.setMEMBER_BIRTH_GN(MEMBER_BIRTH_GN);
				vo.setJOINDATE(JOINDATE);
				vo.setDEPTNO(DEPTNO);
				vo.setDNAME(DNAME);
				list.add(vo);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	
	}
	
	public List<MemberVO> searchMembers(List<SearchList> slist) {
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			connDB();
			String sql = "SELECT * FROM T_SHOPPING_MEMBER TS LEFT JOIN T_DEPT TD ON TS.DEPTNO = TD.DEPTNO WHERE";
			for(int idx = 0; idx < slist.size(); idx++) {
				SearchList sl = slist.get(idx);
				String and_or = sl.getAnd_or();
				String search_opt = sl.getSearch_opt();
				String search_text = sl.getSearch_text();
				sql += and_or+" ";
				if(search_opt.split(",")[0].equals("TEL1")) {
					search_text = sl.getSearch_text().replaceAll("[^¤¡-¤¾¤¿-¤Ó°¡-ÆRa-zA-Z0-9]", "");
					sql += "CONCAT("+search_opt.split(",")[0]+","+search_opt.split(",")[1]+","+search_opt.split(",")[2]+")"+" = "+"'"+search_text+"'";
				}
				else if(sl.getSearch_text().split(",")[0].equals("EMAIL1")) {
					search_text = search_text.replaceAll("[^¤¡-¤¾¤¿-¤Ó°¡-ÆRa-zA-Z0-9.]", "");
					sql += "CONCAT("+search_opt.split(",")[0]+","+search_opt.split(",")[1]+")"+" = "+"'"+search_text+"'";
				}
				else if(search_opt.equals("MEMBER_BIRTH_Y")) {
					search_text = search_text.replaceAll("[^¤¡-¤¾¤¿-¤Ó°¡-ÆRa-zA-Z0-9]", "");
					sql += "CONCAT("+search_opt.split(",")[0]+","+search_opt.split(",")[1]+","+search_opt.split(",")[2]+")"+" = "+"'"+search_text+"'";
				}
				else {
					sql += search_opt+" = '"+search_text+"'";
				}
			}
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.println("ÀÌÀ×µð¹ö±ë");
				String MEMBER_ID = rs.getString("MEMBER_ID");
				String MEMBER_PW = rs.getString("MEMBER_PW");
				String MEMBER_NAME = rs.getString("MEMBER_NAME");
				String MEMBER_GENDER = rs.getString("MEMBER_GENDER");
				String TEL1 = rs.getString("TEL1");
				String TEL2 = rs.getString("TEL2");
				String TEL3 = rs.getString("TEL3");
				String SMSSTS_YN = rs.getString("SMSSTS_YN");
				String EMAIL1 = rs.getString("EMAIL1");
				String EMAIL2 = rs.getString("EMAIL2");
				String EMAILSTS_YN = rs.getString("EMAILSTS_YN");
				String POSTCODE = rs.getString("POSTCODE");
				String ROADADDRESS = rs.getString("ROADADDRESS");
				String JIBUNADDRESS = rs.getString("JIBUNADDRESS");
				String DETAILADDRESS = rs.getString("DETAILADDRESS");	
				String MEMBER_BIRTH_Y = rs.getString("MEMBER_BIRTH_Y");
				String MEMBER_BIRTH_M = rs.getString("MEMBER_BIRTH_M");
				String MEMBER_BIRTH_D = rs.getString("MEMBER_BIRTH_D");
				String MEMBER_BIRTH_GN = rs.getString("MEMBER_BIRTH_GN");
				Date JOINDATE = rs.getDate("JOINDATE");
				int DEPTNO = rs.getInt("DEPTNO");
				String DNAME = rs.getString("DNAME");
				MemberVO vo = new MemberVO();
				vo.setMEMBER_ID(MEMBER_ID);
				vo.setMEMBER_PW(MEMBER_PW);
				vo.setMEMBER_NAME(MEMBER_NAME);
				vo.setMEMBER_GENDER(MEMBER_GENDER);
				vo.setTEL1(TEL1);
				vo.setTEL2(TEL2);
				vo.setTEL3(TEL3);
				vo.setSMSSTS_YN(SMSSTS_YN);
				vo.setEMAIL1(EMAIL1);
				vo.setEMAIL2(EMAIL2);
				vo.setEMAILSTS_YN(EMAILSTS_YN);
				vo.setPOSTCODE(POSTCODE);
				vo.setROADADDRESS(ROADADDRESS);
				vo.setJIBUNADDRESS(JIBUNADDRESS);
				vo.setDETAILADDRESS(DETAILADDRESS);
				vo.setMEMBER_BIRTH_Y(MEMBER_BIRTH_Y);
				vo.setMEMBER_BIRTH_M(MEMBER_BIRTH_M);
				vo.setMEMBER_BIRTH_D(MEMBER_BIRTH_D);
				vo.setMEMBER_BIRTH_GN(MEMBER_BIRTH_GN);
				vo.setJOINDATE(JOINDATE);
				vo.setDEPTNO(DEPTNO);
				vo.setDNAME(DNAME);
				list.add(vo);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	private void connDB() {
		try {
			/* String db_url = "jdbc:mysql://localhost:3306/campus";
			String db_id = "root";                     //MySQL¿¡ Á¢¼ÓÀ» À§ÇÑ °èÁ¤ÀÇ ID
			String db_pwd = "1234";            //MySQL¿¡ Á¢¼ÓÀ» À§ÇÑ °èÁ¤ÀÇ ¾ÏÈ£
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("mySQL µå¶óÀÌ¹ö ·Îµù ¼º°ø");
			con = DriverManager.getConnection(db_url, db_id, db_pwd);
			System.out.println("Connection »ý¼º ¼º°ø");
			stmt = con.createStatement();
			System.out.println("Statement »ý¼º ¼º°ø"); */
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/mysql");
			con = dataFactory.getConnection();
			stmt = con.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteMember(String MEMBER_ID) {
		// TODO Auto-generated method stub
		try {
			connDB();
			String sql = "DELETE FROM T_SHOPPING_MEMBER WHERE MEMBER_ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, MEMBER_ID);
			int rows = pstmt.executeUpdate();	
			if(rows == 0) {
				System.out.println("»èÁ¦ ½ÇÆÐ");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 
}