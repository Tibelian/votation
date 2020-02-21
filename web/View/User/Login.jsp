<%@page import="Model.Voter"%>
<%@page import="Model.WebSite"%>
<%
    if(session.getAttribute("voterr") instanceof Voter){
        response.sendRedirect("Welcome.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        
        <!-- título web -->
        <title>Login - <%= WebSite.getTitle() %></title>
        
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
            <div class="p-4 shadow-sm bg-white rounded col-md-6 mx-auto">
                <h2 class="text-center mb-4">Login</h2>
                <form action="<%= WebSite.getUrl() %>/User/Login" method="post" class="w-100">
                    <div class="form-group">   
                        <label for="username"><i class="fas fa-id-card"></i> NIF:</label>
                        <input type="text" class="form-control" name="username" id="username">
                    </div>
                    <div class="form-group">   
                        <label for="password"><i class="fas fa-key"></i> Password:</label>
                        <input type="password" class="form-control" name="password" id="password">
                    </div>
                    <div class="d-flex">   
                        <button type="submit" class="w-50 btn btn-primary"><i class="fas fa-sign-in-alt"></i> Sign in</button>
                        <a href="./Register.jsp" class="ml-auto btn btn-secondary"><i class="fas fa-user-plus"></i> Register</a>
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
