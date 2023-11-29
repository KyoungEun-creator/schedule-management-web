<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- jsp에서 라이브러리 import하는 방법 -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->

<!-- jsp 코드 -->
<%
    request.setCharacterEncoding("utf-8");

    String idValue = request.getParameter("id_value");
    String pwValue = request.getParameter("pw_value");
    String nameValue = request.getParameter("name_value");
    String departmentValue = request.getParameter("department_value");
    String roleValue = request.getParameter("role_value");
    String telValue = request.getParameter("tel_value");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/schedule_program", "JKE", "1234");

    String sql = "INSERT INTO account (id, password, name, department, role, phone_number) VALUES (?, ?, ?, ?, ?, ?)";

    PreparedStatement query = connect.prepareStatement(sql);

    query.setString(1, idValue);
    query.setString(2, pwValue);
    query.setString(3, nameValue);
    query.setString(4, departmentlValue);
    query.setString(5, roleValue);
    query.setString(6, telValue);

    // query 전송
    query.executeUpdate();
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
</head>
<body>
    
    <script>
        alert("회원가입을 축하합니다");
        location.href = "../pages/mainPage.jsp"
    </script>
</body>