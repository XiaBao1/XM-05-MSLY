package com.ruoyi.weather.mapper;

import java.util.List;
import com.ruoyi.weather.domain.Weather;

/**
 * 天气信息Mapper接口
 * 
 * @author lrc
 * @date 2022-12-11
 */
public interface WeatherMapper 
{
    /**
     * 查询天气信息
     * 
     * @param id 天气信息主键
     * @return 天气信息
     */
    public Weather selectWeatherById(Long id);

    /**
     * 查询天气信息列表
     * 
     * @param weather 天气信息
     * @return 天气信息集合
     */
    public List<Weather> selectWeatherList(Weather weather);

    /**
     * 新增天气信息
     * 
     * @param weather 天气信息
     * @return 结果
     */
    public int insertWeather(Weather weather);

    /**
     * 修改天气信息
     * 
     * @param weather 天气信息
     * @return 结果
     */
    public int updateWeather(Weather weather);

    /**
     * 删除天气信息
     * 
     * @param id 天气信息主键
     * @return 结果
     */
    public int deleteWeatherById(Long id);

    /**
     * 批量删除天气信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWeatherByIds(String[] ids);
}
