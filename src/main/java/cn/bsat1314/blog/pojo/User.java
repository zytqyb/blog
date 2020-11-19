package cn.bsat1314.blog.pojo;

import java.util.Date;

public class User {
    private Integer id; // 用户唯一ide
    private String username; // 用户昵称e
    private String usercode; // 用户账号
    private String password; // 用户密码
    private Integer role; // 用户身份 1/2/3
    private Date creationDate; // 用户创建的时间
    private Date modifyDate; // 用户修改的时间

    public User() {
    }

    public User(Integer id, String username, String usercode, String password, Integer role, Date creationDate, Date modifyDate) {
        this.id = id;
        this.username = username;
        this.usercode = usercode;
        this.password = password;
        this.role = role;
        this.creationDate = creationDate;
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

    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", usercode='" + usercode + '\'' +
                ", password='" + password + '\'' +
                ", role=" + role +
                ", creationDate=" + creationDate +
                ", modifyDate=" + modifyDate +
                '}';
    }
}
