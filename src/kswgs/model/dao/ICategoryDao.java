package kswgs.model.dao;

import kswgs.model.entity.Category;

import java.util.ArrayList;

public interface ICategoryDao {
    /**
     * 查询所有分类
     */
    public ArrayList<Category> selectByCategory();

    /**
     * 查询所有父分类
     */
    public ArrayList<Category> selectByCategoryParent();


    /**
     * 输入相应ID获取一个图书类型
     * @param category
     * @return
     */
    public String selectCategoryById(String category);

    /**
     * 输入相应ID获取一个图书父类型
     * @param categoryParent
     * @return
     */
    public String selectCategoryParentById(String categoryParent);

}
