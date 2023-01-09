package com.ruoyi.clientspecialtyorder.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.ruoyi.clienthomeorder.domain.ClientRoomRecord;
import com.ruoyi.common.config.ServerConfig;
import com.ruoyi.common.json.JSONObject;
import com.ruoyi.landlordhomeorder.domain.LandlordRoomRecord;
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
import com.ruoyi.clientspecialtyorder.domain.ClientSpecialtyRecord;
import com.ruoyi.clientspecialtyorder.service.IClientSpecialtyRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 订单Controller
 *
 * @author ruoyi
 * @date 2022-12-08
 */
@Controller
@RequestMapping("/clientspecialtyorder/clientorder")
public class ClientSpecialtyRecordController extends BaseController {
    private String prefix = "clientspecialtyorder/clientorder";

    @Autowired
    private IClientSpecialtyRecordService clientSpecialtyRecordService;

    @RequiresPermissions("clientspecialtyorder:clientorder:view")
    @GetMapping()
    public String clientorder() {
        return prefix + "/clientorder";
    }

    /**
     * 查询订单列表
     */
    @RequiresPermissions("clientspecialtyorder:clientorder:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ClientSpecialtyRecord clientSpecialtyRecord) {
        startPage();
        List<ClientSpecialtyRecord> list = clientSpecialtyRecordService.selectClientSpecialtyRecordList(clientSpecialtyRecord);
        return getDataTable(list);
    }

    /**
     * 导出订单列表
     */
    @RequiresPermissions("clientspecialtyorder:clientorder:export")
    @Log(title = "订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ClientSpecialtyRecord clientSpecialtyRecord) {
        List<ClientSpecialtyRecord> list = clientSpecialtyRecordService.selectClientSpecialtyRecordList(clientSpecialtyRecord);
        ExcelUtil<ClientSpecialtyRecord> util = new ExcelUtil<ClientSpecialtyRecord>(ClientSpecialtyRecord.class);
        return util.exportExcel(list, "订单数据");
    }

    /**
     * 新增订单
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存订单
     */
    @RequiresPermissions("clientspecialtyorder:clientorder:add")
    @Log(title = "订单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ClientSpecialtyRecord clientSpecialtyRecord) {
        return toAjax(clientSpecialtyRecordService.insertClientSpecialtyRecord(clientSpecialtyRecord));
    }

    /**
     * 修改订单
     */
    @RequiresPermissions("clientspecialtyorder:clientorder:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {

        ClientSpecialtyRecord clientSpecialtyRecord = clientSpecialtyRecordService.selectClientSpecialtyRecordById(id);
        mmap.put("clientSpecialtyRecord", clientSpecialtyRecord);
        System.out.println("hello------------------------------------");

        System.out.println(clientSpecialtyRecord.getId());
        System.out.println(clientSpecialtyRecord);
        return prefix + "/edit";
    }

    /**
     * 修改保存订单
     */
    @RequiresPermissions("clientspecialtyorder:clientorder:edit")
    @Log(title = "订单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ClientSpecialtyRecord clientSpecialtyRecord) {
        return toAjax(clientSpecialtyRecordService.updateClientSpecialtyRecord(clientSpecialtyRecord));
    }

    /**
     * 删除订单
     */
    @RequiresPermissions("clientspecialtyorder:clientorder:remove")
    @Log(title = "订单", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(clientSpecialtyRecordService.deleteClientSpecialtyRecordByIds(ids));
    }

    @RequiresPermissions("clientspecialtyorder:clientorder:eCharts")
    @GetMapping("/eCharts")
    public String statistics(ModelMap mmap) {
        return prefix + "/eCharts";
    }

    @RequiresPermissions("clientspecialtyorder:clientorder:eCharts")
    @Log(title = "历史订单统计", businessType = BusinessType.INSERT)
    @PostMapping("/eCharts")
    @ResponseBody
    public List<Integer> statisticsData() {
        List<Integer> list = clientSpecialtyRecordService.getMonthlyClientSpecialtyRecordIncrement();
        return list;
    }



