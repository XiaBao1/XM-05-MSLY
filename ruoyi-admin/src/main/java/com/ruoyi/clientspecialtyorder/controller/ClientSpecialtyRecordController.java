package com.ruoyi.clientspecialtyorder.controller;

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
import com.ruoyi.clientspecialtyorder.domain.ClientSpecialtyRecord;
import com.ruoyi.clientspecialtyorder.service.IClientSpecialtyRecordService;
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
@RequestMapping("/clientspecialtyorder/clientorder")
public class ClientSpecialtyRecordController extends BaseController
{
    private String prefix = "clientspecialtyorder/clientorder";

    @Autowired
    private IClientSpecialtyRecordService clientSpecialtyRecordService;

    @RequiresPermissions("clientspecialtyorder:clientorder:view")
    @GetMapping()
    public String clientorder()
    {
        return prefix + "/clientorder";
    }

    /**
     * 查询订单列表
     */
    @RequiresPermissions("clientspecialtyorder:clientorder:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ClientSpecialtyRecord clientSpecialtyRecord)
    {
        startPage();
        List<ClientSpecialtyRecord> list = clientSpecialtyRecordService.selectClientSpecialtyRecordList(clientSpecialtyRecord);
        return getDataTable(list);
    }

    /**
     * 导出订单列表
     */
    @RequiresPermissions("clientspecialtyorder:clientorder:export")
    @Log(title = "订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ClientSpecialtyRecord clientSpecialtyRecord)
    {
        List<ClientSpecialtyRecord> list = clientSpecialtyRecordService.selectClientSpecialtyRecordList(clientSpecialtyRecord);
        ExcelUtil<ClientSpecialtyRecord> util = new ExcelUtil<ClientSpecialtyRecord>(ClientSpecialtyRecord.class);
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
    @RequiresPermissions("clientspecialtyorder:clientorder:add")
    @Log(title = "订单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ClientSpecialtyRecord clientSpecialtyRecord)
    {
        return toAjax(clientSpecialtyRecordService.insertClientSpecialtyRecord(clientSpecialtyRecord));
    }

    /**
     * 修改订单
     */
    @RequiresPermissions("clientspecialtyorder:clientorder:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        ClientSpecialtyRecord clientSpecialtyRecord = clientSpecialtyRecordService.selectClientSpecialtyRecordById(id);
        mmap.put("clientSpecialtyRecord", clientSpecialtyRecord);
        return prefix + "/edit";
    }

    /**
     * 修改保存订单
     */
    @RequiresPermissions("clientspecialtyorder:clientorder:edit")
    @Log(title = "订单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ClientSpecialtyRecord clientSpecialtyRecord)
    {
        return toAjax(clientSpecialtyRecordService.updateClientSpecialtyRecord(clientSpecialtyRecord));
    }

    /**
     * 删除订单
     */
    @RequiresPermissions("clientspecialtyorder:clientorder:remove")
    @Log(title = "订单", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(clientSpecialtyRecordService.deleteClientSpecialtyRecordByIds(ids));
    }

    @RequiresPermissions("clientspecialtyorder:clientorder:eCharts")
    @GetMapping("/eCharts")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/eCharts";
    }

    @RequiresPermissions("clientspecialtyorder:clientorder:eCharts")
    @Log(title = "历史订单统计", businessType = BusinessType.INSERT)
    @PostMapping("/eCharts")
    @ResponseBody
    public List<Integer> statisticsData()
    {
        List<Integer> list = clientSpecialtyRecordService.getMonthlyClientSpecialtyRecordIncrement();
        return list;
    }
}
