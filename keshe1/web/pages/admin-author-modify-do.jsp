<%@ page import="submission_review_system.dao.AuthorDao" %>
<%@ page import="submission_review_system.entity.Author" %>
<%@ page import="submission_review_system.util.Config" %>
<%
    request.setCharacterEncoding("utf-8");

    try {
        new AuthorDao().save(new Author(request.getParameter("id"), request.getParameter("account_"), request.getParameter("password_"), request.getParameter("name_"), request.getParameter("contact")));
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("/" + Config.HOST + "/pages/admin-author.jsp");

%>