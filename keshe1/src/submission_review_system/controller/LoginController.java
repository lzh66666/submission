package submission_review_system.controller;

import submission_review_system.dao.AuthorDao;
import submission_review_system.dao.ReviewerDao;
import submission_review_system.entity.Author;
import submission_review_system.entity.Reviewer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import static submission_review_system.util.Config.HOST;

@WebServlet(urlPatterns = "/api/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession(true);
        try {
            if (req.getParameter("account_").equals("admin") && req.getParameter("password_").equals("admin")) {
                resp.sendRedirect("/" + HOST + "/pages/admin.jsp");
            }
            List<Author> authors = new AuthorDao().findBy("account_", req.getParameter("account_"));

            if (authors.size() == 0) {
                session.setAttribute("author", null);
                List<Reviewer> reviewers = new ReviewerDao().findBy("account_", req.getParameter("account_"));
                if (reviewers.size() == 0) {
                    session.setAttribute("reviewer", null);
                } else {
                    Reviewer reviewer = reviewers.get(0);
                    if (reviewer.getPassword_().equals(req.getParameter("password_"))) {
                        session.setAttribute("reviewer", reviewer);
                    } else {
                        session.setAttribute("reviewer", null);
                    }
                }
            } else {
                Author author = authors.get(0);
                if (author.getPassword_().equals(req.getParameter("password_"))) {
                    session.setAttribute("author", author);
                } else {
                    session.setAttribute("author", null);
                }
            }
            req.getRequestDispatcher("/pages/login-dialog.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 修改个人信息之后
        req.getRequestDispatcher("/pages/login-dialog.jsp").forward(req, resp);
    }
}
