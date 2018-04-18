// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal 
$("#myBtn").click(function(){
	$("#myModal").modal('show');
})

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function showGroupInfo(groupNum) {
    // $.get('/scene_render/' + scenceId)//get HTML to insert
    //     .done(function(data)
        {
            // console.log(data);
            var group =$("#GroupWindow");
            group.html("");//clear previous data
            group.html("abcde");//load new scene
        };
}