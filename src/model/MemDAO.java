package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

public class MemDAO {
	// JDBC를 위한 멤버변수
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;

	public MemDAO(ServletContext ctx) {
		try {
			/*
			 * java파일에서 web.xml의 초기화 파라미터를 가져옴
			 */
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin://@localhost:1521:orcl";
			String id = "softlock";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB 연결성공^^*");
		} catch (Exception e) {
			System.out.println("DB 연결실패ㅠㅠ;엉엉");
		}
	}

	public int getTotalRecordCount() {
		int totalCount = 0;
		// 전체 레코드수를 카운트하기 위해 count()그룹함수 사용
		String query = "select count(*) from member";
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			// 게시물의 갯수를 가져오므로 getInt()로 읽어온다.
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 게시물의 갯수 반환
		return totalCount;
	}

	public int getTotalRecordCount(Map<String, Object> map) {
		int totalCount = 0;
		// 전체 레코드수를 카운트하기 위해 count()그룹함수 사용
		/*
		기존쿼리문
		String query = "select count(*) from bbs";*/
		String query = " SELECT COUNT(*) FROM member ";
						
		if (map.get("Word") != null) {
			//선택한 컬럼이 제목+내용 이라면..
			//if(map.get("Column").equals("both")) {
			//	query += " WHERE mem_id LIKE '%" +map.get("Word")+ "%' OR mem_name like '%" +map.get("Word")+ "%' ";
			//}
			//else {
				//query += " where " + map.get("Column") + " like '%" + map.get("Word") + "%'";
				query += " where mem_id like '%" + map.get("Word") + "%'";
			//}
			//쿼리문을 로고로 출력
			System.out.println("Column="+map.get("Column"));
			System.out.println("Word="+map.get("Word"));
			System.out.println("query="+query);
			
			
		}
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			// 게시물의 갯수를 가져오므로 getInt()로 읽어온다.
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("select예외발생gettotal");
		}

