// JavaScript Document
$(function() {
    $('.change a').click(function() {
        $('.signform').animate({ height: 'tooggle', opacity: 'tooggle' }, 'slow');
    });
})

function start() {
    document.getElementById('login').style.display = "";
    moveType:1;
    
}

function signclose() {
    document.getElementById('login').style.display = "none"
    document.getElementById('registerform').style.display = "none"
}

function loading() {
    document.getElementById('registerloading').style.display = ""
}