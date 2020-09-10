package com.hisoft.news.service;

import com.hisoft.news.entity.News;

import java.util.List;
import java.util.Map;

/**
 * @program: MyWebProject
 * @description: 新闻业务层接口
 * @author: wlg
 * @create: 2020-07-29 17:50:46
 **/
public interface NewsService {

    /**
     * 查询所有新闻
     */

    List<News> queryAllNews(Integer tid);

    /**
     * 查询首页数据（国内，国际，娱乐新闻，主题，中间新闻）
     */
    Map<String,Object> queryIndexList(String gn, String gj, String yl, Integer tid,int currPageNo);

    /**
     * 根据id获取新闻
     *
     * @param nid
     * @return
     */
    News getNewsByNid(int nid);

    /**
     * 删除新闻
     */
    int delNewsById(int nid);
}
