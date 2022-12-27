package com.ruoyi.web.system.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Date;
import java.util.Map;

import com.ruoyi.framework.web.domain.server.Sys;
import com.ruoyi.web.system.domain.HouseRoom;
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
import com.ruoyi.web.system.domain.landlord;
import com.ruoyi.web.system.service.IlandlordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 民宿管理Controller
 *
 * @author pch
 * @date 2022-12-12
 */
@Controller
@RequestMapping("/system/landlord")
public class LandlordController extends BaseController
{
    private String prefix = "system/landlord";

    @Autowired
    private IlandlordService landlordService;

    @RequiresPermissions("system:landlord:view")
    @GetMapping()
    public String landlord()
    {
        return prefix + "/landlord";
    }

    /**
     * 查询民宿管理列表
     */
    @RequiresPermissions("system:landlord:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(landlord landlord)
    {
        startPage();
        List<landlord> list = landlordService.selectlandlordList(landlord);
        for(landlord landlord1:list){
            landlord1.imageUrl=landlordService.getImageUrlById(landlord1.getId());
        }
        return getDataTable(list);
    }

    /**
     * 导出民宿管理列表
     */
    @RequiresPermissions("system:landlord:export")
    @Log(title = "民宿管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(landlord landlord)
    {
        List<landlord> list = landlordService.selectlandlordList(landlord);
        ExcelUtil<landlord> util = new ExcelUtil<landlord>(landlord.class);
        return util.exportExcel(list, "我的民宿数据");
    }

    /**
     * 新增民宿管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存民宿管理
     */
    @RequiresPermissions("system:landlord:add")
    @Log(title = "民宿管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(landlord landlord)
    {
        System.out.println("运行到controller的addsave了");
        landlord.setHostNumber(landlord.userId);
        Date date=new Date();
        landlord.setRegisterTime(date);
        return toAjax(landlordService.insertlandlord(landlord));
    }

    /**
     * 修改民宿管理
     */
    @RequiresPermissions("system:landlord:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        landlord landlord = landlordService.selectlandlordById(id);
        mmap.put("landlord", landlord);
        return prefix + "/edit";
    }

    /**
     * 修改保存民宿管理
     */
    @RequiresPermissions("system:landlord:edit")
    @Log(title = "民宿管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(landlord landlord)
    {
        System.out.println(landlord.getHouseName());
        System.out.println(landlord.getAddress());
        System.out.println(landlord.getImageUrl());
        return toAjax(landlordService.updatelandlord(landlord));
    }

    /**
     * 删除民宿管理
     */
    @RequiresPermissions("system:landlord:remove")
    @Log(title = "民宿管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(landlordService.deletelandlordByIds(ids));
    }

    @RequiresPermissions("system:landlord:statistics")
    @GetMapping("/statistics")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/statistics";
    }

    @RequiresPermissions("system:landlord:statistics")
    @Log(title = "民宿统计", businessType = BusinessType.INSERT)
    @PostMapping("/statistics")
    @ResponseBody
    public List<Integer> statisticsData()
    {
        System.out.println("6999996");
        landlord ll=new landlord();
        List<Integer> list=landlordService.getAppointmentData(ll);
//        HouseRoom houseRoom=new HouseRoom();
//        List<Integer> list = houseRoomService.getAppointmentData(houseRoom);
        return list;
    }

    /**
     * 菜单图标上传
     * @param landlordImage 上传的文件
     * @return 上传的文件的URL
     * @throws IOException
     */
    @PostMapping( "/menuIconUpload")
    @ResponseBody
    public Map<String, String> menuIconUpload(MultipartFile landlordImage) throws IOException {
        System.out.println("文件："+landlordImage.getOriginalFilename()+"正在上传！");
        String projectStaticPath = "C:\\yk"; // 项目本地文件夹路径
        String fileStoragePath = "\\uploadPath\\"; // 本地文件夹的相对路径
        Map<String, String> map = upload( landlordImage,projectStaticPath, fileStoragePath);
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
