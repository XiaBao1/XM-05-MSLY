package com.ruoyi.usertodolist.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.security.PermissionUtils;
import org.apache.catalina.User;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.shiro.SecurityUtils;

/**
 * 我的待办对象 user_todolist
 * 
 * @author yyt
 * @date 2022-12-08
 */
public class UserTodolist extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 账号 */
    private String userNumber;


    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 截止时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "截止时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date ddlTime;

    /** 待办事项状态 */
    @Excel(name = "待办事项状态", readConverterExp = "0=待完成,1=已完成")
    private String status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserNumber(String userNumber) 
    {
        this.userNumber = userNumber;
    }

    public String getUserNumber() 
    {
        return userNumber;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setDdlTime(Date ddlTime) 
    {
        this.ddlTime = ddlTime;
    }

    public Date getDdlTime() 
    {
        return ddlTime;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userNumber", getUserNumber())
            .append("content", getContent())
            .append("ddlTime", getDdlTime())
            .append("status", getStatus())
            .toString();
    }
}
