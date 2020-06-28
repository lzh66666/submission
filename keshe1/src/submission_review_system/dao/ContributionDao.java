package submission_review_system.dao;

import submission_review_system.entity.Contribution;
import submission_review_system.util.Assert;
import submission_review_system.util.Jdbc;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class ContributionDao {
    // insert and update
    public Contribution save(Contribution contribution) throws Exception {
        if (findBy("id", contribution.getId()).size() != 0) {
            String sql = "UPDATE `keshe1`.`author_submission_mapping` t SET t.`author_id` = ?, t.`submission_id` = ? WHERE t.`id` LIKE ? ESCAPE '#'";
            Assert.notNull(new Jdbc().setSql(sql)
                    .setString(contribution.getAuthorId())
                    .setString(contribution.getSubmissionId())
                    .executeUpdate());
            return contribution;
        }
        String sql = "INSERT INTO `keshe1`.`author_submission_mapping` (`id`, `author_id`, `submission_id`) VALUES (?, ?, ?)";
        Assert.notNull(new Jdbc().setSql(sql)
                .setString(UUID.randomUUID().toString())
                .setString(contribution.getAuthorId())
                .setString(contribution.getSubmissionId())
                .executeUpdate());
        return contribution;
    }

    // delete
    public Contribution delete(Contribution contribution) throws Exception {
        String sql = "DELETE FROM `keshe1`.`author_submission_mapping` WHERE `id` LIKE ? ESCAPE '#'";
        Assert.notNull(new Jdbc().setSql(sql).setString(contribution.getId()).executeUpdate());
        return contribution;
    }

    // find
    public List<Contribution> findAll() throws Exception {
        String sql = "SELECT t.* FROM `keshe1`.`author_submission_mapping` t LIMIT 501";
        List<Contribution> contributions = new ArrayList<>();
        ResultSet resultSet = new Jdbc().setSql(sql).executeQuery();
        while (resultSet.next()) {
            contributions.add(new Contribution(
                    resultSet.getString("id"),
                    resultSet.getString("author_id"),
                    resultSet.getString("submission_id")));
        }
        return Assert.notNull(contributions);
    }

    public List<Contribution> findBy(String type, String value) throws Exception {
        String sql = "SELECT t.* FROM `keshe1`.`author_submission_mapping` t WHERE `" + type + "` = ? LIMIT 501";
        ResultSet resultSet = Assert.notNull(new Jdbc().setSql(sql).setString(value).executeQuery());
        List<Contribution> authors = new ArrayList<>();
        while (resultSet.next())
            authors.add(new Contribution(
                    resultSet.getString("id"),
                    resultSet.getString("author_id"),
                    resultSet.getString("submission_id")));
        return authors;
    }

    public List<Contribution> findUni(String value1, String value2) throws Exception {
        String sql = "SELECT t.* FROM keshe1.author_submission_mapping t WHERE author_id=? AND submission_id=? LIMIT 501";
        ResultSet resultSet = Assert.notNull(new Jdbc().setSql(sql).setString(value1).setString(value2).executeQuery());
        List<Contribution> authors = new ArrayList<>();
        while (resultSet.next())
            authors.add(new Contribution(
                    resultSet.getString("id"),
                    resultSet.getString("author_id"),
                    resultSet.getString("submission_id")));
        return authors;
    }

}
