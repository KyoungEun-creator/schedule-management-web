<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/mainStyle.css">
    <link rel="icon" href="../imgs/stageus.png">
    <title>스케줄러</title>
</head>
<body>
    <header>
        <div id="headerLeft">
            <img id="navOpenBtn" src="../imgs/bars-solid.svg" onclick="toggleNavBar()">
            <a href="mainPage.jsp">
                <img id="mainLogo" src="../imgs/stageus_logo_white.png">
            </a>

        </div>
        <div id="headerRight">
            <a href="../pages/myPofilePage.jsp" id="userID">홍길동 님</a>
            <form>
                <button id="logoutBtn" type="submit"> 
                    로그아웃
                    <img id="logoutIcon" src="../imgs/logout.png">
                </button>
            </form>
        </div>
    </header>

    <main>
        <div id="calenderContainer">
            <div id="timeContainer">
                <div id="selectYear">
                    <button type="button" id="prevYear" class="changeYearBtn">◀︎</button>
                    <span id="thisYear">2023년</span>
                    <button type="button" id="nextYear" class="changeYearBtn">▶︎</button>
                </div>
                <div id="selectMonth">
                    <span class="month">1월</span>
                    <span class="month">2월</span>
                    <span class="month">3월</span>
                    <span class="month">4월</span>
                    <span class="month">5월</span>
                    <span class="month">6월</span>
                    <span class="month">7월</span>
                    <span class="month">8월</span>
                    <span class="month">9월</span>
                    <span class="month">10월</span>
                    <span class="month">11월</span>
                    <span class="month">12월</span>
                </div>
            </div>
            <table>
                <tr>
                    <td onclick="openScheduleModal()" style="cursor:pointer">1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                    <td>6</td>
                    <td>7</td>
                </tr>
                <tr>
                    <td>8</td>
                    <td>9</td>
                    <td>10</td>
                    <td>11</td>
                    <td>12</td>
                    <td>13</td>
                    <td>14</td>
                </tr>
                <tr>
                    <td>15</td>
                    <td>16</td>
                    <td>17</td>
                    <td>18</td>
                    <td>19</td>
                    <td>20</td>
                    <td>21</td>
                </tr>
                <tr>
                    <td>22</td>
                    <td>23</td>
                    <td>24</td>
                    <td>25</td>
                    <td>26</td>
                    <td>27</td>
                    <td>28</td>
                </tr>
                <tr>
                    <td>29</td>
                    <td>30</td>
                    <td>31</td>
                </tr>
            </table>
        </div>

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
                <button class="memberName">이동욱</button>
                <button class="memberName">조인성</button>
                <button class="memberName">차은우</button>
                <button class="memberName">최우식</button>
                <button class="memberName">현빈</button>
            </div>
        </div>

        <!-- 스케줄 modal -->
        <div id="dailyScheduleModal" style="display:none">
            <div id="dailyScheduleHeader">
                <button id="closeScheduleModalBtn" onclick="closeScheduleModal()">
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
    </main>
    
    <script src="../js/main.js"></script>
</body>
</html>