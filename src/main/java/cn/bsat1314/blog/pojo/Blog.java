package cn.bsat1314.blog.pojo;

import java.sql.Timestamp;

// 博客文章实体类
public class Blog {

    private Integer id; //文章id
    private String username; // 文章作者
    private String title; //文章标题
    private String content; // 文章内容
    private String content100; // 摘要
    private String photo; //文章封面图片地址
    private Integer category; // 文章类别
    private Timestamp uploadTime; // 文章发布时间
    private Timestamp modifyDate; // 文章修改时间

    public Blog() {
    }

    public Blog(Integer id, String username, String title, String content, String content100, String photo, Integer category, Timestamp uploadTime, Timestamp modifyDate) {
        this.id = id;
        this.username = username;
        this.title = title;
        this.content = content;
        this.content100 = content100;
        this.photo = photo;
        this.category = category;
        this.uploadTime = uploadTime;
        this.modifyDate = modifyDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent100() {
        return content100;
    }

    public void setContent100(String content100) {
        this.content100 = content100;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getCategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
    }

    public Timestamp getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Timestamp uploadTime) {
        this.uploadTime = uploadTime;
    }

    public Timestamp getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Timestamp modifyDate) {
        this.modifyDate = modifyDate;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", content100='" + content100 + '\'' +
                ", photo='" + photo + '\'' +
                ", category=" + category +
                ", uploadTime=" + uploadTime +
                ", modifyDate=" + modifyDate +
                '}';
    }
}
