package kswgs.model.service.impl;

import kswgs.model.dao.IShoppingItemDao;
import kswgs.model.entity.ShoppingItem;
import kswgs.model.service.IShoppingItemService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service("shoppingItemService")
public class ShoppingItemServiceImpl implements IShoppingItemService {

    @Resource
    private IShoppingItemDao shoppingItemDao;

    @Override
    public Boolean addShoppingItem(ShoppingItem shoppingItem) {
        return shoppingItemDao.insertShoppongItem(shoppingItem);
    }

    @Override
    public ShoppingItem getShoppingItemByUseIdAndBookId(String book_id, String user_id) {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("book_id",book_id);
        map.put("user_id",user_id);
        return shoppingItemDao.selectShoppingItemByUseIdAndBookId(map);
    }
}
