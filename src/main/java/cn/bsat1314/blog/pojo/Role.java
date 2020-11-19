package cn.bsat1314.blog.pojo;

public class Role {
    private Integer id;
    private String roleCode;
    private String roleName;
    private String datetime;
    private String modifyDate;

    public Role() {
    }

    public Role(Integer id, String roleCode, String roleName, String datetime, String modifyDate) {
        this.id = id;
        this.roleCode = roleCode;
        this.roleName = roleName;
        this.datetime = datetime;
        this.modifyDate = modifyDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(String modifyDate) {
        this.modifyDate = modifyDate;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", roleCode='" + roleCode + '\'' +
                ", roleName='" + roleName + '\'' +
                ", datetime='" + datetime + '\'' +
                ", modifyDate='" + modifyDate + '\'' +
                '}';
    }
}
