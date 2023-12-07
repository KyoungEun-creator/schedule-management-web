<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- jsp에서 라이브러리 import하는 방법 -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>          <!-- 데이터베이스에서 값 받아오기 라이브러리 -->

<%
    request.setCharacterEncoding("utf-8");

    String nameValue = request.getParameter("name_value");
    String telValue = request.getParameter("tel_value");

    // 정규식에 관한 예외처리 필요

    Class.forName("com.mysql.jdbc.Driver");
    String dbURL = "jdbc:mysql://localhost/schedule_program";
    String dbID = "JKE";
    String dbPW = "1234";
    Connection connect = DriverManager.getConnection(dbURL, dbID, dbPW);

    String sql = "SELECT id FROM account WHERE name = ? AND phone_number = ?";
    
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, nameValue);
    query.setString(2, telValue);

    ResultSet result = query.executeQuery();

    String foundID = "";
    if (result.next()) {
        foundID = result.getString(1);
    } 
%>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
</head>
<body>
    <script>
        var foundID = "<%=foundID%>"

        if (foundID !== "") {
            alert("찾은 아이디 : " + foundID);
            location.href = "..index.jsp";
        } else {
            alert("해당 정보가 없습니다.");
            location.href = "../pages/findIDPage.jsp"
        }
    </script>

</body>
    
