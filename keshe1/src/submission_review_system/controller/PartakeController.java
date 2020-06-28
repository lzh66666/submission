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
import java.util.List;

import static submission_review_system.util.Config.HOST;

@WebServlet(urlPatterns = "/api/partake")
public class PartakeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 分享码
        req.setCharacterEncoding("utf-8");
        String id = req.getParameter("id");
        HttpSession session = req.getSession(true);
        Author author = (Author) session.getAttribute("author");
        try {
            List<Contribution> uni = new ContributionDao().findUni(author.getId(), id);
            if (uni.size() != 0) {
                System.out.println(uni.get(0).getSubmissionId());
                //session.setAttribute("share",author.getName_());
                //resp.setHeader("refresh", "0;URL=/" + HOST + "/pages/author-contributions-submission-success.jsp");
                //resp.sendRedirect("/" + HOST + "/pages/author-contributions-submission-success.jsp");

                req.setAttribute("share", uni.get(0).getSubmissionId());
                req.getRequestDispatcher("/pages/author-contributions-submission-success.jsp").forward(req, resp);
                return;
            } else {
                List<Submission> submissions = new SubmissionDao().findBy("id", id);
                if (submissions.size() == 0) {
                    resp.setHeader("refresh", "0;URL=/" + HOST + "/pages/error.jsp");
                    return;
                } else {
                    new ContributionDao().save(new Contribution("", author.getId(), id));
                }
            }
            resp.sendRedirect("/" + HOST + "/api/contribution");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
