package submission_review_system.controller;

import submission_review_system.dao.OrderDao;
import submission_review_system.dao.SubmissionDao;
import submission_review_system.entity.Order;
import submission_review_system.entity.Submission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static submission_review_system.util.Config.HOST;

@WebServlet(urlPatterns = "/api/pass")
public class PassController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 审稿人审核通过
        try {
            List<Submission> rs = new SubmissionDao().findBy("id", req.getParameter("id"));
            if (rs.size() != 0) {
                Submission submission = rs.get(0);
                submission.setState(4);
                new SubmissionDao().save(submission);
                List<Order> id = new OrderDao().findBy("id", req.getParameter("oid"));
                if (id.size() != 0) {
                    Order order = id.get(0);
                    order.setState(1);
                    new OrderDao().save(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.sendRedirect("/" + HOST + "/api/pending");
    }
}
