package com.ruoyi.yk.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户管理对象 else_users
 * 
 * @author ruoyi
 * @date 2022-11-30
 */
public class ElseUsers extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private String userNumber;

    /**  */
    @Excel(name = "")
    private String password;

    /**  */
    @Excel(name = "")
    private String username;

    /**  */
    @Excel(name = "")
    private String gender;

    /**  */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "", width = 30, dateFormat = "yyyy-MM-dd")
    private Date registerTime;

    /**  */
    @Excel(name = "")
    private String province;

    /**  */
    @Excel(name = "")
    private String email;

    /**  */
    @Excel(name = "")
    private Long money;

    /**  */
    @Excel(name = "")
    private String photo;

    /**  */
    @Excel(name = "")
    private String phone;

    /**  */
    @Excel(name = "")
    private Long roleId;

    public void setUserNumber(String userNumber) 
    {
        this.userNumber = userNumber;
    }

    public String getUserNumber() 
    {
        return userNumber;
    }
    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }
    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }
    public void setGender(String gender) 
    {
        this.gender = gender;
    }

    public String getGender() 
    {
        return gender;
    }
    public void setRegisterTime(Date registerTime) 
    {
        this.registerTime = registerTime;
    }

    public Date getRegisterTime() 
    {
        return registerTime;
    }
    public void setProvince(String province) 
    {
        this.province = province;
    }

    public String getProvince() 
    {
        return province;
    }
    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }
    public void setMoney(Long money) 
    {
        this.money = money;
    }

    public Long getMoney() 
    {
        return money;
    }
    public void setPhoto(String photo) 
    {
        this.photo = photo;
    }

    public String getPhoto() 
    {
        return photo;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setRoleId(Long roleId) 
    {
        this.roleId = roleId;
    }

    public Long getRoleId() 
    {
        return roleId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userNumber", getUserNumber())
            .append("password", getPassword())
            .append("username", getUsername())
            .append("gender", getGender())
            .append("registerTime", getRegisterTime())
            .append("province", getProvince())
            .append("email", getEmail())
            .append("money", getMoney())
            .append("photo", getPhoto())
            .append("phone", getPhone())
            .append("roleId", getRoleId())
            .toString();
    }
}
