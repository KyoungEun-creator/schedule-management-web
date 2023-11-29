<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

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
            if (navBar.classList.contains("hidden")) {
                navBar.classList.remove("hidden");
            } else {
                navBar.classList.add("hidden");
            }
        }
    </script>

    <script>
        var dt = new Date();
        var currentYear = dt.getFullYear();
        var currentMonth = dt.getMonth() + 1;
        var currentDate = dt.getDate();
        var thisYear = document.getElementById("thisYear");
        var monthContainer = document.getElementById("monthContainer");
        var clickedMonth; 

        thisYear.innerHTML = currentYear + "년";   

        // 달력 초기화
        function clearCalendar() {
            var mainCalendar = document.getElementById("mainCalendar");
            mainCalendar.innerHTML = "";
        }

        // 년도 변경 버튼 클릭 이벤트
        function prevYearEvent() {
            clearCalendar();
            currentYear = currentYear - 1;
            thisYear.innerHTML = currentYear + "년";
            createCalendar();
        }
        function nextYearEvent() {
            clearCalendar();
            currentYear = currentYear + 1;
            thisYear.innerHTML = currentYear + "년";
            createCalendar();
        }

        var months = document.getElementsByClassName("month");

        // 월 버튼 만들기
        function monthBtn() {
            var numberOfMonths = 12;
            var mon = document.getElementById("mon");

            for (var i = 0; i < numberOfMonths; i++) {
                var nameOfMonths = document.createElement("button");
                nameOfMonths.className = "month";
                monthValues = i+1;
                nameOfMonths.innerHTML = monthValues + "월";

                // 월 버튼 클릭 이벤트
                nameOfMonths.addEventListener("click", function() {
                    clickedMonth = parseInt(this.innerHTML); 
                    currentMonth = clickedMonth;
                    clearCalendar();
                    createCalendar();
                    highlightClickedMonth();        
                });
                monthContainer.appendChild(nameOfMonths);

                // 페이지 시작될 때 현재 달 표시되어 있도록
                if (currentMonth === monthValues) {
                    months[i].classList.add("selectedMonth");
                }
            }
        }

        // 클릭한 월버튼 표시
        function highlightClickedMonth() {
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

                    // 날짜 의미
                    var dateNum = document.createElement("span");
                    dateNum.className = "dateNum";
                    dateNum.innerHTML = startDate + index;
                    dateBox.appendChild(dateNum);

                    // 스케줄 개수 의미
                    var scheduleNum = document.createElement("span");   
                    scheduleNum.className = "dateNum";
                    dateBox.appendChild(scheduleNum);

                    weekBox.appendChild(dateBox);

                    // 한 칸의 일자 클릭 시 해당 일자의 스케줄페이지 생성
                    dateBox.addEventListener("click", function () {
                        window.open("../pages/schedulePage.jsp", "_blank", "width=900,height=600,scrollbars=yes");
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
</body>