$(document).ready(function() {
    if(localStorage.getItem("consent") == null){
        $("#ga-notice").toggleClass('is-hidden');
    }

    $(".zoomable img").on("click", function(){
        $(this).toggleClass('zoom');
    });

    $(".yield a").addClass('is-external-link');

    $("a.is-external-link").each(function(i){
        this.target = "_blank";
    });
    
    $("#ga-notice button").on("click", function(e){
        localStorage.setItem("consent", true);
        $("#ga-notice").remove();
    });
});
