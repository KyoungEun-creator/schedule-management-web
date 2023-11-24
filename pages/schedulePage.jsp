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
    <!-- 스케줄 modal -->
    <div id="dailyScheduleModal" style="display:none">
        <div id="dailyScheduleHeader">
            <button id="closeScheduleModalBtn" onclick="closeScheduleModalEvent()">
                <img id="closeModalBtnImg" src="../imgs/close.png">
            </button>
            일정관리
        </div>
        <form id="newScheduleContainer">
            <input id="scheduleTimeSelect" type="time" value="09:00">
            <input id="scheduleInputBox" type="text" placeholder="할 일을 입력하세요.">
            <button id="addScheduleBtn" type="submit">+</button>
        </form>

        <!-- createElement되는 부분 -->
        <div id="scheduleListContainer">
            <div id="schedule">
                <div id="scheduleName">10시 서비스 팀 zoom 회의</div>
                <div id="scheduleExtraFunctions">
                    <button class="scheduleExtraBtn">
                        <img id="scheduleEditBtnImg" class="scheduleExtraBtnImg" src="../imgs/editing.png">
                    </button>
                    <button class="scheduleExtraBtn">
                        <img id="scheduleDeleteBtnImg" class="scheduleExtraBtnImg" src="../imgs/delete.png">
                    </button>
                </div>
            </div>
            <div id="schedule">
                <div id="scheduleName">10시 서비스 팀 zoom 회의</div>
                <div id="scheduleExtraFunctions">
                    <button class="scheduleExtraBtn">
                        <img id="scheduleEditBtnImg" class="scheduleExtraBtnImg" src="../imgs/editing.png">
                    </button>
                    <button class="scheduleExtraBtn">
                        <img id="scheduleDeleteBtnImg" class="scheduleExtraBtnImg" src="../imgs/delete.png">
                    </button>
                </div>
            </div>
            <div id="schedule">
                <div id="scheduleName">10시 서비스 팀 zoom 회의</div>
                <div id="scheduleExtraFunctions">
                    <button class="scheduleExtraBtn">
                        <img id="scheduleEditBtnImg" class="scheduleExtraBtnImg" src="../imgs/editing.png">
                    </button>
                    <button class="scheduleExtraBtn">
                        <img id="scheduleDeleteBtnImg" class="scheduleExtraBtnImg" src="../imgs/delete.png">
                    </button>
                </div>
            </div>
            <div id="schedule">
                <div id="scheduleName">10시 서비스 팀 zoom 회의</div>
                <div id="scheduleExtraFunctions">
                    <button class="scheduleExtraBtn">
                        <img id="scheduleEditBtnImg" class="scheduleExtraBtnImg" src="../imgs/editing.png">
                    </button>
                    <button class="scheduleExtraBtn">
                        <img id="scheduleDeleteBtnImg" class="scheduleExtraBtnImg" src="../imgs/delete.png">
                    </button>
                </div>
            </div>
            <div id="schedule">
                <div id="scheduleName">10시 서비스 팀 zoom 회의</div>
                <div id="scheduleExtraFunctions">
                    <button class="scheduleExtraBtn">
                        <img id="scheduleEditBtnImg" class="scheduleExtraBtnImg" src="../imgs/editing.png">
                    </button>
                    <button class="scheduleExtraBtn">
                        <img id="scheduleDeleteBtnImg" class="scheduleExtraBtnImg" src="../imgs/delete.png">
                    </button>
                </div>
            </div>
        </div>
    </div>
    <script>
        // 수정,삭제,추가,닫기
    </script>
</body>