package com.ruoyi.yk.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 代码生成测试对象 landlord_house
 * 
 * @author sja
 * @date 2022-11-30
 */
public class TopLandlordHouse extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 民宿ID */
    private Long id;

    /** 民宿名称 */
    @Excel(name = "民宿名称")
    private String houseName;

    /** 房主账号 */
    @Excel(name = "房主账号")
    private Long hostNumber;

    /** 民宿地址 */
    @Excel(name = "民宿地址")
    private String address;

    /** 民宿得分 */
    @Excel(name = "民宿得分")
    private Long score;

    /** 民宿得分 */
    @Excel(name = "民宿销量")
    private Long sale;

    /** 注册时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "注册时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date registerTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setHouseName(String houseName) 
    {
        this.houseName = houseName;
    }

    public String getHouseName() 
    {
        return houseName;
    }
    public void setHostNumber(Long hostNumber)
    {
        this.hostNumber = hostNumber;
    }

    public Long getHostNumber()
    {
        return hostNumber;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setScore(Long score) 
    {
        this.score = score;
    }

    public Long getScore() 
    {
        return score;
    }
    public void setRegisterTime(Date registerTime) 
    {
        this.registerTime = registerTime;
    }

    public Date getRegisterTime() 
    {
        return registerTime;
    }

    public Long getSale() {
        return sale;
    }

    public void setSale(Long sale) {
        this.sale = sale;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("houseName", getHouseName())
            .append("hostNumber", getHostNumber())
            .append("address", getAddress())
            .append("score", getScore())
            .append("registerTime", getRegisterTime())
            .toString();
    }
}
