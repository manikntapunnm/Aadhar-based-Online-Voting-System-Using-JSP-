<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Base64" %>


<%
String DB_URL = "jdbc:mysql://localhost:3306/fvms";
String DB_USER = "root";
String DB_PASSWORD = "Durga@123";

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

    // Get the event ID from the request parameter
    String id = request.getParameter("id");

    // Retrieve the image from the appropriate table based on the event ID
    String sql = "SELECT image FROM candidates WHERE id=?";
    PreparedStatement statement = connection.prepareStatement(sql);
    statement.setString(1, id);
    ResultSet resultSet = statement.executeQuery();

    if (resultSet.next()) {
        // Get the image data as InputStream
        InputStream inputStream = resultSet.getBinaryStream("image");

        // Set the content type of the response to image/jpeg
        response.setContentType("image/jpeg");

        // Write the image data to the response output stream
        OutputStream outputStream = response.getOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }

        // Close streams and database connection
        outputStream.close();
        inputStream.close();
    } else {
        response.setStatus(HttpServletResponse.SC_NOT_FOUND); // Set HTTP 404 status if no image found
    }

    // Close resources
    resultSet.close();
    statement.close();
    connection.close();
} catch (SQLException | ClassNotFoundException | IOException e) {
    e.printStackTrace();
    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Set HTTP 500 status on error
}
%>
