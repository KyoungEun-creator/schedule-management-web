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

    String dbURL = "jdbc:mysql://localhost/stageus";
    String dbID = "JKE";
    String dbPW = "1234";
    Connection connect = DriverManager.getConnection(dbURL, dbID, dbPW);

    String sql = "SELECT * FROM account WHERE id = ? AND password = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, pwValue);

    ResultSet result = query.executeQuery();    // 테이블을 읽어와

    // result.next();      // 가져온 테이블의 한 줄을 읽는다

    if (result.next()) {                        // 테이블을 읽을 수 있다면(==존재한다는 뜻임)
        session.setAttribute("idx", result.getString(1));
        session.setAttribute("id", result.getString(2));
        session.setAttribute("password", result.getString(3));
        session.setAttribute("name", result.getString(4));
        session.setAttribute("department", result.getString(5));
        session.setAttribute("position", result.getString(6));
        session.setAttribute("phoneNumber", result.getString(7));
        response.sendRedirect("../pages/mainPage.jsp");
    }
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인하기</title>
</head>
<body>
    <script>
        // 회원정보를 찾지 못할 경우
        alert("아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.")

        console.log(<%=idValue%>)
        console.log(<%=pwValue%>)

        location.href="../index.jsp";
    </script>
</body>
