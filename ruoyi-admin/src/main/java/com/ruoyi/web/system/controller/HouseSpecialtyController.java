package com.ruoyi.web.system.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.ruoyi.common.json.JSONObject;
import com.ruoyi.web.system.domain.landlord;
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
import com.ruoyi.web.system.domain.HouseSpecialty;
import com.ruoyi.web.system.service.IHouseSpecialtyService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 我的特产Controller
 *
 * @author pch
 * @date 2022-12-13
 */
@Controller
@RequestMapping("/system/specialty")
public class HouseSpecialtyController extends BaseController
{
    private String prefix = "system/specialty";

    @Autowired
    private IHouseSpecialtyService houseSpecialtyService;

    //@RequiresPermissions("system:specialty:view")
    @GetMapping()
    public String specialty()
    {
        return prefix + "/specialty";
    }

    /**
     * 查询我的特产列表
     */
    //@RequiresPermissions("system:specialty:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(HouseSpecialty houseSpecialty)
    {
        startPage();

        if(houseSpecialty.getHouseName()!=null&&(!houseSpecialty.getHouseName().equals(""))){
            String id=houseSpecialtyService.getHouseIdByHouseName(houseSpecialty);
            Long houseId=Long.parseLong(id);
            houseSpecialty.setHouseId(houseId);
        }

        List<HouseSpecialty> list = houseSpecialtyService.selectHouseSpecialtyList(houseSpecialty);
        for(HouseSpecialty h:list){
            h.setHouseName(houseSpecialtyService.getHouseNameById(h.getHouseId()));
        }
        return getDataTable(list);
    }

    /**
     * 导出我的特产列表
     */
    //@RequiresPermissions("system:specialty:export")
    @Log(title = "我的特产", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(HouseSpecialty houseSpecialty)
    {
        List<HouseSpecialty> list = houseSpecialtyService.selectHouseSpecialtyList(houseSpecialty);
        for(HouseSpecialty h:list){
            h.setHouseName(houseSpecialtyService.getHouseNameById(h.getHouseId()));
        }
        ExcelUtil<HouseSpecialty> util = new ExcelUtil<HouseSpecialty>(HouseSpecialty.class);
        return util.exportExcel(list, "我的特产数据");
    }

    /**
     * 新增我的特产
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存我的特产
     */
   //@RequiresPermissions("system:specialty:add")
    @Log(title = "我的特产", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(HouseSpecialty houseSpecialty)
    {
        //判断houseId
        String id=houseSpecialtyService.getHouseIdByHouseName(houseSpecialty);
        if(id==null||id.equals("")){
            AjaxResult res=new AjaxResult();
            res.put("msg","民宿名称有误");
            return res;
        }
        Long houseId=Long.parseLong(id);
        houseSpecialty.setHouseId(houseId);
        return toAjax(houseSpecialtyService.insertHouseSpecialty(houseSpecialty));
    }

    /**
     * 修改我的特产
     */
    //@RequiresPermissions("system:specialty:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        HouseSpecialty houseSpecialty = houseSpecialtyService.selectHouseSpecialtyById(id);
        mmap.put("houseSpecialty", houseSpecialty);
        return prefix + "/edit";
    }

    /**
     * 修改保存我的特产
     */
    //@RequiresPermissions("system:specialty:edit")
    @Log(title = "我的特产", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(HouseSpecialty houseSpecialty)
    {
        //判断houseId
        return toAjax(houseSpecialtyService.updateHouseSpecialty(houseSpecialty));
    }

    /**
     * 删除我的特产
     */
    //@RequiresPermissions("system:specialty:remove")
    @Log(title = "我的特产", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(houseSpecialtyService.deleteHouseSpecialtyByIds(ids));
    }

    //@RequiresPermissions("system:specialty:statistics")
    @GetMapping("/statistics")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/statistics";
    }

    //@RequiresPermissions("system:specialty:statistics")
    @Log(title = "特产统计", businessType = BusinessType.INSERT)
    @PostMapping("/statistics")
    @ResponseBody
    public String statisticsData()
    {
        System.out.println("6999996");
        JSONObject res=new JSONObject();
        JSONArray s=new JSONArray();
        List<String> nameList=houseSpecialtyService.getName();
        for(String name : nameList){
            JSONObject tmp=new JSONObject();
            tmp.put("name",name);
            tmp.put("sell",houseSpecialtyService.getSellNumber(name));
            tmp.put("sold",houseSpecialtyService.getSoldNumber(name));
            s.add(tmp);
        }
        res.put("specialty",s);
        return res.toString();
    }

    /**
     * 菜单图标上传
     * @param  specialtyImage 上传的文件
     * @return 上传的文件的URL
     * @throws IOException
     */
    @PostMapping( "/menuIconUpload")
    @ResponseBody
    public Map<String, String> menuIconUpload(MultipartFile specialtyImage) throws IOException {
        System.out.println("文件："+specialtyImage.getOriginalFilename()+"正在上传！");
        String projectStaticPath = "C:\\yk"; // 项目本地文件夹路径
        String fileStoragePath = "\\uploadPath\\"; // 本地文件夹的相对路径
        Map<String, String> map = upload( specialtyImage,projectStaticPath, fileStoragePath);
        System.out.println(map);
        String value = map.get("genFilename");
        System.out.println("key genFilename 对应的 value: " + value);
        String path="http://localhost/profile/"+value;
        map.put("savePath",path);
        System.out.println(path);
        //landlordService.insertImageUrl(path);
        return map;
    }

    /**
     * SpringBoot上传文件到指定目录
     * @param multipartFile 需要上传的文件
     * @param projectStaticPath 当前项目到静态资源文件路径（从当前项目开始：如：存放在当前项目的"\\ruoyi-admin\\src\\main\\resources\\static"静态资源文件夹下）
     * @param fileStoragePath 文件存放路径（从静态资源文件夹开始，如：存放在static的"\\news\\default_images"文件夹下)
     * @return 存放文件路劲信息的map
     * @throws IOException
     */
    public Map<String, String> upload(MultipartFile multipartFile, String projectStaticPath, String fileStoragePath) throws IOException {
        String completedFilePath =   projectStaticPath + fileStoragePath; // 完整文件路径
        // mk dir
        File fileDir = new File(completedFilePath);
        if (!fileDir.exists()) {
            fileDir.mkdirs();
        }
        // mk file
        String time = System.currentTimeMillis()+"";
        int random = (int) (Math.random()*1000); // 生成一个[0,999]的随机数
        String genFilename = time+random+".png";
        File file = new File(completedFilePath + "\\"+ genFilename);
        // upload file
        multipartFile.transferTo(file); // 将multipartFile存入创建好的file中
        // return file path info by map
        Map<String, String> map = new HashMap<>();
        map.put("completedFilePath", completedFilePath);
        map.put("fileStoragePath", fileStoragePath);
        map.put("genFilename", genFilename);
        String path =fileStoragePath+genFilename;
        for (String s : map.keySet()) {
            System.out.println("key: " + s + " value: " + map.get(s));
        }
        return map;
    }
}
