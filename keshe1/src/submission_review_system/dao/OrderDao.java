package submission_review_system.dao;

import submission_review_system.entity.Order;
import submission_review_system.util.Assert;
import submission_review_system.util.Jdbc;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class OrderDao {
    // insert and update
    public Order save(Order order) throws Exception {
        if (findBy("id", order.getId()).size() != 0) {
            String sql = "UPDATE `keshe1`.`review_submission_mapping` t SET t.`state` = ?, t.`payment` = ?, t.`fee` = ?, t.`charge` = ?, t.`reviewer_id` = ?, t.`submission_id` = ? WHERE t.`id` LIKE ? ESCAPE '#'";
            Assert.notNull(new Jdbc().setSql(sql)
                    .setInteger(order.getState())
                    .setInteger(order.getPayment())
                    .setInteger(order.getFee())
                    .setInteger(order.getCharge())
                    .setString(order.getReviewer_id())
                    .setString(order.getSubmission_id())
                    .setString(order.getId())
                    .executeUpdate());
            return order;
        }
        String sql = "INSERT INTO `keshe1`.`review_submission_mapping` (`id`, `state`, `payment`, `fee`, `charge`, `reviewer_id`, `submission_id`) VALUES (?, ? , ?, ?, ?, ?, ?)";
        Assert.notNull(new Jdbc().setSql(sql)
                .setString(UUID.randomUUID().toString())
                .setInteger(order.getState())
                .setInteger(order.getPayment())
                .setInteger(order.getFee())
                .setInteger(order.getCharge())
                .setString(order.getReviewer_id())
                .setString(order.getSubmission_id())
                .executeUpdate());
        return order;
    }

    // delete
    public Order delete(Order author) throws Exception {
        String sql = "DELETE FROM `keshe1`.`review_submission_mapping` WHERE `id` LIKE ? ESCAPE '#'";
        Assert.notNull(new Jdbc().setSql(sql).setString(author.getId()).executeUpdate());
        return author;
    }

    // find
    public List<Order> findAll() throws Exception {
        String sql = "SELECT t.* FROM `keshe1`.`review_submission_mapping` t LIMIT 501";
        List<Order> authors = new ArrayList<>();
        ResultSet resultSet = new Jdbc().setSql(sql).executeQuery();
        while (resultSet.next()) {
            authors.add(new Order(
                    resultSet.getString("id"),
                    resultSet.getInt("state"),
                    resultSet.getInt("fee_state"),
                    resultSet.getInt("payment"),
                    resultSet.getInt("fee"),
                    resultSet.getInt("charge"),
                    resultSet.getString("reviewer_id"),
                    resultSet.getString("submission_id")));
        }
        return Assert.notNull(authors);
    }

    public List<Order> findBy(String type, String value) throws Exception {
        String sql = "SELECT t.* FROM `keshe1`.`review_submission_mapping` t WHERE `" + type + "` = ? LIMIT 501";
        ResultSet resultSet = Assert.notNull(new Jdbc().setSql(sql).setString(value).executeQuery());
        List<Order> authors = new ArrayList<>();
        while (resultSet.next())
            authors.add(new Order(
                    resultSet.getString("id"),
                    resultSet.getInt("state"),
                    resultSet.getInt("fee_state"),
                    resultSet.getInt("payment"),
                    resultSet.getInt("fee"),
                    resultSet.getInt("charge"),
                    resultSet.getString("reviewer_id"),
                    resultSet.getString("submission_id")));
        return authors;
    }
}
