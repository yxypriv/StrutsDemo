<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="text/javascript" language="javascript" src="ajax1.js"></script>
        <script type="text/javascript" language="javascript" src="cart.js"></script>
        <script type="text/javascript" language="javascript" src="json_sans_eval.js"></script>
        <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <link href="cartCss.css" type="text/css" rel="stylesheet"></link>
        <script>
            window.fbAsyncInit = function () {
                FB.init({
                    appId: '1518924365091713',
                    xfbml: true,
                    version: 'v2.5'
                });
            };

            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) {
                    return;
                }
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
            
            function loginFacebook() {
                FB.login(function(response) {
                    if (response.authResponse) {
                    	window.location.replace("content.do");
                    	/*
                        $.post('cart.do',{accessToken: response.authResponse.accessToken},function(ret){
                        	    
                        })
                        */
                     alert('Welcome!  Fetching your information.... ');
                     FB.api('/me', function(response) {
                        console.log(response);
                        alert('Good to see you, ' + response.name + '.');
//                        window.location = 'index_1.jsp'
                     });
                    } else {
                     alert('User cancelled login or did not fully authorize.');
                    }
                }, {scope: 'public_profile,user_friends,email,user_events,user_managed_groups,user_posts,read_insights,read_audience_network_insights,manage_pages,publish_pages,publish_actions,pages_show_list,pages_manage_cta,pages_manage_leads,ads_read,ads_management'});
            }
        </script>
    </head>
    <body>
        <div>
	        <button onclick="loginFacebook()">FB Login</button>
        </div>
    </body>
</html>