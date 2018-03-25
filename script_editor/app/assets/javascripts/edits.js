// (function($) {})(jQuery);

$(function() {
    $(document).ready(function() {
        $('.accordion').find('.accordion-toggle').click(function() {
            $(this).next().slideToggle('600');
            $(".accordion-content").not($(this).next()).slideUp('600');
        });
        $('.accordion-toggle').on('click', function() {
            $(this).toggleClass('active').siblings().removeClass('active');
        });
        //renderHelper(1);//this will need to be fixed later
        detectCut();
    });
    analytics();
    renderScene();
    $(document).on("mousedown", '.word', function(event) {
        console.log("down Detected");
        console.log(this);
    });





});

/*
    Above is pro hax
    why it works has something to do with confirming that JQuery is loaded before the
    execution of code
    however as a web dev I have never seen this before in any other framework
    another hack that works is to inline script
    but this is terrible style
 */

function test() {
    console.log($("#synopsis-modal"))
}

/**
 * The bellow method binds the Anyalicts element to the analytis modal so when
 * it is clicked the modal will open
 */
function analytics() {
    $("#play-analytics").click(function () {
        $("#analytics-modal").modal("show");
    })

}

/**
 * Will handel loading difrent scences into the Play area
 */
function renderScene()
{
    $(".sceneMenu").click(function () {
        console.log(this.id);
        var scenceId = this.id.slice(5); //slices off scene of scene2 to give 2 or other number
        console.log( scenceId);
        renderHelper(scenceId);
    })

};
function renderHelper(scenceId) {
    $.get('/scene_render/' + scenceId)//get HTML to insert
        .done(function(data)
        {
            // console.log(data);
            var play =$("#PlaySection");
            play.html("");//clear previous data
            play.html(data);//load new scene
        });
}

function detectCut(){
    console.log("down bound ");
    $(".word").mousedown(function () {
        console.log("down Detected");
        console.log(this);
    })
}

// function renderHelper(scenceId) {
//     $.ajax({
//         type: "GET",
//         url: '/scene_render/' + scenceId,
//         success: function(data) {
//             console.log("data");
//             var play =$("#PlaySection");
//             play.html("");//clear previous data
//             play.html(data);//load new scene
//         },
//         complete: function() {
//             console.log("completed");
//             $('.sceneMenu').click(function () {
//                 console.log("rebind");
//                 renderScene();
//             }); // will fire either on success or error
//         }
//     });
// }