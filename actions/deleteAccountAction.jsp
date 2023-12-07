<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%
    // 로그인할 때 세션에 넣어뒀던 값들 가져오기
    String idx = (String)session.getAttribute("idx");
%>

<!-- <%
    session.invalidate(); // 세션 정보 삭제로 로그아웃 먼저 진행시켜
%> -->

<!-- jsp에서 라이브러리 import하는 방법 -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>          <!-- 데이터베이스에서 값 받아오기 라이브러리 -->

<%
    request.setCharacterEncoding("utf-8");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/stageus", "JKE", "1234");

    String deleteSql = "DELETE FROM account WHERE idx = ?";
    PreparedStatement deleteQuery = connect.prepareStatement(deleteSql);
    deleteQuery.setString(1, idx);

    int deletedRows = deleteQuery.executeUpdate(); // 삭제된 행 수 반환

    Boolean isDeleteSuccess = false;

    if (deletedRows > 0) {
        isDeleteSuccess = true;
    }
    else {
        isDeleteSuccess = false;
    }
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>탈퇴하기</title>
</head>
<body>
    <script>
        var isDeleteSuccess = <%=isDeleteSuccess%>;
        console.log(isDeleteSuccess);

        if (isDeleteSuccess) {
            alert("탈퇴에 성공했습니다.");
        }
        else {
            alert("탈퇴에 실패했습니다.");
            // location.href = "../pages/myProfilePage.jsp"; 
        }
    </script>

</body>