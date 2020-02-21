<%@page import="Model.Voter"%>
<%@page import="Model.WebSite"%>
<%
    if (session.getAttribute("voter") instanceof Voter) {
        response.sendRedirect("./Welcome.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>

        <!-- título web -->
        <title>Register - <%= WebSite.getTitle()%></title>

        <!-- meta -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- css -->
        <link rel="stylesheet" href="../../Assets/css/all.min.css">
        <link rel="stylesheet" href="../../Assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../Assets/css/main.css">

    </head>
    <body>

        <!-- principal -->
        <main>
            <%
                String alert = ""
                        + "<div class='alert alert-success alert-dismissible fade show mx-auto w-50' role='alert'>"
                        + "Account created successfully! Now you can login and vote!"
                        + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'>"
                        + "<span aria-hidden='true'>&times;</span>"
                        + "</button>"
                        + "</div>"
                        + "";
                if (request.getParameter("ok") != null && request.getParameter("ok").equals("1")) {
                    out.print(alert);
                }
            %>
            <div class="p-4 shadow-sm bg-white rounded col-md-7 mx-auto">
                <h2 class="text-center mb-4">Create new account</h2>
                <form action="<%= WebSite.getUrl()%>/User/Register" method="post" class="w-100">
                    <div class="form-group">   
                        <label for="username"><i class="fas fa-id-card"></i> NIF:</label>
                        <input type="text" class="form-control" name="username" id="username">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">   
                            <label for="firstName"><i class="fas fa-id-card-alt"></i> First Name:</label>
                            <input type="text" class="form-control" name="firstName" id="firstName">
                        </div>
                        <div class="form-group col-md-6">   
                            <label for="lastName"><i class="fas fa-portrait"></i> Last Name:</label>
                            <input type="text" class="form-control" name="lastName" id="lastName">
                        </div>
                    </div>
                    <div class="form-group">   
                        <label for="password"><i class="fas fa-key"></i> Password:</label>
                        <input type="password" class="form-control" name="password" id="password">
                    </div>
                    <div class="form-row"> 
                        <div class="form-group col-md-6">   
                            <label for="bornDate"><i class="fas fa-calendar"></i> Born Date:</label>
                            <input type="date" class="form-control" name="bornDate" id="bornDate">
                        </div>
                        <div class="form-group col-md-6">   
                            <label for="residence"><i class="fas fa-map"></i> Residence:</label>
                            <input type="text" class="form-control" name="residence" id="residence">
                        </div>
                    </div>
                    <div class="d-flex">
                        <button type="submit" class="w-50 btn btn-primary"><i class="fas fa-user-plus"></i> Register</button>
                        <a href="./Login.jsp" class="ml-auto btn btn-secondary"><i class="fas fa-sign-in-alt"></i> Login</a>
                    </div>
                </form>
            </div>
        </main>

        <!-- js -->
        <script src="../../Assets/js/jquery-3.3.1.slim.min.js"></script>
        <script src="../../Assets/js/popper.min.js"></script>
        <script src="../../Assets/js/bootstrap.min.js"></script>

    </body>
</html>
