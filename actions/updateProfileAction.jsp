<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- 세션에 들어있던 것 -->
<%
    String idx = (String)session.getAttribute("idx");
%>

<!-- jsp에서 라이브러리 import하는 방법 -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>          <!-- 데이터베이스에서 값 받아오기 라이브러리 -->

<%
    request.setCharacterEncoding("utf-8");

    String pwChangedValue = request.getParameter("pw_changed_value");
    String departmentChangedValue = request.getParameter("department_changed_value");
    String roleChangedValue = request.getParameter("role_changed_value");
    String telChangedValue = request.getParameter("tel_changed_value");

    String dbURL = "jdbc:mysql://localhost/schedule_program";
    String dbID = "JKE";
    String dbPW = "1234";
    Connection connect = DriverManager.getConnection(dbURL, dbID, dbPW);

    // 아이디는 본인 제외한 나머지 아이디와 중복이면 안 되기 때문에, 중복을 체크하는 부분
    String searchSQL = "SELECT * FROM account WHERE phone_number = ? AND idx != ?";
    PreparedStatement searchQuery = connect.prepareStatement(searchSQL);
    searchQuery.setString(1, telChangedValue);
    searchQuery.setString(2, idx);

    ResultSet searchResult = searchQuery.executeQuery();

    Boolean isDuplicateTel = false;         // 중복 체크
    if (searchResult.next()) {              // 이미 해당 전화번호가 존재함 
        isDuplicateTel = true;
    } 
    else {                                  // 해당 전화번호가 기존에 존재하지 않는다면
        String updateSQL = "UPDATE account SET password = ?, department = ?, role = ?, phone_number = ? WHERE idx = ?";

        PreparedStatement updateQuery = connect.prepareStatement(updateSQL);

        updateQuery.setString(1, pwChangedValue);
        updateQuery.setString(2, departmentChangedValue);
        updateQuery.setString(3, roleChangedValue);
        updateQuery.setString(4, telChangedValue);
        updateQuery.setString(5, idx);

        updateQuery.executeUpdate();

        // 세션 비워서 로그아웃
        session.invalidate();

        // 수정완료 됐으니까 로그인페이지로 이동
        response.sendRedirect("../index.jsp"); 
    }
%>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 수정(액션)</title>
    <link rel="stylesheet" href="../style/account.css">
    <link rel="icon" href="../imgs/stageus.png">
</head>
<body>

    <script>
        var isDuplicateTel = <%=isDuplicateTel%>;
        console.log(isDuplicateTel);

        if (isDuplicateTel) {
            alert("이미 다른 사용자에 의해 사용 중인 전화번호입니다.");
            location.href = "../pages/updateProfilePage.jsp";
        }

    </script>
</body>