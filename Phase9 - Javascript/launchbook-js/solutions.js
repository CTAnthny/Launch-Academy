// Exercise: Find the top navbar by query for the element type, which is <nav>.
document.getElementsByTagName("nav")[0];
// Exercise: Find the sidebar on the right by using it's id.
document.getElementById('sidebar-right');
// Exercise: Find the "Pages" and "Groups" sections of the sidebar by using their class.
document.getElementsByClassName('pages')[0];
document.getElementsByClassName('groups')[0];
// Exercise: Find all of the comments on the page.
document.getElementsByClassName('comments');
// Exercise: Find the first comment on the page.
document.getElementsByClassName('comments')[0];
// Exercise: Find the last comment on the page.
var comments = document.getElementsByClassName('comments');
var lastCommentIndex = comments.length - 1;
comments[lastCommentIndex];
// Exercise: Find the fourth comment on the page.
document.getElementsByClassName('comments')[3].getElementsByTagName('p');
// Exercise: Find one of the ads in the sidebar and hide them.
document.getElementsByClassName('ads')[0].style.visibility = "hidden";
// Exercise: Set the visibility to the form that you hid in the previous step to make it visible again.
document.getElementsByClassName('ads')[0].style.visibility = "visible";
// Exercise: Use setAttribute to change src attribute of one of the ads in the sidebar.
var ad = document.getElementsByClassName('ads')[0];
var adImg = ad.getElementsByTagName('img')[0];
adImg.setAttribute('src', 'http://google.com');
// Exercise: Find Sam's post and change it's text to something incredible.
var fourthPost = document.getElementsByClassName('post')[3];
var fourthPostText = fourthPost.getElementsByTagName('p')[0];
fourthPostText.innerHTML = 'Pokemon GO is Innncredible';
// Exercise: Find the first post and add the .post-liked class to it.
var firstPost = document.getElementsByClassName('post')[0];
var likeable = firstPost.getElementsByTagName('li')[1];
likeable.className = likeable.className + " post-liked";
// Exercise: Find the second post and remove the .post-liked class.
var firstPost = document.getElementsByClassName('post')[0];
var likeable = firstPost.getElementsByTagName('li')[1];
likeable.classList.remove('post-liked');
