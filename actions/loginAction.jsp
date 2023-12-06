<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- jsp에서 라이브러리 import하는 방법 -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>          <!-- 데이터베이스에서 값 받아오기 라이브러리 -->

<%
    request.setCharacterEncoding("utf-8");

    String idValue = request.getParameter("id_value");
    String pwValue = request.getParameter("pw_value");

    String dbURL = "jdbc:mysql://localhost/schedule_program";
    String dbID = "JKE";
    String dbPW = "1234";
    Connection connect = DriverManager.getConnection(dbURL, dbID, dbPW);

    String sql = "SELECT * FROM account WHERE id = ? AND password = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, pwValue);

    ResultSet result = query.executeQuery();    

    String idx = null;
    Boolean isLoginSuccess = false;

    if (result.next()) {

        idx = result.getString(1);

        session.setAttribute("idx", idx);
        session.setAttribute("id", result.getString(2));
        session.setAttribute("password", result.getString(3));
        session.setAttribute("name", result.getString(4));
        session.setAttribute("department", result.getString(5));
        session.setAttribute("role", result.getString(6));
        session.setAttribute("tel", result.getString(7));

        isLoginSuccess = true;
    }
    else {
        isLoginSuccess = false;
    }
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
</head>
<body>
    <script>
        var idx = "<%=idx%>";
        var dt = new Date();
        var currentYear = dt.getFullYear();
        var currentMonth = dt.getMonth() + 1;
        var isLoginSuccess = <%=isLoginSuccess%>;

        if (isLoginSuccess === true) {
            location.href = "../pages/mainPage.jsp?idx=" + idx + "&year=" + currentYear + "&month=" + currentMonth;
        } 
        else {
            alert("존재하지 않는 계정입니다.")
            location.href = "../index.jsp"

        }
    </script>
</body>
