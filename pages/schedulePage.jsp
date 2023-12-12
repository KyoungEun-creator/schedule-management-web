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
<%@ page import="java.util.ArrayList" %>         <!-- 리스트 라이브러리 -->

<!-- jsp 코드 -->
<%
    request.setCharacterEncoding("utf-8");

    String dbURL = "jdbc:mysql://localhost/schedule_program";
    String dbID = "JKE";
    String dbPW = "1234";
    Connection connect = DriverManager.getConnection(dbURL, dbID, dbPW);

    // schedule 테이블에서 idx, year, month, date가 동일한 행을 시간 순 정렬에 따라 가져오고자 함
    String scheduleContentSelectsql = "SELECT * FROM schedule WHERE user = ? AND year = ? AND month = ? AND date = ? ORDER BY time ASC";
    PreparedStatement scheduleContentSelectQuery = connect.prepareStatement(scheduleContentSelectsql);
    scheduleContentSelectQuery.setString(1, idx);
    scheduleContentSelectQuery.setString(2, yearValue);
    scheduleContentSelectQuery.setString(3, monthValue);
    scheduleContentSelectQuery.setString(4, dateValue);

    ResultSet scheduleContentSelectResult = scheduleContentSelectQuery.executeQuery();

    ArrayList<String> scheduleIdxList = new ArrayList<String>();
    ArrayList<String> scheduleTimeList = new ArrayList<String>();
    ArrayList<String> scheduleContentList = new ArrayList<String>();

    while (scheduleContentSelectResult.next()) {
        String scheduleIdx = scheduleContentSelectResult.getString(1);
        String scheduleTime = scheduleContentSelectResult.getString(6);
        String scheduleContent = scheduleContentSelectResult.getString(7);

        scheduleIdxList.add("\"" + scheduleIdx + "\"");
        scheduleTimeList.add("\"" + scheduleTime + "\"");
        scheduleContentList.add("\"" + scheduleContent + "\"");
    }
%> 
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/mainStyle.css">
    <link rel="stylesheet" href="../styles/commonStyle.css">
    <link rel="stylesheet" href="../styles/templateStyle.css">
    <link rel="icon" href="../imgs/stageus.png">
    <title>일정 상세보기</title>
</head>
<body>
    <!-- 스케줄 modal -->
    <div id="dailyScheduleModal">
        <div id="dailyScheduleHeader">
            <button id="closeScheduleModalBtn" onclick="closeScheduleModalEvent()">
                <img id="closeModalBtnImg" src="../imgs/close.png">
            </button>
            일정관리
        </div>
        <form id="newScheduleContainer" action="../actions/createScheduleAction.jsp">
            <input type="hidden" name="year" value="<%=yearValue%>">
            <input type="hidden" name="month" value="<%=monthValue%>">
            <input type="hidden" name="date" value="<%=dateValue%>">
            <input id="scheduleTimeSelect" name="schedule_time_value" type="time" value="09:00">
            <input id="scheduleInputBox" name="schedule_content_value" type="text" placeholder="할 일을 입력하세요.">
            <button id="addScheduleBtn" type="button" onclick="addScheduleEvent()">+</button>
        </form>

        <main id="scheduleListContainer">
            <div id="scheduleColumn">
                <!-- createElement되는 부분 -->
            </div>
        </main>
    </div>
    <script>
        var currentYear = <%=yearValue%>;
        var currentMonth = <%=monthValue%>;
        var currentDate = <%=dateValue%>;
        
        console.log("년도"+currentYear);
        console.log("달"+currentMonth);
        console.log("일"+currentDate);

        var scheduleColumn = document.getElementById("scheduleColumn");
        var scheduleTimeSelect = document.getElementById("scheduleTimeSelect");
        var scheduleInputBox = document.getElementById("scheduleInputBox");
        var scheduleListContainer = document.getElementById("scheduleListContainer");

        var scheduleIdxList = <%=scheduleIdxList%>;
        var scheduleTimeList = <%=scheduleTimeList%>;
        var scheduleContentList = <%=scheduleContentList%>;

        console.log(scheduleIdxList);       // ['13', '9', '12', '10']
        console.log(scheduleTimeList);      // ['07:00:00', '11:00:00', '13:30:00', '15:00:00']
        console.log(scheduleContentList);   // ['샵 방문', '결혼식 참석', '이동', '밴드부 크리스마스 파티']

        function addScheduleEvent() {
            document.getElementById("newScheduleContainer").submit()
            //createSchedule()
            // window.onunload = function() {
            //     window.location.reload(); // 페이지 새로고침
            // };
            // window.onload = function() {
            //     var url = "../pages/schedulePage.jsp?year="<%= yearValue %>"&month="<%= monthValue %>"&date="<%= dateValue %>;
            //     window.location.href = url;
            // };

           
        }
        
        function createSchedule() {
            for (var i = 0; i < scheduleIdxList.length; i++) {
                var scheduleRow = document.createElement("div");
                scheduleRow.className = "scheduleRow";
                scheduleColumn.appendChild(scheduleRow);

                var scheduleName = document.createElement("div");
                scheduleName.className = "scheduleName";
                scheduleName.innerHTML = scheduleTimeList[i] + '  ' + scheduleContentList[i];
                scheduleRow.appendChild(scheduleName);

                var scheduleExtraFunctions = document.createElement("div");
                scheduleExtraFunctions.className = "scheduleExtraFunctions";
                scheduleRow.appendChild(scheduleExtraFunctions);

                var scheduleEditBtn = document.createElement("button");
                scheduleEditBtn.className = "scheduleExtraBtn";
                scheduleExtraFunctions.appendChild(scheduleEditBtn);

                var scheduleEditBtnImg = document.createElement("img");
                scheduleEditBtnImg.className = "scheduleExtraBtnImg";
                scheduleEditBtnImg.src = "../imgs/editing.png";
                scheduleEditBtn.appendChild(scheduleEditBtnImg);

                var scheduleDeleteBtn = document.createElement("button");
                scheduleDeleteBtn.className = "scheduleExtraBtn";
                scheduleExtraFunctions.appendChild(scheduleDeleteBtn);

                var scheduleDeleteBtnImg = document.createElement("img");
                scheduleDeleteBtnImg.className = "scheduleExtraBtnImg";
                scheduleDeleteBtnImg.src = "../imgs/delete.png";
                scheduleDeleteBtn.appendChild(scheduleDeleteBtnImg);

                scheduleInputBox.value = "";
            }
            
        }
        createSchedule();

        function closeScheduleModalEvent() {
            window.close();
        }
    
    </script>
</body>