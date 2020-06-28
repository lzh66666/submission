package submission_review_system.dao;

import submission_review_system.entity.Submission;
import submission_review_system.util.Assert;
import submission_review_system.util.Jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class SubmissionDao {
    // insert and update
    public Submission save(Submission submission) throws Exception {
        if (findBy("id", submission.getId()).size() != 0) {
            String sql = "UPDATE `keshe1`.`submission` t SET t.`name_` = ?, t.`content` = ?, t.`state` = ? WHERE t.`id` LIKE ? ESCAPE '#'";
            System.out.println(submission.getState());
            Assert.notNull(new Jdbc().setSql(sql)
                    .setString(submission.getName_())
                    .setString(submission.getContent())
                    .setInteger(submission.getState())
                    .setString(submission.getId())
                    .executeUpdate());
            return submission;
        }
        String sql = "INSERT INTO `keshe1`.`submission` (`id`,`name_`, `content`, `state`) VALUES (?, ?, ?, ?)";
        submission.setId(UUID.randomUUID().toString());
        Assert.notNull(new Jdbc().setSql(sql)
                .setString(submission.getId())
                .setString(submission.getName_())
                .setString(submission.getContent())
                .setInteger(submission.getState())
                .executeUpdate());
        return submission;
    }

    // delete
    public Submission delete(Submission submission) throws Exception {
        String sql = "DELETE FROM `keshe1`.`submission` WHERE `id` LIKE ? ESCAPE '#'";
        Assert.notNull(new Jdbc().setSql(sql).setString(submission.getId()).executeUpdate());
        return submission;
    }

    // find
    public List<Submission> findAll() throws Exception {
        String sql = "SELECT t.* FROM `keshe1`.`submission` t LIMIT 501";
        List<Submission> submissions = new ArrayList<>();
        ResultSet resultSet = new Jdbc().setSql(sql).executeQuery();
        while (resultSet.next()) {
            submissions.add(new Submission(
                    resultSet.getString("id"),
                    resultSet.getString("name_"),
                    resultSet.getString("content"),
                    resultSet.getInt("state")));
        }
        return Assert.notNull(submissions);
    }

    public List<Submission> findBy(String type, String value) throws Exception {
        String sql = "SELECT t.* FROM `keshe1`.`submission` t WHERE `" + type + "` = ?  LIMIT 501";
        ResultSet resultSet = Assert.notNull(new Jdbc().setSql(sql).setString(value).executeQuery());
        List<Submission> submissions = new ArrayList<>();
        while (resultSet.next())
            submissions.add(new Submission(
                    resultSet.getString("id"),
                    resultSet.getString("name_"),
                    resultSet.getString("content"),
                    resultSet.getInt("state")));
        return submissions;
    }

    public List<Submission> findByPro(String id) throws Exception {
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/keshe1?useUnicode=true&characterEncoding=utf-8&serverTimezone=CST","root","admin");
        String sql = "{call pro_author(?)}";
        CallableStatement csm = connection.prepareCall(sql);
        csm.setString(1,id);
        ResultSet res = csm.executeQuery();
        List<Submission> submissions = new ArrayList<>();
        while (res.next()) {
            submissions.add(new Submission(
                    res.getString("id"),
                    res.getString("name_"),
                    res.getString("content"),
                    res.getInt("state")
            ));
        }
        System.out.println(submissions);
        return submissions;
    }
}
