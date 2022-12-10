package com.ruoyi.admin_feedback.controller;

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
import com.ruoyi.admin_feedback.domain.AdminFeedback;
import com.ruoyi.admin_feedback.service.IAdminFeedbackService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 反馈处理Controller
 * 
 * @author yyt
 * @date 2022-12-10
 */
@Controller
@RequestMapping("/admin_feedback/admin_feedback")
public class AdminFeedbackController extends BaseController
{
    private String prefix = "admin_feedback/admin_feedback";

    @Autowired
    private IAdminFeedbackService adminFeedbackService;

    @RequiresPermissions("admin_feedback:admin_feedback:view")
    @GetMapping()
    public String admin_feedback()
    {
        return prefix + "/admin_feedback";
    }

    /**
     * 查询反馈处理列表
     */
    @RequiresPermissions("admin_feedback:admin_feedback:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(AdminFeedback adminFeedback)
    {
        startPage();
        List<AdminFeedback> list = adminFeedbackService.selectAdminFeedbackList(adminFeedback);
        return getDataTable(list);
    }

    /**
     * 导出反馈处理列表
     */
    @RequiresPermissions("admin_feedback:admin_feedback:export")
    @Log(title = "反馈处理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(AdminFeedback adminFeedback)
    {
        List<AdminFeedback> list = adminFeedbackService.selectAdminFeedbackList(adminFeedback);
        ExcelUtil<AdminFeedback> util = new ExcelUtil<AdminFeedback>(AdminFeedback.class);
        return util.exportExcel(list, "反馈处理数据");
    }

    /**
     * 新增反馈处理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存反馈处理
     */
    @RequiresPermissions("admin_feedback:admin_feedback:add")
    @Log(title = "反馈处理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(AdminFeedback adminFeedback)
    {
        return toAjax(adminFeedbackService.insertAdminFeedback(adminFeedback));
    }

    /**
     * 修改反馈处理
     */
    @RequiresPermissions("admin_feedback:admin_feedback:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        AdminFeedback adminFeedback = adminFeedbackService.selectAdminFeedbackById(id);
        mmap.put("adminFeedback", adminFeedback);
        return prefix + "/edit";
    }

    /**
     * 修改保存反馈处理
     */
    @RequiresPermissions("admin_feedback:admin_feedback:edit")
    @Log(title = "反馈处理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(AdminFeedback adminFeedback)
    {
        return toAjax(adminFeedbackService.updateAdminFeedback(adminFeedback));
    }

    /**
     * 删除反馈处理
     */
    @RequiresPermissions("admin_feedback:admin_feedback:remove")
    @Log(title = "反馈处理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(adminFeedbackService.deleteAdminFeedbackByIds(ids));
    }
}
