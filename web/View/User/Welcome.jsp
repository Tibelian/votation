<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="Model.WebSite"%>
<%@page import="Model.Voter"%>
<%
    if(session.getAttribute("voter") == null){
        response.sendRedirect(WebSite.getUrl() + "/View/User/Login.jsp");
        return;
    }
    Voter voter = (Voter)session.getAttribute("voter");
%>
<!DOCTYPE html>
<html>
    <head>

        <!-- título web -->
        <title>Welcome <%= voter.getFirstName()%> - <%= WebSite.getTitle()%></title>

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
            <div class="p-4 shadow-sm bg-white rounded col-md-7 mx-auto">
                <h2 class="text-center mb-4 border-bottom pb-3  ">
                    Welcome: <%
                        out.print(voter.getFirstName() + " " + voter.getLastName());
                    %>
                </h2>
                <div class="d-flex justify-content-center flex-column align-items-center">
                    <%
                        String formattedDate = voter.getBornDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                    %>
                    <p class="m-0"><strong>Born Date:</strong> <%= formattedDate %></p>
                    <p class="m-0"><strong>Residence:</strong> <%= voter.getResidence() %></p>
                    <%

                        if (voter.isVoted()) {
                            out.print("<p style='text-align:center;margin-top:5px;'>You cannot delete your account because you have already voted!</p>");
                        } else {
                    %>
                    <form class="d-inline w-auto" method="post" action="<%= WebSite.getUrl()%>/User/Delete" onsubmit="return confirm('¿Do you really want to delete your account?')">
                        <p class="m-0">
                            <strong>Delete account:</strong> 
                            <button type="submit" name="delete" class="btn btn-sm btn-danger"><i class="fas fa-times"></i></button>
                        </p>
                    </form>
                    <%
                        }
                    %>
                    <a class="btn btn-sm btn-success" href="<%= WebSite.getUrl() %>/View/User/Edit.jsp"><i class="fas fa-edit"></i> Edit account</a>
                </div>
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
