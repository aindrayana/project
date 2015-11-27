$("#<%= dom_id(@comment) %>").fadeOut(200, function() { $(this); });

var count = $("#comment-count").html();
$("#comment-count").html(parseInt(count)-1);
