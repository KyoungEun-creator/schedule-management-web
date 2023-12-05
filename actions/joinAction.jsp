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

    // String idValue = request.getParameter("id_value");
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

    // String idRegex = "[a-zA-Z0-9]{3,15}$";
    String pwRegex = "[a-zA-Z0-9*!~^]{3,20}$";
    String nameRegex = "[ㄱ-ㅎ가-힣]{2,5}$";
    String telRegex = "[0-9]{9,11}$";
    
    // 정규식 부합 실패
    boolean isFailedRegex = false;
    if (!pwValue.matches(pwRegex) || !nameValue.matches(nameRegex) || !telValue.matches(telRegex)) {
        isFailedRegex = true;
        //response.sendRedirect("../pages/joinPage.jsp");
    } 

    // 아이디 중복 체크 
    boolean isDuplicateID = false;
    boolean isDifferentPW = false;

    if (!isFailedRegex) {
        // String checkIdDuplicateSQL = "SELECT * FROM account WHERE id = ?";
        // PreparedStatement checkIdDuplicateQuery = connect.prepareStatement(checkIdDuplicateSQL);
        // checkIdDuplicateQuery.setString(1, idValue);
        // ResultSet searchResult = checkIdDuplicateQuery.executeQuery(); // 이미 존재하는 아이디 회원정보의 행

        // 이미 해당 아이디가 존재하면
        // if (searchResult.next()) {      
            //     isDuplicateID = true;
            //response.sendRedirect("../pages/joinPage.jsp");
            // } 
        // 이미 존재하는 아이디는 아니야
        // else {
            // 비밀번호 둘이 다르면
            if (!pwValue.equals(pwSecondValue)) {
                isDifferentPW = true;
            }
            // 비밀번호 둘이 같다면 비로소 데이터 입력
            else {
                String joinSQL = "INSERT INTO account (id, password, name, department, role, phone_number) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement joinQuery = connect.prepareStatement(joinSQL);
            
                joinQuery.setString(1, idValue);
                joinQuery.setString(2, pwValue);
                joinQuery.setString(3, nameValue);
                joinQuery.setString(4, departmentValue);
                joinQuery.setString(5, roleValue);
                joinQuery.setString(6, telValue);
            
                joinQuery.executeUpdate();
            }
        }
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
        // 정규식 부합 테스트
        var isFailedRegex = <%=isFailedRegex%>;
        console.log(isFailedRegex);
        // 아이디 중복 테스트 
        // var isDuplicateID = <%=isDuplicateID%>;
        // console.log(isDuplicateID);
        // 비번 동일 여부 테스튼
        var isDifferentPW = <%=isDifferentPW%>;
        console.log(isDifferentPW);


        if (isFailedRegex) {      
            alert("입력값이 조건에 부합하지 않습니다.");
            location.href = "../pages/joinPage.jsp";
        } 
        // if (isDuplicateID) {
        //     alert("해당 아이디는 사용 불가능합니다.");
        //     location.href = "../pages/joinPage.jsp";
        // }
        if (isDifferentPW) {
            alert("비밀번호가 잘못 입력되었습니다.");
            location.href = "../pages/joinPage.jsp";
        }
    </script>
</body>