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
        <title>Edit account <%= voter.getFirstName()%> - <%= WebSite.getTitle()%></title>

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
                    Editing account: <%= voter.getNif() %>
                </h2>
                <div class="d-flex justify-content-center flex-column align-items-center">
                    
                    <form method="post" action="<%= WebSite.getUrl() + "/User/Edit" %>">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="first_name"><i class="fas fa-user"></i> First Name: </label>
                                <input type="text" name="first_name" value="<%= voter.getFirstName() %>" id="first_name" class="form-control form-control-sm">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="last_name"><i class="far fa-user"></i> Last Name: </label>
                                <input type="text" name="last_name" value="<%= voter.getLastName() %>" id="last_name" class="form-control form-control-sm">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password"><i class="fas fa-key "></i> Password: </label>
                            <input type="password" name="password" id="password" class="form-control form-control-sm" placeholder="Leave it blank to ignore">
                        </div>
                        <%
                            String formattedDate = voter.getBornDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                        %>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="born_date"><i class="fas fa-calendar "></i> Born Date: </label>
                                <input type="date" name="born_date" value="<%= formattedDate %>" id="born_date" class="form-control form-control-sm">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="residence"><i class="fas fa-home "></i> Residence: </label>
                                <input type="text" name="residence" value="<%= voter.getResidence() %>" id="residence" class="form-control form-control-sm">
                            </div>
                        </div>
                        <div class="d-flex justify-content-center">
                            <button class="btn btn-sm btn-primary" type="submit"><i class="fas fa-save"></i> Guardar cambios</button>
                        </div>
                    </form>
                        
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
