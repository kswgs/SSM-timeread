package kswgs.model.service;

import kswgs.model.entity.Category;

import java.util.ArrayList;


public interface ICategoryService {
    /**
     * 查询所有分类
     */
    public ArrayList<Category> getCategory();

    /**
     * 查询所有父分类
     */
    public ArrayList<Category> getCategoryParent();

    /**
     * 输入id获取一个具体的图书类型
     * @param category
     * @return
     */
    public String getCategoryById(String category);

    /**
     * 输入ID获取一个图书父分类
     * @param categoryParent
     * @return
     */
    public String getCategoryParentById(String categoryParent);

}
