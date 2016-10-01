import java.sql.*;
public class oracleTest
{
	static final String JDBC_ORACLE_DRIVER="oracle.jdbc.driver.OracleDriver";
	static final String JDBC_ORACLE_URL="jdbc:oracle:thin:@orion.towson.edu:1521:cosc";
	static final String userName = "sweng304";
	static final String password="sweng";
	private static Connection connection=null;
	
	public static void main(String[] args) throws Exception
	{
		Class.forName(JDBC_ORACLE_DRIVER).newInstance();
                      
		connection =DriverManager.getConnection(JDBC_ORACLE_URL,userName,password);
		Statement queryStatement = connection.createStatement();
		String query="select * from books";
		ResultSet result = queryStatement.executeQuery(query);
		while(result.next())
		{
			
			System.out.println(result.getInt("BOOKID"));
			System.out.println(result.getString("BOOK_NAME"));
		
		}
	}
}
