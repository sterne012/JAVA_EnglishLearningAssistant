package domain;

public class User {
    private String user_id;
    private String user_passwd;
    private String user_name;
    private String user_date;
    private String user_learn;//打卡天数
    private int user_words_num;//学习计划中每日单词数
    private int user_sel;//学习计划中筛选方法
    private int user_learned;//每日学习数


    public int getUser_learned() {
        return user_learned;
    }

    public void setUser_learned(int user_learned) {
        this.user_learned = user_learned;
    }

    public int getUser_words_num() {
        return user_words_num;
    }

    public void setUser_words_num(int user_words_num) {
        this.user_words_num = user_words_num;
    }

    public int getUser_sel() {
        return user_sel;
    }

    public void setUser_sel(int user_sel) {
        this.user_sel = user_sel;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_passwd() {
        return user_passwd;
    }

    public void setUser_passwd(String user_passwd) {
        this.user_passwd = user_passwd;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_date() {
        return user_date;
    }

    public void setUser_date(String user_date) {
        this.user_date = user_date;
    }

    public String getUser_learn() {
        return user_learn;
    }

    public void setUser_learn(String user_learn) {
        this.user_learn = user_learn;
    }
}
