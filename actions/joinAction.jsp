<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- jsp에서 라이브러리 import하는 방법 -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>         <!-- 데이터베이스에서 값 받아오기 라이브러리 -->
<%@ page import="java.util.regex.Pattern" %>  
<%@ page import="java.util.regex.Matcher" %>  


<!-- jsp 코드 -->
<%
    request.setCharacterEncoding("utf-8");

    String idValue = request.getParameter("id_value");
    String pwValue = request.getParameter("pw_value");
    String pwSecondValue = request.getParameter("pw_second_value");
    String nameValue = request.getParameter("name_value");
    String departmentValue = request.getParameter("department_value");
    String roleValue = request.getParameter("role_value");
    String telValue = request.getParameter("tel_value");

    String dbURL = "jdbc:mysql://localhost/schedule_program";
    String dbID = "JKE";
    String dbPW = "1234";
    Connection connect = DriverManager.getConnection(dbURL, dbID, dbPW);

    // 정규식 체크
    boolean isFailedRegex = false;

    String idRegex = "[a-zA-Z0-9]{3,15}$";
    Pattern idPattern = Pattern.compile(idRegex);
    Matcher idMatcher = idPattern.matcher(idValue);

    String pwRegex = "[a-zA-Z0-9*!~^]{3,20}$";
    Pattern pwPattern = Pattern.compile(pwRegex);
    Matcher pwMatcher = pwPattern.matcher(pwValue);

    String nameRegex = "[ㄱ-ㅎ가-힣]{2,5}$";
    Pattern namePattern = Pattern.compile(nameRegex);
    Matcher nameMatcher = namePattern.matcher(nameValue);

    String telRegex = "[0-9]{9,11}$";
    Pattern telPattern = Pattern.compile(telRegex);
    Matcher telMatcher = telPattern.matcher(telValue);
    
    // 아이디 중복 체크
    boolean isDuplicateID = false;

    String checkIdDuplicateSQL = "SELECT * FROM account WHERE id = ?";
    PreparedStatement checkIdDuplicateQuery = connect.prepareStatement(checkIdDuplicateSQL);
    checkIdDuplicateQuery.setString(1, idValue);
    ResultSet searchIdResult = checkIdDuplicateQuery.executeQuery();

    // 비밀번호 동일 여부 체크
    boolean isDifferentPW = false;

    // 전화번호 중복 여부 체크
    boolean isDuplicateTel = false;

    String checkTelDuplicateSQL = "SELECT * FROM account WHERE phone_number = ?";
    PreparedStatement checkTelDuplicateQuery = connect.prepareStatement(checkTelDuplicateSQL);
    checkTelDuplicateQuery.setString(1, telValue);
    
    ResultSet searchTelResult = checkTelDuplicateQuery.executeQuery();

    if (!idMatcher.matches() || !pwMatcher.matches() || !nameMatcher.matches() || !telMatcher.matches()) {
        isFailedRegex = true;
    } 
    // 아이디 중복 (사용불가)
    else if (searchIdResult.next()) {
        isDuplicateID = true;
    }
    // 비밀번호 다름 (사용불가)
    if (pwValue != pwSecondValue) {
        isDifferentPW = true;
    }
    // 전화번호 중복 (사용불가)
    else if (searchTelResult.next()) {
        isDuplicateTel = true;
    }
    // 위 조건 통과 시 회원가입
    else {
        String joinSql = "INSERT INTO account (id, password, name, department, role, phone_number) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement joinQuery = connect.prepareStatement(joinSql);
    
        joinQuery.setString(1, idValue);
        joinQuery.setString(2, pwValue);
        joinQuery.setString(3, nameValue);
        joinQuery.setString(4, departmentValue);
        joinQuery.setString(5, roleValue);
        joinQuery.setString(6, telValue);
    
        joinQuery.executeUpdate();
    }
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
</head>
<body>
    <script>
        console.log("<%=idValue%>")
        console.log("<%=pwValue%>")
        console.log("<%=pwSecondValue%>")
        console.log("<%=nameValue%>")
        console.log("<%=departmentValue%>")
        console.log("<%=roleValue%>")
        console.log("<%=telValue%>")

        var isFailedRegex = <%=isFailedRegex%>;
        var isDuplicateID = <%=isDuplicateID%>;
        var isDifferentPW = <%=isDifferentPW%>;
        var isDuplicateTel = <%=isDuplicateTel%>;

        if (isFailedRegex) {
            alert("옳지 못한 형식입니다.");
        }
        else if (isDuplicateID) {
            alert("사용할 수 없는 아이디입니다.");
        } 
        else if (isDifferentPW) {
            alert("비밀번호를 재확인해주세요.");
        }
        else if (isDuplicateTel) {
            alert("사용할 수 없는 전화번호입니다.");
        }
        else {
            location.href = "../index.jsp";
        }
    </script>
</body>