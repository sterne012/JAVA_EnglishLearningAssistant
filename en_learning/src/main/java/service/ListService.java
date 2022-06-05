package service;

import dao.ListDao;
import domain.User;

public class ListService {
    private ListDao dao=new ListDao();


    public void rank_move(User user, String word) {
        dao.rank_move(user,word);
    }

    public void rank_up(User user, String word) {
        dao.rank_up(user,word);
    }

    public void rank_down(User user, String word) {
        dao.rank_down(user,word);
    }

    public void rank_re(User user, String word) {
        dao.rank_re(user,word);
    }
}
