// Homepage js
//= require jquery3

var a = $('#searchbar');
a.submit(function(e) {
    e.preventDefault();
    var b = document.getElementById('searchinput').value;
    document.getElementById("searchquery").innerHTML = b;
    window.location.href = '/plays/' + b;
});

$(document).on("click", ".flip-container", function () {
    $(this).toggleClass('hover');
});
