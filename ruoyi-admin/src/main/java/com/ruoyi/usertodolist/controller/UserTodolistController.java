package com.ruoyi.usertodolist.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ruoyi.client_landlord_feedback.domain.ClientLandlordFeedback;
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
import com.ruoyi.usertodolist.domain.UserTodolist;
import com.ruoyi.usertodolist.service.IUserTodolistService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 我的待办Controller
 * 
 * @author yyt
 * @date 2022-12-08
 */
@Controller
@RequestMapping("/usertodolist/todolist")
public class UserTodolistController extends BaseController
{
    private String prefix = "usertodolist/todolist";

    @Autowired
    private IUserTodolistService userTodolistService;

    @RequiresPermissions("usertodolist:todolist:view")
    @GetMapping()
    public String todolist()
    {
        return prefix + "/todolist";
    }

    /**
     * 查询我的待办列表
     */
    @RequiresPermissions("usertodolist:todolist:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(UserTodolist userTodolist)
    {
        startPage();
        List<UserTodolist> list = userTodolistService.selectUserTodolistList(userTodolist);
        return getDataTable(list);
    }

    /**
     * 导出我的待办列表
     */
    @RequiresPermissions("usertodolist:todolist:export")
    @Log(title = "我的待办", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(UserTodolist userTodolist)
    {
        List<UserTodolist> list = userTodolistService.selectUserTodolistList(userTodolist);
        ExcelUtil<UserTodolist> util = new ExcelUtil<UserTodolist>(UserTodolist.class);
        return util.exportExcel(list, "我的待办数据");
    }

//    @RequiresPermissions("client_landlord_feedback:client_landlord_feedback:export")
//    @Log(title = "我要反馈", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    @ResponseBody
//    public AjaxResult export(ClientLandlordFeedback clientLandlordFeedback)
//    {
//        List<ClientLandlordFeedback> list = clientLandlordFeedbackService.selectClientLandlordFeedbackList(clientLandlordFeedback);
//        ExcelUtil<ClientLandlordFeedback> util = new ExcelUtil<ClientLandlordFeedback>(ClientLandlordFeedback.class);
//        return util.exportExcel(list, "我要反馈数据");
//    }
    /**
     * 新增我的待办
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存我的待办
     */
    @RequiresPermissions("usertodolist:todolist:add")
    @Log(title = "我的待办", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(UserTodolist userTodolist)
    {
        return toAjax(userTodolistService.insertUserTodolist(userTodolist));
    }

    /**
     * 修改我的待办
     */
    @RequiresPermissions("usertodolist:todolist:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        UserTodolist userTodolist = userTodolistService.selectUserTodolistById(id);
        mmap.put("userTodolist", userTodolist);
        System.out.println("==================================================================================="+userTodolist);
        return prefix + "/edit";
    }

    /**
     * 修改保存我的待办
     */
    @RequiresPermissions("usertodolist:todolist:edit")
    @Log(title = "我的待办", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(UserTodolist userTodolist)
    {
        return toAjax(userTodolistService.updateUserTodolist(userTodolist));
    }

    /**
     * 删除我的待办
     */
    @RequiresPermissions("usertodolist:todolist:remove")
    @Log(title = "我的待办", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(userTodolistService.deleteUserTodolistByIds(ids));
    }

    /**
     * 统计todolist
     */
    @RequiresPermissions("usertodolist:todolist:eCharts")
    @GetMapping("/eCharts")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/eCharts";
    }
//
    @RequiresPermissions("usertodolist:todolist:eCharts")
    @Log(title = "待办事项统计", businessType = BusinessType.INSERT)
    @PostMapping("/eCharts")
    @ResponseBody
    public ArrayList<Map<String, String>> statisticsData()
    {
        ArrayList<Map<String, String>> list = userTodolistService.getMonthlyToDoListRecordIncrement();
        return list;
    }
}
