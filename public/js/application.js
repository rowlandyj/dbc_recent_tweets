$(document).ready(function() {
  $('.container').on('submit','form',function(e){
    e.preventDefault();
    $('#tweets').html("<img src='hypnotoad.gif'>");
    $.post('/', $(this).serialize()).done(function(response){
      $('#tweets').html(response);
    });
  });
});
