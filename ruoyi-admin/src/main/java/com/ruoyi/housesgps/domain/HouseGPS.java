package com.ruoyi.housesgps.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 地图管理对象 landlord_house
 * 
 * @author yyt
 * @date 2022-12-11
 */
public class HouseGPS extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /**  */
    @Excel(name = "民宿名称")
    private String houseName;

    /**  */
    private Long hostNumber;

    /**  */
    @Excel(name = "所在地址")
    private String address;
    @Excel(name = "城市")
    private String city;

    /**  */

    private BigDecimal score;

    /**  */
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
    public void setScore(BigDecimal score) 
    {
        this.score = score;
    }

    public BigDecimal getScore() 
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

    public void setCity(String city)
    {
        this.city = city;
    }

    public String getCity()
    {
        return city;
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
                .append("city", getCity())
            .toString();
    }
}
