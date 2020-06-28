package submission_review_system.controller;

import submission_review_system.dao.SubmissionDao;
import submission_review_system.entity.Submission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static submission_review_system.util.Config.HOST;

@WebServlet(urlPatterns = "/api/modify")
public class ModifyController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 投稿人修改稿件内容
        req.setCharacterEncoding("utf-8");
        String id = req.getParameter("id");
        try {
            List<Submission> submissions = new SubmissionDao().findBy("id", id);
            if (submissions.size() != 0) {
                Submission submission = submissions.get(0);
                req.setAttribute("submission", submission);
                req.getRequestDispatcher("/pages/author-modify-submission.jsp").forward(req, resp);

            } else {
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 投稿人修改稿件保存
        req.setCharacterEncoding("utf-8");
        try {
            new SubmissionDao().save(new Submission(req.getParameter("id"), req.getParameter("name_"), req.getParameter("content"), Integer.parseInt(req.getParameter("state"))));
            resp.sendRedirect("/" + HOST + "/api/contribution");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
