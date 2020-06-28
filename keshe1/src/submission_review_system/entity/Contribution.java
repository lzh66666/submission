package submission_review_system.entity;

/**
 * 投稿人稿件信息联系实体类
 *
 * 对应author_submission_mapping表格
 */
public class Contribution {

    private String id;              //订单编号
    private String authorId;        //作者编号
    private String submissionId;    //稿件编号
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAuthorId() {
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    public String getSubmissionId() {
        return submissionId;
    }

    public void setSubmissionId(String submissionId) {
        this.submissionId = submissionId;
    }

    public Contribution(String id, String authorId, String submissionId) {
        this.id = id;
        this.authorId = authorId;
        this.submissionId = submissionId;
    }
}
