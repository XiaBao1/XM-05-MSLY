package com.ruoyi.yk.controller;

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
import com.ruoyi.yk.domain.LandlordHouse;
import com.ruoyi.yk.service.ILandlordHouseService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 代码生成测试Controller
 * 
 * @author sja
 * @date 2022-11-30
 */
@Controller
@RequestMapping("/yk/test_code_gen")
public class LandlordHouseController extends BaseController
{
    private String prefix = "yk/test_code_gen";

    @Autowired
    private ILandlordHouseService landlordHouseService;

    @RequiresPermissions("yk:test_code_gen:view")
    @GetMapping()
    public String test_code_gen()
    {
        return prefix + "/test_code_gen";
    }

    /**
     * 查询代码生成测试列表
     */
    @RequiresPermissions("yk:test_code_gen:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(LandlordHouse landlordHouse)
    {
        startPage();
        List<LandlordHouse> list = landlordHouseService.selectLandlordHouseList(landlordHouse);
        return getDataTable(list);
    }

    /**
     * 导出代码生成测试列表
     */
    @RequiresPermissions("yk:test_code_gen:export")
    @Log(title = "代码生成测试", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(LandlordHouse landlordHouse)
    {
        List<LandlordHouse> list = landlordHouseService.selectLandlordHouseList(landlordHouse);
        ExcelUtil<LandlordHouse> util = new ExcelUtil<LandlordHouse>(LandlordHouse.class);
        return util.exportExcel(list, "代码生成测试数据");
    }

    /**
     * 新增代码生成测试
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存代码生成测试
     */
    @RequiresPermissions("yk:test_code_gen:add")
    @Log(title = "代码生成测试", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(LandlordHouse landlordHouse)
    {
        return toAjax(landlordHouseService.insertLandlordHouse(landlordHouse));
    }

    /**
     * 修改代码生成测试
     */
    @RequiresPermissions("yk:test_code_gen:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        LandlordHouse landlordHouse = landlordHouseService.selectLandlordHouseById(id);
        mmap.put("landlordHouse", landlordHouse);
        return prefix + "/edit";
    }

    /**
     * 修改保存代码生成测试
     */
    @RequiresPermissions("yk:test_code_gen:edit")
    @Log(title = "代码生成测试", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(LandlordHouse landlordHouse)
    {
        return toAjax(landlordHouseService.updateLandlordHouse(landlordHouse));
    }

    /**
     * 删除代码生成测试
     */
    @RequiresPermissions("yk:test_code_gen:remove")
    @Log(title = "代码生成测试", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(landlordHouseService.deleteLandlordHouseByIds(ids));
    }
}
