

<div class="d-flex flex-column align-items-center py-3">
    <%@page import="java.time.format.DateTimeFormatter"%>
    <%@page import="java.time.LocalDate"%>
    <%
        DateTimeFormatter formated = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate now = LocalDate.now();
        String today = now.format(formated);
    %>
    <p class="mb-0">&copy; All rights reserved | Votation 2ºDAW TID | <%= today %></p>
    <div class="d-flex">
        <a class="mx-2" href="#">Terms and conditions</a>
        <a class="mx-2" href="#">Privacy policies and cookies</a>
    </div>
</div>
    