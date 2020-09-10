package com.hisoft.news.dao.impl;

import com.hisoft.news.dao.BaseDao;
import com.hisoft.news.dao.NewsDao;
import com.hisoft.news.entity.News;
import com.hisoft.news.util.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: MyWebProject
 * @description:
 * @author: wlg
 * @create: 2020-07-25 09:12:46
 **/
public class NewsDaoImpl extends BaseDao implements NewsDao {
    public NewsDaoImpl(Connection connection) {
        super(connection);
    }

    @Override
    public List<News> queryPageNews(Integer tid,int currPageNo,int pageSize) throws SQLException {
        PreparedStatement pstmt = null;
        String sql;
        if(tid ==null){
            sql = "select nid,nauthor,ntitle,ncreateDate from news order by ncreateDate desc limit ?,?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,(currPageNo-1)*pageSize);
            pstmt.setInt(2,pageSize);
        }else{
            sql = "select nid,nauthor,ntitle,ncreateDate from news where ntid = ? order by ncreateDate desc limit ?,?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,tid);
            pstmt.setInt(2,(currPageNo-1)*pageSize);
            pstmt.setInt(3,pageSize);
        }

        ResultSet rs = pstmt.executeQuery();
        List<News> newsList = new ArrayList<>();
        News news = null;
        while (rs.next()) {
            news = new News();
            news.setNid(rs.getInt("nid"));
            news.setNauthor(rs.getString("nauthor"));
            news.setNtitle(rs.getString("ntitle"));
            news.setNcreateDate(rs.getTimestamp("ncreateDate"));
            //不需要全查出来，需要多少查多少
            newsList.add(news);
        }
        JdbcUtil.closeAll(null, pstmt, rs);
        return newsList;
    }

    @Override
    public int queryNewsCount(Integer tid) throws SQLException {
        PreparedStatement pstmt = null;
        String sql;
        if(tid ==null){
            sql = "select nid,nauthor,ntitle,ncreateDate from news order by ncreateDate desc";
            pstmt = connection.prepareStatement(sql);
        }else{
            sql = "select nid,nauthor,ntitle,ncreateDate from news where ntid = ? order by ncreateDate desc";
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,tid);
        }

        ResultSet rs = pstmt.executeQuery();
        List<News> newsList = new ArrayList<>();
        News news = null;
        while (rs.next()) {
            news = new News();
            news.setNid(rs.getInt("nid"));
            news.setNauthor(rs.getString("nauthor"));
            news.setNtitle(rs.getString("ntitle"));
            news.setNcreateDate(rs.getTimestamp("ncreateDate"));
            //不需要全查出来，需要多少查多少
            newsList.add(news);
        }
        JdbcUtil.closeAll(null, pstmt, rs);
        return newsList.size();
    }

    @Override
    public List<News> queryAllNews(Integer tid) throws SQLException {
        PreparedStatement pstmt = null;
        String sql;
        if(tid ==null){
            sql = "select nid,nauthor,ntitle,ncreateDate from news order by ncreateDate desc";
            pstmt = connection.prepareStatement(sql);
        }else{
            sql = "select nid,nauthor,ntitle,ncreateDate from news where ntid = ? order by ncreateDate desc";
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,tid);
        }

        ResultSet rs = pstmt.executeQuery();
        List<News> newsList = new ArrayList<>();
        News news = null;
        while (rs.next()) {
            news = new News();
            news.setNid(rs.getInt("nid"));
            news.setNauthor(rs.getString("nauthor"));
            news.setNtitle(rs.getString("ntitle"));
            news.setNcreateDate(rs.getTimestamp("ncreateDate"));
            //不需要全查出来，需要多少查多少
            newsList.add(news);
        }
        JdbcUtil.closeAll(null, pstmt, rs);
        return newsList;
    }

    @Override
    public List<News> queryNewsByTid(int tid) throws SQLException {

        PreparedStatement pstmt = connection.prepareStatement("select nid,nauthor,ntitle from news where ntid = ?");
        pstmt.setInt(1, tid);
        ResultSet rs = pstmt.executeQuery();
        List<News> newsList = new ArrayList<>();
        News news = null;
        while (rs.next()) {
            news = new News();
            news.setNid(rs.getInt("nid"));
            news.setNauthor(rs.getString("nauthor"));
            news.setNtitle(rs.getString("ntitle"));
            //不需要全查出来，需要多少查多少
            newsList.add(news);
        }
        JdbcUtil.closeAll(null, pstmt, rs);
        return newsList;
    }

    @Override
    public List<News> queryNewsByTname(String tname) throws SQLException {
        PreparedStatement pstmt = connection.prepareStatement("select nid,ntitle from news,topic where news.ntid = topic.tid and  tname = ? order by ncreateDate desc limit 5");
        pstmt.setString(1, tname);
        ResultSet rs = pstmt.executeQuery();
        List<News> newsList = new ArrayList<>();
        News news = null;
        while (rs.next()) {
            news = new News();
            news.setNid(rs.getInt("nid"));
            news.setNtitle(rs.getString("ntitle"));
            //不需要全查出来，需要多少查多少
            newsList.add(news);
        }
        JdbcUtil.closeAll(null, pstmt, rs);
        return newsList;
    }

    // 获取某条新闻
    @Override
    public News getNewsByNID(int nid) throws SQLException {
        String sql = "SELECT * FROM news, topic  where news.ntid = topic.tid and news.nid = ?"
                + " order by ncreateDate desc";
        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setInt(1,nid);
        News news = null;
        ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                news = new News();
                news.setNid(rs.getInt("nid"));
                news.setNtid(rs.getInt("ntid"));
                news.setNtitle(rs.getString("ntitle"));
                news.setNauthor(rs.getString("nauthor"));
                news.setNcreateDate(rs.getTimestamp("ncreateDate"));
                news.setNpicPath(rs.getString("npicPath"));
                news.setNcontent(rs.getString("ncontent"));
                news.setNmodifyDate(rs.getTimestamp("nmodifyDate"));
                news.setNsummary(rs.getString("nsummary"));
                news.setNtname(rs.getString("tname"));
            }
            JdbcUtil.closeAll(null, pstmt, rs);
        return news;
    }

    @Override
    public int delNewsById(int nid) throws SQLException {
        PreparedStatement pstmt = connection.prepareStatement("delete from news where nid = ?");
        pstmt.setInt(1,nid);
        int i = pstmt.executeUpdate();
        JdbcUtil.closeAll(null,pstmt,null);
        return i;
    }

}
