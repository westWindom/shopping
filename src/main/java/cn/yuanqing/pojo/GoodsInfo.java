package cn.yuanqing.pojo;

/**
 * 商品信息实体类
 *
 * @author yq
 * cn.yuanqing.pojo.GoodsInfo
 */
public class GoodsInfo {
    /**
     * 商品id
     */
    private int goodsId;//商品ID
    private String goodsName;//商品名称
    private double goodsprice;//商品价格
    private int goodsNum;//商品库存
    private String goodsMaker;//商品制造商
    private String goodsDesc;//商品描述
    private String goodsPic;//商品图片
    private int goodsCategory;//商品目录

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public double getGoodsprice() {
        return goodsprice;
    }

    public void setGoodsprice(double goodsprice) {
        this.goodsprice = goodsprice;
    }

    public int getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(int goodsNum) {
        this.goodsNum = goodsNum;
    }

    public String getGoodsMaker() {
        return goodsMaker;
    }

    public void setGoodsMaker(String goodsMaker) {
        this.goodsMaker = goodsMaker;
    }

    public String getGoodsDesc() {
        return goodsDesc;
    }

    public void setGoodsDesc(String goodsDesc) {
        this.goodsDesc = goodsDesc;
    }

    public String getGoodsPic() {
        return goodsPic;
    }

    public void setGoodsPic(String goodsPic) {
        this.goodsPic = goodsPic;
    }

    public int getGoodsCategory() {
        return goodsCategory;
    }

    public void setGoodsCategory(int goodsCategory) {
        this.goodsCategory = goodsCategory;
    }

    @Override
    public String toString() {
        return "GoodsInfo{" +
                "goodsId=" + goodsId +
                ", goodsName='" + goodsName + '\'' +
                ", goodsprice=" + goodsprice +
                ", goodsNum=" + goodsNum +
                ", goodsMaker='" + goodsMaker + '\'' +
                ", goodsDesc='" + goodsDesc + '\'' +
                ", goodsPic='" + goodsPic + '\'' +
                ", goodsCategory=" + goodsCategory +
                '}';
    }
}

