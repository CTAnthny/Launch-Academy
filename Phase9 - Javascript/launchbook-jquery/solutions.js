// Exercise: Find the top navbar by query for the element type, which is <nav>.
$('nav');
// Exercise: Find the sidebar on the right by using it's id.
$('$#sidebar-right');
// Exercise: Find the "Pages" and "Groups" sections of the sidebar by using their class.
$('.pages');
$('.groups');
// Exercise: Find all of the comments on the page.
$('.comments');
// Exercise: Find the first comment on the page.
$('.comments').first();
// Exercise: Find the last comment on the page.
$('.comments:last');
// Exercise: Find the fourth comment on the page.
$('.comments:last p');
// Exercise: Find one of the ads in the sidebar and use .hide() to hide it.
$('#sidebar-right div:first').hide();
// Exercise: Use .show() to make the ad that you hid in the previous step visible again.
$('#sidebar-right div:first').show();
// Exercise: Use .toggle() to toggle the display of the nav bar at the top of the page.
$('nav').toggle();
// Exercise: Use .attr() to change src attribute of one of the ads in the sidebar. Here's an image source if you need one: http://placebear.com/200/300.
var $sidebarAd1 = $('#sidebar-right div img:first');
$sidebarAd1.attr('src', 'http://google.com');
// Exercise: Find Sam's post and change it's text to something incredible.
$('.post:last p:first').text('Pokemon Go is Increeedible');
// Exercise: Find the first post and use .addClass() to add the .post-liked class to it.
$('.post:first ul li:first').addClass('post-liked');
// Exercise: Find the second post and use .removeClass() to remove the .post-liked class.
$('.post:first ul li:first').removeClass('post-liked');
// Exercise: Find any post and use .toggleClass() to toggle the .post-liked class.
$('.post:first ul li:first').toggleClass('post-liked');
