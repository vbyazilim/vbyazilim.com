var CookieConsent={createCookie:function(e,o,t){var i=new Date,n="";t?(i.setTime(i.getTime()+24*t*60*60*1e3),n="; expires="+i.toGMTString()):n="",document.cookie=e+"="+o+n+"; path=/",console.log("cookie created...")},getCookie:function(e){var o=!1,t=decodeURIComponent(document.cookie);if(t.length>0){var i=t.split(";");$.each(i,function(t,i){var n=i.split("="),c=n[0].replace(" ",""),a=n[1].replace(" ","");if(e==c)return void(o=a)})}return o},createAcceptCookie:function(){this.createCookie("cookie_accepted","1",3650)}};$(document).ready(function(){CookieConsent.getCookie("cookie_accepted")||$("#ga-notice").toggleClass("is-hidden"),$(".zoomable img").on("click",function(){$(this).toggleClass("zoom")}),$(".yield a").addClass("is-external-link"),$("a.is-external-link").each(function(){this.target="_blank"}),$("#ga-notice button").on("click",function(){CookieConsent.createAcceptCookie(),$("#ga-notice").remove()})});