<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Establish a database connection
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String jdbcUrl = "jdbc:mysql://localhost:3306/fvms";
        String username = "root";
        String password = "Durga@123";
        connection = DriverManager.getConnection(jdbcUrl, username, password);

        // Fetch data from the database
//        String query = "SELECT pname, votes FROM candidates ";
//        statement = connection.createStatement();
//        resultSet = statement.executeQuery(query);
   //String electionName = "MLA";
   String electionName = (String) session.getAttribute("ename2");
   //String electionName = request.getParameter("ename");
   
        String query = "SELECT pname, votes FROM candidates WHERE ename = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, electionName);
        resultSet = preparedStatement.executeQuery();

        // Create a JSON response manually
        StringBuilder jsonResponse = new StringBuilder("[");
        boolean firstRow = true;
        while (resultSet.next()) {
            if (!firstRow) {
                jsonResponse.append(",");
            } else {
                firstRow = false;
            }
            jsonResponse.append("{\"partyname\":\"")
                       .append(resultSet.getString("pname"))
                       .append("\",\"votecount\":")
                       .append(resultSet.getInt("votes"))
                       .append("}");
        }
        jsonResponse.append("]");

        // Write JSON response
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (resultSet != null) resultSet.close();
        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }
%>
