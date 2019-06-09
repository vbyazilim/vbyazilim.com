var CookieConsent = {

    createCookie: function (name, value, days) {
        var date = new Date(),
            expires = '';
        if (days) {
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            expires = "; expires=" + date.toGMTString();
        } else {
            expires = "";
        }
        document.cookie = name + "=" + value + expires + "; path=/";
        console.log('cookie created...');
    },

    getCookie: function(name){
        var getResult = false;
        var cookieString = decodeURIComponent(document.cookie);
        if(cookieString.length > 0){
            var cookieArray = cookieString.split(';'); 
            $.each(cookieArray, function(i, kv){
                var kvArray = kv.split('=');
                var cookieName = kvArray[0].replace(' ', '');
                var cookieValue = kvArray[1].replace(' ', '');
                if (name == cookieName) {
                    getResult = cookieValue;
                    return;
                }
            });
        }

        return getResult;
    }
    ,

    createAcceptCookie: function () {
        this.createCookie('cookie_accepted', '1', 10 * 365);
    }

};


$(document).ready(function() {
    if(!CookieConsent.getCookie('cookie_accepted')){
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
        CookieConsent.createAcceptCookie();
        $("#ga-notice").remove();
    });
});
