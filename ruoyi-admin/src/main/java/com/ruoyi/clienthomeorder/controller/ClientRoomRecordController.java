package com.ruoyi.clienthomeorder.controller;

import java.util.List;

import com.ruoyi.clientspecialtyorder.domain.ClientSpecialtyRecord;
import com.ruoyi.common.json.JSONObject;
import com.ruoyi.system.service.ISysUserService;
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
import com.ruoyi.clienthomeorder.domain.ClientRoomRecord;
import com.ruoyi.clienthomeorder.service.IClientRoomRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import javax.servlet.http.HttpServletRequest;


/**
 * 民宿订单Controller
 * 
 * @author ruoyi
 * @date 2022-12-06
 */
@Controller
@RequestMapping("/clienthomeorder/homeorder")
public class ClientRoomRecordController extends BaseController
{
    private String prefix = "clienthomeorder/homeorder";

    @Autowired
    private IClientRoomRecordService clientRoomRecordService;
    private Object AxisType;

    @RequiresPermissions("clienthomeorder:homeorder:view")
    @GetMapping()
    public String homeorder()
    {
        return prefix + "/homeorder";
    }

    /**
     * 查询民宿订单列表
     */
    @RequiresPermissions("clienthomeorder:homeorder:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ClientRoomRecord clientRoomRecord)
    {
        startPage();
        List<ClientRoomRecord> list = clientRoomRecordService.selectClientRoomRecordList(clientRoomRecord);
        return getDataTable(list);
    }



    /**
     * 导出民宿订单列表
     */
    @RequiresPermissions("clienthomeorder:homeorder:export")
    @Log(title = "民宿订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ClientRoomRecord clientRoomRecord)
    {
        List<ClientRoomRecord> list = clientRoomRecordService.selectClientRoomRecordList(clientRoomRecord);
        ExcelUtil<ClientRoomRecord> util = new ExcelUtil<ClientRoomRecord>(ClientRoomRecord.class);
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
    @RequiresPermissions("clienthomeorder:homeorder:add")
    @Log(title = "民宿订单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ClientRoomRecord clientRoomRecord)
    {
        return toAjax(clientRoomRecordService.insertClientRoomRecord(clientRoomRecord));
    }

    /**
     * 修改民宿订单
     */
    @RequiresPermissions("clienthomeorder:homeorder:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        ClientRoomRecord clientRoomRecord = clientRoomRecordService.selectClientRoomRecordById(id);
        mmap.put("clientRoomRecord", clientRoomRecord);
        return prefix + "/edit";
    }

    /**
     * 修改保存民宿订单
     */
    @RequiresPermissions("clienthomeorder:homeorder:edit")
    @Log(title = "民宿订单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ClientRoomRecord clientRoomRecord)
    {
        return toAjax(clientRoomRecordService.updateClientRoomRecord(clientRoomRecord));
    }

    /**
     * 删除民宿订单
     */
    @RequiresPermissions("clienthomeorder:homeorder:remove")
    @Log(title = "民宿订单", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(clientRoomRecordService.deleteClientRoomRecordByIds(ids));
    }

    /**
     * 统计民宿订单
     */

    @RequiresPermissions("clienthomeorder:homeorder:eCharts")
    @GetMapping("/eCharts")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/eCharts";
    }

    @RequiresPermissions("clienthomeorder:homeorder:eCharts")
    @Log(title = "历史订单统计", businessType = BusinessType.INSERT)
    @PostMapping("/eCharts")
    @ResponseBody
    public List<Integer> statisticsData()
    {
        List<Integer> list = clientRoomRecordService.getMonthlyClientRoomRecordIncrement();
        return list;
    }

//    @RequiresPermissions("clienthomeorder:homeorder:comment")
//    @GetMapping("/comment/{id}")
//    public String comment(@PathVariable("id") Long id, ModelMap mmap)
//    {
//        ClientRoomRecord clientRoomCommentRecord = clientRoomRecordService.selectClientRoomCommentRecordById(id);
//        mmap.put("clientRoomCommentRecord", clientRoomCommentRecord);
//        System.out.println("hellocomment------------------------------------");
//
//        System.out.println(clientRoomCommentRecord.getId());
//        System.out.println(clientRoomCommentRecord);
//        System.out.println(clientRoomCommentRecord.getScore());
//        return prefix + "/comment";
//    }
//
//    /**
//     * 修改保存评论民宿订单
//     */
//    @RequiresPermissions("clienthomeorder:homeorder:comment")
//    @Log(title = "评论", businessType = BusinessType.UPDATE)
//    @PostMapping("/comment")
//    @ResponseBody
//    public AjaxResult commentSave(ClientRoomRecord clientRoomRecord)
//    {
//        System.out.println("hellonewcomment------------------------------------");
//        return toAjax(clientRoomRecordService.insertClientRoomCommentRecord(clientRoomRecord));
//    }
    /**
     * 新增民宿订单评论
     */
    @GetMapping("/comment")
    public String comment()
    {
        return prefix + "/comment";
    }

    /**
     * 新增保存民宿订单评论
     */
    @RequiresPermissions("clienthomeorder:homeorder:comment")
    @Log(title = "评论", businessType = BusinessType.INSERT)
    @PostMapping("/comment")
    @ResponseBody
    public AjaxResult commentSave(ClientRoomRecord clientRoomRecord)
    {
        return toAjax(clientRoomRecordService.insertClientRoomCommentRecord(clientRoomRecord));
    }

}
