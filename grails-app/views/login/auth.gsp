<%--
  Created by IntelliJ IDEA.
  User: Norberto Sennrich
  Date: 20.05.2019
  Time: 15:55
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code='springSecurity.login.title'/></title>
    <asset:link rel="icon" href="asador/asador-favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="style.css"/>
    <asset:stylesheet src="bootstrap.min.css"/>
</head>

<body class="bg-light pt-5">
<div id="login" class="text-center pt-5">
        <asset:image src="/asador/asador-oficial.png" class="logoBig mx-lg-4 my-lg-2" alt="Asador Logo"/>
        <div class="h2 mb-lg-5 font-weight-normal">Restaurant El Asador<br>Orders Manager</div>
        <div class="h3 mt-lg-5 pt-4 font-weight-normal"><g:message code='springSecurity.login.header'/></div>

        <g:if test='${flash.message}'>
            <div class="login_message">${flash.message}</div>
        </g:if>

        <form class="form-signin" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
                <label for="username" class="sr-only"><g:message code='springSecurity.login.username.label'/>:</label>
                <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username" placeholder="Username" required autofocus/>
                <label for="password" class="sr-only"><g:message code='springSecurity.login.password.label'/>:</label>
                <input type="password" class="form-control" name="${passwordParameter ?: 'password'}" id="password" placeholder="Password" required/>

            <div class="checkbox my-3">
                <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
            </div>
            <input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}" class="btn btn-lg btn-primary btn-block"/>
        </form>
    <div class="my-lg-2">WebeC Projekt 4iCb</div>
</div>
<div class="text-right pb-0 mr-4"><br><br><a href="/../index.html">Zur Projektbeschreibung</a></div>
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>