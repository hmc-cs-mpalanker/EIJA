// Homepage js

var a = document.getElementById('searchbar');
a.addEventListener('submit',function(e) {
    e.preventDefault();
    var b = document.getElementById('searchinput').value;
    document.getElementById("searchquery").innerHTML = b;
    window.location.href = '/plays/' + b;
});
