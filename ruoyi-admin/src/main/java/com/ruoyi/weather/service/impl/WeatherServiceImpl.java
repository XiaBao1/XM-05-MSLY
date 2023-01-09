package com.ruoyi.weather.service.impl;

import java.text.SimpleDateFormat;
import java.util.*;

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
 * @date 2022-12-11
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

    /**
     * 统计本月天气信息
     *
     * @return 结果
     */
    @Override
    public List<Long> getMonthTemperature() {
        Calendar monthStart = Calendar.getInstance();
        int len=monthStart.getActualMaximum(Calendar.DAY_OF_MONTH); // 本月len天
        List<Long> ans = new ArrayList<Long>(62);
        for(int i=0;i<62;i++)
        {
            ans.add(null);
        }
        monthStart.set(Calendar.DAY_OF_MONTH,0); // 设成上月最后一天
        Calendar monthEnd = Calendar.getInstance();
        monthEnd.set(Calendar.DAY_OF_MONTH, monthEnd.getActualMaximum(Calendar.DAY_OF_MONTH)); //获取当前月最后一天
        //System.out.println(monthStart.getTime());
        //System.out.println(monthEnd.getTime());
        List<Weather> allWeather=weatherMapper.selectWeatherList(new Weather());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for(Weather cur:allWeather)
        {
            Calendar tmp=Calendar.getInstance();
            tmp.setTime(cur.getWeatherDate());
            if(cur.getCity().equals("成都") && monthStart.before(tmp) && tmp.before(monthEnd))
            {
                //System.out.println(cur.getCity());
                //System.out.println(cur.getWeatherDate().toString());
                tmp.setTime(cur.getWeatherDate());
                int id=tmp.get(Calendar.DAY_OF_MONTH);
                ans.set(id-1,cur.getHighT());
                ans.set(id+30,cur.getLowT());
            }
        }

        return ans;
    }

    /**
     * 统计本月风向信息
     *
     * @return 结果
     */
    @Override
    public List<Long> getMonthDirection(){
        List<Long> thisMonth=new ArrayList<Long>(31);
        for(int i=0;i<31;i++){
            thisMonth.add(null);
        }
        Calendar monthStart = Calendar.getInstance();
        List<Long> ans=new ArrayList<Long>(3);
        for(int i=0;i<3;i++) {
            ans.add(0L);
        }
        monthStart.set(Calendar.DAY_OF_MONTH,0); // 设成上月最后一天
        Calendar monthEnd = Calendar.getInstance();
        monthEnd.set(Calendar.DAY_OF_MONTH, monthEnd.getActualMaximum(Calendar.DAY_OF_MONTH)); //获取当前月最后一天
        List<Weather> allWeather=weatherMapper.selectWeatherList(new Weather());
        for(Weather cur:allWeather) {
            Calendar tmp=Calendar.getInstance();
            tmp.setTime(cur.getWeatherDate());
            if(cur.getCity().equals("成都") && monthStart.before(tmp) && tmp.before(monthEnd))
            {
                tmp.setTime(cur.getWeatherDate());
                int id=tmp.get(Calendar.DAY_OF_MONTH);
                thisMonth.set(id-1,cur.getWindScale());
            }
        }
        for(Long cur:thisMonth) {
            if(cur==null)
                continue;
            if(cur<=2){
                Long c=ans.get(0);
                ans.set(0,c+1);
            }
            else if(cur<=5){
                Long c=ans.get(1);
                ans.set(1,c+1);
            }
            else if(cur>5){
                Long c=ans.get(2);
                ans.set(2,c+1);
            }
        }
        return ans;
    }
}
