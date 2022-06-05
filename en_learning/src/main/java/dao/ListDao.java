package dao;

import domain.User;
import org.springframework.jdbc.core.JdbcTemplate;
import util.jdbcUtils;

public class ListDao {
    private JdbcTemplate template=new JdbcTemplate(jdbcUtils.getDs());


    public void rank_move(User user, String word) {
        String sql="exec rank_move \'"+user.getUser_id()+"\',\'"+word+"\'";
        template.execute(sql);
    }

    public void rank_up(User user,String word){
        String sql="exec rank_up \'"+user.getUser_id()+"\',\'"+word+"\'";
        template.execute(sql);
    }

    public void rank_down(User user,String word){
        String sql="exec rank_down \'"+user.getUser_id()+"\',\'"+word+"\'";
        template.execute(sql);
    }

    public void rank_re(User user,String word){
        String sql="exec rank_re \'"+user.getUser_id()+"\',\'"+word+"\'";
        template.execute(sql);
    }
}
