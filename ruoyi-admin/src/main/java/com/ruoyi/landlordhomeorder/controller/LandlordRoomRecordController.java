package com.ruoyi.landlordhomeorder.controller;

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
import com.ruoyi.landlordhomeorder.domain.LandlordRoomRecord;
import com.ruoyi.landlordhomeorder.service.ILandlordRoomRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 民宿订单Controller
 * 
 * @author ruoyi
 * @date 2022-12-07
 */
@Controller
@RequestMapping("/landlordhomeorder/landlordorder")
public class LandlordRoomRecordController extends BaseController
{
    private String prefix = "landlordhomeorder/landlordorder";

    @Autowired
    private ILandlordRoomRecordService landlordRoomRecordService;

    @RequiresPermissions("landlordhomeorder:landlordorder:view")
    @GetMapping()
    public String landlordorder()
    {
        return prefix + "/landlordorder";
    }

    /**
     * 查询民宿订单列表
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(LandlordRoomRecord landlordRoomRecord)
    {
        startPage();
        List<LandlordRoomRecord> list = landlordRoomRecordService.selectLandlordRoomRecordList(landlordRoomRecord);
        return getDataTable(list);
    }

    /**
     * 导出民宿订单列表
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:export")
    @Log(title = "民宿订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(LandlordRoomRecord landlordRoomRecord)
    {
        List<LandlordRoomRecord> list = landlordRoomRecordService.selectLandlordRoomRecordList(landlordRoomRecord);
        ExcelUtil<LandlordRoomRecord> util = new ExcelUtil<LandlordRoomRecord>(LandlordRoomRecord.class);
        return util.exportExcel(list, "民宿订单数据");
    }

    /**
     * 新增民宿订单
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存民宿订单
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:add")
    @Log(title = "民宿订单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(LandlordRoomRecord landlordRoomRecord)
    {
        LandlordRoomRecord a = landlordRoomRecordService.selectRoomID(landlordRoomRecord);
        Long value = a.roomId;
        System.out.println(value);
        landlordRoomRecord.roomId =value;;
        return toAjax(landlordRoomRecordService.insertLandlordRoomRecord(landlordRoomRecord));
    }

    /**
     * 修改民宿订单
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        LandlordRoomRecord landlordRoomRecord = landlordRoomRecordService.selectLandlordRoomRecordById(id);
        mmap.put("landlordRoomRecord", landlordRoomRecord);
        //System.out.println(landlordRoomRecord);
        return prefix + "/edit";
    }

    /**
     * 修改保存民宿订单
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:edit")
    @Log(title = "民宿订单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(LandlordRoomRecord landlordRoomRecord)
    {

        return toAjax(landlordRoomRecordService.updateLandlordRoomRecord(landlordRoomRecord));
    }

    /**
     * 删除民宿订单
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:remove")
    @Log(title = "民宿订单", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(landlordRoomRecordService.deleteLandlordRoomRecordByIds(ids));
    }
    /**
     * 统计民宿订单
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:eCharts")
    @GetMapping("/eCharts")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/eCharts";
    }

    @RequiresPermissions("landlordhomeorder:landlordorder:eCharts")
    @Log(title = "历史订单统计", businessType = BusinessType.INSERT)
    @PostMapping("/eCharts")
    @ResponseBody
    public List<Integer> statisticsData()
    {
        List<Integer> list = landlordRoomRecordService.getMonthlyClientRoomRecordIncrement();
        return list;
    }

    /**
     * 修改民宿订单
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:querycomment")
    @GetMapping("/querycomment/{id}")
    public String querycomment(@PathVariable("id") Long id, ModelMap mmap)
    {
        LandlordRoomRecord landlordRoomRecord = landlordRoomRecordService.selectLandlordRoomCommentRecordById(id);
        mmap.put("landlordRoomRecord", landlordRoomRecord);
        return prefix + "/querycomment";
    }

    /**
     * 修改保存民宿订单
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:querycomment")
    @Log(title = "查看评论", businessType = BusinessType.UPDATE)
    @PostMapping("/querycomment")
    @ResponseBody
    public AjaxResult querycommentSave(LandlordRoomRecord landlordRoomRecord)
    {
        return toAjax(landlordRoomRecordService.updateLandlordRoomCommentRecord(landlordRoomRecord));
    }
}
