<%@ page import="submission_review_system.dao.AuthorDao" %>
<%@ page import="submission_review_system.entity.Author" %>
<%@ page import="java.util.List" %>
<%@ page import="submission_review_system.dao.ContributionDao" %>
<%@ page import="submission_review_system.entity.Contribution" %>
<%@ page import="submission_review_system.util.Config" %>
<%

    try {
        List<Author> by = new AuthorDao().findBy("id", request.getParameter("id"));
        if (by.size() != 0) {
            Author author = by.get(0);
            String id = author.getId();
            List<Contribution> author_id = new ContributionDao().findBy("author_id", id);
            for (Contribution contribution : author_id) {
                new ContributionDao().delete(contribution);
            }
            new AuthorDao().delete(author);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("/" + Config.HOST + "/pages/admin-author.jsp");

%>