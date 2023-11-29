<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/mainStyle.css">
    <link rel="stylesheet" href="../styles/commonStyle.css">
    <link rel="stylesheet" hreff="../styles/templateStyle.css">
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
        <form id="newScheduleContainer" >
            <input id="scheduleTimeSelect" name="time_value" type="time" value="09:00">
            <input id="scheduleInputBox" name="content_value" type="text" placeholder="할 일을 입력하세요.">
            <button id="addScheduleBtn" type="button" onclick="addScheduleEvent()">+</button>
        </form>

        <main id="scheduleListContainer">
            <div id="scheduleColumn">
                <!-- createElement되는 부분 -->
            </div>
        </main>
    </div>
    <script>
        var dateOfSchedule1 = {
            year: "2023",
            month: "11",
            date: "16",
            time: "10:00",
            content: "외주 2차 미팅"
        }
        var dateOfSchedule2 = {
            year: "2023",
            month: "12",
            date: "1",
            time: "15:00",
            content: "2024 프로젝트 계획 발표회 참석"
        }
        var dateOfSchedule3 = {
            year: "2022",
            month: "12",
            date: "30",
            time: "14:00",
            content: "크리스마스 시즌 한정 UI 회의"
        }
        var dateOfSchedule4 = {
            year: "2024",
            month: "10",
            date: "28",
            time: "22:00",
            content: "할로윈 시즌 굿즈 예약 판매 시작"
        }
        
        var scheduleColumn = document.getElementById("scheduleColumn");
        var scheduleTimeSelect = document.getElementById("scheduleTimeSelect");
        var scheduleInputBox = document.getElementById("scheduleInputBox");
        var scheduleListContainer = document.getElementById("scheduleListContainer");

        function addScheduleEvent() {
            createSchedule()
            // // 예외처리

            // // form태그 동작
            // document.getElementById("newScheduleContainer").submit()
        }
        
        function closeScheduleModalEvent() {
            window.close();
        }

        function createSchedule() {
            var scheduleRow = document.createElement("div");
            scheduleRow.className = "scheduleRow";
            scheduleColumn.appendChild(scheduleRow);

            var scheduleName = document.createElement("div");
            scheduleName.className = "scheduleName";
            scheduleName.innerHTML = scheduleTimeSelect.value + '  ' + scheduleInputBox.value;
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

            // 삭제버튼
            scheduleDeleteBtn.addEventListener("click", function(){
                var scheduleRow = this.parentElement.parentElement;
                scheduleRow.remove;
            })
        }
    
    </script>
</body>