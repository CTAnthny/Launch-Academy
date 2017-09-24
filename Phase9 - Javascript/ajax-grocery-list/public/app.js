// AJAX new grocery item submit
$('#new_grocery_item').on('submit', function(event) {
  event.preventDefault();

  function checkInput() {
    var groceryFormInputValue = $('#grocery_name').val();
    if (groceryFormInputValue.length == 0) {
      alert("Please fill in the grocery item name.");
      $('#grocery-list').remove();
    }
  }
  checkInput();

  var groceryItem = $("#new_grocery_item").serialize();
  $.ajax({
    url: "/groceries",
    dataType: "text",
    method: "POST",
    data: groceryItem
  }).done(function(data) {
    $('body').html(data);
  });
});

// AJAX grocery item delete from list
$('#delete_grocery_item').on('submit', function(event) {
  event.preventDefault();

  var itemToDeleteDbId = $('#delete_grocery_item').attr('data-id');

  $.ajax({
    url: ("/groceries/" + itemToDeleteDbId),
    method: "DELETE"
  }).done(function(data) {
    $('body').html(data);
  });
});
