package submission_review_system.entity;

/**
 * 审稿人的实体类
 */
public class Reviewer {
    private String id;
    private String account_;
    private String password_;
    private String name_;
    private String contact;
    private Long total;

    public Reviewer(String id, String account_, String password_, String name_, String contact, Long total) {
        this.id = id;
        this.account_ = account_;
        this.password_ = password_;
        this.name_ = name_;
        this.contact = contact;
        this.total = total;
    }

    public Reviewer() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAccount_() {
        return account_;
    }

    public void setAccount_(String account_) {
        this.account_ = account_;
    }

    public String getPassword_() {
        return password_;
    }

    public void setPassword_(String password_) {
        this.password_ = password_;
    }

    public String getName_() {
        return name_;
    }

    public void setName_(String name_) {
        this.name_ = name_;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }
}
