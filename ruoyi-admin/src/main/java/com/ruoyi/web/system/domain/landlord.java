package com.ruoyi.web.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.utils.security.PermissionUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 民宿管理对象 landlord_house
 *
 * @author pch
 * @date 2022-12-12
 */
public class landlord extends BaseEntity
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
    @Excel(name = "民宿地址")
    private String address;

    /**  */
    //@Excel(name = "城市名称")
    private String city;

    private String province;

    /**  */
    @Excel(name = "民宿评分")
    private BigDecimal score;

    @Excel(name = "民宿图片")
    public String imageUrl;

    /**  */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "注册时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date registerTime;

    public  Long userId= (Long) PermissionUtils.getPrincipalProperty("userId");

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

    public void setCity(String city){this.city=city;}

    public String getCity() {
        return city;
    }

    public void setProvince(String province){this.province=province;}

    public String getProvince() {
        return province;
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

    public String getImageUrl(){return imageUrl;}
    public void setImageUrl(String imageUrl){this.imageUrl=imageUrl;}

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("houseName", getHouseName())
                .append("hostNumber", getHostNumber())
                .append("city", getCity())
                .append("province",getProvince())
                .append("address", getAddress())
                .append("score", getScore())
                .append("registerTime", getRegisterTime())
                .append("imageUrl",getImageUrl())
                .toString();
    }
}
