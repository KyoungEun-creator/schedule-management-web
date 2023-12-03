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

    String dbURL = "jdbc:mysql://localhost/schedule_program";
    String dbID = "JKE";
    String dbPW = "1234";
    Connection connect = DriverManager.getConnection(dbURL, dbID, dbPW);

    // 아이디 중복 체크 
    String checkIdDuplicateSQL = "SELECT * FROM account WHERE id = ?";
    PreparedStatement checkIdDuplicateQuery = connect.prepareStatement(checkIdDuplicateSQL);
    checkIdDuplicateQuery.setString(1, idValue);
    ResultSet searchResult = searchQuery.executeQuery(); // 이미 존재하는 아이디 회원정보의 행

    Boolean isDuplicate = false;    
    if (searchResult.next()) {      // 이미 해당 아이디가 존재한다면 아래에서 alert문 출력, 그리고 insert 하면 안 되지
        isDuplicate = true;
    } else {
        isDuplicate = false;

        String sql = "INSERT INTO account (id, password, name, department, role, phone_number) VALUES (?, ?, ?, ?, ?, ?)";

        PreparedStatement query = connect.prepareStatement(sql);
    
        query.setString(1, idValue);
        query.setString(2, pwValue);
        query.setString(3, nameValue);
        query.setString(4, departmentValue);
        query.setString(5, roleValue);
        query.setString(6, telValue);
    
        // query 전송
        query.executeUpdate();
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
    // 아이디 중복 체크
    var isDuplicate = <%=isDuplicate%>;
    console.log(isDuplicate);

    if (isDuplicate) {      
        alert("이미 존재하는 아이디입니다.");
        location.href = "../pages/joinPage.jsp";
        document.getElementById("impossibleIDMessage").classList.remove("hidden");
    } else {
        alert("사용 가능한 아이디입니다.");
        location.href = "../pages/joinPage.jsp";
        document.getElementById("possibleIDMessage").classList.remove("hidden");
    }

</script>
</body>