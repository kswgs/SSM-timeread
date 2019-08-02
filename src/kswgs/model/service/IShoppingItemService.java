package kswgs.model.service;

import kswgs.model.entity.ShoppingItem;

public interface IShoppingItemService {

    /**
     * 输入一个ShoppingItem，插入一条购买记录，返回一个布尔值
     * @param shoppingItem
     * @return
     */
    public Boolean addShoppingItem(ShoppingItem shoppingItem);

    /**
     * 查询一条购买图书记录
     * 输入图书id和用户id，返回一条购买记录
     * @param book_id
     * @param user_id
     * @return
     */
    public ShoppingItem getShoppingItemByUseIdAndBookId(String book_id,String user_id);
}
