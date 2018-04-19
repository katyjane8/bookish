// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require map
//= require_tree .

// hover flip on book covers
$(document).ready(function(){
  $('.hover').hover(function(){
    $(this).addClass('flip');
  },function(){
    $(this).removeClass('flip');
  });
});

// book show page
$(document).ready(function(){
  $('.wrapper').on('click', '.back', function(){
    var title = $(this).closest('.back').find('p')[0].innerText
  bookShow(title)
  });
});

 const bookShow = (title) => {
  const body = { book: {
    title: title
  } }
  fetch(`/api/v1/book`,{
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
    body: JSON.stringify(body)
  }).then(response => response.text())
    .then(data =>  {

    if(data){
         redirect: window.location.replace(`/book`)
    } else {
        alert("Invalid");
    }
  })
}

// add favorites from the bestsellers page to current_user
$(document).ready(function(){
  $('.hovercard').on('click', '.hovercard-overlay', function(){
    var user_id = $(this).closest('.hovercard').attr('id')
    var isbns = $(this).closest('.hovercard').find('p')[4].innerText
    var title = $(this).closest('.hovercard').find('p')[5].innerText
    var description = $(this).closest('.hovercard').find('p')[6].innerText
    var author = $(this).closest('.hovercard').find('p')[7].innerText
  addFavorite(user_id, isbns, title, description, author)
  });
});

const addFavorite = (user_id, isbns, title, description, author) => {
  const body = { favorite: {
    user_id: user_id, isbns: isbns, title: title, description: description, author: author
  } }
  fetch(`/api/v1/favorites`,{
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
    body: JSON.stringify(body)
  }).then(response => response.text())
    .then(data =>  {

    if(data){
         redirect: window.location.replace(`/favorites`)
    } else {
        alert("Invalid");
    }
  })
}

// responsive nav with hamburger menu
function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}
