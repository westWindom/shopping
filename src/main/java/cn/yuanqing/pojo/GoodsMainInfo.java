package cn.yuanqing.pojo;

/**
 * 主要商品实体类
 *
 * @author yq
 */
public class GoodsMainInfo {
    private int goodsId;//商品ID
    private String goodsName;//商品名称
    private String goodsPic;//商品图片地址

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

    public String getGoodsPic() {
        return goodsPic;
    }

    public void setGoodsPic(String goodsPic) {
        this.goodsPic = goodsPic;
    }
}
