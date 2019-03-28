package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

public class AdminDAO {

	//JDBC를 위한 멤버변수
	//연결
	Connection con;
	//정적쿼리
	PreparedStatement psmt;
	//디비에서 실행하고나서 결과돌려주기
	ResultSet rs;
	
	//인자생성자 : DAO객체를 생성함과 동시에 DB연결
	public AdminDAO(ServletContext ctx) {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin://@localhost:1521:orcl";
			String id = "softlock";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB 연결 성공");
		}
		catch(Exception e){
			System.out.println("DB 연결 실패");
		}
	}
	
	
	public Map<String, String> getMemberMap(String adm_id, String adm_pw){
		Map<String, String> maps = new HashMap<String, String>();
		String query = "select adm_id, adm_pw from admin where adm_id=? and adm_pw=?";
		System.out.println("아이디" + adm_id);
		System.out.println("비밀번호" + adm_pw);
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, adm_id);
			psmt.setString(2, adm_pw);
			rs = psmt.executeQuery();
			
			//결과셋이 있는 경우에만 레코드를 읽어온다.
			//레코드한줄 한줄 한줄 을 읽어가는게 rs.next 
			if(rs.next()) {
				maps.put("adm_id", rs.getString(1));
				maps.put("adm_pw", rs.getString(2));
			}
			else {
				System.out.println("일치하는 회원정보없음");
			}
		}
		catch(SQLException e) {
			System.out.println("쿼리실행중 오류");
			e.printStackTrace();
		}
		
		return maps;
		
	}
	
}
