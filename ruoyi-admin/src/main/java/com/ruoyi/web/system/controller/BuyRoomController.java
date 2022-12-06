package com.ruoyi.system.controller;

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
import com.ruoyi.system.domain.BuyRoom;
import com.ruoyi.system.service.IBuyRoomService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房间订购Controller
 * 
 * @author ruoyi
 * @date 2022-12-02
 */
@Controller
@RequestMapping("/system/buyroom")
public class BuyRoomController extends BaseController
{
    private String prefix = "system/buyroom";

    @Autowired
    private IBuyRoomService buyRoomService;

    @RequiresPermissions("system:buyroom:view")
    @GetMapping()
    public String buyroom()
    {
        return prefix + "/buyroom";
    }

    /**
     * 查询房间订购列表
     */
    @RequiresPermissions("system:buyroom:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BuyRoom buyRoom)
    {
        startPage();
        List<BuyRoom> list = buyRoomService.selectBuyRoomList(buyRoom);
        return getDataTable(list);
    }

    /**
     * 导出房间订购列表
     */
    @RequiresPermissions("system:buyroom:export")
    @Log(title = "房间订购", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BuyRoom buyRoom)
    {
        List<BuyRoom> list = buyRoomService.selectBuyRoomList(buyRoom);
        ExcelUtil<BuyRoom> util = new ExcelUtil<BuyRoom>(BuyRoom.class);
        return util.exportExcel(list, "房间订购数据");
    }

    /**
     * 新增房间订购
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存房间订购
     */
    @RequiresPermissions("system:buyroom:add")
    @Log(title = "房间订购", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BuyRoom buyRoom)
    {
        return toAjax(buyRoomService.insertBuyRoom(buyRoom));
    }

    /**
     * 修改房间订购
     */
    @RequiresPermissions("system:buyroom:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        BuyRoom buyRoom = buyRoomService.selectBuyRoomById(id);
        mmap.put("buyRoom", buyRoom);
        return prefix + "/edit";
    }

    /**
     * 修改保存房间订购
     */
    @RequiresPermissions("system:buyroom:edit")
    @Log(title = "房间订购", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BuyRoom buyRoom)
    {
        return toAjax(buyRoomService.updateBuyRoom(buyRoom));
    }

    /**
     * 删除房间订购
     */
    @RequiresPermissions("system:buyroom:remove")
    @Log(title = "房间订购", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(buyRoomService.deleteBuyRoomByIds(ids));
    }



    @GetMapping("/ff")
    @ResponseBody
    public void ff()
    {
        System.out.println("fff");
    }
}
