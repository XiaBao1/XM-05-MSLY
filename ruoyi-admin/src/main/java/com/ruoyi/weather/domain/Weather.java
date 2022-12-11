package com.ruoyi.weather.domain;

import java.math.BigDecimal;
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
 * @date 2022-12-11
 */
public class Weather extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 数据编号 */
    private Long id;

    /** 城市 */
    @Excel(name = "城市")
    private String city;

    /** 天气日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "天气日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date weatherDate;

    /** 低温 */
    @Excel(name = "低温（℃）")
    private Long lowT;

    /** 高温 */
    @Excel(name = "高温（℃）")
    private Long highT;

    /** 白天天气 */
    @Excel(name = "白天天气")
    private String dayType;

    /** 夜晚天气 */
    @Excel(name = "夜晚天气")
    private String nightType;

    /** 风向 */
    @Excel(name = "风向")
    private String windDirection;

    /** 风速（单位m/s） */
    @Excel(name = "风速（m/s）")
    private BigDecimal windSpeed;

    /** 风力（单位级） */
    @Excel(name = "风力（级）")
    private Long windScale;

    /** 湿度（单位%） */
    @Excel(name = "湿度（%）")
    private Long humidity;

    /** 数据收集时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "数据收集时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date collectTime;

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
    public void setWeatherDate(Date weatherDate) 
    {
        this.weatherDate = weatherDate;
    }

    public Date getWeatherDate() 
    {
        return weatherDate;
    }
    public void setLowT(Long lowT) 
    {
        this.lowT = lowT;
    }

    public Long getLowT() 
    {
        return lowT;
    }
    public void setHighT(Long highT) 
    {
        this.highT = highT;
    }

    public Long getHighT() 
    {
        return highT;
    }
    public void setDayType(String dayType) 
    {
        this.dayType = dayType;
    }

    public String getDayType() 
    {
        return dayType;
    }
    public void setNightType(String nightType) 
    {
        this.nightType = nightType;
    }

    public String getNightType() 
    {
        return nightType;
    }
    public void setWindDirection(String windDirection) 
    {
        this.windDirection = windDirection;
    }

    public String getWindDirection() 
    {
        return windDirection;
    }
    public void setWindSpeed(BigDecimal windSpeed) 
    {
        this.windSpeed = windSpeed;
    }

    public BigDecimal getWindSpeed() 
    {
        return windSpeed;
    }
    public void setWindScale(Long windScale) 
    {
        this.windScale = windScale;
    }

    public Long getWindScale() 
    {
        return windScale;
    }
    public void setHumidity(Long humidity) 
    {
        this.humidity = humidity;
    }

    public Long getHumidity() 
    {
        return humidity;
    }
    public void setCollectTime(Date collectTime) 
    {
        this.collectTime = collectTime;
    }

    public Date getCollectTime() 
    {
        return collectTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("city", getCity())
            .append("weatherDate", getWeatherDate())
            .append("lowT", getLowT())
            .append("highT", getHighT())
            .append("dayType", getDayType())
            .append("nightType", getNightType())
            .append("windDirection", getWindDirection())
            .append("windSpeed", getWindSpeed())
            .append("windScale", getWindScale())
            .append("humidity", getHumidity())
            .append("collectTime", getCollectTime())
            .toString();
    }
}
