var navBar = document.getElementById("navBar");
var dailyScheduleModal = document.getElementById("dailyScheduleModal");


// navOpenBtn 클릭 이벤트
function toggleNavBarEvent() {
    if (navBar.style.display === "none") {
        navBar.style.display = "block";
    } else if (navBar.style.display === "block") {
        navBar.style.display = "none";
    }
}

// closeScheduleModalBtn 클릭 이벤트
function closeScheduleModalEvent() {
    dailyScheduleModal.style.display = "none";
}

// 날짜 클릭 이벤트
function openScheduleModalEvent() {
    dailyScheduleModal.style.display = "block";
}