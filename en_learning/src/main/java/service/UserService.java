package service;

import dao.UserDao;
import domain.User;
import domain.userWord;
import domain.words;


import java.util.List;

public class UserService {
    UserDao dao=new UserDao();

    public void updateProfile(User user){
        dao.update(user);
    }

    public User login(User user){
        return dao.login(user);
    }

    public boolean CheckLogin(User user) {
        return dao.CheckLogin(user);
    }

    public void sign(User user) {
        dao.sign(user);
    }

    public List<userWord> List1words(User user){
        return dao.List1words(user.getUser_id());
    }

    public List<userWord> List2words(User user) {
        return dao.List2words(user.getUser_id());
    }

    public void BeginLearn(User user){
        dao.BeginLearn(user);
    }


    public List<userWord> UserTest(User user) {
        return dao.UserTest(user);
    }


}
