<%@page import="java.util.ArrayList"%>
<%@page import="Model.PoliticalParty"%>
<%@page import="Model.WebSite"%>
<%@page import="Model.Voter"%>
<%
    if(session.getAttribute("voter") == null){
        response.sendRedirect(WebSite.getUrl() + "/View/User/Login.jsp");
        return;
    }
    if(session.getAttribute("partyList") == null){
        response.sendRedirect(WebSite.getUrl() + "/PoliticalParty/LoadList");
        return;
    }
    ArrayList<PoliticalParty> parties = (ArrayList)session.getAttribute("partyList");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <!-- título web -->
        <title>Political Parties List - <%= WebSite.getTitle() %></title>
        
        <!-- meta -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!-- css -->
        <link rel="stylesheet" href="../../Assets/css/all.min.css">
        <link rel="stylesheet" href="../../Assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../Assets/css/main.css">
        
    </head>
    <body>
        
        <!-- encabezado -->
        <header>
            <jsp:include page="/View/Default/Header.jsp" />
        </header>
        
        <!-- principal -->
        <main>
            <div class="p-4 shadow-sm bg-white rounded mx-auto">
                <h2 class="text-center mb-4">Political Parties</h2>
                <table class="table table-light table-hover table-sm">
                    <thead class="thead-dark">
                        <tr>
                            <th>Party</th>
                            <th>Acronymous</th>
                            <th>Image</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        //out.print(parties.get(0));
                    for(PoliticalParty party:parties){
                    %>
                        <tr>
                            <td class="align-middle"><%= party.getName() %></td>
                            <td class="align-middle"><%= party.getAchronym() %></td>
                            <td><img src="<%= WebSite.getUrl() + "/Assets/img/" + party.getImage() %>" width="50px"></td>
                        </tr>
                    <%
                     
                    }
                    %>
                    </tbody>
                </table>
            </div>
        </main>
        
        <!-- pie de pagina -->
        <footer>
            <jsp:include page="/View/Default/Footer.jsp"/>
        </footer>
        
        <!-- js -->
        <script src="../../Assets/js/jquery-3.3.1.slim.min.js"></script>
        <script src="../../Assets/js/popper.min.js"></script>
        <script src="../../Assets/js/bootstrap.min.js"></script>
        
    </body>
</html>
<%
session.setAttribute("partyList", null);
%>