require 'pry'
require 'nokogiri'

messages = <<-HTML
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Messages</title>
  <link rel="stylesheet" type="text/css" href="/pure.css">
  <link rel="stylesheet" type="text/css" href="/main.css">
</head>

<body>
  <div class="header">
  <div class="pure-g">
    <div class="pure-u-1-8"></div>

    <div class="pure-u-3-4">
      <div class="home-menu pure-menu pure-menu-horizontal">
        <a class="pure-menu-heading" href="/">Messages</a>

        <ul class="pure-menu-list">
          <li class="pure-menu-item"><a href="/messages" class="pure-menu-link">View Messages</a></li>
          <li class="pure-menu-item"><a href="/messages/new" class="pure-menu-link">New Message</a></li>
          <li class="pure-menu-item"></li>
        </ul>
      </div>
    </div>

    <div class="pure-u-1-8"></div>
  </div>
</div>


  <div class="pure-g">
    <div class="pure-u-1-8"></div>

    <div class="pure-u-3-4">
      <h1>Messages</h1>

<div class="pure-g">
  <div class="pure-u-1-4 created_at">
    <strong>Created At</strong>
  </div>

  <div class="pure-u-1-2 content">
    <strong>Content</strong>
  </div>
</div>

  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-22 15:37:46
    </div>
    <div class="pure-u-1-2 content">
      Today is Wednesday.
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-22 15:36:50
    </div>
    <div class="pure-u-1-2 content">
      Test
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-22 15:36:37
    </div>
    <div class="pure-u-1-2 content">
      Test
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-22 15:35:53
    </div>
    <div class="pure-u-1-2 content">
      Test
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-22 15:34:33
    </div>
    <div class="pure-u-1-2 content">
      Test
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-22 15:33:01
    </div>
    <div class="pure-u-1-2 content">
      Test
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-21 21:59:38
    </div>
    <div class="pure-u-1-2 content">
      Test
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-21 15:43:06
    </div>
    <div class="pure-u-1-2 content">
      I'm a Launcher and I'm OK!
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-21 15:42:59
    </div>
    <div class="pure-u-1-2 content">
      I'm a Launcher and I'm OK!
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-20 14:38:11
    </div>
    <div class="pure-u-1-2 content">
      SUCH RESTful
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-20 14:37:38
    </div>
    <div class="pure-u-1-2 content">
      MUCH WOW
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-20 14:37:30
    </div>
    <div class="pure-u-1-2 content">
      VERY POST
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-20 14:36:45
    </div>
    <div class="pure-u-1-2 content">
      test post
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-20 14:32:08
    </div>
    <div class="pure-u-1-2 content">
      test
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-20 14:28:40
    </div>
    <div class="pure-u-1-2 content">
      test
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-15 22:52:14
    </div>
    <div class="pure-u-1-2 content">
      33
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-06-06 03:12:02
    </div>
    <div class="pure-u-1-2 content">
      My message

    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-05-31 18:57:19
    </div>
    <div class="pure-u-1-2 content">
      Still no clue
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-05-30 16:55:42
    </div>
    <div class="pure-u-1-2 content">
      hope
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-05-30 16:50:19
    </div>
    <div class="pure-u-1-2 content">
      I did it again!
    </div>
  </div>

    </div>

    <div class="pure-u-1-8"></div>
  </div>
</body>
</html>
HTML

html = Nokogiri::HTML(messages)
timestamps = html.css("div.pure-u-1-4")
posts = html.css("div.pure-u-1-2")
posts.length.times do |index|
  puts "#{timestamps[index].text.strip}"
  puts "#{posts[index].text.strip}"
end
