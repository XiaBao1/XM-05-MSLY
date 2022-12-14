package com.ruoyi.web.system.controller;

import java.util.List;
import java.util.Date;

import com.ruoyi.framework.web.domain.server.Sys;
import com.ruoyi.web.system.domain.HouseRoom;
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
import com.ruoyi.web.system.domain.landlord;
import com.ruoyi.web.system.service.IlandlordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 民宿管理Controller
 *
 * @author pch
 * @date 2022-12-12
 */
@Controller
@RequestMapping("/system/landlord")
public class LandlordController extends BaseController
{
    private String prefix = "system/landlord";

    @Autowired
    private IlandlordService landlordService;

    @RequiresPermissions("system:landlord:view")
    @GetMapping()
    public String landlord()
    {
        return prefix + "/landlord";
    }

    /**
     * 查询民宿管理列表
     */
    @RequiresPermissions("system:landlord:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(landlord landlord)
    {
        startPage();
        List<landlord> list = landlordService.selectlandlordList(landlord);
        for(landlord landlord1:list){
            landlord1.imageUrl=landlordService.getImageUrlById(landlord1.getId());
        }
        return getDataTable(list);
    }

    /**
     * 导出民宿管理列表
     */
    @RequiresPermissions("system:landlord:export")
    @Log(title = "民宿管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(landlord landlord)
    {
        List<landlord> list = landlordService.selectlandlordList(landlord);
        ExcelUtil<landlord> util = new ExcelUtil<landlord>(landlord.class);
        return util.exportExcel(list, "民宿管理数据");
    }

    /**
     * 新增民宿管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存民宿管理
     */
    @RequiresPermissions("system:landlord:add")
    @Log(title = "民宿管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(landlord landlord)
    {
        System.out.println("运行到controller的addsave了");
        landlord.setHostNumber(landlord.userId);
        Date date=new Date();
        landlord.setRegisterTime(date);
        return toAjax(landlordService.insertlandlord(landlord));
    }

    /**
     * 修改民宿管理
     */
    @RequiresPermissions("system:landlord:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        landlord landlord = landlordService.selectlandlordById(id);
        mmap.put("landlord", landlord);
        return prefix + "/edit";
    }

    /**
     * 修改保存民宿管理
     */
    @RequiresPermissions("system:landlord:edit")
    @Log(title = "民宿管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(landlord landlord)
    {
        System.out.println(landlord.getHouseName());
        System.out.println(landlord.getAddress());
        System.out.println(landlord.getImageUrl());
        return toAjax(landlordService.updatelandlord(landlord));
    }

    /**
     * 删除民宿管理
     */
    @RequiresPermissions("system:landlord:remove")
    @Log(title = "民宿管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(landlordService.deletelandlordByIds(ids));
    }

    @RequiresPermissions("system:landlord:statistics")
    @GetMapping("/statistics")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/statistics";
    }

    @RequiresPermissions("system:landlord:statistics")
    @Log(title = "民宿统计", businessType = BusinessType.INSERT)
    @PostMapping("/statistics")
    @ResponseBody
    public List<Integer> statisticsData()
    {
        System.out.println("6999996");
        landlord ll=new landlord();
        List<Integer> list=landlordService.getAppointmentData(ll);
//        HouseRoom houseRoom=new HouseRoom();
//        List<Integer> list = houseRoomService.getAppointmentData(houseRoom);
        return list;
    }
}
