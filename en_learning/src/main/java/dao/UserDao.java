package dao;

import domain.User;
import domain.userWord;
import domain.words;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.jdbcUtils;

import java.util.List;

public class UserDao {
    private JdbcTemplate template = new JdbcTemplate(jdbcUtils.getDs());

    public User login(User loginUser) {
        try {
            String sql = "select * from users where user_id = ? and user_passwd = ?";
            User user = template.queryForObject(sql,
                    new BeanPropertyRowMapper<>(User.class), loginUser.getUser_id(), loginUser.getUser_passwd());
            return user;
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean CheckLogin(User user) {
        String sql = "select count(*) from users where user_id=" + user.getUser_id();
        if (template.queryForObject(sql, Integer.class) == 1) {
            return false;
        }
        return true;
    }


    public void sign(User user) {
        String sql = "insert into users(user_id,user_passwd,user_name) values (\'" + user.getUser_id() + "\',\'" +
                user.getUser_passwd() + "\',\'" + user.getUser_name() + "\')";
        template.execute(sql);
    }

    public void update(User loginUser) {
        String sql = "update users set user_passwd=?,user_name=?,user_learn=?,user_words_num=?,user_sel=? where user_id=?";
        template.update(sql, loginUser.getUser_passwd(), loginUser.getUser_name(),
                loginUser.getUser_learn(), loginUser.getUser_words_num(), loginUser.getUser_sel(),
                loginUser.getUser_id());
    }

    public List<userWord> List1words(String user_id) {
        String sql = "exec order_user1_rank \'" + user_id + "\',\'desc\'";
        List<userWord> wordsList = template.query(sql, new BeanPropertyRowMapper<userWord>(userWord.class));
        return wordsList;
    }


    public List<userWord> List2words(String user_id) {
        String sql = "exec order_user2_date \'" + user_id + "\'";
        List<userWord> wordsList = template.query(sql, new BeanPropertyRowMapper<userWord>(userWord.class));
        return wordsList;
    }

    public void BeginLearn(User user) {
        String sql = "exec day_en_word \'" +
                user.getUser_id() + "\'," +
                user.getUser_words_num() + "," +
                user.getUser_sel();
        template.execute(sql);
    }


    public List<userWord> UserTest(User user) {
        String sql = "exec user_en_test \'" + user.getUser_id() + "\'";
        List<userWord> wordsList = template.query(sql, new BeanPropertyRowMapper<userWord>(userWord.class));
        return wordsList;
    }
}


