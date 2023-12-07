<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%
    // 로그인할 때 세션에 넣어뒀던 값들 가져오기
    String idx = (String)session.getAttribute("idx");
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    String department = (String)session.getAttribute("department");
    String role = (String)session.getAttribute("role");

    // 로그인 시점의 년, 월 정보를 변수로 만들어놓음
    String yearValue = request.getParameter("year");
    String monthValue = request.getParameter("month");
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

    // 로그인 안 되어 있으면 열리면 안 됨
    if (idx == null) { 
        response.sendRedirect("../index.jsp");
    }

    // schedule 테이블에서 idx, year, month가 동일한 행의 date만 가져온다


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
    <header>
        <div id="headerLeft">
            <img id="navOpenBtn" class="hidden" src="../imgs/bars-solid.svg" onclick="toggleNavBarEvent()">
            <img id="mainLogo" src="../imgs/stageus_logo_white.png">
        </div>
        <div id="headerRight">
            <!-- 로그인한 회원 본명 + '님' 출력 -->
            <a href="../pages/myProfilePage.jsp" id="userID"></a>
            <form action="../actions/logoutAction.jsp">
                <button id="logoutBtn">
                    로그아웃 
                    <img id="logoutIcon" src="../imgs/logout.png">
                </button>
            </form>
        </div>
    </header>

    <main>
        <div id="timeContainer">
            <div id="selectYear">
                <button type="button" id="prevYear" class="changeYearBtn" onclick="prevYearEvent()">◀︎</button>
                <span id="thisYear"></span>
                <button type="button" id="nextYear" class="changeYearBtn" onclick="nextYearEvent()">▶︎</button>
            </div>
            <div id="monthContainer"></div>
        </div>
        <div id="mainCalendar">

        </div>
    </main>

    <!-- 팀장 전용 팀원 선택 navigation bar -->
    <div id="navBar" class="hidden">
        <div id="teamName">서비스 팀</div>
        <div class="positionTitle">팀장</div>
        <button id="teamLeader" class="memberName">홍길동</button>
        <div class="positionTitle">팀원</div>
        <div id="teamMembersList">
            <button class="memberName">강동원</button>
            <button class="memberName">공지철</button>
            <button class="memberName">김우빈</button>
            <button class="memberName">박서준</button>
            <button class="memberName">서강준</button>
            <button class="memberName">손석구</button>
            <button class="memberName">이동욱</button>
            <button class="memberName">조인성</button>
            <button class="memberName">차은우</button>
            <button class="memberName">최우식</button>
            <button class="memberName">최재림</button>
            <button class="memberName">현빈</button>
        </div>
    </div>

    <!-- navOpenBtn 클릭 이벤트 -->
    <script>
        var navBar = document.getElementById("navBar");

        function toggleNavBarEvent() {
            if (navBar.classList.contains("hidden")) {
                navBar.classList.remove("hidden");
            } else {
                navBar.classList.add("hidden");
            }
        }
    </script>

    <script>
        var idx = "<%=idx%>";
        var currentYear = "<%=yearValue%>"
        var currentMonth = "<%=monthValue%>"

        var dt = new Date();
        var currentDate = dt.getDate();
        var thisYear = document.getElementById("thisYear");
        var monthContainer = document.getElementById("monthContainer");
        var months = document.getElementsByClassName("month");
        var clickedMonth; 

        thisYear.innerHTML = currentYear + "년";   

        // 년도 변경 버튼 클릭 이벤트
        function prevYearEvent() {
            currentYear = parseInt(currentYear) - 1;
            location.href = "../pages/mainPage.jsp?idx=" + idx + "&year=" + currentYear + "&month=" + currentMonth;
        }
        function nextYearEvent() {
            currentYear = parseInt(currentYear) + 1;
            location.href = "../pages/mainPage.jsp?idx=" + idx + "&year=" + currentYear + "&month=" + currentMonth;
        }

        // 월 버튼 만들기
        function monthBtn() {
            var numberOfMonths = 12;
            //var mon = document.getElementById("mon");

            for (var i = 0; i < numberOfMonths; i++) {
                var nameOfMonths = document.createElement("button");
                nameOfMonths.className = "month";
                monthValues = i+1;
                nameOfMonths.innerHTML = monthValues + "월";

                // 월 버튼 클릭 이벤트
                nameOfMonths.addEventListener("click", function() {
                    clickedMonth = parseInt(this.innerHTML); 
                    currentMonth = clickedMonth;
                    location.href = "../pages/mainPage.jsp?idx=" + idx + "&year=" + currentYear + "&month=" + currentMonth;
                  });
                monthContainer.appendChild(nameOfMonths);
            }
        }

        // // 클릭한 월버튼 표시 (페이지 시작될 때 현재 달 표시되어 있음)
        // if (currentMonth === new Date().getMonth()+1) {
        //     months[i].classList.add("selectedMonth");
        // }
        // function highlightClickedMonth() {
        //     if (currentMonth === new Date().getMonth()+1) {
        //         console.log("현재 달입니다")
        //     }
        //     for (var i = 0; i < months.length; i ++) {
        //         months[i].classList.remove("selectedMonth");
        //     }

        //     for (var i = 0; i < months.length; i ++) {
        //         if (parseInt(months[i].innerHTML) === clickedMonth) {
        //             months[i].classList.add("selectedMonth");
        //             //break;
        //         }
        //     }
        // }

        // 달력 만들기 
        function createCalendar() {
            var mainCalendar = document.getElementById("mainCalendar");
            var datesOfMonth = new Date(currentYear, currentMonth, 0).getDate();

            for (var i = 1; i < datesOfMonth+1; i += 7) {
                mainCalendar.appendChild(createWeek(i, datesOfMonth));
            }
            
            // mainCalendar.appendChild(createWeek(1, datesOfMonth))
            // mainCalendar.appendChild(createWeek(8, datesOfMonth))
            // mainCalendar.appendChild(createWeek(15, datesOfMonth))
            // mainCalendar.appendChild(createWeek(22, datesOfMonth))
            // mainCalendar.appendChild(createWeek(29, datesOfMonth))
        }
        
        // 주 만들기
        function createWeek(startDate, max) {
            // 한 줄의 주를 의미하는 div
            var weekBox = document.createElement("div");   
            weekBox.className = "weekBox"

            for (var index = 0; index < 7; index ++) {

                if (startDate + index <= max) {
                    // 한 칸의 일자을 의미하는 div
                    var dateBox = document.createElement("div");        
                    dateBox.className = "dateBox";

                    // 날짜 
                    var dateNum = document.createElement("span");
                    dateNum.className = "dateNum";
                    dateNum.innerHTML = startDate + index;
                    dateBox.appendChild(dateNum);

                    // 스케줄 개수
                    var scheduleNum = document.createElement("span");   
                    scheduleNum.className = "dateNum";
                    dateBox.appendChild(scheduleNum);

                    weekBox.appendChild(dateBox);

                    // 한 칸의 일자 클릭 시 해당 일자의 스케줄페이지 생성
                    dateBox.addEventListener("click", function () {
                        var currentDate = this.textContent;
                        // console.log(currentDate);
                        var schedulePageURL = "../pages/schedulePage.jsp?idx=" + idx + "&year=" + currentYear + "&month=" + currentMonth + "&date=" + currentDate;
                        window.open(schedulePageURL, "_blank", "width=900,height=600, scrollbars=yes");
                    })
                } else {
                    break;
                }
            }
            return weekBox;
        }

        monthBtn();
        createCalendar();
    </script>

    <script>
        var accountIdx = "<%=idx%>";
        var accountId = "<%=id%>";
        var accountName = "<%=name%>";
        var accountDepartment = "<%=department%>";
        var accountRole = "<%=role%>";

        // 로그인 되어있으면
        if (accountIdx) {  
            document.getElementById("userID").innerHTML = accountName + ' 님';
        } 
        // 로그인 안 되어있으면 main페이지 자체를 못 보도록 함
        else {
            location.href="../index.jsp"
        }

        // 직급에 따른 nav bar 반영 여부
        if (accountRole === '1') {
            document.getElementById("navOpenBtn").classList.remove("hidden");
        }

        // nav bar 내부 데이터 반영
        document.getElementById("teamName").innerHTML = accountDepartment;
        document.getElementById("teamLeader").innerHTML = accountName;

        var teamMembersList = document.getElementById("teamMembersList");
        var teamMemberBtn = document.createElement("button");

        // 부서가 accountDepartment와 동일하고 직급이 '2'인 사람들의 정보 가져오기
        // #teamMembersList 안에 <button class="memberName">강동원</button> createElement 해주기

    </script>
</body>