package com.ruoyi.weather.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.weather.domain.Weather;
import com.ruoyi.weather.service.IWeatherService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 天气信息Controller
 * 
 * @author lrc
 * @date 2022-12-11
 */
@Controller
@RequestMapping("/weather/weather")
public class WeatherController extends BaseController
{
    private String prefix = "weather/weather";

    @Autowired
    private IWeatherService weatherService;

    @RequiresPermissions("weather:weather:view")
    @GetMapping()
    public String weather()
    {
        return prefix + "/weather";
    }

    /**
     * 查询天气信息列表
     */
    @RequiresPermissions("weather:weather:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Weather weather)
    {
        startPage();
        List<Weather> list = weatherService.selectWeatherList(weather);
        return getDataTable(list);
    }

    /**
     * 导出天气信息列表
     */
    @RequiresPermissions("weather:weather:export")
    @Log(title = "天气信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Weather weather)
    {
        List<Weather> list = weatherService.selectWeatherList(weather);
        ExcelUtil<Weather> util = new ExcelUtil<Weather>(Weather.class);
        return util.exportExcel(list, "天气信息数据");
    }

    /**
     * 新增天气信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存天气信息
     */
    @RequiresPermissions("weather:weather:add")
    @Log(title = "天气信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Weather weather)
    {
        weather.setCollectTime(new Date());
        return toAjax(weatherService.insertWeather(weather));
    }

    /**
     * 修改天气信息
     */
    @RequiresPermissions("weather:weather:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Weather weather = weatherService.selectWeatherById(id);
        mmap.put("weather", weather);
        return prefix + "/edit";
    }

    /**
     * 修改保存天气信息
     */
    @RequiresPermissions("weather:weather:edit")
    @Log(title = "天气信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Weather weather)
    {
        return toAjax(weatherService.updateWeather(weather));
    }

    /**
     * 删除天气信息
     */
    @RequiresPermissions("weather:weather:remove")
    @Log(title = "天气信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(weatherService.deleteWeatherByIds(ids));
    }

    @RequiresPermissions("weather:weather:statistics")
    @GetMapping("/statistics")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/statistics";
    }

    @RequiresPermissions("weather:weather:statistics")
    @Log(title = "天气信息统计", businessType = BusinessType.INSERT)
    @PostMapping("/statistics")
    @ResponseBody
    public List<Long> statisticsData()
    {
        List<Long> list = weatherService.getMonthTemperature();
        return list;
    }

    @RequiresPermissions("system:user:print")
    @GetMapping("/print")
    public String print(ModelMap mmap)
    {
        return prefix + "/print";
    }
}
