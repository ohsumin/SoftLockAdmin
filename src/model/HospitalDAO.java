package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

public class HospitalDAO {
	
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public HospitalDAO(ServletContext ctx) {
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
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<HospitalDTO> selectList(Map<String,Object> map, String page) {
		List<HospitalDTO> bbs = new Vector<HospitalDTO>();
		// 페이지처리를 위한 쿼리
		String query = ""
					+ " select hp_name, hp_num, hp_regidate, hp_email, hp_username, rnum, hp_id from ( " 
					+ "    select Tb.*, rownum rNum from ( "  
					+ "        select * from hospital "; 
		// 병원승인대기 페이지라면
		if(page.equals("0")) {
			// 만약 검색어가 파라미터로 전달되었다면
			if(map.get("search") != null) {
				query += " where hp_id LIKE '%" + map.get("search") + "%'"
						+ " AND hp_perm='w'" 
		    			+ "    	  ORDER BY hp_regidate desc "
					    + " 	) Tb " 
					    + " ) "
					    + " WHERE rNum BETWEEN " + map.get("start") + " and " + map.get("end");   
				// 쿼리문을 로그로 출력
				System.out.println("query=" + query);
			} else {
				query +=  " WHERE hp_perm='w'" 
		    			+ "    	  ORDER BY hp_regidate desc "
					    + " 	) Tb " 
					    + " ) "
					    + " WHERE rNum BETWEEN " + map.get("start") + " and " + map.get("end");    
			}
		} 
		// 병원승인완료 페이지라면
		else if(page.equals("1")) {
			if(map.get("search") != null) {
				query += " where hp_id LIKE '%" + map.get("search") + "%'"
						+ " AND hp_perm='y'" 
		    			+ "    	  ORDER BY hp_regidate desc "
					    + " 	) Tb " 
					    + " ) "
					    + " WHERE rNum BETWEEN " + map.get("start") + " and " + map.get("end");   
				// 쿼리문을 로그로 출력
				System.out.println("query=" + query);
			} else {
				query +=  " WHERE hp_perm='y'" 
		    			+ "    	  ORDER BY hp_regidate desc "
					    + " 	) Tb " 
					    + " ) "
					    + " WHERE rNum BETWEEN " + map.get("start") + " and " + map.get("end");    
			}
		}
		System.out.println("query"+query);
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			// 오라클이 반환해준 결과셋의 갯수만큼 반복함
			while(rs.next()) {
				// 결과셋중 하나를 DTO객체에 저장함
				HospitalDTO dto = new HospitalDTO();
				
				// DTO객체의 setter()을 이용하여 데이터저장
				dto.setHp_name(rs.getString(1));
				dto.setHp_num(rs.getString(2));
				dto.setHp_regiDate(rs.getDate(3));
				dto.setHp_email(rs.getString(4));
				dto.setHp_username(rs.getString(5));
				dto.setIndex(rs.getString(6));
				dto.setHp_id(rs.getString(7));
				
				// 위에서 저장한 DTO객체를 List컬렉션에 추가
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("selectList() 예외발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	public int getTotalRecordCount(Map<String,Object> map, String page) {
		int totalCount = 0;
		String query = ""
				+ " select count(*) from ( " 
				+ "    select Tb.*, rownum rNum from ( "  
				+ "        select * from hospital "; 
	
		// 만약 검색어가 파라미터로 전달되었다면
		if(map.get("search") != null) {
			query += " where hp_id LIKE '%" + map.get("search") + "%'";
			// 쿼리문을 로그로 출력
			System.out.println("query=" + query);
		}
		System.out.println("page:"+page);
		// 승인대기 페이지면
		if(page.equals("0")) {
			query +=      " WHERE hp_perm='w'" 
		    			+ "    	  ORDER BY hp_regidate desc "
					    + " 	) Tb " 
					    + " ) ";
		} 
		// 승인완료 페이지면
		else if(page.equals("1")) {
			query +=      " WHERE hp_perm='y'" 
	    			+ "    	  ORDER BY hp_regidate desc "
				    + " 	) Tb " 
				    + " ) ";
		}
		// 쿼리문을 로그로 출력
		System.out.println("query=" + query);
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			// 게시물의 갯수를 가져오므로 getInt()로 읽어온다.
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("getTotalRecordCount() 에러발생");
		}
		
		return totalCount;	
	}
	
	// 가입허가
	public void updatePerm(String hp_id) {
		Connection con2 = null;
		PreparedStatement psmt2;
		ResultSet rs2;
		String query = "UPDATE hospital SET "
				+ " hp_perm='y'"
				+ " WHERE hp_id=?";
		String query2 = "UPDATE hospital SET "
				+ " authority='ROLE_ADMIN'"
				+ " WHERE hp_id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, hp_id);
			psmt.executeQuery();
			psmt2 = con2.prepareStatement(query2);
			psmt2.setString(1, hp_id);
			psmt2.executeQuery();
			System.out.println("updatePerm() query : " + query);
		}
		catch(Exception e) {
			System.out.println("updatePerm() 예외발생");
			e.printStackTrace();
		}
	}
	
	// 가입거절
	public int delete(String hp_id) {
		int affected = 0;
		try {
			String query = "DELETE FROM hospital " 
					+ " WHERE hp_id=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, hp_id);
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("delete() 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
}
