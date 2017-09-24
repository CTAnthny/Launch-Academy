$('.more-sprouts').on('click', function(event) {
  event.preventDefault();

  var nextPageNumber = $('.more-sprouts').attr('href').match(/\d/)[0];
  var request = $.ajax({
    method: "GET",
    url: ("/tweets.json?page=" + nextPageNumber)
  });

  request.done(function(brusselsData) {
    for (let i = 0; i < brusselsData.length; i++) {
      var post = brusselsData[i]["text"];
      var username = brusselsData[i]["username"];
      $('.tweets').append('<li class="tweet">');
      $('.tweet').last().append('<div class="body">' + post + '</div>');
      $('.tweet').last().append('<div class="user">' + username + '</div>');
      $('.user').last().append('</li>');
    }
  });
});
