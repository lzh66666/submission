package submission_review_system.controller;

import submission_review_system.dao.OrderDao;
import submission_review_system.dao.SubmissionDao;
import submission_review_system.entity.Order;
import submission_review_system.entity.Reviewer;
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

@WebServlet(urlPatterns = "/api/adopt")
public class AdoptController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 审核人提交审核信息
        try {
            HttpSession session = req.getSession(true);
            List<Submission> rs = new SubmissionDao().findBy("id", req.getParameter("id"));
            Submission submission = null;
            if (rs.size() != 0) {
                submission = rs.get(0);
                submission.setState(2);
                new SubmissionDao().save(submission);
            }
            Reviewer reviewer = (Reviewer) session.getAttribute("reviewer");
            new OrderDao().save(new Order("", 0,0, Integer.parseInt(req.getParameter("payment")), Integer.parseInt(req.getParameter("fee")), Integer.parseInt(req.getParameter("charge")), reviewer.getId(), submission.getId()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.sendRedirect("/" + HOST + "/api/reviewer");
    }
}
