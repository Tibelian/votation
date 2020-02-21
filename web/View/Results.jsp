<%@page import="java.util.ArrayList"%>
<%@page import="Model.PoliticalParty"%>
<%@page import="Model.Parameter"%>
<%@page import="Model.WebSite"%>
<%
    if(session.getAttribute("voter") == null){
        response.sendRedirect(WebSite.getUrl() + "/View/User/Login.jsp");
        return;
    }
    if(session.getAttribute("parameter") == null){
        response.sendRedirect(WebSite.getUrl() + "/Parameter/Load?redirect=" + WebSite.getUrl() + "/View/Results.jsp");
        return;
    }
    Parameter parameter = (Parameter) session.getAttribute("parameter");
    if(!parameter.getScrutiny().equals("Finished")){
        response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=results-scrutiny");
        return;
    }
    if(session.getAttribute("partyList") == null){
        response.sendRedirect(WebSite.getUrl() + "/PoliticalParty/LoadList?redirect=" + WebSite.getUrl() + "/View/Results.jsp");
        return;
    }
    ArrayList<PoliticalParty> partyList = (ArrayList) session.getAttribute("partyList");
    
    ArrayList<String> label = new ArrayList();
    ArrayList<Integer> data = new ArrayList();
    ArrayList<String> color = new ArrayList();
    for(PoliticalParty party:partyList){
        label.add(party.getAchronym());
        data.add(party.getVotes());
        int r = (int)(Math.random() * 255 + 1);
        int g = (int)(Math.random() * 255 + 1);
        int b = (int)(Math.random() * 255 + 1);
        String rgba = Integer.toString(r) + ", " + Integer.toString(g) + ", " + Integer.toString(b);
        color.add(rgba);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        
        <!-- título web -->
        <title>Results - <%= WebSite.getTitle() %></title>
        
        <!-- meta -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!-- css -->
        <link rel="stylesheet" href="../Assets/css/all.min.css">
        <link rel="stylesheet" href="../Assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../Assets/css/Chart.min.css">
        <link rel="stylesheet" href="../Assets/css/main.css">
        
    </head>
    <body>
                
        <!-- principal -->
        <main>
            <div class="p-4 shadow-sm bg-white rounded col-md-7 mx-auto">
                <h2 class="text-center mb-4 text-uppercase">These are the results:</h2>
                <canvas id="myChart" width="400" height="400"></canvas>
            </div>
            <div class="d-flex w-100 mt-3">
                <a href="<%= WebSite.getUrl() %>" class="btn btn-lg btn-primary mx-auto">
                    <i class="fas fa-arrow-left"></i> Go back!
                </a>
            </div>
        </main>
        
        <!-- js -->
        <script src="../Assets/js/jquery-3.3.1.slim.min.js"></script>
        <script src="../Assets/js/popper.min.js"></script>
        <script src="../Assets/js/bootstrap.min.js"></script>
        <script src="../Assets/js/Chart.min.js"></script>
        <script>
            var ctx = document.getElementById('myChart');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: [
                    <%
                        for(int l = 0; l < label.size(); l++){
                            out.print("'" + label.get(l) + "'");
                            if(l != label.size() - 1){
                                out.print(", ");
                            }
                        }
                    %>
                    ],
                    datasets: [{
                        label: '# of Votes',
                        data: [
                        <%
                            for(int l = 0; l < data.size(); l++){
                                out.print(data.get(l));
                                if(l != data.size() - 1){
                                    out.print(", ");
                                }
                            }
                        %>                
                        ],
                        backgroundColor: [
                        <%
                            for(int l = 0; l < color.size(); l++){
                                out.print("'rgba(" + color.get(l) + ", .5)'");
                                if(l != color.size() - 1){
                                    out.print(", ");
                                }
                            }
                        %>                
                        ],
                        borderColor: [
                        <%
                            for(int l = 0; l < color.size(); l++){
                                out.print("'rgba(" + color.get(l) + ", 1)'");
                                if(l != color.size() - 1){
                                    out.print(", ");
                                }
                            }
                        %>                
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    }
                }
            });
        </script>
        
    </body>
</html>
<%
session.setAttribute("parameter", null);
%>