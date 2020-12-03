package cn.bsat1314.blog.pojo;

import java.sql.Timestamp;

public class Category {

    private Integer id; // 分类id
    private String name; // 分类名称
    private Timestamp createTime; // 分类创建时间

    public Category() {
    }

    public Category(Integer id, String name, Timestamp createTime) {
        this.id = id;
        this.name = name;
        this.createTime = createTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
