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

    String idChangedValue = request.getParameter("id_changed_value");
    String pwChangedValue = request.getParameter("pw_changed_value");
    String nameChangedValue = request.getParameter("name_changed_value");
    String emailChangedValue = request.getParameter("email_changed_value");
    String birthdayChangedValue = request.getParameter("birthday_changed_value");
    String phoneNumberChangedValue = request.getParameter("phoneNumber_changed_value");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/stageus","JKE","1234");

    // 아이디는 중복이면 안 되기 때문에, 중복을 체크하는 부분
    String searchSQL = "SELECT * FROM account WHERE id=?";
    PreparedStatement searchQuery = connect.prepareStatement(searchSQL);
    searchQuery.setString(1, idChangedValue);
    ResultSet searchResult = searchQuery.executeQuery();

    Boolean isDuplicate = false;    // 중복 체크
    if (searchResult.next()) {      // 이미 해당 아이디가 존재함 ( 에러 출력 )
        isDuplicate = true;
    } 
    else {                        // 해당 아이디가 기존에 존재하지 않는다면 ( 수정 진행 )
        String updateSQL = "UPDATE account SET id = ?, password = ?, name = ?, email = ?, birthday = ?, phone_number = ? WHERE idx = ?";

        PreparedStatement updateQuery = connect.prepareStatement(updateSQL);

        updateQuery.setString(1, idChangedValue);
        updateQuery.setString(2, pwChangedValue);
        updateQuery.setString(3, nameChangedValue);
        updateQuery.setString(4, emailChangedValue);
        updateQuery.setString(5, birthdayChangedValue);
        updateQuery.setString(6, phoneNumberChangedValue);
        updateQuery.setString(7, idx);

        updateQuery.executeUpdate();

        // 세션 비워서 로그아웃 해
        session.invalidate();

        // 수정완료 됐으니까 로그인페이지로 이동해
        response.sendRedirect("../pages/loginPage.jsp"); 
    }
%>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 수정하기(액션)</title>
    <link rel="stylesheet" href="../style/account.css">
    <link rel="icon" href="../imgs/stageus.png">
</head>
<body>

    <script>
        var isDuplicate = <%=isDuplicate%>;
        console.log(isDuplicate);

        if (isDuplicate) {
            alert("수정하려는 아이디가 이미 존재합니다.");
            location.href = "../pages/editAccountPage.jsp";
        }

    </script>
</body>