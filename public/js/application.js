$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  bindEventHandlers();
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

var bindEventHandlers = function(){
  makeTweet()
}

var makeTweet = function (){
  $('.create-tweet-form').on('submit', function(event){
    event.preventDefault();
    var route = $(this).attr('action');
    var button = this
    var submit = $.ajax({
      url: route,
      method: 'post'
    })
    submit.done(function(res){
      $('.robot-tweets-list').prepend(res)
      $($('.robot-tweets-list').children()[6]).remove()
    })
  })
}
