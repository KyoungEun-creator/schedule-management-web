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

    // account 테이블에 부서 idx로 되어있는 거 department 테이블의 name으로 가져오고자 함
    String departmentSelectSql = "SELECT name FROM department WHERE idx = ?";
    PreparedStatement departmentSelectQuery = connect.prepareStatement(departmentSelectSql);
    departmentSelectQuery.setString(1, department);

    ResultSet departmentNameSelectResult = departmentSelectQuery.executeQuery();

    String departmentName = "";

    if (departmentNameSelectResult.next()) {
        departmentName = departmentNameSelectResult.getString(1);       // 서비스팀or디자인팀
    }

    // account 테이블에 직책 idx로 되어있는 거 role 테이블의 name으로 가져오고자 함
    String roleSelectSql = "SELECT name FROM role WHERE idx = ?";
    PreparedStatement roleNameSelectQuery = connect.prepareStatement(roleSelectSql);
    roleNameSelectQuery.setString(1, role);

    ResultSet roleNameSelectResult = roleNameSelectQuery.executeQuery();

    if (roleNameSelectResult.next()) {
        role = roleNameSelectResult.getString(1);                        // 팀장or팀원
    }

    // schedule 테이블에서 idx, year, month가 동일한 행의 date만 가져오고자 함
    // 달력 안의 날짜(dateNum.innerHTML)가 schedule의 date와 같다면 스케줄 개수를 넣는 span을 createElement 하고(scheduleNum) dateBox에 appendChild 해주고자 함

    String scheduleDateSelectSql = "SELECT date FROM schedule WHERE user = ? AND year = ? AND month = ?";
    PreparedStatement scheduleDateSelectQuery = connect.prepareStatement(scheduleDateSelectSql);
    scheduleDateSelectQuery.setString(1, idx);
    scheduleDateSelectQuery.setString(2, yearValue);
    scheduleDateSelectQuery.setString(3, monthValue);

    ResultSet scheduleDateSelectResult = scheduleDateSelectQuery.executeQuery();

    ArrayList<String> scheduleDateList = new ArrayList<String>();

    while (scheduleDateSelectResult.next()) {
        String scheduleDate = scheduleDateSelectResult.getString(1);

        scheduleDateList.add("\"" + scheduleDate + "\"");
    }

    // 팀장이 속한 부서와 같은 부서의 직책이 "2"(팀원)인 사람들의 account 행을 가져오고자 함
    String memberSelectSql = "SELECT * FROM account WHERE department = ? AND role = ?";
    PreparedStatement memberSelectQuery = connect.prepareStatement(memberSelectSql);
    memberSelectQuery.setString(1, department);
    memberSelectQuery.setString(2, "2");

    ResultSet memberSelectResult = memberSelectQuery.executeQuery();

    ArrayList<String> memberIdxList = new ArrayList<String>();
    ArrayList<String> memberIdList = new ArrayList<String>();
    ArrayList<String> memberNameList = new ArrayList<String>();

    while (memberSelectResult.next()) {
        String memberIdx = memberSelectResult.getString(1);
        String memberId = memberSelectResult.getString(2);
        String memberName = memberSelectResult.getString(4);

        memberIdxList.add("\"" + memberIdx + "\""); 
        memberIdList.add("\"" + memberId + "\""); 
        memberNameList.add("\"" + memberName + "\"");
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
        <div id="teamName"></div>
        <div class="positionTitle">팀장</div>
        <button id="teamLeader" class="memberName"></button>
        <div class="positionTitle">팀원</div>
        <div id="teamMembersList"></div>
    </div>


    <script>

        // --------------- navOpenBtn 클릭 이벤트 ---------------

        var navBar = document.getElementById("navBar");

        function toggleNavBarEvent() {
            if (navBar.classList.contains("hidden")) {
                navBar.classList.remove("hidden");
            } else {
                navBar.classList.add("hidden");
            }
        }


        // --------------- 달력 관련된 것들 만들기 --------------- 

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

                    // console.log(typeof(dateNum.innerHTML)); // string 

                    // 스케줄 개수
                    var scheduleDateList = <%=scheduleDateList%>;
                    console.log(scheduleDateList);                                  // ['23', '23', '30']
                    console.log("같은 년월의 스케줄 개수 " + scheduleDateList.length)     // 같은 년월의 스케줄 개수 3

                    var scheduleCount = 0;
                    for (var i = 0; i < scheduleDateList.length; i++) {
                        if (scheduleDateList[i] === dateNum.innerHTML) {
                            scheduleCount++;
                            console.log("같은 년월일의 스케줄 개수" + scheduleCount);
                        }
                    }

                    var scheduleNum = document.createElement("span");   
                    scheduleNum.className = "scheduleNum";
                    scheduleNum.innerHTML = scheduleCount;
                    if (scheduleCount > 5) {
                        scheduleNum.innerHTML = "5+";
                    }

                    if (scheduleCount === 0) {
                        scheduleNum.innerHTML = "";
                    }
                    
                    dateBox.appendChild(scheduleNum);
                    weekBox.appendChild(dateBox);

                    // 한 칸의 일자 클릭 시 해당 일자의 스케줄페이지 생성
                    dateBox.addEventListener("click", function (event) {
                        var clickedDate = event.target.querySelector(".dateNum").innerHTML;
                        // console.log(currentDate);
                        var schedulePageURL = "../pages/schedulePage.jsp?idx=" + idx + "&year=" + currentYear + "&month=" + currentMonth + "&date=" + clickedDate;
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


        // --------------- 팀장이 팀원 mainPage 선택 시 ---------------

        var accountIdx = <%=idx%>;
        var accountId = "<%=id%>";
        var accountName = "<%=name%>";
        var accountDepartmentIdx = "<%=department%>";
        var accountDepartment = "<%=departmentName%>"; 
        var accountRole = "<%=role%>"; 

        var scheduleDateList = <%=scheduleDateList%>;

        var memberIdxList = <%=memberIdxList%>; 
        var memberIdList = <%=memberIdList%>;   
        var memberNameList = <%=memberNameList%>; 

        console.log(accountIdx);            // 1
        console.log(accountId);             // jke
        console.log(accountName);           // 조경은
        console.log(accountDepartmentIdx);  // 1
        console.log(accountDepartment);     // 서비스팀
        console.log(accountRole);           // 팀장

        console.log(scheduleDateList);      // ['23', '23', '30']

        console.log(memberIdxList);         // ['23', '24']
        console.log(memberIdList);          // ['jye' , 'jci']
        console.log(memberNameList);        // ['조영은', '조창일']

        // 로그인 되어있으면
        if (accountIdx) {  
            document.getElementById("userID").innerHTML = accountName + ' 님';
        } 
        // 로그인 안 되어있으면 main페이지 자체를 못 보도록 함
        else {
            location.href="../index.jsp"
        }

        // 직급에 따른 nav bar 반영 여부 (팀장이면 nav bar 있음)
        if (accountRole === '팀장') {
            document.getElementById("navOpenBtn").classList.remove("hidden");
        }

        // nav bar 내부 데이터 반영
        document.getElementById("teamName").innerHTML = accountDepartment;
        document.getElementById("teamLeader").innerHTML = accountName;


        // #teamMembersList 안에 팀원명(클릭 시 팀원 스케줄 페이지) createElement 해주기
        for (var i=0; i<memberIdxList.length; i++) {
            var teamMembersList = document.getElementById("teamMembersList");
            var teamMemberBtn = document.createElement("button");
            
            teamMemberBtn.className = "memberName";
            teamMemberBtn.innerHTML = memberNameList[i];
            teamMembersList.appendChild(teamMemberBtn);
            
            console.log(memberIdxList[i]);

            teamMemberBtn.addEventListener("click", function() {
                location.href = "../pages/mainPage.jsp?idx=" + memberIdxList[i] + "&year=" + currentYear + "&month=" + currentMonth;
            })
            
        }
    </script>
</body>