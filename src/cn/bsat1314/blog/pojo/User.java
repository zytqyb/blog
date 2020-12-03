package cn.bsat1314.blog.pojo;

import java.sql.Timestamp;


public class User {
    private Integer id; // 用户唯一ide
    private String username; // 用户昵称e
    private String usercode; // 用户账号
    private String password; // 用户密码
    private Integer role; // 用户身份 1/2/3
    private Timestamp creationDate; // 用户创建的时间
    private Timestamp modifyDate; // 用户修改的时间
    private String AvatarUrl; // 头像

    public User() {
    }

    public User(Integer id, String username, String usercode, String password, Integer role, Timestamp creationDate, Timestamp modifyDate, String avatarUrl) {
        this.id = id;
        this.username = username;
        this.usercode = usercode;
        this.password = password;
        this.role = role;
        this.creationDate = creationDate;
        this.modifyDate = modifyDate;
        AvatarUrl = avatarUrl;
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

    public Timestamp getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Timestamp creationDate) {
        this.creationDate = creationDate;
    }

    public Timestamp getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Timestamp modifyDate) {
        this.modifyDate = modifyDate;
    }

    public String getAvatarUrl() {
        return AvatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        AvatarUrl = avatarUrl;
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
                ", AvatarUrl='" + AvatarUrl + '\'' +
                '}';
    }
}
