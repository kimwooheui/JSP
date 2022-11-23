package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBExpert {
	private String driver = "oracle.jdbc.OracleDriver";
	private String url = "jdbc:oracle:thin:@//localhost:1521/xe";
	Connection conn;
	ResultSet rs;
	PreparedStatement pstmt;
	public ArrayList<Score> scoreSelect() {
		Connection conn = null; PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Score> al = new ArrayList<Score>();
		
		String select = "select student.SID,student.SNAME, substr(student.JUMIN,1,6)||'-'||substr(student.JUMIN,7,13) as jumin, "
				+ "decode(substr(student.JUMIN,7,1),1,'남',3,'남',2,'여',4,'여') as gender, "
				+ "subject.SUBCODE, subject.PRONAME,subject.SUBNAME "
				+ "from TBL_STUDENT_202210 student, TBL_SCORE_202210 score, TBL_SUBJECT_202210 subject "
				+ "where score.STUID = student.SID "
				+ "and subject.SUBCODE = score.SUBCODE";
//		String select = "SELECT STUID,SUBCODE,MIDSCORE,FINALSCORE,ATTEND,REPORT,ETC "
//				+ "FROM TBL_SCORE_202210 WHERE SUBCODE = '+"+param+"+' ";
		try {
			System.out.println("scoreSelect2");
			Class.forName(driver);
			conn=DriverManager.getConnection(url,"hr","hr");
			pstmt = conn.prepareStatement(select);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Score s = new Score();//DTO 부르기
				s.setSID(rs.getString(1));
				System.out.println("scoreSelect2");
				s.setSNAME(rs.getString(2));
				s.setJUMIN(rs.getString(3));
				s.setGENDER(rs.getString(4));
				s.setSUBCODE(rs.getString(5));
				s.setPRONAME(rs.getString(6));
				s.setSUBNAME(rs.getString(7));
				al.add(s);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close(); conn.close();
				rs.close();
			}catch(Exception e) {}
			
		}
		return al;
	}
	
	
}
