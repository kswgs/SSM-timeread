package kswgs.model.dao;

import kswgs.model.entity.ShoppingItem;

import java.util.Map;

public interface IShoppingItemDao {

    /**
     * 输入一个ShoppingItem，插入一条购买记录，返回一个布尔值
     * @param shoppingItem
     * @return
     */
    public Boolean insertShoppongItem(ShoppingItem shoppingItem);

    /**
     * 查询一条购买图书记录
     * 传入Map参数，键只能有两个，book_id、user_id
     * 两个键都必须有
     * book_id为图书id
     * user_id为用户id
     * @param map
     * @return
     */
    public ShoppingItem selectShoppingItemByUseIdAndBookId(Map<String,Object> map);
}
