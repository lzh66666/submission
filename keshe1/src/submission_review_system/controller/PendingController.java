package submission_review_system.controller;

import submission_review_system.dao.AuthorDao;
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
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/api/pending"})
public class PendingController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 查看待审稿件
        // 审核通过之后跳转页面
        // 审核不通过之后跳转页面
        try {
            req.setCharacterEncoding("utf-8");
            List<Submission> all = new SubmissionDao().findAll();
            List<Submission> submissions = new ArrayList<>();
            ArrayList<List<Author>> lists = new ArrayList<List<Author>>();
            for (Submission submission : all) {
                if (submission.getState() == 1) {
                    ArrayList<Author> authors = new ArrayList<>();
                    List<Contribution> contributionList = new ContributionDao().findBy("submission_id", submission.getId());
                    if (contributionList.size() != 0) {
                        for (Contribution contribution : contributionList) {
                            String authorId = contribution.getAuthorId();
                            List<Author> authorList = new AuthorDao().findBy("id", authorId);
                            if (authorList.size() != 0) {
                                authors.add(authorList.get(0));
                            }
                        }
                    }else {
                        continue;
                    }
                    submissions.add(submission);
                    lists.add(authors);
                }
            }
            req.setAttribute("submissions", submissions);
            req.setAttribute("authors", lists);

            req.getRequestDispatcher("/pages/awaiting-review-submission.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