		// 게시물의 갯수 반환
		return totalCount;
	}

	/*public List<BbsDTO> selectList() {

		List<BbsDTO> bbs = new Vector<BbsDTO>();
		String query = "select * from bbs where 1=1 order by num desc";

		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			// 오라클이 반환해준 결과셋의 갯수만큼 반복함
			while (rs.next()) {
				// 결과셋중 하나를 DTO객체에 저장함.
				BbsDTO dto = new BbsDTO();

				// DTO객체의 setter()를 이용하여 데이터 저장.
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setPostdate(rs.getDate(4));
				dto.setId(rs.getString(5));
				dto.setVisitcount(rs.getString(6));

				// 위에서 저장한 DTO객체를 List컬렉션에 추가
				bbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("select예외발생ㅣㅣㅣㅣㅣㅣ");
			e.printStackTrace();
		}

		return bbs;
	}*/

	public List<MemDTO> selectList(Map<String, Object> map) {

		List<MemDTO> mem = new Vector<MemDTO>();
		/*
		기존쿼리1
		String query = "select * from bbs ";*/
	    /*
	    기존쿼리2
	    String query= "SELECT B.*, M.name FROM bbs B " + 
	              "          INNER JOIN member M " + 
	              "              ON B.id=M.id ";*/
	    //페이지 처리를 위한 쿼리
		String query = ""
		+" select * from ( "
		+" 		select Tb.*, rownum rNum from "
		+" 		( "
		+"    		select * from member M ";


		
		if (map.get("Word") != null) {
			/*if(map.get("Column").equals("both")) {
				query += " WHERE mem_id LIKE '%" +map.get("Word")+ "%' OR mem_name like '%" +map.get("Word")+ "%' ";
			}
			else {*/
				//query += " where " + map.get("Column") + " like '%" + map.get("Word") + "%'";
				query += " where mem_id like '%" + map.get("Word") + "%'";
			/*}*/
		}
		
		query += "     		order by mem_idx desc "
		+"		) Tb "
		+" ) "
		+" where rNum between "+map.get("start")+" and "+map.get("end");
		System.out.println("query="+query);

		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			// 오라클이 반환해준 결과셋의 갯수만큼 반복함
			while (rs.next()) {
				// 결과셋중 하나를 DTO객체에 저장함.
				MemDTO dto = new MemDTO();

				// DTO객체의 setter()를 이용하여 데이터 저장.
				dto.setMem_idx(rs.getInt(1));
				dto.setMem_id(rs.getString(2));
				dto.setMem_name(rs.getString(3));
				dto.setMem_phone1(rs.getString(6).substring(0, 3));
				dto.setMem_phone2(rs.getString(6).substring(3, 7));
				dto.setMem_phone3(rs.getString(6).substring(7));
				String email[] = rs.getString(8).split("@");
				dto.setMem_email1(email[0]);
				dto.setMem_email2(email[1]);
				
				// 위에서 저장한 DTO객체를 List컬렉션에 추가
				mem.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("select예외발생");
		}

		return mem;
	}
	 
	/*public int insertWrite(BbsDTO dto) {
		int affected = 0;
		try {
			String query = " INSERT INTO bbs ( "
					+ " num,title,content,id,visitcount) "
					+ " VALUES ( "
					+ " seq_bbs_num.NEXTVAL, ?, ?, ?, 0) ";
			
			
			System.out.println("title:"+dto.getTitle());
		
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			
			affected = psmt.executeUpdate();	
	
		}
		catch(Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	*/
	/*public BbsDTO selectView(String num) {
		
		BbsDTO dto = new BbsDTO();
		
		
		bbs테이블만 가져와서 작성자는 id로 출력되는 쿼리
		String query = " "
				+ " SELECT * FROM bbs WHERE num=? ";
		//member테이블과 join하여 작성자를 name으로 출력
		String query = " "
			+ " SELECT B.*, M.name FROM bbs B "
			+ " INNER JOIN member M on B.id=m.id "
			+ " WHERE num=? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate(4));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				
				//member테이블과 join된 결과추가
				dto.setName(rs.getString("name"));
			}
		}
		catch(Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}
		return dto;
	}*/
	
	public void updateVisitCount(String num) {
		String query = " UPDATE bbs SET "
				+ " visitcount=visitcount+1 "
				+ " WHERE num=? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		}
		catch(Exception e) {
			System.out.println("조회수 증가시 예외발생");
			e.printStackTrace();
		}
		
	}
	
	/*public int updateEdit(BbsDTO dto) {
		int affected = 0;
		try {
			String query = " UPDATE bbs SET "
					+ " title=? , content=? "
					+ " WHERE num=? ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			//수정된 행의 갯수가 반환됨
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("update중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}*/
	
	public int delete(String mem_id) {
		int affected = 0;
		try {
			String query = " DELETE FROM member "
					+ " WHERE mem_id=? ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, mem_id);
			
			//수정된 행의 갯수가 반환됨
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("delete중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	// 자원반납
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//병원 타입과 타입의 개수 반환
	public List<HospitalDTO> getTypeNum() {
		List<HospitalDTO> hpList = new Vector<>();
		String query = "SELECT hp_type,count(*) FROM hospital GROUP BY hp_type";
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				HospitalDTO hDTO = new HospitalDTO();
				hDTO.setHp_type(rs.getString(1));
				hDTO.setHp_typeCount(rs.getString(2));
				
				hpList.add(hDTO);
			}
			return hpList;
		}
		catch(Exception e) {
			System.out.println("병원리스트부르기 실패");
			e.printStackTrace();
		}
		return hpList;
	}
	
	//전체 등록한 병원의 개수
	public String getTotalHpNum() {
		String totalHpNum = "";
		String query ="select count(*) from hospital";
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			totalHpNum = rs.getString(1);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return totalHpNum;
	}
	//전체 등록한 예약의 개수
	public String getTotalResvNum() {
		String totalHpNum="";
		String query="select count(*) from reservation";
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			totalHpNum = rs.getString(1);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return totalHpNum;
		
	}

	//월별 예약 숫자 카운드하기
	public ArrayList<ReservationDTO> monthData() { 
		ArrayList<ReservationDTO> rDTO = new ArrayList<ReservationDTO>();
		String query = " select count(*) from reservation where resv_date like '20%' group by resv_date order by resv_date asc ";
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			// 오라클이 반환해준 결과셋의 갯수만큼 반복함
			while(rs.next()) {
				// 결과셋중 하나를 DTO객체에 저장함
				ReservationDTO dto = new ReservationDTO();
				
				// DTO객체의 setter()을 이용하여 데이터저장
				dto.setResv_date(rs.getString(1));
				
				// 위에서 저장한 DTO객체를 List컬렉션에 추가
				rDTO.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("selectList() 예외발생");
			e.printStackTrace();
		}
		
		return rDTO;
	}
	public int getTotalRecordCount1() {
		int totalCount = 0;
		// 전체 레코드수를 카운트하기 위해 count()그룹함수 사용
		String query = "select count(*) from member ";
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			// 게시물의 갯수를 가져오므로 getInt()로 읽어온다.
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 게시물의 갯수 반환
		return totalCount;
	}
	
	public int getGenderRecordCount() {
		int GenderCount = 0;
		// 전체 레코드수를 카운트하기 위해 count()그룹함수 사용
		String query = "select count(*) from member where mem_gender like 'M' or mem_gender like 'm' ";
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			// 게시물의 갯수를 가져오므로 getInt()로 읽어온다.
			GenderCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 게시물의 갯수 반환
		return GenderCount;
	}
	
	


}
