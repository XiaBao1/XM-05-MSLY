package com.ruoyi.weather.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 天气信息对象 weather
 * 
 * @author lrc
 * @date 2022-12-09
 */
public class Weather extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 数据编号 */
    private Long id;

    /** 城市 */
    @Excel(name = "城市")
    private String city;

    /** 温度 */
    @Excel(name = "温度")
    private String temperature;

    /** 天气类型 */
    @Excel(name = "天气类型")
    private String type;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setCity(String city) 
    {
        this.city = city;
    }

    public String getCity() 
    {
        return city;
    }
    public void setTemperature(String temperature) 
    {
        this.temperature = temperature;
    }

    public String getTemperature() 
    {
        return temperature;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("city", getCity())
            .append("temperature", getTemperature())
            .append("createTime", getCreateTime())
            .append("type", getType())
            .toString();
    }
}