    /**
     * 新增订单评论
     */
    @GetMapping("/comment")
    public String comment() {
        return prefix + "/comment";
    }

    /**
     * 新增保存订单评论
     */
    @RequiresPermissions("clientspecialtyorder:clientorder:comment")
    @Log(title = "订单", businessType = BusinessType.INSERT)
    @PostMapping("/comment")
    @ResponseBody
    public AjaxResult commentSave(ClientSpecialtyRecord clientSpecialtyRecord) {
        return toAjax(clientSpecialtyRecordService.updateClientSpecialtyCommentRecord(clientSpecialtyRecord));
    }

    /**
     * 菜单图标上传
     * @param newsMenuIconFile 上传的文件
     * @return 上传的文件的URL
     * @throws IOException
     */
    @PostMapping( "/menuIconUpload")
    @ResponseBody
    public Map<String, String> menuIconUpload(MultipartFile newsMenuIconFile) throws IOException {
        System.out.println("文件："+newsMenuIconFile.getOriginalFilename()+"正在上传！");
        String projectStaticPath = "C:\\yk"; // 项目本地文件夹路径
        String fileStoragePath = "\\uploadPath\\"; // 本地文件夹的相对路径
        Map<String, String> map = upload( newsMenuIconFile,projectStaticPath, fileStoragePath);
        System.out.println(map);
        String value = map.get("genFilename");
        System.out.println("key genFilename 对应的 value: " + value);
        String path="http://localhost/profile/"+value;
        System.out.println(path);
        clientSpecialtyRecordService.insertClientSpecialtyCommentPhotoRecord(path);
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

    /**
     * 修改民宿订单
     */
    @RequiresPermissions("clientspecialtyorder:clientorder:querycomment")
    @GetMapping("/querycomment/{id}")
    public String querycomment(@PathVariable("id") Long id, ModelMap mmap)
    {
        System.out.println(id);
        ClientSpecialtyRecord clientSpecialtyRecord = clientSpecialtyRecordService.selectClientSpecialtyCommentRecordById(id);
        System.out.println(clientSpecialtyRecord);
        if(clientSpecialtyRecord==null){
            System.out.println("hello___________________________________");
            clientSpecialtyRecord = clientSpecialtyRecordService.selectClientSpecialtyCommentRecordById((long) 0);
            mmap.put("clientSpecialtyRecord",clientSpecialtyRecord);

            System.out.println(mmap);

        }
        else{
            mmap.put("clientSpecialtyRecord",clientSpecialtyRecord);
        }
        return prefix + "/querycomment";
    }

    /**
     * 修改保存民宿订单
     */
    @RequiresPermissions("clientspecialtyorder:clientorder:querycomment")
    @Log(title = "查看评论", businessType = BusinessType.UPDATE)
    @PostMapping("/querycomment")
    @ResponseBody
    public AjaxResult  querycommentSave(ClientSpecialtyRecord clientSpecialtyRecord)
    {
        System.out.println(clientSpecialtyRecord);
        return toAjax(clientSpecialtyRecordService.updateClientSpecialtyCommentRecord(clientSpecialtyRecord));
    }

    /**
     * 驾驶舱数据
     */
    @PostMapping("/specialtydata")
    @ResponseBody
    public String Data()
    {
        JSONObject res=new JSONObject();
        JSONArray s=new JSONArray();
        List<String> namelist = clientSpecialtyRecordService.getDataNameList();
        for(String name:namelist){
            JSONObject tmp=new JSONObject();
            String a = name;
            tmp.put("name",a);
            String b = String.valueOf(clientSpecialtyRecordService.getSellNumber(name)) ;
            tmp.put("number",b);
            s.add(tmp);
        }
        res.put("data",s);
        System.out.println(res);
        return res.toString();
    }
}
