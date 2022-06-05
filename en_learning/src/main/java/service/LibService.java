package service;

import dao.LibDao;
import domain.PageBean;
import domain.User;
import domain.words;

import java.util.List;
import java.util.Map;

public class LibService {
    private LibDao dao=new LibDao();
     //查询所有
    public List<words> findAll(){
        return dao.findAll();
    }

    public void addWords(User user, String[] words){
        for (String word : words) {
            dao.addWords(user.getUser_id(),word);
        }
    }

    public boolean findWords(User user, String[] words) {
        for(String word:words){
            if(dao.findWords(user,word)!=null){
                return false;
            }
        }
        return true;
    }


    public PageBean<words> findByPage(String _currentPage, String _rows) {
        int currentPage=Integer.parseInt(_currentPage);
        int rows=Integer.parseInt(_rows);
        PageBean<words> pb=new PageBean<words>();

        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        //dao查询总记录数
        int totalCount=dao.findTotalCount();
        pb.setTotalCount(totalCount);

        //计算开始记录的位置
        int start=(currentPage-1)*rows;
        List<words> wordsList=dao.findByPage(start,rows);
        pb.setList(wordsList);

        //总页数
        int totalPage=totalCount%rows==0?totalCount/rows:totalCount/rows+1;
        pb.setTotalPage(totalPage);

        return pb;
    }


    public PageBean<words> findByPage(String _currentPage, String _rows, String query,int type) {
        int currentPage=Integer.parseInt(_currentPage);
        int rows=Integer.parseInt(_rows);
        PageBean<words> pb=new PageBean<words>();

        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        if(type==1){
            //dao查询总记录数
            int totalCount=dao.findTotalCountEn(query);
            pb.setTotalCount(totalCount);

            //计算开始记录的位置
            int start=(currentPage-1)*rows;
            List<words> wordsList=dao.findByPageEn(start,rows,query);
            pb.setList(wordsList);

            //总页数
            int totalPage=totalCount%rows==0?totalCount/rows:totalCount/rows+1;
            pb.setTotalPage(totalPage);
        }
        else if(type==2) {
            //dao查询总记录数
            int totalCount = dao.findTotalCountCh(query);
            pb.setTotalCount(totalCount);

            //计算开始记录的位置
            int start = (currentPage - 1) * rows;
            List<words> wordsList = dao.findByPageCh(start, rows,query);
            pb.setList(wordsList);

            //总页数
            int totalPage = totalCount % rows == 0 ? totalCount / rows : totalCount / rows + 1;
            pb.setTotalPage(totalPage);
        }
        return pb;
    }


}
