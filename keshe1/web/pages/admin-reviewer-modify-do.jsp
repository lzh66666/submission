<%@ page import="submission_review_system.util.Config" %>
<%@ page import="submission_review_system.dao.ReviewerDao" %>
<%@ page import="submission_review_system.entity.Reviewer" %>
<%
    request.setCharacterEncoding("utf-8");
    try {
        new ReviewerDao().save(new Reviewer(request.getParameter("id"), request.getParameter("account_"), request.getParameter("password_"), request.getParameter("name_"), request.getParameter("contact"), Long.parseLong(request.getParameter("total"))));
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("/" + Config.HOST + "/pages/admin-reviewer.jsp");

%>