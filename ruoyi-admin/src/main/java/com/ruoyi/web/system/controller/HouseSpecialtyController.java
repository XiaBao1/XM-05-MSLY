package com.ruoyi.web.system.controller;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.ruoyi.common.json.JSONObject;
import com.ruoyi.web.system.domain.landlord;
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
import com.ruoyi.web.system.domain.HouseSpecialty;
import com.ruoyi.web.system.service.IHouseSpecialtyService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 我的特产Controller
 *
 * @author pch
 * @date 2022-12-13
 */
@Controller
@RequestMapping("/system/specialty")
public class HouseSpecialtyController extends BaseController
{
    private String prefix = "system/specialty";

    @Autowired
    private IHouseSpecialtyService houseSpecialtyService;

    @RequiresPermissions("system:specialty:view")
    @GetMapping()
    public String specialty()
    {
        return prefix + "/specialty";
    }

    /**
     * 查询我的特产列表
     */
    @RequiresPermissions("system:specialty:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(HouseSpecialty houseSpecialty)
    {
        startPage();
        List<HouseSpecialty> list = houseSpecialtyService.selectHouseSpecialtyList(houseSpecialty);
        for(HouseSpecialty h:list){
            h.setHouseName(houseSpecialtyService.getHouseNameById(h.getHouseId()));
        }
        return getDataTable(list);
    }

    /**
     * 导出我的特产列表
     */
    @RequiresPermissions("system:specialty:export")
    @Log(title = "我的特产", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(HouseSpecialty houseSpecialty)
    {
        List<HouseSpecialty> list = houseSpecialtyService.selectHouseSpecialtyList(houseSpecialty);
        ExcelUtil<HouseSpecialty> util = new ExcelUtil<HouseSpecialty>(HouseSpecialty.class);
        return util.exportExcel(list, "我的特产数据");
    }

    /**
     * 新增我的特产
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存我的特产
     */
    @RequiresPermissions("system:specialty:add")
    @Log(title = "我的特产", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(HouseSpecialty houseSpecialty)
    {
        //判断houseId

        return toAjax(houseSpecialtyService.insertHouseSpecialty(houseSpecialty));
    }

    /**
     * 修改我的特产
     */
    @RequiresPermissions("system:specialty:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        HouseSpecialty houseSpecialty = houseSpecialtyService.selectHouseSpecialtyById(id);
        mmap.put("houseSpecialty", houseSpecialty);
        return prefix + "/edit";
    }

    /**
     * 修改保存我的特产
     */
    @RequiresPermissions("system:specialty:edit")
    @Log(title = "我的特产", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(HouseSpecialty houseSpecialty)
    {
        //判断houseId
        return toAjax(houseSpecialtyService.updateHouseSpecialty(houseSpecialty));
    }

    /**
     * 删除我的特产
     */
    @RequiresPermissions("system:specialty:remove")
    @Log(title = "我的特产", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(houseSpecialtyService.deleteHouseSpecialtyByIds(ids));
    }

    @RequiresPermissions("system:specialty:statistics")
    @GetMapping("/statistics")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/statistics";
    }

    @RequiresPermissions("system:specialty:statistics")
    @Log(title = "特产统计", businessType = BusinessType.INSERT)
    @PostMapping("/statistics")
    @ResponseBody
    public String statisticsData()
    {
        System.out.println("6999996");
        JSONObject res=new JSONObject();
        JSONArray s=new JSONArray();
        List<String> nameList=houseSpecialtyService.getName();
        for(String name : nameList){
            JSONObject tmp=new JSONObject();
            tmp.put("name",name);
            tmp.put("sell",houseSpecialtyService.getSellNumber(name));
            tmp.put("sold",houseSpecialtyService.getSoldNumber(name));
            s.add(tmp);
        }
        res.put("specialty",s);
        return res.toString();
    }
}
