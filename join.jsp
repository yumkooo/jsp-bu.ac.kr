<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
    
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    Connection con = null;
    PreparedStatement pstmt = null;
    
    
	
    String sql = "INSERT INTO user(id, password, name, phone, address) VALUES(?, ?, ?, ?, ?)";
	
   	String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql42";
	
	Class.forName(driverName);
	
	con = DriverManager.getConnection(dbURL, "root", "kbc0924");
	
	pstmt = con.prepareStatement(sql.toString());  
	
    String name_temp = request.getParameter("name");
	
	pstmt.setString(1, request.getParameter("id"));
	pstmt.setString(2, request.getParameter("pw"));
	pstmt.setString(3, request.getParameter("name"));
	pstmt.setString(4, request.getParameter("phone"));
	pstmt.setString(5, request.getParameter("addr"));
	
    int count = pstmt.executeUpdate();
    
    if (count > 0)
        count = 0;
        out.print(count);
%>
    <h1>Wallnut</h1>
    <br><%=name_temp%>님, 가입을 축하합니다!<br><br>
    <button onclick="location='login.html'">로그인</button>
    <button onclick="location='main.html'">홈으로</button>
<%  
    
    
   pstmt.close();
   con.close();
    

%>
</body>
</html>