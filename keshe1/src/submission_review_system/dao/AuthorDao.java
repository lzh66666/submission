package submission_review_system.dao;

import submission_review_system.entity.Author;
import submission_review_system.util.Assert;
import submission_review_system.util.Jdbc;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class AuthorDao {
    // insert and update
    public Author save(Author author) throws Exception {
        if (findBy("id", author.getId()).size() != 0) {
            String sql = "UPDATE `keshe1`.`author` t SET t.`account_` = ?, t.`password_` = ?, t.`name_` = ?, t.`contact` = ? WHERE t.`id` LIKE ? ESCAPE '#'";
            Assert.notNull(new Jdbc().setSql(sql)
                    .setString(author.getAccount_())
                    .setString(author.getPassword_())
                    .setString(author.getName_())
                    .setString(author.getContact())
                    .setString(author.getId())
                    .executeUpdate());
            return author;
        }
        String sql = "INSERT INTO `keshe1`.`author` (`id`, `account_`, `password_`, `name_`, `contact`) VALUES (?, ?, ?, ?, ?)";
        Assert.notNull(new Jdbc().setSql(sql)
                .setString(UUID.randomUUID().toString())
                .setString(author.getAccount_())
                .setString(author.getPassword_())
                .setString(author.getName_())
                .setString(author.getContact()).executeUpdate());
        return author;
    }

    // delete
    public Author delete(Author author) throws Exception {
        String sql = "DELETE FROM `keshe1`.`author` WHERE `id` LIKE ? ESCAPE '#'";
        Assert.notNull(new Jdbc().setSql(sql).setString(author.getId()).executeUpdate());
        return author;
    }

    // find
    public List<Author> findAll() throws Exception {
        String sql = "SELECT t.* FROM `keshe1`.`author` t LIMIT 501";
        List<Author> authors = new ArrayList<>();
        ResultSet resultSet = new Jdbc().setSql(sql).executeQuery();
        while (resultSet.next()) {
            authors.add(new Author(
                    resultSet.getString("id"),
                    resultSet.getString("account_"),
                    resultSet.getString("password_"),
                    resultSet.getString("name_"),
                    resultSet.getString("contact")));
        }
        return Assert.notNull(authors);
    }

    public List<Author> findBy(String type, String value) throws Exception {
        String sql = "SELECT t.* FROM `keshe1`.`author` t WHERE `" + type + "` = ? LIMIT 501";
        ResultSet resultSet = Assert.notNull(new Jdbc().setSql(sql).setString(value).executeQuery());
        List<Author> authors = new ArrayList<>();
        while (resultSet.next())
            authors.add(new Author(
                    resultSet.getString("id"),
                    resultSet.getString("account_"),
                    resultSet.getString("password_"),
                    resultSet.getString("name_"),
                    resultSet.getString("contact")));
        return authors;
    }
}
