package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class fileDAO {
	private Connection conn;
	Statement stmt=null;
	ResultSet rs = null;
	
	public fileDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcurl= "jdbc:mysql://localhost:3306/project_db";
			conn = DriverManager.getConnection(jdbcurl,"root","1223");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int upload(String fileName, String fileRealName) {
		//String sql="insert into file values (?,?)";
		try {
			/*PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			pstmt.setString(2,fileRealName);
			return pstmt.executeUpdate();*/
		
			stmt = conn.createStatement();
			String sql="";
			
			String fileName1=fileName;
			String fileRealName1=fileRealName;
			
			sql="insert into file_tbl values ("+"'"+fileName1+"'"+","+"'"+fileRealName1+"'"+")";
			
			stmt.executeUpdate(sql);
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	

}
