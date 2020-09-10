package com.hisoft.news.dao;

import com.hisoft.news.entity.News;

import java.sql.SQLException;
import java.util.List;

public interface NewsDao {

    /**
     * 查询页面新闻
     */

    List<News> queryPageNews(Integer tid,int currPageNo,int pageSize) throws SQLException;

    int queryNewsCount(Integer tid) throws SQLException;

    List<News> queryAllNews(Integer tid) throws SQLException;
    /**
     * 根据tid查找新闻列表
     */
    List<News> queryNewsByTid(int tid) throws SQLException;

    /**
     * 根据主题名称查询新闻列表
     */
    List<News> queryNewsByTname(String tname) throws SQLException;

    /**
     * 根据id获取新闻
     * @param nid
     * @return
     */
    News getNewsByNID(int nid) throws SQLException;

    /**
     * 根据新闻id删除新闻
     */
    int delNewsById(int nid) throws SQLException;
}
