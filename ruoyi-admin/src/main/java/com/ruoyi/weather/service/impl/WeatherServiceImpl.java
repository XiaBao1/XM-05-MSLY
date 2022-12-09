package com.ruoyi.weather.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.weather.mapper.WeatherMapper;
import com.ruoyi.weather.domain.Weather;
import com.ruoyi.weather.service.IWeatherService;
import com.ruoyi.common.core.text.Convert;

/**
 * 天气信息Service业务层处理
 * 
 * @author lrc
 * @date 2022-12-09
 */
@Service
public class WeatherServiceImpl implements IWeatherService 
{
    @Autowired
    private WeatherMapper weatherMapper;

    /**
     * 查询天气信息
     * 
     * @param id 天气信息主键
     * @return 天气信息
     */
    @Override
    public Weather selectWeatherById(Long id)
    {
        return weatherMapper.selectWeatherById(id);
    }

    /**
     * 查询天气信息列表
     * 
     * @param weather 天气信息
     * @return 天气信息
     */
    @Override
    public List<Weather> selectWeatherList(Weather weather)
    {
        return weatherMapper.selectWeatherList(weather);
    }

    /**
     * 新增天气信息
     * 
     * @param weather 天气信息
     * @return 结果
     */
    @Override
    public int insertWeather(Weather weather)
    {
        return weatherMapper.insertWeather(weather);
    }

    /**
     * 修改天气信息
     * 
     * @param weather 天气信息
     * @return 结果
     */
    @Override
    public int updateWeather(Weather weather)
    {
        return weatherMapper.updateWeather(weather);
    }

    /**
     * 批量删除天气信息
     * 
     * @param ids 需要删除的天气信息主键
     * @return 结果
     */
    @Override
    public int deleteWeatherByIds(String ids)
    {
        return weatherMapper.deleteWeatherByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除天气信息信息
     * 
     * @param id 天气信息主键
     * @return 结果
     */
    @Override
    public int deleteWeatherById(Long id)
    {
        return weatherMapper.deleteWeatherById(id);
    }
}
