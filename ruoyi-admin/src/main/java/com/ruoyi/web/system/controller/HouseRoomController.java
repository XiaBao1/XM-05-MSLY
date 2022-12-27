package com.ruoyi.web.system.controller;

import java.util.List;

import com.ruoyi.framework.web.domain.server.Sys;
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
import com.ruoyi.web.system.domain.HouseRoom;
import com.ruoyi.web.system.service.IHouseRoomService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房子管理Controller
 *
 * @author ruoyi
 * @date 2022-12-02
 */
@Controller
@RequestMapping("/system/room")
public class HouseRoomController extends BaseController
{
    private String prefix = "system/room";

    @Autowired
    private IHouseRoomService houseRoomService;

    @RequiresPermissions("system:room:view")
    @GetMapping()
    public String room()
    {
        return prefix + "/room";
    }

    /**
     * 查询房子管理列表
     */
    @RequiresPermissions("system:room:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(HouseRoom houseRoom)
    {
        startPage();

        if(houseRoom.getHouseName()!=null&&(!houseRoom.getHouseName().equals(""))){
            String id=houseRoomService.getHouseIdByHouseName(houseRoom);
            Long houseId=Long.parseLong(id);
            houseRoom.setHouseId(houseId);
        }

        List<HouseRoom> list = houseRoomService.selectHouseRoomList(houseRoom);
        for(HouseRoom houseRoom1:list){
            houseRoom1.houseName=houseRoomService.getHouseNameById(houseRoom1.getHouseId());
        }
        return getDataTable(list);
    }

    /**
     * 导出房子管理列表
     */
    @RequiresPermissions("system:room:export")
    @Log(title = "房子管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(HouseRoom houseRoom)
    {
        List<HouseRoom> list = houseRoomService.selectHouseRoomList(houseRoom);
        for(HouseRoom houseRoom1:list){
            houseRoom1.houseName=houseRoomService.getHouseNameById(houseRoom1.getHouseId());
            if(houseRoom1.getIsFree()==1)houseRoom1.setFree("是");
            else houseRoom1.setFree("否");
        }
        ExcelUtil<HouseRoom> util = new ExcelUtil<HouseRoom>(HouseRoom.class);
        return util.exportExcel(list, "我的房间数据");
    }

    /**
     * 新增房子管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存房子管理
     */
    @RequiresPermissions("system:room:add")
    @Log(title = "房子管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(HouseRoom houseRoom)
    {
        String id=houseRoomService.getHouseIdByHouseName(houseRoom);
        System.out.println(houseRoom.getHouseName()+"    %%%%%%%%%%");
        if(id==null||id.equals("")){
            AjaxResult res=new AjaxResult();
            res.put("msg","民宿名称有误");
            return res;
        }
        System.out.println("yyyyyyyyyyyyyyyyyhhhhhhhhhhhhhhhhhhhhh&&&&&&&&&&&&&7");
        Long houseId=Long.parseLong(id);
        houseRoom.setHouseId(houseId);
        return toAjax(houseRoomService.insertHouseRoom(houseRoom));
    }

    /**
     * 修改房子管理
     */
    @RequiresPermissions("system:room:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        HouseRoom houseRoom = houseRoomService.selectHouseRoomById(id);
        mmap.put("houseRoom", houseRoom);
        return prefix + "/edit";
    }

    /**
     * 修改保存房子管理
     */
    @RequiresPermissions("system:room:edit")
    @Log(title = "房子管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(HouseRoom houseRoom)
    {
        return toAjax(houseRoomService.updateHouseRoom(houseRoom));
    }

    /**
     * 删除房子管理
     */
    @RequiresPermissions("system:room:remove")
    @Log(title = "房子管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(houseRoomService.deleteHouseRoomByIds(ids));
    }

    @RequiresPermissions("system:room:statistics")
    @GetMapping("/statistics")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/statistics";
    }

    @RequiresPermissions("system:room:statistics")
    @Log(title = "房源统计", businessType = BusinessType.INSERT)
    @PostMapping("/statistics")
    @ResponseBody
    public List<Integer> statisticsData()
    {
        System.out.println("6666");
        HouseRoom houseRoom=new HouseRoom();
        List<Integer> list = houseRoomService.getAppointmentData(houseRoom);
        return list;
    }
}
