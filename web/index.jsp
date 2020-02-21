
<%@page import="Model.Voter"%>
<%@page import="Model.WebSite"%>
<%

    if (session.getAttribute("voter") == null) {
        response.sendRedirect(WebSite.getUrl() + "/View/User/Login.jsp");
    } else {
        response.sendRedirect(WebSite.getUrl() + "/View/User/Welcome.jsp");
    }

%>
