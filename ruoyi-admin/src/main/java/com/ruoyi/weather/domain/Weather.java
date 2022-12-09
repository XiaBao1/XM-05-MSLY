package com.ruoyi.weather.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
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

    /** 数据收集时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "数据收集时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date collectTime;

    /** 天气类型 */
    @Excel(name = "天气类型")
    private String weatherType;

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
    public void setCollectTime(Date collectTime) 
    {
        this.collectTime = collectTime;
    }

    public Date getCollectTime() 
    {
        return collectTime;
    }
    public void setWeatherType(String weatherType) 
    {
        this.weatherType = weatherType;
    }

    public String getWeatherType() 
    {
        return weatherType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("city", getCity())
            .append("temperature", getTemperature())
            .append("collectTime", getCollectTime())
            .append("weatherType", getWeatherType())
            .toString();
    }
}
