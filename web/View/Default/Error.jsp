<%@page import="Model.WebSite"%>
<!DOCTYPE html>
<html>
    <head>
        
        <!-- título web -->
        <title>Error Message - Votation System</title>
        
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
            <div class="p-4 shadow-sm bg-white rounded col-md-7 mx-auto">
                <h2 class="text-center mb-4 text-uppercase">System notify you:</h2>
                <p class="text-danger text-center">
                <%
                    String code = request.getParameter("code");
                    if("wrong-login".equals(code)){
                        out.println("Wrong credentials!");
                    }else if("miss-data".equals(code)){
                        out.println("Complete all required fields!");
                    }else if("must-login".equals(code)){
                        out.println("You must sign in to do that!");
                    }else if("already-voted".equals(code)){
                        out.println("You have already voted! Thank you! <br> Now you have to wait until the vote ends!");
                    }else if("results-scrutiny".equals(code)){
                        out.println("You have to wait until the vote ends!");
                    }else if("delete-failed-01".equals(code)){
                        out.println("You must sign in to delete your account");
                    }else if("delete-failed-02".equals(code)){
                        out.println("To delete your account you must confirm!");
                    }else if("delete-ok".equals(code)){
                        out.println("Your account has been deleted successfully!");
                    }else if("edit-ok".equals(code)){
                        out.println("Your account has been edited successfully!");
                    }else if("vote-ok".equals(code)){
                        out.println("You have voted successfully!");
                    }else if("403".equals(code)){
                        out.println("Forbidden! You can not do that!");
                    }else if("sql".equals(code)){
                        out.println("SQL ERROR - Please contact an administrator if the error persists");
                        String message = request.getParameter("message");
                        if(message != null){
                            out.println("<code class='d-block mt-2'>" + message + "</code>");
                        }
                    }
                %>
                </p>
            </div>
            <div class="d-flex w-100 mt-3">
                <a href="<%= WebSite.getUrl() %>" class="btn btn-lg btn-primary mx-auto">
                    <i class="fas fa-arrow-left"></i> Go back!
                </a>
            </div>
        </main>
        
        <!-- js -->
        <script src="../../Assets/js/jquery-3.3.1.slim.min.js"></script>
        <script src="../../Assets/js/popper.min.js"></script>
        <script src="../../Assets/js/bootstrap.min.js"></script>
        
    </body>
</html>
