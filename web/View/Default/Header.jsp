<%@page import="Model.Voter"%>
<%@page import="Model.WebSite"%>
<%
    if (session.getAttribute("voter") == null) {
        response.sendRedirect(WebSite.getUrl() + "/View/User/Login.jsp");
        return;
    }
    Voter voter = (Voter) session.getAttribute("voter");
%>
<div class="info d-flex flex-wrap bg-primary text-white">
    <div class="p-2 col-md-6">
        <span>Welcome to the votation webpage!</span>
    </div>
    <div class="p-2 col-md-6 text-right">
        <span class="mx-3">Contact us:</span>
        <a class="mx-2" href="mailto:support@votation.com"><i class="fas fa-envelope"></i> support@votation.com</a>
        <a class="mx-2" href="tel:632423453"><i class="fas fa-phone"></i> 632 42 34 53</a>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-light flex-column">
    <a href="<%= WebSite.getUrl() %>" class="h1 d-block text-uppercase my-3">Votation</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-center" id="mainNav">
        <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link"  href="<%= WebSite.getUrl() %>/View/PoliticalParty/List.jsp"><i class="fas fa-flag"></i> Parties</a></li>
            <li class="nav-item"><a class="nav-link"  href="<%= WebSite.getUrl() %>/View/Candidate/List.jsp"><i class="fas fa-users"></i> Candidates</a></li>
            <li class="nav-item"><a class="nav-link"  href="<%= WebSite.getUrl() %>/View/Scrutiny.jsp"><i class="fas fa-door-open"></i> Scrutiny</a></li>
            <%
            if(voter.isVoted()){
            %>
            <li class="nav-item"><a class="nav-link"  href="<%= WebSite.getUrl() %>/View/Results.jsp"><i class="fas fa-vote-yea"></i> View results!</a></li>
            <%  
            }else{
            %>
            <li class="nav-item"><a class="nav-link"  href="<%= WebSite.getUrl() %>/View/Vote.jsp"><i class="fas fa-vote-yea"></i> Vote now!</a></li>
            <%
            }
            %>
            <li class="nav-item"><a class="nav-link"  href="<%= WebSite.getUrl() %>/User/Logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>
</nav>
