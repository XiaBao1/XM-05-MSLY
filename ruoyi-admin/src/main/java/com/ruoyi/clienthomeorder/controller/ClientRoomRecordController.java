package com.ruoyi.clienthomeorder.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ch.qos.logback.core.net.server.Client;
import com.ruoyi.clientspecialtyorder.domain.ClientSpecialtyRecord;
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
import com.ruoyi.clienthomeorder.domain.ClientRoomRecord;
import com.ruoyi.clienthomeorder.service.IClientRoomRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;


/**
 * 民宿订单Controller
 * 
 * @author ruoyi
 * @date 2022-12-06
 */
@Controller
@RequestMapping("/clienthomeorder/homeorder")
public class ClientRoomRecordController extends BaseController
{
    private String prefix = "clienthomeorder/homeorder";

    @Autowired
    private IClientRoomRecordService clientRoomRecordService;
    private Object AxisType;

    @RequiresPermissions("clienthomeorder:homeorder:view")
    @GetMapping()
    public String homeorder()
    {
        return prefix + "/homeorder";
    }

    /**
     * 查询民宿订单列表
     */
    @RequiresPermissions("clienthomeorder:homeorder:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ClientRoomRecord clientRoomRecord)
    {
        startPage();
        List<ClientRoomRecord> list = clientRoomRecordService.selectClientRoomRecordList(clientRoomRecord);
        //System.out.println(list);
        return getDataTable(list);
    }



    /**
     * 导出民宿订单列表
     */
    @RequiresPermissions("clienthomeorder:homeorder:export")
    @Log(title = "民宿订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ClientRoomRecord clientRoomRecord)
    {
        List<ClientRoomRecord> list = clientRoomRecordService.selectClientRoomRecordList(clientRoomRecord);
        ExcelUtil<ClientRoomRecord> util = new ExcelUtil<ClientRoomRecord>(ClientRoomRecord.class);
        return util.exportExcel(list, "民宿订单数据");
    }

    /**
     * 新增民宿订单
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存民宿订单
     */
    @RequiresPermissions("clienthomeorder:homeorder:add")
    @Log(title = "民宿订单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ClientRoomRecord clientRoomRecord)
    {
        return toAjax(clientRoomRecordService.insertClientRoomRecord(clientRoomRecord));
    }

    /**
     * 修改民宿订单
     */
    @RequiresPermissions("clienthomeorder:homeorder:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        ClientRoomRecord clientRoomRecord = clientRoomRecordService.selectClientRoomRecordById(id);
        mmap.put("clientRoomRecord", clientRoomRecord);
        return prefix + "/edit";
    }

    /**
     * 修改保存民宿订单
     */
    @RequiresPermissions("clienthomeorder:homeorder:edit")
    @Log(title = "民宿订单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ClientRoomRecord clientRoomRecord)
    {
        return toAjax(clientRoomRecordService.updateClientRoomRecord(clientRoomRecord));
    }

    /**
     * 删除民宿订单
     */
    @RequiresPermissions("clienthomeorder:homeorder:remove")
    @Log(title = "民宿订单", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(clientRoomRecordService.deleteClientRoomRecordByIds(ids));
    }

    /**
     * 统计民宿订单
     */

    @RequiresPermissions("clienthomeorder:homeorder:eCharts")
    @GetMapping("/eCharts")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/eCharts";
    }

    @RequiresPermissions("clienthomeorder:homeorder:eCharts")
    @Log(title = "历史订单统计", businessType = BusinessType.INSERT)
    @PostMapping("/eCharts")
    @ResponseBody
    public List<Integer> statisticsData()
    {
        List<Integer> list = clientRoomRecordService.getMonthlyClientRoomRecordIncrement();
        return list;
    }


    /**
     * 新增民宿订单评论
     */
    @GetMapping("/comment")
    public String comment()
    {
        return prefix + "/comment";
    }

    /**
     * 新增保存民宿订单评论
     */
    @RequiresPermissions("clienthomeorder:homeorder:comment")
    @Log(title = "评论", businessType = BusinessType.INSERT)
    @PostMapping("/comment")
    @ResponseBody
    public AjaxResult commentSave(ClientRoomRecord clientRoomRecord) throws IOException {
        System.out.println("hello-------------------");

        return toAjax(clientRoomRecordService.updateClientRoomCommentRecord(clientRoomRecord));
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
        clientRoomRecordService.insertClientRoomCommentPhotoRecord(path);
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
     * 查询评论
     * @return
     */
    @RequiresPermissions("clienthomeorder:homeorder:querycomment")
    @GetMapping("/querycomment/{id}")

    public String querycomment(@PathVariable("id") Long id, ModelMap mmap)
    {
        System.out.println(id);
        ClientRoomRecord clientRoomRecord = clientRoomRecordService.selectClientRoomCommentRecordById(id);
        System.out.println(clientRoomRecord);
        if(clientRoomRecord==null){
            System.out.println("hello___________________________________");
            clientRoomRecord = clientRoomRecordService.selectClientRoomCommentRecordById((long) 0);
            mmap.put("clientRoomRecord",clientRoomRecord);

            System.out.println(mmap);

        }
        else{
            mmap.put("clientRoomRecord",clientRoomRecord);
        }
        return prefix + "/querycomment";
    }

    /**
     * 保存评论
     */
    @RequiresPermissions("clienthomeorder:homeorder:querycomment")
    @Log(title = "民宿订单", businessType = BusinessType.UPDATE)
    @PostMapping("/querycomment")
    @ResponseBody
    public AjaxResult querycommentSave(ClientRoomRecord clientRoomRecord)
    {
        System.out.println(clientRoomRecord);
        return toAjax(clientRoomRecordService.updateClientRoomCommentRecord(clientRoomRecord));
    }

    /**
     * 小程序查看评论
     */
    @RequiresPermissions("clienthomeorder:homeorder:querycomment")
    @Log(title = "小程序查看评论", businessType = BusinessType.UPDATE)
    @PostMapping("/appquerycomment")
    @ResponseBody
    public List<ClientRoomRecord> appquerycomment(String id)
    {
        Long ids=Long.valueOf(id);
        List<ClientRoomRecord> list=new ArrayList<ClientRoomRecord>(1);
        ClientRoomRecord clientRoomRecord = clientRoomRecordService.selectClientRoomCommentRecordById(ids);
        if(clientRoomRecord==null){
            ClientRoomRecord N=new ClientRoomRecord();
            N.setId(0L);
            list.add(N);
        }
        else {
            list.add(clientRoomRecordService.selectClientRoomCommentRecordById(ids));
        }
        return list;
    }
}
