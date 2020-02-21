<%@page import="Model.Parameter"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="Model.WebSite"%>
<%@page import="Model.Voter"%>
<%
    if(session.getAttribute("voter") == null){
        response.sendRedirect(WebSite.getUrl() + "/View/User/Login.jsp");
        return;
    }
    if(session.getAttribute("parameter") == null){
        response.sendRedirect(WebSite.getUrl() + "/Parameter/Load");
        return;
    }
    Voter voter = (Voter)session.getAttribute("voter");
    Parameter parameter = (Parameter)session.getAttribute("parameter");
%>
<!DOCTYPE html>
<html>
    <head>

        <!-- título web -->
        <title>Scrutiny - <%= WebSite.getTitle()%></title>

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
            <div class="p-4 shadow-sm bg-white rounded col-md-7 mx-auto">
                <h2 class="text-center mb-4 border-bottom pb-3  ">
                    Scrutiny Status
                </h2>
                <div class="d-flex justify-content-center flex-column align-items-center">
                    <p>The <strong><%= parameter.getCircumscription() %></strong>'s circumscription for <strong><%= parameter.getTypeQuery() %></strong></p>
                    <p>There are <strong><%= parameter.getNumCandidates() %></strong> candidates participating in the elections</p>
                    <%
                    
                    String scrutiny = "";
                    String s = parameter.getScrutiny();
                    if(s.equals("Opened")){
                        scrutiny = "<span class='badge badge-success'>" + s + "</span>";
                    }else if(s.equals("Closed")){
                        scrutiny = "<span class='badge badge-secondary'>" + s + "</span>";
                    }else{
                        scrutiny = "<span class='badge badge-danger'>" + s + "</span>";
                    }

                    %>
                    <p>Now the scrutiny is <%= scrutiny %></p>
                    <%
                    if(voter.getRole().equals("Administrator")){
                    %>
                    <h6 class="border-bottom w-100 mt-3 pb-2">Manage votation system parameters:</h6>
                    <form class="w-100 mt-2" method="post" action="<%= WebSite.getUrl() + "/Parameter/ModifyScrutiny" %>">
                        <div class="form-row">
                            <div class="form-group col-md-9">
                                <label for="new_scrutiny">Select the new scrutiny status: </label>
                                <select id="new_scrutiny" name="new_scrutiny" class="form-control form-control-sm">
                                    <option value="Closed">Closed</option>
                                    <option value="Opened">Opened</option>
                                    <option value="Finished">Finished</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3 d-flex align-items-end">
                                <button class="btn btn-sm btn-primary w-100" type="submit"><i class="fas fa-save"></i> Save</button>
                            </div>
                        </div>
                    </form>
                    <%
                    }
                    %>
                </div>
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
<%
session.setAttribute("parameter", null);
%>
