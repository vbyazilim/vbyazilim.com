$(document).ready(function() {
    $(".zoomable img").on("click", function(){
        $(this).toggleClass('zoom');
    });
    
    $("a.is-external-link").each(function(i){
        this.target = "_blank";
    });
});
