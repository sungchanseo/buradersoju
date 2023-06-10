package com.itwillbs.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;

public class MysqlConntectTest {
	
	//System.out.println();
	// => 일반적으로 클래스는 main()없이 코드 실행 불가
	// => Junit을 사용해서 main()/서버 없이 코드 실행
	   // => 테스트 개발
	
	// JAVA -> DB연결 (JDBC)
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String DBURL = "jdbc:mysql://localhost:3306/springdb";
	private static final String DBID = "root";
	private static final String DBPW = "1234";
	
	
	// 디비 연결 메서드 
	// @Test : 테스트할 내용을 메서드안에 작성
	//         어노테이션표시 -> Junit  테스트 동작수행 
	
//	@Test
//	public void testDBConnection() throws Exception {
//		System.out.println(" 디비 연결 테스트 - 시작 ");
//		
//		// 1. 드라이버 로드
//		Class.forName(DRIVER);
//		
//		// 2. 디비연결 수행
//		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
//		
//		System.out.println(" 디비연결 성공! ");
//		System.out.println(con);
//		
//		System.out.println(" 디비 연결 테스트 - 종료");
//	}
	
	@Test
	public void testDBConnection(){
		System.out.println(" 디비 연결 테스트 - 시작 ");
		
//		try {
//			// 1. 드라이버 로드
//			Class.forName(DRIVER);
//			// 2. 디비연결 수행
//			Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
//			System.out.println(" 디비연결 성공! ");
//			System.out.println(con);
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			// 예외 발생여부와 상관없이 무조건 실행 코드 (자원해제) 
//		}
		
		// try ~ with 구문 : finally구문에 있는 자원해제를 대신 구현 형태의 예외처리 문법
		//                   ( ) 들어가는 객체가 반드시 AutoClosable 인터페이스 구현해야함.
		//                   JDK 1.7~ 사용가능                    
		
		try(Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);) {
			// 1. 드라이버 로드
			Class.forName(DRIVER);
			// 2. 디비연결 수행 
			System.out.println(" 디비연결 성공! ");
			System.out.println(con);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		System.out.println(" 디비 연결 테스트 - 종료");
	}
	
	
	

}
