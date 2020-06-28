<%@ page import="java.util.List" %>
<%@ page import="submission_review_system.util.Config" %>
<%@ page import="submission_review_system.dao.ReviewerDao" %>
<%@ page import="submission_review_system.entity.Reviewer" %>
<%@ page import="submission_review_system.dao.OrderDao" %>
<%@ page import="submission_review_system.entity.Order" %>
<%

    try {
        List<Reviewer> by = new ReviewerDao().findBy("id", request.getParameter("id"));
        if (by.size() != 0) {
            Reviewer reviewer = by.get(0);
            String id = reviewer.getId();
            List<Order> reviewer_id = new OrderDao().findBy("reviewer_id", id);
            for (Order order : reviewer_id) {
                new OrderDao().delete(order);
            }
            new ReviewerDao().delete(reviewer);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("/" + Config.HOST + "/pages/admin-reviewer.jsp");
%>