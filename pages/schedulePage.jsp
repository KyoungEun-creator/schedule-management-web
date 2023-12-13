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

    ArrayList<Integer> scheduleIdxList = new ArrayList<Integer>();
    ArrayList<String> scheduleTimeList = new ArrayList<String>();
    ArrayList<String> scheduleContentList = new ArrayList<String>();

    while (scheduleContentSelectResult.next()) {
        Integer scheduleIdx = scheduleContentSelectResult.getInt(1);
        String scheduleTime = scheduleContentSelectResult.getString(6);
        String scheduleContent = scheduleContentSelectResult.getString(7);

        scheduleIdxList.add(scheduleIdx);
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

        console.log(currentYear);
        console.log(currentMonth);
        console.log(currentDate);

        var scheduleColumn = document.getElementById("scheduleColumn");
        var scheduleTimeSelect = document.getElementById("scheduleTimeSelect");
        var scheduleInputBox = document.getElementById("scheduleInputBox");
        var scheduleListContainer = document.getElementById("scheduleListContainer");

        var scheduleIdxList = <%=scheduleIdxList%>;
        var scheduleTimeList = <%=scheduleTimeList%>;
        var scheduleContentList = <%=scheduleContentList%>;

        console.log(scheduleIdxList);
        console.log(scheduleTimeList);
        console.log(scheduleContentList);

        // 스케줄 추가하는 백엔드 통신 이벤트
        function addScheduleEvent() {
            document.getElementById("newScheduleContainer").submit();
        }
        
        // 스케줄 추가를 명시적으로 보여주는 이벤트
        function createScheduleEvent() {
            for (var i = 0; i < scheduleIdxList.length; i++) {

                var scheduleRowForm = document.createElement("form");
                scheduleRowForm.setAttribute("action", "../actions/deleteScheduleAction.jsp");
                scheduleColumn.appendChild(scheduleRowForm);

                var scheduleRow = document.createElement("div");
                scheduleRow.className = "scheduleRow";
                scheduleRowForm.appendChild(scheduleRow);
                
                var scheduleName = document.createElement("div");
                scheduleName.className = "scheduleName";
                scheduleRow.appendChild(scheduleName);

                var scheduleIdx = document.createElement("input");
                scheduleIdx.type = "hidden";
                scheduleIdx.value = scheduleIdxList[i];
                scheduleIdx.setAttribute("name", "scheduleIdx");
                scheduleName.appendChild(scheduleIdx);

                var scheduleTime = document.createElement("input");
                scheduleTime.className = "scheduleTime";
                scheduleTime.value = scheduleTimeList[i];
                scheduleTime.setAttribute("readonly", true); 
                scheduleName.appendChild(scheduleTime);

                var scheduleContent = document.createElement("input");
                scheduleContent.className = "scheduleContent";
                scheduleContent.value = scheduleContentList[i];
                scheduleContent.setAttribute("readonly", true); 
                scheduleName.appendChild(scheduleContent);

                var scheduleExtraFunctions = document.createElement("div");
                scheduleExtraFunctions.className = "scheduleExtraFunctions";
                scheduleRow.appendChild(scheduleExtraFunctions);

                // 수정 버튼
                var scheduleEditBtn = document.createElement("input");
                scheduleEditBtn.className = "scheduleExtraBtn";
                scheduleEditBtn.type = "button";
                scheduleEditBtn.style.backgroundImage = "url('../imgs/editing.png')";
                scheduleEditBtn.style.border = "none";
                scheduleEditBtn.style.backgroundColor = "transparent";
                scheduleEditBtn.style.backgroundSize = "cover"; 
                scheduleExtraFunctions.appendChild(scheduleEditBtn);

                // 수정 완료 버튼
                var scheduleEditFinBtn = document.createElement("input");
                scheduleEditFinBtn.className = "scheduleExtraBtn";
                scheduleEditFinBtn.type = "button";
                scheduleEditFinBtn.style.backgroundImage = "url('../imgs/checked.png')";
                scheduleEditFinBtn.style.border = "none";
                scheduleEditFinBtn.style.backgroundColor = "transparent";
                scheduleEditFinBtn.style.backgroundSize = "cover"; 
                scheduleEditFinBtn.classList.add("hidden");
                scheduleExtraFunctions.appendChild(scheduleEditFinBtn);

                // 삭제 버튼
                var scheduleDeleteBtn = document.createElement("input");
                scheduleDeleteBtn.className = "scheduleExtraBtn";
                scheduleDeleteBtn.type = "button";
                scheduleDeleteBtn.style.backgroundImage = "url('../imgs/delete.png')";
                scheduleDeleteBtn.style.border = "none";
                scheduleDeleteBtn.style.backgroundColor = "transparent";
                scheduleDeleteBtn.style.backgroundSize = "cover"; 
                scheduleExtraFunctions.appendChild(scheduleDeleteBtn);

                // 수정 버튼 클릭 이벤트
                scheduleEditBtn.addEventListener("click", function() {
                    console.log("수정버튼 클릭함");
                    var clickedExtraFunctions = this.parentNode;
                    //scheduleExtraFunctions.style.justifyContent = "center";
                    var clickedEditBtn = clickedExtraFunctions.firstChild;
                    var clickedEditFinBtn = clickedEditBtn.nextSibling;
                    var clickedDeleteBtn = clickedExtraFunctions.lastChild;
                    var clickedRow = this.parentNode.parentNode;
                    var clickedRowForm = this.parentNode.parentNode.parentNode;
                    var clickedName = clickedRow.firstChild;
                    var clickedScheduleIdx = clickedName.firstChild;
                    var clickedScheduleTime = clickedScheduleIdx.nextSibling;
                    var clickedScheduleContent = clickedName.lastChild;

                    // 수정 버튼이 속한 scheduleRow의 배경색 변경
                    clickedRow.style.backgroundColor = "var(--clicked-color)";

                    // 수정 버튼이 속한 scheduleRow가 속한 scheduleRowForm의 action 바뀜
                    clickedRowForm.action = "../actions/updateScheduleAction.jsp";

                    // clickedScheduleTime를 새로운 input 요소로 교체
                    var newTimeInput = document.createElement("input");
                    newTimeInput.type = "time";
                    newTimeInput.setAttribute("name", "schedule_time_changed_value");
                    newTimeInput.value = clickedScheduleTime.value;
                    newTimeInput.className = clickedScheduleTime.className;
                    newTimeInput.style.fontSize = "20px";
                    newTimeInput.readOnly = false;
                    clickedName.replaceChild(newTimeInput, clickedScheduleTime);

                    // clickedScheduleContent를 수정 가능하게 변경
                    clickedScheduleContent.readOnly = false;
                    clickedScheduleContent.setAttribute("name", "schedule_content_changed_value");
                    clickedScheduleContent.style.border = "1px solid black"
                    clickedScheduleContent.style.padding = "10px 10px 10px 10px";

                    // clickedExtraFunctions 안의 input 요소들 변화
                    clickedEditBtn.classList.add("hidden");
                    clickedEditFinBtn.classList.remove("hidden");
                    clickedDeleteBtn.classList.add("hidden");
                });

                // 수정 완료 버튼 클릭 이벤트
                scheduleEditFinBtn.addEventListener("click", function() {
                    console.log("수정완료버튼 클릭함");
                    var clickedRowForm = this.parentNode.parentNode.parentNode;
                    
                    // UPDATE form 전송하여 백엔드 통신
                    clickedScheduleRowForm.submit();

                    createScheduleEvent();
                });

                // 삭제 버튼 클릭 이벤트
                scheduleDeleteBtn.addEventListener("click", function() {
                    var clickedScheduleRowForm = this.parentNode.parentNode.parentNode;
                    // DELETE form 전송하여 백엔드 통신
                    clickedScheduleRowForm.submit();
                });

                // scheduleInputBox 안에 내용 비워줌
                scheduleInputBox.value = "";
            }
        }
        createScheduleEvent();

        // 본 페이지 닫는 이벤트
        function closeScheduleModalEvent() {
            window.close();
        }

        // 스케줄 개수 반영 위해 본 페이지 닫힐 때 부모페이지(mainPage) 새로고침 되도록 함
        window.onunload = function() {
            opener.location.reload(); 
        };
    </script>
</body>