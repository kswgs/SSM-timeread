package kswgs.model.entity;

public class Category {
    /**
     * 图书分类id
     */
    private String category_id;
    /**
     * 分类迷宫
     */
    private String name;
    /**
     * 父分类id
     */
    private String parent_id;

    public String getCategory_id() {
        return category_id;
    }

    public void setCategory_id(String category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getParent_id() {
        return parent_id;
    }

    public void setParent_id(String parent_id) {
        this.parent_id = parent_id;
    }

    @Override
    public String toString() {
        return "Category{" +
                "category_id='" + category_id + '\'' +
                ", name='" + name + '\'' +
                ", parent_id='" + parent_id + '\'' +
                '}';
    }
}
