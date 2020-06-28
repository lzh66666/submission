package submission_review_system.controller;

import submission_review_system.dao.*;
import submission_review_system.entity.*;

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

@WebServlet(urlPatterns = "/api/reviewer")
public class ReviewerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 审核人提交信息成功之后
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession(true);
        Reviewer reviewer = (Reviewer) session.getAttribute("reviewer");
        try {
            List<Order> orders = new OrderDao().findBy("reviewer_id", reviewer.getId());
            req.setAttribute("orders", orders);
            req.getRequestDispatcher("/pages/review-record.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("utf-8");
            HttpSession session = req.getSession(true);
            Reviewer reviewer = (Reviewer) session.getAttribute("reviewer");
            new ReviewerDao().save(new Reviewer(reviewer.getId(), req.getParameter("account_"), req.getParameter("password_"), req.getParameter("name_"), req.getParameter("contact"), Long.parseLong(req.getParameter("total"))));
            List<Reviewer> reviewers = new ReviewerDao().findBy("id", reviewer.getId());
            if (reviewers.size() != 0) {
                session.setAttribute("reviewer", reviewers.get(0));
                resp.sendRedirect("/" + HOST + "/api/login");
            } else {
                session.setAttribute("author", null);
                resp.sendRedirect("/" + HOST + "/api/login");
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }
}
