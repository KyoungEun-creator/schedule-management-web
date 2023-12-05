<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- jsp에서 라이브러리 import하는 방법 -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>         <!-- 데이터베이스에서 값 받아오기 라이브러리 -->
<%@ page import="java.util.regex.Matcher" %>  
<%@ page import="java.util.regex.Pattern" %>  


<!-- jsp 코드 -->
<%
    request.setCharacterEncoding("utf-8");

    String idValue = request.getParameter("id_value");

    String dbURL = "jdbc:mysql://localhost/schedule_program";
    String dbID = "JKE";
    String dbPW = "1234";
    Connection connect = DriverManager.getConnection(dbURL, dbID, dbPW);

    // 아이디 정규식 체크
    String idRegex = "[a-zA-Z0-9]{3,15}$";
    boolean isFailedRegex = !idValue.matches(idRegex);

    // 아이디 중복 체크
    boolean isDuplicateID = false;

    // 정규식 통과했을 경우
    if (!isFailedRegex) {
        String checkIdDuplicateSQL = "SELECT * FROM account WHERE id = ?";
        PreparedStatement checkIdDuplicateQuery = connect.prepareStatement(checkIdDuplicateSQL);
        checkIdDuplicateQuery.setString(1, idValue);
        ResultSet searchResult = checkIdDuplicateQuery.executeQuery();

        if (searchResult.next()) {
            isDuplicateID = true;
        }
    }
%>
 

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 중복 체크</title>
</head>
<body>
<script>
    var isFailedRegex = <%=isFailedRegex%>;
    var isDuplicateID = <%=isDuplicateID%>;

    if (isFailedRegex) {
        alert("옳지 못한 형식의 아이디입니다.");
    } else if (isDuplicateID) {
        alert("중복된 아이디입니다.");
    } else {
        alert("옳은 형식의 아이디입니다. 사용 가능합니다.");
    }

    // 부모창에 아이디 중복 테스트 결과를 보내는 용도
    window.opener.idDuplicateCheck = isDuplicateID;
    console.log(window.opener.idDuplicateCheck);
</script>
</body>