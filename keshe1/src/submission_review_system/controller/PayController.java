package submission_review_system.controller;

import submission_review_system.dao.OrderDao;
import submission_review_system.dao.ReviewerDao;
import submission_review_system.dao.SubmissionDao;
import submission_review_system.entity.Order;
import submission_review_system.entity.Reviewer;
import submission_review_system.entity.Submission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static submission_review_system.util.Config.HOST;

@WebServlet(urlPatterns = {"/api/pay"})
public class PayController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 支付稿费
        req.setCharacterEncoding("utf-8");
        String sid = req.getParameter("sid");

        try {
            List<Submission> id1 = new SubmissionDao().findBy("id", sid);
            if(id1.size()!=0){
                Submission submission = id1.get(0);
                submission.setState(5);
                new SubmissionDao().save(submission);
            }
            List<Order> orders = new OrderDao().findBy("submission_id", sid);
            if (orders.size() != 0) {
                Order order = orders.get(0);
                System.out.println(order);
                //if (order.getFee_state() == 1) {    //收到稿费
                    String reviewer_id = order.getReviewer_id();
                    List<Reviewer> id = new ReviewerDao().findBy("id", reviewer_id);
                    if (id.size() != 0) {
                        Reviewer reviewer = id.get(0);
                        reviewer.setTotal(reviewer.getTotal() + order.getFee());
                        new ReviewerDao().save(reviewer);
                    }
                //}
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.sendRedirect("/" + HOST + "/api/contribution");
    }
}
