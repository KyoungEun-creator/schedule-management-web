<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%
    String yearValue = request.getParameter("year");
    String monthValue = request.getParameter("month");
    String dateValue = request.getParameter("date");

    // 클릭한 삭제 버튼이 속한 schedule의 idx
    String scheduleIdx = request.getParameter("scheduleIdx");
%>

<!-- jsp에서 라이브러리 import하는 방법 -->
<%@ page import="java.sql.DriverManager" %>     <!-- 데이터베이스 탐색 라이브러리 -->
<%@ page import="java.sql.Connection" %>        <!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %> <!-- 데이터베이스 SQL 전송 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>          <!-- 데이터베이스에서 값 받아오기 라이브러리 -->

<%
    request.setCharacterEncoding("utf-8");

	String scheduleTimeChangedValue = request.getParameter("schedule_time_changed_value");
    String scheduleContentChangedValue = request.getParameter("schedule_content_changed_value");

    String dbURL = "jdbc:mysql://localhost/schedule_program";
    String dbID = "JKE";
    String dbPW = "1234";
    Connection connect = DriverManager.getConnection(dbURL, dbID, dbPW);

    String updateScheduleSql = "UPDATE schedule SET time = ?, content = ? WHERE idx = ?";

    PreparedStatement updateScheduleQuery = connect.prepareStatement(updateScheduleSql);
    updateScheduleQuery.setString(1, scheduleTimeChangedValue);
    updateScheduleQuery.setString(2, scheduleContentChangedValue);
    updateScheduleQuery.setString(3, scheduleIdx);

    updateScheduleQuery.executeUpdate();
%>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스케줄 수정(액션)</title>
    <link rel="icon" href="../imgs/stageus.png">
</head>
<body>
    <script>
        window.onload = function() {
            location.href = "../pages/schedulePage.jsp?year=" + <%= yearValue %> + "&month=" + <%= monthValue %> + "&date=" + <%= dateValue %>;
        };
    </script>
</body>