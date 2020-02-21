<%@page import="java.util.ArrayList"%>
<%@page import="Model.Candidate"%>
<%@page import="Model.WebSite"%>
<%@page import="Model.Voter"%>
<%
    if(session.getAttribute("voter") == null){
        response.sendRedirect(WebSite.getUrl() + "/View/User/Login.jsp");
        return;
    }
    if(session.getAttribute("candidateList") == null){
        response.sendRedirect(WebSite.getUrl() + "/Candidate/LoadList");
        return;
    }
    ArrayList<Candidate> candidates = (ArrayList)session.getAttribute("candidateList");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <!-- título web -->
        <title>Candidates List - <%= WebSite.getTitle() %></title>
        
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
                <h2 class="text-center mb-4">All candidates</h2>
                <table class="table table-light table-hover table-sm">
                    <thead class="thead-dark">
                        <tr>
                            <th>Image</th>
                            <th>Political Party</th>
                            <th>Name</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        //out.print(parties.get(0));
                    for(Candidate candidate:candidates){
                    %>
                        <tr>
                            <td><img src="<%= WebSite.getUrl() + "/Assets/img/" + candidate.getPoliticalParty().getImage() %>" width="50px"></td>
                            <td class="align-middle"><%= candidate.getPoliticalParty().getName() %></td>
                            <td class="align-middle"><%= candidate.getName() %></td>
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
session.setAttribute("candidateList", null);
%>