package dao;

import com.alibaba.druid.util.JdbcUtils;
import domain.User;
import domain.words;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.jdbcUtils;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class LibDao {
    private JdbcTemplate template=new JdbcTemplate(jdbcUtils.getDs());

    public List<words> findAll(){
        String sql="execute order_en_list 50";
        List<words> wordsList = template.query(sql, new BeanPropertyRowMapper<words>(words.class));
        return wordsList;
    }

    public void addWords(String user_id,String word){
        String sql="exec en_list_to_user \'"+user_id+"\' ,\'"+word+"\'";
        template.execute(sql);
    }

    public words findWords(User user, String word) {
        try {
            String sql = "select * from user_"+user.getUser_id()+" where word=\'" + word + "\'";
            words w=template.queryForObject(sql,
                    new BeanPropertyRowMapper<>(words.class));
            return w;
        }catch (DataAccessException e){
            e.printStackTrace();
            return null;
        }
    }

    public int findTotalCount() {
        String sql="exec en_list_counter";
        return template.queryForObject(sql,Integer.class);
    }

    public int findTotalCountEn(String query) {
        String sql="select count(*) from en_list where word like \'%"+query+"%\'";
        return template.queryForObject(sql,Integer.class);
    }

    public int findTotalCountCh(String query){
        String sql="select count(*) from en_list where trans like \'%"+query+"%\'";
        return template.queryForObject(sql,Integer.class);
    }

    public List<words> findByPage(int start, int rows) {
        String sql="select top "+rows+" * from en_list where word not in" +
                "(select top "+start+" word from en_list)";
        List<words> wordsList = template.query(sql, new BeanPropertyRowMapper<words>(words.class));
        return wordsList;
    }


    public List<words> findByPageEn(int start, int rows, String query) {
        String sql="select top "+rows+" * from en_list where word like \'%"+query+"%\' and word not in" +
                "(select top "+start+" word from en_list where word like \'%"+query+"%\')";
        String sql2="exec EN_search \'"+query+"\'";
        List<words> wordsList = template.query(sql, new BeanPropertyRowMapper<words>(words.class));
        template.execute(sql2);
        return wordsList;
    }


    public List<words> findByPageCh(int start, int rows, String query) {
        String sql="select top "+rows+" * from en_list where trans like \'%"+query+"%\' and word not in" +
                "(select top "+start+" word from en_list where trans like \'%"+query+"%\')";
        String sql2="exec CH_search \'"+query+"\'";
        List<words> wordsList = template.query(sql, new BeanPropertyRowMapper<words>(words.class));
        template.execute(sql2);
        return wordsList;
    }


}
