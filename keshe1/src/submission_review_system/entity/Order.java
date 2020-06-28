package submission_review_system.entity;

/**
 * 稿件审稿人实体类
 *
 * 对应review_submission_mapping表格
 */
public class Order {
    private String id;              //订单编号
    private Integer state;          //审阅标记（通过,不通过）
    private Integer fee_state;
    private Integer payment;        //稿费
    private Integer fee;            //审稿费
    private Integer charge;         //版面费

    private String reviewer_id;     //审稿人id
    private String submission_id;   //稿件id

    public Order(String id, Integer state, Integer fee_state, Integer payment, Integer fee, Integer charge, String reviewer_id, String submission_id) {
        this.id = id;
        this.state = state;
        this.fee_state = fee_state;
        this.payment = payment;
        this.fee = fee;
        this.charge = charge;
        this.reviewer_id = reviewer_id;
        this.submission_id = submission_id;
    }

    public Integer getFee_state() {
        return fee_state;
    }

    public void setFee_state(Integer fee_state) {
        this.fee_state = fee_state;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getPayment() {
        return payment;
    }

    public void setPayment(Integer payment) {
        this.payment = payment;
    }

    public Integer getFee() {
        return fee;
    }

    public void setFee(Integer fee) {
        this.fee = fee;
    }

    public Integer getCharge() {
        return charge;
    }

    public void setCharge(Integer charge) {
        this.charge = charge;
    }

    public String getReviewer_id() {
        return reviewer_id;
    }

    public void setReviewer_id(String reviewer_id) {
        this.reviewer_id = reviewer_id;
    }

    public String getSubmission_id() {
        return submission_id;
    }

    public void setSubmission_id(String submission_id) {
        this.submission_id = submission_id;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id='" + id + '\'' +
                ", state=" + state +
                ", fee_state=" + fee_state +
                ", payment=" + payment +
                ", fee=" + fee +
                ", charge=" + charge +
                ", reviewer_id='" + reviewer_id + '\'' +
                ", submission_id='" + submission_id + '\'' +
                '}';
    }
}
