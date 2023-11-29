<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/mainStyle.css">
    <link rel="stylesheet" href="../styles/commonStyle.css">
    <link rel="icon" href="../imgs/stageus.png">
    <title>일정 상세보기</title>
</head>
<body>
    <header>
        <div id="headerLeft">
            <img id="navOpenBtn" src="../imgs/bars-solid.svg" onclick="toggleNavBarEvent()">
            <a href="mainPage.jsp">
                <img id="mainLogo" src="../imgs/stageus_logo_white.png">
            </a>

        </div>
        <div id="headerRight">
            <a href="../pages/myProfilePage.jsp" id="userID">홍길동 님</a>
            <form>
                <button id="logoutBtn" type="submit"> 
                    로그아웃
                    <img id="logoutIcon" src="../imgs/logout.png">
                </button>
            </form>
        </div>
    </header>

    <main id="mainContainer">
        <div id="timeContainer">
            <div id="selectYear">
                <button type="button" id="prevYear" class="changeYearBtn" onclick="prevYearEvent()">◀︎</button>
                <span id="thisYear"></span>
                <button type="button" id="nextYear" class="changeYearBtn" onclick="nextYearEvent()">▶︎</button>
            </div>
            <div id="selectMonth"></div>
        </div>
        <div id="mainCalendar"></div>
    </main>

    <!-- 팀장 전용 팀원 선택 navigation bar -->
    <div id="navBar" style="display:none">
        <div id="teamName">서비스 팀</div>
        <div class="positionTitle">팀장</div>
        <button class="memberName">홍길동</button>
        <div class="positionTitle">팀원</div>
        <div id="teamMembers">
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
            if (navBar.style.display === "none") {
                navBar.style.display = "block";
            } else if (navBar.style.display === "block") {
                navBar.style.display = "none";
            }
        }
    </script>

    <script>
        var dt = new Date();
        var currentYear = dt.getFullYear();
        var currentMonth = dt.getMonth()+1;
        var currentDate = dt.getDate();
        var thisYear = document.getElementById("thisYear");
        var selectMonth = document.getElementById("selectMonth");
        var clickedMonth; 

        thisYear.innerText = currentYear + "년";

        var dateOfSchedule = {
            year: "2023",
            month: "11",
            date: "16",
            time: "10:00",
            content: "외주 2차 미팅"
        }

        // 달력 초기화
        function clearCalendar() {
            var mainCalendar = document.getElementById("mainCalendar");
            mainCalendar.innerHTML = "";
        }

        // 년도 변경 버튼 클릭 이벤트
        function prevYearEvent() {
            clearCalendar();
            currentYear = currentYear - 1;
            thisYear.innerText = currentYear + "년";
            calendar();
        }
        function nextYearEvent() {
            clearCalendar();
            currentYear = currentYear + 1;
            thisYear.innerText = currentYear + "년";
            calendar();
        }

        // 월 버튼 만들기
        function monthBtn() {
            var numberOfMonths = 12;
            var selectMonth = document.getElementById("selectMonth");

            for (var i = 0; i < numberOfMonths; i++) {
                var nameOfMonths = document.createElement("button");
                nameOfMonths.className = "month";
                monthValues = i+1;
                nameOfMonths.innerHTML = monthValues + "월";

                nameOfMonths.addEventListener("click", function() {
                    clickedMonth = parseInt(this.innerHTML); 
                    console.log(this.innerHTML);
                    currentMonth = clickedMonth;
                    clearCalendar();
                    calendar();
                    highlightClickedMonth(); //클릭한 월버튼 표시
                })
                selectMonth.appendChild(nameOfMonths);
            }
        }

        // 클릭한 월버튼 표시
        function highlightClickedMonth() {
            var months = document.getElementsByClassName("month");

            for (var i = 0; i < months.length; i ++) {
                months[i].classList.remove("selectedMonth");
            }

            for (var i = 0; i < months.length; i ++) {
                if (parseInt(months[i].innerHTML) === clickedMonth) {
                    months[i].classList.add("selectedMonth");
                    break;
                }
            }
        }

        // 달력 만들기 
        function calendar() {
            var mainCalendar = document.getElementById("mainCalendar");
            var datesOfMonth = new Date(currentYear, currentMonth, 0).getDate();

            for (var i=0; i<datesOfMonth; i++) {
                var dateBox = document.createElement("div");
                dateBox.className = "dateBox";
                var dateNum = document.createElement("span");
                dateNum.className = "dateNum";
                dateNum.innerHTML = i+1;
                var scheduleNum = document.createElement("span");
                scheduleNum.className = "dateNum";

                dateBox.appendChild(dateNum);
                dateBox.appendChild(scheduleNum);
                mainCalendar.appendChild(dateBox);
            }

        }

        monthBtn();
        calendar();

        


    </script>

            <!-- // 날짜 클릭 이벤트 발생 시 일정상세보기 schedulePage.jsp 열림
            function openScheduleModalEvent() {
                dailyScheduleModal.style.display = "block";
            } -->
</body>
</html>