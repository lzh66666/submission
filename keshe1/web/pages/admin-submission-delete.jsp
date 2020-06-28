<%@ page import="java.util.List" %>
<%@ page import="submission_review_system.dao.ContributionDao" %>
<%@ page import="submission_review_system.entity.Contribution" %>
<%@ page import="submission_review_system.util.Config" %>
<%@ page import="submission_review_system.entity.Submission" %>
<%@ page import="submission_review_system.dao.SubmissionDao" %>
<%@ page import="submission_review_system.dao.OrderDao" %>
<%@ page import="submission_review_system.entity.Order" %>
<%
    try {
        List<Submission> by = new SubmissionDao().findBy("id", request.getParameter("id"));
        if (by.size() != 0) {
            Submission submission = by.get(0);
            String id = submission.getId();
            List<Contribution> submission_id = new ContributionDao().findBy("submission_id", id);
            for (Contribution contribution : submission_id) {
                new ContributionDao().delete(contribution);
            }
            List<Order> submission_id1 = new OrderDao().findBy("submission_id", id);
            for (Order order : submission_id1) {
                new OrderDao().delete(order);
            }
            new SubmissionDao().delete(submission);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("/" + Config.HOST + "/pages/admin-submission.jsp");
%>