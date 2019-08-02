package kswgs.model.service.impl;

import kswgs.model.dao.ICategoryDao;
import kswgs.model.entity.Category;
import kswgs.model.service.ICategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService {

    @Resource
    private ICategoryDao categoryDao;

    @Override
    public ArrayList<Category> getCategory() {
        return categoryDao.selectByCategory();
    }

    @Override
    public ArrayList<Category> getCategoryParent() {
        return categoryDao.selectByCategoryParent();
    }

    @Override
    public String getCategoryById(String category) {
        return categoryDao.selectCategoryById(category);
    }

    @Override
    public String getCategoryParentById(String categoryParent) {
        return categoryDao.selectCategoryParentById(categoryParent);
    }
}
