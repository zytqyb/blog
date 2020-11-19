package cn.bsat1314.blog.pojo;

import java.util.Date;

public class Article {

    private Integer id;
    private String title;
    private String content;
    private String author;
    private Date time;

    public Article() {
    }

    public Article(Integer id, String title, String content, String author, Date time) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.author = author;
        this.time = time;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
