package com.ruoyi.landlordspecialtyorder.controller;

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
import com.ruoyi.landlordspecialtyorder.domain.LandlordSpecialtyRecord;
import com.ruoyi.landlordspecialtyorder.service.ILandlordSpecialtyRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单Controller
 * 
 * @author ruoyi
 * @date 2022-12-08
 */
@Controller
@RequestMapping("/landlordspecialtyorder/specialtyorder")
public class LandlordSpecialtyRecordController extends BaseController
{
    private String prefix = "landlordspecialtyorder/specialtyorder";

    @Autowired
    private ILandlordSpecialtyRecordService landlordSpecialtyRecordService;

    @RequiresPermissions("landlordspecialtyorder:specialtyorder:view")
    @GetMapping()
    public String specialtyorder()
    {
        return prefix + "/specialtyorder";
    }

    /**
     * 查询订单列表
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(LandlordSpecialtyRecord landlordSpecialtyRecord)
    {
        startPage();
        List<LandlordSpecialtyRecord> list = landlordSpecialtyRecordService.selectLandlordSpecialtyRecordList(landlordSpecialtyRecord);
        return getDataTable(list);
    }

    /**
     * 导出订单列表
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:export")
    @Log(title = "订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(LandlordSpecialtyRecord landlordSpecialtyRecord)
    {
        List<LandlordSpecialtyRecord> list = landlordSpecialtyRecordService.selectLandlordSpecialtyRecordList(landlordSpecialtyRecord);
        ExcelUtil<LandlordSpecialtyRecord> util = new ExcelUtil<LandlordSpecialtyRecord>(LandlordSpecialtyRecord.class);
        return util.exportExcel(list, "订单数据");
    }

    /**
     * 新增订单
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存订单
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:add")
    @Log(title = "订单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(LandlordSpecialtyRecord landlordSpecialtyRecord)
    {
        return toAjax(landlordSpecialtyRecordService.insertLandlordSpecialtyRecord(landlordSpecialtyRecord));
    }

    /**
     * 修改订单
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        LandlordSpecialtyRecord landlordSpecialtyRecord = landlordSpecialtyRecordService.selectLandlordSpecialtyRecordById(id);
        mmap.put("landlordSpecialtyRecord", landlordSpecialtyRecord);
        return prefix + "/edit";
    }

    /**
     * 修改保存订单
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:edit")
    @Log(title = "订单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(LandlordSpecialtyRecord landlordSpecialtyRecord)
    {
        return toAjax(landlordSpecialtyRecordService.updateLandlordSpecialtyRecord(landlordSpecialtyRecord));
    }

    /**
     * 删除订单
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:remove")
    @Log(title = "订单", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(landlordSpecialtyRecordService.deleteLandlordSpecialtyRecordByIds(ids));
    }

    /**
     * 统计特产订单
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:eCharts")
    @GetMapping("/eCharts")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/eCharts";
    }

    @RequiresPermissions("landlordspecialtyorder:specialtyorder:eCharts")
    @Log(title = "特产订单统计", businessType = BusinessType.INSERT)
    @PostMapping("/eCharts")
    @ResponseBody
    public List<Integer> statisticsData()
    {
        List<Integer> list = landlordSpecialtyRecordService.getMonthlyLandlordSpecialtyRecordIncrement();
        return list;
    }
}
