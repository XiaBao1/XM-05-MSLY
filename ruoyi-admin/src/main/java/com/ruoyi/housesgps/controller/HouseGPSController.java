package com.ruoyi.housesgps.controller;

import java.util.List;

import com.ruoyi.clienthomeorder.domain.ClientRoomRecord;
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
import com.ruoyi.housesgps.domain.HouseGPS;
import com.ruoyi.housesgps.service.IHouseGPSService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 地图管理Controller
 * 
 * @author yyt
 * @date 2022-12-11
 */
@Controller
@RequestMapping("/housesgps/gps")
public class HouseGPSController extends BaseController
{
    private String prefix = "housesgps/gps";

    @Autowired
    private IHouseGPSService houseGPSService;

    @RequiresPermissions("housesgps:gps:view")
    @GetMapping()
    public String gps()
    {
        return prefix + "/gps";
    }

    /**
     * 查询地图管理列表
     */
    @RequiresPermissions("housesgps:gps:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(HouseGPS houseGPS)
    {
        startPage();
        List<HouseGPS> list = houseGPSService.selectHouseGPSList(houseGPS);
        return getDataTable(list);
    }

    /**
     * 导出地图管理列表
     */
    @RequiresPermissions("housesgps:gps:export")
    @Log(title = "地图管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(HouseGPS houseGPS)
    {
        List<HouseGPS> list = houseGPSService.selectHouseGPSList(houseGPS);
        ExcelUtil<HouseGPS> util = new ExcelUtil<HouseGPS>(HouseGPS.class);
        return util.exportExcel(list, "地图管理数据");
    }

    /**
     * 新增地图管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存地图管理
     */
    @RequiresPermissions("housesgps:gps:add")
    @Log(title = "地图管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(HouseGPS houseGPS)
    {
        return toAjax(houseGPSService.insertHouseGPS(houseGPS));
    }

    /**
     * 修改地图管理
     */
    @RequiresPermissions("housesgps:gps:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        HouseGPS houseGPS = houseGPSService.selectHouseGPSById(id);
        mmap.put("houseGPS", houseGPS);
        return prefix + "/edit";
    }

    /**
     * 修改保存地图管理
     */
    @RequiresPermissions("housesgps:gps:edit")
    @Log(title = "地图管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(HouseGPS houseGPS)
    {
        return toAjax(houseGPSService.updateHouseGPS(houseGPS));
    }

    /**
     * 删除地图管理
     */
    @RequiresPermissions("housesgps:gps:remove")
    @Log(title = "地图管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(houseGPSService.deleteHouseGPSByIds(ids));
    }

    /**
     * 打开地图
     */
    @RequiresPermissions("housesgps:gps:baiduapi")
    @GetMapping("/baiduapi")
    public String baiduapi()
    {
        return prefix + "/baiduapi";
    }

    /**
     * 查询位置
     */
    @RequiresPermissions("housesgps:gps:houseaddress")
    @GetMapping("/houseaddress/{id}")
    public String houseaddress(@PathVariable("id") Long id, ModelMap mmap)
    {
        HouseGPS houseGPS = houseGPSService.selectHouseGPSById(id);
        mmap.put("houseGPS", houseGPS);
        String housename = houseGPS.getHouseName();
        String address = houseGPS.getAddress();
        String city = houseGPS.getCity();
        mmap.addAttribute("housename",housename);
        mmap.addAttribute("address",address);
        mmap.addAttribute("city",city);
        System.out.println("==============================================================="+housename);
        return prefix + "/houseaddress";
    }

    /**
     * 保存位置
     */
    @RequiresPermissions("housesgps:gps:houseaddress")
    @Log(title = "民宿订单", businessType = BusinessType.UPDATE)
    @PostMapping("/houseaddress")
    @ResponseBody
    public AjaxResult houseaddressSave(HouseGPS houseGPS)
    {
        return toAjax(houseGPSService.updateHouseGPS(houseGPS));
    }
}
