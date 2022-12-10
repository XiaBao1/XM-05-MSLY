package com.ruoyi.client_landlord_feedback.controller;

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
import com.ruoyi.client_landlord_feedback.domain.ClientLandlordFeedback;
import com.ruoyi.client_landlord_feedback.service.IClientLandlordFeedbackService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 我要反馈Controller
 * 
 * @author yyt
 * @date 2022-12-10
 */
@Controller
@RequestMapping("/client_landlord_feedback/client_landlord_feedback")
public class ClientLandlordFeedbackController extends BaseController
{
    private String prefix = "client_landlord_feedback/client_landlord_feedback";

    @Autowired
    private IClientLandlordFeedbackService clientLandlordFeedbackService;

    @RequiresPermissions("client_landlord_feedback:client_landlord_feedback:view")
    @GetMapping()
    public String client_landlord_feedback()
    {
        return prefix + "/client_landlord_feedback";
    }

    /**
     * 查询我要反馈列表
     */
    @RequiresPermissions("client_landlord_feedback:client_landlord_feedback:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ClientLandlordFeedback clientLandlordFeedback)
    {
        startPage();
        List<ClientLandlordFeedback> list = clientLandlordFeedbackService.selectClientLandlordFeedbackList(clientLandlordFeedback);
        return getDataTable(list);
    }

    /**
     * 导出我要反馈列表
     */
    @RequiresPermissions("client_landlord_feedback:client_landlord_feedback:export")
    @Log(title = "我要反馈", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ClientLandlordFeedback clientLandlordFeedback)
    {
        List<ClientLandlordFeedback> list = clientLandlordFeedbackService.selectClientLandlordFeedbackList(clientLandlordFeedback);
        ExcelUtil<ClientLandlordFeedback> util = new ExcelUtil<ClientLandlordFeedback>(ClientLandlordFeedback.class);
        return util.exportExcel(list, "我要反馈数据");
    }

    /**
     * 新增我要反馈
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存我要反馈
     */
    @RequiresPermissions("client_landlord_feedback:client_landlord_feedback:add")
    @Log(title = "我要反馈", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ClientLandlordFeedback clientLandlordFeedback)
    {
        return toAjax(clientLandlordFeedbackService.insertClientLandlordFeedback(clientLandlordFeedback));
    }

    /**
     * 修改我要反馈
     */
    @RequiresPermissions("client_landlord_feedback:client_landlord_feedback:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        ClientLandlordFeedback clientLandlordFeedback = clientLandlordFeedbackService.selectClientLandlordFeedbackById(id);
        mmap.put("clientLandlordFeedback", clientLandlordFeedback);
        return prefix + "/edit";
    }

    /**
     * 修改保存我要反馈
     */
    @RequiresPermissions("client_landlord_feedback:client_landlord_feedback:edit")
    @Log(title = "我要反馈", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ClientLandlordFeedback clientLandlordFeedback)
    {
        return toAjax(clientLandlordFeedbackService.updateClientLandlordFeedback(clientLandlordFeedback));
    }

    /**
     * 删除我要反馈
     */
    @RequiresPermissions("client_landlord_feedback:client_landlord_feedback:remove")
    @Log(title = "我要反馈", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(clientLandlordFeedbackService.deleteClientLandlordFeedbackByIds(ids));
    }
}
