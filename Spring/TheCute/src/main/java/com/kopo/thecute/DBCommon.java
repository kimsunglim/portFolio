package com.kopo.thecute;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class DBCommon<T> {
	private Connection connection;

	public DBCommon() {
	}
	
	// oracle 데이터베이스 연결
	private void open() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			this.connection = DriverManager.getConnection("jdbc:oracle:thin:@192.168.110.112:1521:orcl",
					"kopo2019","kopo2019");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// oracle 데이터 베이스 연결해제
	private void close() {
		if (this.connection != null) {
			try {
				this.connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		this.connection = null;
	}
	
	// THECUTE 테이블 insert
	public void insertData(T t, String id) {
		try {
			Class<?> dataClass = t.getClass();
			Field[] dataClassFields = dataClass.getDeclaredFields();
			String fieldString = "";
			String valueString = "";
			
			// 입력받은 객체 반복문을 통해 컬럼명 value값 문자열로 만들기
			for (Field field : dataClassFields) {
				if (!fieldString.isEmpty()) {
					fieldString = fieldString + ",";
				}
				String fieldType = field.getType().toString();
				String fieldName = field.getName();
				if (fieldName.matches("idx")) {
					continue;
				}
				fieldString = fieldString + fieldName;
				if (!valueString.isEmpty()) {
					valueString = valueString + ",";
				}
				if (fieldType.matches(".*String")) {
					if (field.get(t) != null) {
						valueString = valueString + field.get(t);
					} else {
						valueString = valueString + "null";
					}
				} else {
					valueString = valueString + field.get(t);
				}
			}
			
			// 데이터베이스 연결
			if (this.connection == null) {
				this.open();
			}
			
			// 쿼리문 완성후 쿼리 실행
			String query = "INSERT INTO THECUTE (idx,id," + fieldString + ") VALUES(SEQ_IDX.NEXTVAL,'"+ id + "'," + valueString + ")";
			System.out.println(query);
			Statement statement = this.connection.createStatement();
			int result = statement.executeUpdate(query);
			statement.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} 
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 데이터베이스 연결 해제
			this.close();
		}
	}
	
	// THECUTE_USER 테이블 insert
	public void insertUserData(T t) {
		try {
			Class<?> dataClass = t.getClass();
			Field[] dataClassFields = dataClass.getDeclaredFields();
			String fieldString = "";
			String valueString = "";
			
			// 입력받은 객체 반복문을 통해 컬럼명 value값 문자열로 만들기
			for (Field field : dataClassFields) {
				if (!fieldString.isEmpty()) {
					fieldString = fieldString + ",";
				}
				String fieldType = field.getType().toString();
				String fieldName = field.getName();
				if (fieldName.matches("idx")) {
					continue;
				}
				fieldString = fieldString + fieldName;
				if (!valueString.isEmpty()) {
					valueString = valueString + ",";
				}
				if (fieldType.matches(".*String")) {
					valueString = valueString + "'" + field.get(t) + "'";
				} else {
					valueString = valueString + field.get(t);
				}
			}
			// 데이터베이스 연결
			if (this.connection == null) {
				this.open();
			}
			
			// 쿼리문 완성후 쿼리 실행
			String query = "INSERT INTO THECUTE_USER (idx," + fieldString + ") VALUES(USER_IDX.NEXTVAL," + valueString + ")";
			System.out.println(query);
			Statement statement = this.connection.createStatement();
			int result = statement.executeUpdate(query);
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 데이터베이스 연결 해제
			this.close();
		}
	}
	
	// THECUTE 테이블 select group by 
	public HashMap<String, String> detailsData(T t,String jobgroup, String q010000, String q07grade) {
		HashMap<String, String> details = new HashMap<String, String>();
		try {
			Class<?> dataClass = t.getClass();
			Field[] dataClassFields = dataClass.getDeclaredFields();
			
			// 데이터베이스 연결
			if (this.connection == null) {
				this.open();
			}
			
			String queryString = "";
			
			// 입력받은 객체 반복문을 통해 컬럼명 value값 문자열로 만들기
			for (Field field : dataClassFields) {
				if (!queryString.isEmpty()) {
					queryString = queryString + ", ";
				}
				String fieldName = field.getName();	
				queryString = queryString + "count(" + fieldName + ") as " + fieldName;
			}
			
			// 쿼리문 완성후 쿼리 실행, 입력받은 (jobgroup, q010000, q07grade) group by 키값, 만족도 70이상 데이터
			String query = "select jobgroup, q010000, q07grade, " + queryString + " from ( select * from thecute where 1=1 and q10grade >= 70) " + 
					"where 1=1 and jobgroup = " + jobgroup + " and q010000 = " + q010000 + " and q07grade = " + q07grade + 
					" group by jobgroup, q010000, q07grade order by jobgroup";
			System.out.println(query);

			PreparedStatement preparedStatement = this.connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			// 쿼리문 결과를 HashMap에 추가
			if (resultSet.next()) {
				details.put("jobgroup", resultSet.getString("jobgroup"));
				details.put("q010000", resultSet.getString("q010000"));
				details.put("q07grade", resultSet.getString("q07grade"));
				
				for (Field field : dataClassFields) {
					String fieldName = field.getName();				
					details.put(fieldName, resultSet.getString(fieldName));
				}
			}
			
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 데이터베이스 연결 해제
			this.close();
		}
		return details;
	}
	
	// THECUTE_USER 테이블 select
	public String signIn(String id, String password) {
		// 세션에 저장할 값 선언
		String userId = null;
		try {
			// 데이터베이스 연결
			if (this.connection == null) {
				this.open();
			}
			
			// 로그인창에서 입력받은 데이터를 이용하여 쿼리문 완성 
			String query = "SELECT * FROM THECUTE_USER WHERE id='" + id + "' AND password='" + password
					+ "'";
			System.out.println(query);
			
			PreparedStatement preparedStatement = this.connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			// 쿼리문 결과가 저장된 resultSet에서 id를 가져와서 리턴할 userId에 저장
			if (resultSet.next()) {
				userId = resultSet.getString("id");
			}
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 데이터베이스 연결 해제
			this.close();
		}
		return userId;
	}
	
	public int searchData(T t, String searchValue) {
		// 세션에 저장할 값 선언
		String userId = null;
		int check_id = 0;
		
		try {
//			Class<?> dataClass = t.getClass();
//			Field[] dataClassFields = dataClass.getDeclaredFields();

			if (this.connection == null) {
				this.open();
			}
			String query = "SELECT * FROM THECUTE_USER WHERE ID = '" + searchValue + "'";
			PreparedStatement preparedStatement = this.connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			// 쿼리문 결과가 저장된 resultSet에서 id를 가져와서 userId에 저장 리턴할 check_id에 중복여부 값 저장
			if (resultSet.next()) {
				userId = resultSet.getString("id");
			}
			
			// 쿼리문 결과 해당아이디가 존재하면 1 아니면 0을 리턴
			if (userId != null) {
				check_id = 1;
			} else {
				check_id = 0;
			}
			
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return check_id;
	}
	
}
