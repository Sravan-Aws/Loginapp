<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");   
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://10.160.0.36:3306/userdb","admin","admin@1");
    
    PreparedStatement pstmt = null;
    String SQL = "insert into test_user(first_name, last_name, email, username, password) values(?,?,?,?,?)";
       pstmt = con.prepareStatement(SQL);
       pstmt.setString(1,firstName);
       pstmt.setString(2,lastName);
       pstmt.setString(3,email);
       pstmt.setString(4,userName);
       pstmt.setString(5,password);
       int i = pstmt.executeUpdate();
    //Statement st = con.createStatement();
    //int i = st.executeUpdate("insert into TEST_USER(first_name, last_name, email, username, password, regdate) values ('" + firstName + "','"
    //+ lastName + "','" + email + "','" + userName + "','" + password+"'");
    if (i > 0) {
        response.sendRedirect("welcome.jsp");
        
    } else {
        response.sendRedirect("index.jsp");
    }
%>