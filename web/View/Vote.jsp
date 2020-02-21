<%@page import="Model.Voter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.PoliticalParty"%>
<%@page import="Model.WebSite"%>
<%
    if (session.getAttribute("partyList") == null) {
        response.sendRedirect(WebSite.getUrl() + "/PoliticalParty/LoadList?vote=1");
        return;
    }
    if(((Voter)session.getAttribute("voter")).isVoted()){
        response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=already-voted");
        return;
    }
    ArrayList<PoliticalParty> parties = (ArrayList) session.getAttribute("partyList");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!-- título web -->
        <title>Vote The Political Party - <%= WebSite.getTitle()%></title>

        <!-- meta -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- css -->
        <link rel="stylesheet" href="../Assets/css/all.min.css">
        <link rel="stylesheet" href="../Assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../Assets/css/main.css">

    </head>
    <body>

        <!-- encabezado -->
        <header>
            <jsp:include page="/View/Default/Header.jsp" />
        </header>

        <!-- principal -->
        <main>
            <div class="p-4 shadow-sm bg-white rounded mx-auto">
                <h2 class="text-center mb-4">Vote your political party</h2>
                <form method="post" action="<%= WebSite.getUrl()%>/doVote">
                    <table class="table table-sm table-light table-hover table-sm">
                        <thead class="thead-dark">
                            <tr>
                                <th>Logo</th>
                                <th>Name</th>
                                <th>#</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (PoliticalParty party : parties) {
                            %>
                            <tr onclick="document.getElementById('<%= party.getId()%>').click();" style="cursor:pointer;">
                                <td><img src="<%= WebSite.getUrl() + "/Assets/img/" + party.getImage()%>" width="50px"></td>
                                <td class="align-middle"><%= party.getName()%></td>
                                <td class="align-middle">
                                    <input required class="vote" type="radio" name="party" id="<%= party.getId()%>" value="<%= party.getId()%>">
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <div class="d-flex w-100 justify-content-center">
                        <button type="submit" class="btn btn-primary">Guardar mi voto!</button>
                    </div>
                </form>
            </div>
        </main>

        <!-- pie de pagina -->
        <footer>
            <jsp:include page="/View/Default/Footer.jsp"/>
        </footer>

        <!-- js -->
        <script src="../Assets/js/jquery-3.3.1.slim.min.js"></script>
        <script src="../Assets/js/popper.min.js"></script>
        <script src="../Assets/js/bootstrap.min.js"></script>

    </body>
</html>

