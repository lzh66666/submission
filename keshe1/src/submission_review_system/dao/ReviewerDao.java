package submission_review_system.dao;

import submission_review_system.entity.Reviewer;
import submission_review_system.util.Assert;
import submission_review_system.util.Jdbc;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class ReviewerDao {
    // insert and update
    public Reviewer save(Reviewer reviewer) throws Exception {
        if (findBy("id", reviewer.getId()).size() != 0) {
            String sql = "UPDATE `keshe1`.`reviewer` t SET t.`account_` = ?, t.`password_` = ?, t.`name_` = ?, t.`contact` = ?, t.`total` = ? WHERE t.`id` LIKE ? ESCAPE '#'";
            Assert.notNull(new Jdbc().setSql(sql)
                    .setString(reviewer.getAccount_())
                    .setString(reviewer.getPassword_())
                    .setString(reviewer.getName_())
                    .setString(reviewer.getContact())
                    .setLong(reviewer.getTotal())
                    .setString(reviewer.getId()).executeUpdate());
            return reviewer;
        }
        String sql = "INSERT INTO `keshe1`.`reviewer` (`id`, `account_`, `password_`, `name_`, `contact`, `total`) VALUES (?, ?, ?, ?, ?, ?)";
        Assert.notNull(new Jdbc().setSql(sql)
                .setString(UUID.randomUUID().toString())
                .setString(reviewer.getAccount_())
                .setString(reviewer.getPassword_())
                .setString(reviewer.getName_())
                .setString(reviewer.getContact())
                .setLong(reviewer.getTotal()).executeUpdate());
        return reviewer;
    }

    // delete
    public Reviewer delete(Reviewer reviewer) throws Exception {
        String sql = "DELETE FROM `keshe1`.`reviewer` WHERE `id` LIKE ? ESCAPE '#'";
        Assert.notNull(new Jdbc().setSql(sql).setString(reviewer.getId()).executeUpdate());
        return reviewer;
    }

    // find
    public List<Reviewer> findAll() throws Exception {
        String sql = "SELECT t.* FROM `keshe1`.`reviewer` t LIMIT 501";
        List<Reviewer> reviewers = new ArrayList<>();
        ResultSet resultSet = new Jdbc().setSql(sql).executeQuery();
        while (resultSet.next()) {
            reviewers.add(new Reviewer(
                    resultSet.getString("id"),
                    resultSet.getString("account_"),
                    resultSet.getString("password_"),
                    resultSet.getString("name_"),
                    resultSet.getString("contact"),
                    resultSet.getLong("total")));
        }
        return Assert.notNull(reviewers);
    }

    public List<Reviewer> findBy(String type, String value) throws Exception {
        String sql = "SELECT t.* FROM `keshe1`.`reviewer` t WHERE `" + type + "` = ? LIMIT 501";
        ResultSet resultSet = Assert.notNull(new Jdbc().setSql(sql).setString(value).executeQuery());
        List<Reviewer> reviewers = new ArrayList<>();
        while (resultSet.next())
            reviewers.add(new Reviewer(
                    resultSet.getString("id"),
                    resultSet.getString("account_"),
                    resultSet.getString("password_"),
                    resultSet.getString("name_"),
                    resultSet.getString("contact"),
                    resultSet.getLong("total")));
        return reviewers;
    }

}
