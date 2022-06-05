package service;

import dao.AdminDao;
import domain.Admin;
import domain.User;
import domain.words;

import java.util.List;

public class AdminService {
    AdminDao dao =new AdminDao();

    public Admin login(Admin login) {
        return dao.login(login);
    }

    public void updateProfile(Admin admin) {
        dao.update(admin);
    }

    public words findWord(String word) {
        return dao.findWord(word);
    }

    public void updateWord(words word) {
        dao.updateWord(word);
    }

    public List<User> findUsers() {
        return dao.findUsers();
    }

    public void insertWord(words word) {
        dao.insertWord(word);
    }

    public void delWord(words word) {
        dao.delWord(word);

    }

    public User findUser(String user) {
        return dao.findUser(user);
    }

    public void updateUser(User user) {
        dao.updateUser(user);
    }

    public void delUser(User user) {
        dao.delUser(user);
    }

    public void bak(String dateNowStr) {
        dao.bak(dateNowStr);
    }
}
