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
import com.ruoyi.yk.domain.ElseUsers;
import com.ruoyi.yk.service.IElseUsersService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户管理Controller
 * 
 * @author ruoyi
 * @date 2022-11-30
 */
@Controller
@RequestMapping("/yk/users")
public class ElseUsersController extends BaseController
{
    private String prefix = "yk/users";

    @Autowired
    private IElseUsersService elseUsersService;

    @RequiresPermissions("yk:users:view")
    @GetMapping()
    public String users()
    {
        return prefix + "/users";
    }

    /**
     * 查询用户管理列表
     */
    @RequiresPermissions("yk:users:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ElseUsers elseUsers)
    {
        startPage();
        List<ElseUsers> list = elseUsersService.selectElseUsersList(elseUsers);
        return getDataTable(list);
    }

    /**
     * 导出用户管理列表
     */
    @RequiresPermissions("yk:users:export")
    @Log(title = "用户管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ElseUsers elseUsers)
    {
        List<ElseUsers> list = elseUsersService.selectElseUsersList(elseUsers);
        ExcelUtil<ElseUsers> util = new ExcelUtil<ElseUsers>(ElseUsers.class);
        return util.exportExcel(list, "用户管理数据");
    }

    /**
     * 新增用户管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存用户管理
     */
    @RequiresPermissions("yk:users:add")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ElseUsers elseUsers)
    {
        return toAjax(elseUsersService.insertElseUsers(elseUsers));
    }

    /**
     * 修改用户管理
     */
    @RequiresPermissions("yk:users:edit")
    @GetMapping("/edit/{userNumber}")
    public String edit(@PathVariable("userNumber") String userNumber, ModelMap mmap)
    {
        ElseUsers elseUsers = elseUsersService.selectElseUsersByUserNumber(userNumber);
        mmap.put("elseUsers", elseUsers);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户管理
     */
    @RequiresPermissions("yk:users:edit")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ElseUsers elseUsers)
    {
        return toAjax(elseUsersService.updateElseUsers(elseUsers));
    }

    /**
     * 删除用户管理
     */
    @RequiresPermissions("yk:users:remove")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(elseUsersService.deleteElseUsersByUserNumbers(ids));
    }
}
