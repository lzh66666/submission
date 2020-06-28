package submission_review_system.controller;

import submission_review_system.dao.ContributionDao;
import submission_review_system.dao.ReviewerDao;
import submission_review_system.dao.SubmissionDao;
import submission_review_system.entity.Author;
import submission_review_system.entity.Contribution;
import submission_review_system.entity.Reviewer;
import submission_review_system.entity.Submission;
import submission_review_system.util.Jdbc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/api/contribution")
public class ContributionController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 草稿保存成功之后执行
        try {
            req.setCharacterEncoding("utf-8");
            HttpSession session = req.getSession(true);
            Submission submission = (Submission) req.getAttribute("submission");
            Author author = (Author) session.getAttribute("author");
            new ContributionDao().save(new Contribution("", author.getId(), submission.getId()));
            req.setAttribute("share", submission.getId());
            req.getRequestDispatcher("/pages/author-contributions-submission-success.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 查看投稿记录
        // 投递稿件成功之后
        // 删除稿件成功之后
        // 修改稿件保存成功之后
        // 成功递交稿费之后
        try {
            req.setCharacterEncoding("utf-8");
            HttpSession session = req.getSession(true);
            Author author = (Author) session.getAttribute("author");

            List<Contribution> all = new ContributionDao().findBy("author_id", author.getId());
            List<Submission> submissions = new ArrayList<>();
            for (Contribution contribution : all) {
                Submission submission = new SubmissionDao().findBy("id", contribution.getSubmissionId()).get(0);
                submissions.add(submission);
            }
            req.setAttribute("submissions", submissions);
            req.getRequestDispatcher("/pages/author-all-contributions.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
