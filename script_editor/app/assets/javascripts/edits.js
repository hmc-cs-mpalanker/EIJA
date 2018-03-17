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
    });
    analytics();



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

