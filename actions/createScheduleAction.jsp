<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%
    // 로그인 정보 세션에 넣어놓음
    String idx = (String)session.getAttribute("idx");
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    String department = (String)session.getAttribute("department");
    String role = (String)session.getAttribute("role");

    String yearValue = request.getParameter("year");
    String monthValue = request.getParameter("month");
    String dateValue = request.getParameter("date");
%>

<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>          <!-- 데이터베이스에서 값 받아오기 라이브러리 -->

<!-- jsp 코드 -->
<%
    request.setCharacterEncoding("utf-8");

    String scheduleTimeValue = request.getParameter("schedule_time_value");
    String scheduleContentValue = request.getParameter("schedule_content_value");

    System.out.println("Year Value: " + yearValue);


    String dbURL = "jdbc:mysql://localhost/schedule_program";
    String dbID = "JKE";
    String dbPW = "1234";
    Connection connect = DriverManager.getConnection(dbURL, dbID, dbPW);

    // 사용자가 새로 입력한 스케줄을 schedule 테이블에 CREATE(INSERT) 해주고자 함
    String newScheduleInsertSql = "INSERT INTO schedule (user, year, month, date, time, content) VALUES (?, ?, ?, ?, ?, ?)";
    PreparedStatement newScheduleInsertQuery = connect.prepareStatement(newScheduleInsertSql);

    newScheduleInsertQuery.setString(1, idx);
    newScheduleInsertQuery.setString(2, yearValue);
    newScheduleInsertQuery.setString(3, monthValue);
    newScheduleInsertQuery.setString(4, dateValue);
    newScheduleInsertQuery.setString(5, scheduleTimeValue);
    newScheduleInsertQuery.setString(6, scheduleContentValue);

    newScheduleInsertQuery.executeUpdate();
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스케줄 추가(액션)</title>
</head>
<body>
    <script>
        window.onload = function() {
            location.href = "../pages/schedulePage.jsp?year=" + <%= yearValue %> + "&month=" + <%= monthValue %> + "&date=" + <%= dateValue %>;
        };
    </script>
</body>