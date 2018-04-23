package cn.yuanqing.service;

import java.util.List;

import javax.annotation.Resource;

import cn.yuanqing.dao.GoodsDao;
import cn.yuanqing.pojo.CommentsInfo;
import cn.yuanqing.pojo.GoodsInfo;
import cn.yuanqing.pojo.GoodsMainInfo;
import cn.yuanqing.pojo.OrderlistInfo;
import org.springframework.stereotype.Service;

@Service
public class GoodsService {

    @Resource
    private GoodsDao goodsDao;


    public List<GoodsMainInfo> screenad() {

        return goodsDao.screenad();
    }

    public List<GoodsMainInfo> recommend() {

        return goodsDao.recommend();
    }

    public List<GoodsMainInfo> newgoods() {

        return goodsDao.newgoods();
    }

    public List<GoodsMainInfo> popular() {

        return goodsDao.popular();
    }

    /**
     * 查询数据库中所有的数据
     *
     * @return 一个GoodsInfo类型的List集合<br       />
     * 如果无数据，那么返回一个长度为0的List集合
     */
    public List<GoodsInfo> queryallgoods() {

        return goodsDao.queryallgoods();
    }

    /**
     * 按照给定的目录类别查询商品信息
     *
     * @param goodscategory 商品种类对应的编号
     * @return 一个GoodsInfo的list集合
     * 如果未查到，那么返回长度为0的List集合
     */
    public List<GoodsInfo> querywithcatagory(int goodscategory) {

        return goodsDao.querywithcatagory(goodscategory);
    }

    public GoodsInfo goodsdetail(String goodsName) {
        return goodsDao.goodsdetail(goodsName);
    }

    public List<CommentsInfo> getcomment(String goodsName) {

        return goodsDao.getcomment(goodsName);
    }

    public List<CommentsInfo> getBestComment(String goodsName) {

        return goodsDao.getBestComment(goodsName);
    }

    public List<CommentsInfo> getMiddleComment(String goodsName) {

        return goodsDao.getMiddleComment(goodsName);
    }

    public List<CommentsInfo> getWorstComment(String goodsName) {

        return goodsDao.getWorstComment(goodsName);
    }

    public boolean whetherbuy(String name, String goodsname) {
        List<OrderlistInfo> orderlist = null;

        orderlist = goodsDao.getorderlist(name, goodsname);
        if (orderlist.size() == 0) {
            return false;
        } else {
            return true;
        }
    }

    public boolean insertcomment(CommentsInfo commentsinfo) {
        int res = goodsDao.insertorderlist(commentsinfo);
        if (res > 0) {
            return true;
        } else {
            return false;
        }
    }

    public List<GoodsInfo> queryallgoodsasc() {
        List<GoodsInfo> goodsinfo = null;
        try {
            goodsinfo = goodsDao.queryallgoosdsasc();
        } catch (Exception e) {
        }

        return goodsinfo;
    }

    public List<GoodsInfo> querywithcatagoryasc(int goodscatagory) {
        List<GoodsInfo> goodsinfo = null;
        try {
            goodsinfo = goodsDao.querywithcategoryasc(goodscatagory);
        } catch (Exception e) {
        }

        return goodsinfo;
    }

    public List<GoodsInfo> queryallgoodsdesc() {
        List<GoodsInfo> goodsinfo = null;
        try {
            goodsinfo = goodsDao.queryallgoosdsdesc();
        } catch (Exception e) {
        }

        return goodsinfo;
    }

    public List<GoodsInfo> querywithcatagorydesc(int goodscatagory) {
        List<GoodsInfo> goodsinfo = null;
        try {
            goodsinfo = goodsDao.querywithcategorydesc(goodscatagory);
        } catch (Exception e) {
        }

        return goodsinfo;
    }

    public boolean upgoodsbyname(GoodsInfo goodsinfo) {
        int res = goodsDao.upgoodsbyname(goodsinfo);
        if (res > 0) {
            return true;
        }
        return false;
    }

    public boolean upgoodsbynameexcpic(GoodsInfo goodsinfo) {
        int res = goodsDao.upgoodsbynameexcpic(goodsinfo);
        if (res > 0) {
            return true;
        }
        return false;
    }


    public boolean degoodsbyname(GoodsInfo goodsinfo) {
        int res = goodsDao.degoodsbyname(goodsinfo);
        if (res > 0)
            return true;
        return false;
    }

    public boolean insgoodsinfo(GoodsInfo goodsinfo) {
        int res = goodsDao.insgoodsinfo(goodsinfo);
        if (res > 0)
            return true;
        return false;
    }

    public GoodsInfo getgoodsbyid(int regoodsid) {
        return goodsDao.getgoods_byid(regoodsid);
    }

    public boolean uptablead(String table, int goodsid, int regoodsid, GoodsInfo goodsinfo) {
        int res = goodsDao.uptablad(table, goodsid, regoodsid, goodsinfo.getGoodsName(), goodsinfo.getGoodsPic(), goodsinfo.getGoodsId());
        if (res > 0)
            return true;
        return false;
    }

    /**
     * 利用外连接，查询出失效的商品
     *
     * @return
     */
    public List<GoodsInfo> queryInvalidbiscreeand(String tablename) {
        return goodsDao.selectInvalidbiscreeand(tablename);

    }

    /**
     * 通过模糊查询查询商品数据库中的数据
     *
     * @param key 需要的进行模糊查询的key
     * @return 一个GoodsInfo的List集合，<br/>
     * 如果无数据，将会是一个长度为0的List集合
     */
    public List<GoodsInfo> querygoodsThoughVague(String key) {

        return goodsDao.selectgoodsThoughVague(key);
    }
}
