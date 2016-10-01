import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class SqlQuery4 extends HttpServlet
{

	private String DBaccount ="karne";
		  private String DBpassword = "xxxxxx";
		  private String DBURL = "jdbc:oracle:thin:@orion.towson.edu:1521:cosc";
		  private String JDBCDriver = "oracle.jdbc.driver.OracleDriver";

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        response.setContentType("Text/html");
        PrintWriter out = response.getWriter();

	  String query = request.getParameter("query");

        out.println("<HTML>");
        out.println("<HEAD><TITLE>Query Result</TITLE></HEAD>");
        out.println("<BODY BGCOLOR=\"#FFFFFF\">");
        out.println("<CENTER>");
        out.println("<b> Query you entered is:</b>");
        out.println(query);
	out.println("<BR><BR>");
        out.println("<B>Query Result</B>");
        out.println("<BR><BR>");

        Connection conn = null;

	   try
	    {
		Class.forName(JDBCDriver);

		conn = DriverManager.getConnection(DBURL, DBaccount,DBpassword);

		Statement stmt = conn.createStatement();

                        //out.println("Successful______1");
		ResultSet rs = stmt.executeQuery(query);
//out.println("Successful______2");
		ResultSetMetaData rsMetaData = rs.getMetaData();
                //out.println("Successful______3");
		int colCount = rsMetaData.getColumnCount();
//out.println("Successful______4");
		// Displays the results in a table.
		// Start the table.

		out.println("<table>");
//out.println("Successful______5");
		// Start a new row
		String thisLine = "";
		for (int i = 0; i < colCount; i++) {
		    thisLine += "<th>";
		    // Column header is based on 1.
		    thisLine += rsMetaData.getColumnLabel(i + 1);
		    thisLine += "</th>";
		}
//out.println("Successful______6");
		// Print headers.
		out.println("<tr>" + thisLine + "</tr>");

		// Print the result set.

		int rows = 0;

		//Step through the result set.
		while (rs.next()) {
		    rows++;

		    // Display row contents.
		    thisLine = "";
		    for (int i = 0; i < colCount; i++) {
			// Column index is based on 1.
			thisLine += "<td>";
			thisLine += rs.getString(i +1);
			thisLine += "</td>";
		    } // end for
		    out.println("<tr>" + thisLine + "</tr>");
		} // end while

		// End the table.
		out.println("</table>");
	    } // end try


	catch (Exception e){
	    out.println("<p>Exception in main try block");
	    e.printStackTrace();
	}

	out.println("</body></html>");
    }
}
