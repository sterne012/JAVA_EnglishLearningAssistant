package dao;

import domain.Admin;
import domain.User;
import domain.words;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.jdbcUtils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class AdminDao {
    private JdbcTemplate template = new JdbcTemplate(jdbcUtils.getDs());

    public Admin login(Admin login) {
        try {
            String sql = "select * from Admin where admin_id = ? and admin_passwd = ?";
            Admin admin = template.queryForObject(sql,
                    new BeanPropertyRowMapper<>(Admin.class), login.getAdmin_id(), login.getAdmin_passwd());
            return admin;
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void update(Admin admin) {
        String sql = "update Admin set admin_passwd=? where admin_id=?";
        template.update(sql, admin.getAdmin_passwd(),admin.getAdmin_id());
    }

    public words findWord(String word) {
        try {
            String sql = "select * from en_list where word=\'" + word + "\'";
            words w = template.queryForObject(sql, new BeanPropertyRowMapper<>(words.class));
            return w;
        }catch (DataAccessException e){
            e.printStackTrace();
            return null;
        }
    }

    public void updateWord(words word) {
        String sql="update en_list set symbol=N\'"+word.getSymbol()+"\',trans=\'"+word.getTrans()+"\'," +
                "frequency="+word.getFrequency()+" where word=\'"+word.getWord()+"\'";
        template.update(sql);
    }

    public List<User> findUsers() {
        String sql="select * from users";
        List<User> userList=template.query(sql,new BeanPropertyRowMapper<User>(User.class));
        return userList;
    }

    public void insertWord(words word) {
        String sql="insert into en_list(word,symbol,trans,frequency) values(\'"
                +word.getWord()+"\',\'"
                +word.getSymbol()+"\',\'"
                +word.getTrans()+"\',"
                +word.getFrequency()+")";
        template.update(sql);
    }

    public void delWord(words word) {
        String sql="delete from en_list where word=\'"+word.getWord()+"\'";
        template.execute(sql);
    }

    public User findUser(String user) {
        try {
            String sql = "select * from users where user_id=\'" + user + "\'";
            User u = template.queryForObject(sql, new BeanPropertyRowMapper<>(User.class));
            return u;
        } catch (DataAccessException e){
            e.printStackTrace();
            return null;
        }
    }

    public void updateUser(User user) {
        String sql="update users set user_passwd=?,user_name=?,user_date=?,user_learn=?,user_words_num=?,user_sel=? " +
                "where user_id=?";
        template.update(sql,user.getUser_passwd(),user.getUser_name(),
                user.getUser_date(),user.getUser_learn(),
                user.getUser_words_num(),user.getUser_sel(),
                user.getUser_id());
    }

    public void delUser(User user) {
        String sql="delete from users where user_id=\'"+user.getUser_id()+"\'";
        template.execute(sql);
    }

    public void bak(String dateNowStr) {
        String sql="backup database EN_learning to disk='D:\\#Download\\2.2\\bak\\en_learning"+dateNowStr+".bak'";
        template.execute(sql);
    }
}
