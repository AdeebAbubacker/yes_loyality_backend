
function SetCookie(
    CookieName,
    CookieValue,
    ExpiryInDays = 1,
    path = '/',
    domain = window.location.hostname,
    secure = false,
    samesite = 'Lax'
) {
    let expires = "";
    if (ExpiryInDays) {
        let date = new Date();
        date.setTime(date.getTime() + (ExpiryInDays * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = CookieName + "=" + CookieValue + expires +
        (path ? "; path=" + path : "") +
        (domain ? "; domain=" + domain : "") +
        (secure ? "; secure" : "") +
        (samesite ? "; SameSite=" + samesite : "");
}

function GetCookie(CookieName) {
    let name = CookieName + "=";
    let ca = document.cookie.split(";");
    for (let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == " ") {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return false;
}

function DeleteCookie(
    CookieName,
    path = '/',
    domain = window.location.hostname,
    secure = false,
    samesite = 'Lax'
) {
    if (GetCookie(CookieName)) {
        document.cookie = CookieName + "=" +
            ((path) ? ";path=" + path : "") +
            ((domain) ? ";domain=" + domain : "") +
            ";expires=Thu, 01 Jan 1970 00:00:01 GMT" +
            ((secure) ? ";secure" : "") +
            ((samesite) ? ";samesite=" + samesite : "");
    }
}


// function DeleteCookie(CookieName) {
//     document.cookie = CookieName + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/; domain=" + window.location.hostname + ";";
// }

// function DeleteCookie(CookieName) {
//     document.cookie = CookieName + "=" + null + ";max-age=0;path=/;Expires=Thu, 01 Jan 1970 00:00:01 GMT;";
// }