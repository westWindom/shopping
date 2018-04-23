package cn.yuanqing.dao;

import java.util.List;

import cn.yuanqing.pojo.CommentsInfo;
import cn.yuanqing.pojo.GoodsInfo;
import cn.yuanqing.pojo.GoodsMainInfo;
import cn.yuanqing.pojo.OrderlistInfo;
import org.apache.ibatis.annotations.Param;


public interface GoodsDao {
    List<GoodsMainInfo> screenad();

    List<GoodsMainInfo> recommend();

    List<GoodsMainInfo> newgoods();

    List<GoodsMainInfo> popular();

    List<GoodsInfo> queryallgoods();

    List<GoodsInfo> querywithcatagory(int goodscategory);

    GoodsInfo goodsdetail(String goodsName);

    List<CommentsInfo> getcomment(String goodsName);

    List<CommentsInfo> getBestComment(String goodsName);

    List<CommentsInfo> getMiddleComment(String goodsName);

    List<CommentsInfo> getWorstComment(String goodsName);

    GoodsInfo getgoods_byname(String name);

    List<OrderlistInfo> getorderlist(@Param("name") String name, @Param("goodsname") String goodsname);

    int insertorderlist(CommentsInfo commentsinfo);

    List<GoodsInfo> queryallgoosdsasc();

    List<GoodsInfo> querywithcategoryasc(@Param("goodscatagory") int goodscatagory);

    List<GoodsInfo> queryallgoosdsdesc();

    List<GoodsInfo> querywithcategorydesc(@Param("goodscatagory") int goodscategory);

    int upgoodsbyname(GoodsInfo goodsinfo);

    int upgoodsbynameexcpic(GoodsInfo goodsinfo);

    int degoodsbyname(GoodsInfo goodsinfo);

    int insgoodsinfo(GoodsInfo goodsinfo);

    GoodsInfo getgoods_byid(@Param("regoodsid") int regoodsid);

    int uptablad(@Param("table") String table, @Param("goodsid") int goodsid, @Param("regoodsid") int regoodsid,
                 @Param("goodsName") String goodsname, @Param("goodsPic") String goodspic, @Param("reregoodsid") int reregoodsid);

    List<GoodsInfo> selectInvalidbiscreeand(@Param("tablename") String tablename);

    List<GoodsInfo> selectgoodsThoughVague(@Param("key") String key);
}
