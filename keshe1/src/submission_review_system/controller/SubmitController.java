package submission_review_system.controller;

import submission_review_system.dao.ContributionDao;
import submission_review_system.dao.SubmissionDao;
import submission_review_system.entity.Author;
import submission_review_system.entity.Contribution;
import submission_review_system.entity.Submission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static submission_review_system.util.Config.HOST;

@WebServlet(urlPatterns = "/api/submit")
public class SubmitController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //投递稿件
        try {
            req.setCharacterEncoding("utf-8");
            new SubmissionDao().save(new Submission(req.getParameter("id"), req.getParameter("name_"), req.getParameter("content"), Integer.parseInt(req.getParameter("state"))));
            resp.sendRedirect("/" + HOST + "/api/contribution");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //删除稿件
        try {
            req.setCharacterEncoding("utf-8");
            HttpSession session = req.getSession(true);
            Author author = (Author)session.getAttribute("author");
            List<Contribution> contributions = new ContributionDao().findUni(author.getId(), req.getParameter("id"));
            if (contributions.size() != 0) {
                Contribution contribution = contributions.get(0);
                new ContributionDao().delete(contribution);
                resp.sendRedirect("/" + HOST + "/api/contribution");
            } else {
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
