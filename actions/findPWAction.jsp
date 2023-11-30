<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- jsp에서 라이브러리 import하는 방법 -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>          <!-- 데이터베이스에서 값 받아오기 라이브러리 -->


<%
    request.setCharacterEncoding("utf-8");

    String idValue = request.getParameter("id_value");
    String nameValue = request.getParameter("name_value");
    String emailValue = request.getParameter("email_value");
    String birthdayValue = request.getParameter("birthday_value");
    String phoneNumberValue = request.getParameter("phoneNumber_value");

    Class.forName("com.mysql.jdbc.Driver");
    String dbURL = "jdbc:mysql://localhost/stageus";
    String dbID = "JKE";
    String dbPW = "1234";
    Connection connect = DriverManager.getConnection(dbURL, dbID, dbPW);

    String sql = "SELECT password FROM account WHERE id = ? AND name = ? AND email = ? AND birthday = ? AND phone_number = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, nameValue);
    query.setString(3, emailValue);
    query.setString(4, birthdayValue);
    query.setString(5, phoneNumberValue);
    
    ResultSet result = query.executeQuery();

    String foundPw = "";

    if (result.next()) {
        foundPw = result.getString(1);
    }
%>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="../style/myProfile.css">
    <link rel="icon" href="../imgs/stageus.png">
</head>
<body>
    <script>
        var foundPw = "<%=foundPw%>"

        if (foundPw !== "") {
            alert("찾은 비밀번호 : " + foundPw);
            location.href = "../pages/loginPage.jsp";
        } else {
            alert("해당 정보가 없습니다.");
            location.href = "../pages/searchPwPage.jsp";
        }
    </script>
</body>
