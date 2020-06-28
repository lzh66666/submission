<%@ page import="submission_review_system.util.Config" %>
<%@ page import="submission_review_system.entity.Reviewer" %>
<%@ page import="submission_review_system.dao.ReviewerDao" %>
<%
    request.setCharacterEncoding("utf-8");
    try {
        new ReviewerDao().save(new Reviewer("", request.getParameter("account_"), request.getParameter("password_"), request.getParameter("name_"), request.getParameter("contact"), Long.parseLong("0")));
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("/" + Config.HOST + "/pages/admin-reviewer.jsp");

%>