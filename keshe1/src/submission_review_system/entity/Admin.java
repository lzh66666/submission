package submission_review_system.entity;

public class Admin {
    private String id;
    private String account_;
    private String password_;


    public Admin(String id, String account_, String password_) {
        this.id = id;
        this.account_ = account_;
        this.password_ = password_;
    }

    public Admin() {
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

}
