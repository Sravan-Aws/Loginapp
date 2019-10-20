<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");   
    String password = request.getParameter("password");
    System.out.println(userName + "---"+password);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://10.160.0.36:3306/userdb","admin","admin@1");
    
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from test_user where userName='" + userName + "' and password='" +password + "'");
    System.out.println("select * from test_user where userName='" + userName + "' and password='" +password + "'");
    if (rs.next()) {
        session.setAttribute("userName", userName);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>