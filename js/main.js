// #nav-open-btn click event
function toggleNavBar() {
    var navBar = document.getElementById('navBar');

    if (navBar.style.display === 'none') {
        navBar.style.display = 'block';
    } else if (navBar.style.display === 'block') {
        navBar.style.display = 'none';
    }
}

// 
var dailyScheduleModal = document.getElementById('dailyScheduleModal');
function closeScheduleModal() {
    dailyScheduleModal.style.display = 'none';
}

//
function openScheduleModal() {
    dailyScheduleModal.style.display = 'block';
}