package com.ruoyi.landlordhomeorder.controller;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.ruoyi.common.json.JSONObject;
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
import com.ruoyi.landlordhomeorder.domain.LandlordRoomRecord;
import com.ruoyi.landlordhomeorder.service.ILandlordRoomRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import javax.servlet.http.HttpServletRequest;

/**
 * 民宿订单Controller
 * 
 * @author ruoyi
 * @date 2022-12-07
 */
@Controller
@RequestMapping("/landlordhomeorder/landlordorder")
public class LandlordRoomRecordController extends BaseController
{
    private String prefix = "landlordhomeorder/landlordorder";

    @Autowired
    private ILandlordRoomRecordService landlordRoomRecordService;

    @RequiresPermissions("landlordhomeorder:landlordorder:view")
    @GetMapping()
    public String landlordorder()
    {
        return prefix + "/landlordorder";
    }

    /**
     * 查询民宿订单列表
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(LandlordRoomRecord landlordRoomRecord)
    {
        startPage();
        List<LandlordRoomRecord> list = landlordRoomRecordService.selectLandlordRoomRecordList(landlordRoomRecord);
        return getDataTable(list);
    }

    /**
     * 导出民宿订单列表
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:export")
    @Log(title = "民宿订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(LandlordRoomRecord landlordRoomRecord)
    {
        List<LandlordRoomRecord> list = landlordRoomRecordService.selectLandlordRoomRecordList(landlordRoomRecord);
        ExcelUtil<LandlordRoomRecord> util = new ExcelUtil<LandlordRoomRecord>(LandlordRoomRecord.class);
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
    @RequiresPermissions("landlordhomeorder:landlordorder:add")
    @Log(title = "民宿订单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(LandlordRoomRecord landlordRoomRecord)
    {
        LandlordRoomRecord a = landlordRoomRecordService.selectRoomID(landlordRoomRecord);
        Long value = a.roomId;
        System.out.println(value);
        landlordRoomRecord.roomId =value;;
        return toAjax(landlordRoomRecordService.insertLandlordRoomRecord(landlordRoomRecord));
    }

    /**
     * 修改民宿订单
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        LandlordRoomRecord landlordRoomRecord = landlordRoomRecordService.selectLandlordRoomRecordById(id);
        mmap.put("landlordRoomRecord", landlordRoomRecord);
        //System.out.println(landlordRoomRecord);
        return prefix + "/edit";
    }

    /**
     * 修改保存民宿订单
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:edit")
    @Log(title = "民宿订单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(LandlordRoomRecord landlordRoomRecord)
    {

        return toAjax(landlordRoomRecordService.updateLandlordRoomRecord(landlordRoomRecord));
    }

    /**
     * 删除民宿订单
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:remove")
    @Log(title = "民宿订单", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(landlordRoomRecordService.deleteLandlordRoomRecordByIds(ids));
    }
    /**
     * 统计民宿订单
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:eCharts")
    @GetMapping("/eCharts")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/eCharts";
    }

    @RequiresPermissions("landlordhomeorder:landlordorder:eCharts")
    @Log(title = "历史订单统计", businessType = BusinessType.INSERT)
    @PostMapping("/eCharts")
    @ResponseBody
    public List<Integer> statisticsData()
    {
        List<Integer> list = landlordRoomRecordService.getMonthlyClientRoomRecordIncrement();
        return list;
    }

    /**
     * 修改民宿订单
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:querycomment")
    @GetMapping("/querycomment/{id}")
    public String querycomment(@PathVariable("id") Long id, ModelMap mmap)
    {
        System.out.println(id);
        LandlordRoomRecord landlordRoomRecord = landlordRoomRecordService.selectLandlordRoomCommentRecordById(id);
        System.out.println(landlordRoomRecord);
        if(landlordRoomRecord==null){
            System.out.println("hello___________________________________");
            landlordRoomRecord = landlordRoomRecordService.selectLandlordRoomCommentRecordById((long) 0);
            mmap.put("landlordRoomRecord",landlordRoomRecord);

            System.out.println(mmap);

        }
        else{
            mmap.put("landlordRoomRecord", landlordRoomRecord);
        }
        return prefix + "/querycomment";
    }

    /**
     * 修改保存民宿订单
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:querycomment")
    @Log(title = "查看评论", businessType = BusinessType.UPDATE)
    @PostMapping("/querycomment")
    @ResponseBody
    public AjaxResult  querycommentSave(LandlordRoomRecord landlordRoomRecord)
    {
        System.out.println(landlordRoomRecord);
        return toAjax(landlordRoomRecordService.updateLandlordRoomCommentRecord(landlordRoomRecord));
    }

    /**
     * 查询所有评论
     * @return
     */
    @RequiresPermissions("landlordhomeorder:landlordorder:queryallcomment")
    @GetMapping("/queryallcomment/{id}")
    public String queryallcommentPage(@PathVariable("id") Long id, ModelMap mmap) {
        System.out.println(id);
        mmap.put("id",id);
        return prefix+ "/queryallcomment";
    }

    @RequiresPermissions("landlordhomeorder:landlordorder:queryallcomment")
    @Log(title = "全部评论", businessType = BusinessType.UPDATE)
    @PostMapping("/queryallcomment")
    @ResponseBody
    public String queryallcomment(HttpServletRequest request)
    {
        Long id= Long.valueOf(request.getParameter("id"));
        System.out.println("id is:"+id);
//        System.out.println("postmapping:"+clientRoomRecord);
//        Long id = clientRoomRecord.roomRecordId;
        List<Long> idlist =  landlordRoomRecordService.getDataIdList(id);

        if(idlist.isEmpty()){
            System.out.println("idlist is null---------------------------");
            Long ids = Long.valueOf(0);
            idlist = landlordRoomRecordService.getDataIdList(ids);
        }
        System.out.println(idlist);
        JSONObject res=new JSONObject();
        JSONArray s=new JSONArray();
        for(Long idnew:idlist){
            JSONObject tmp=new JSONObject();
            String a = String.valueOf(idnew);
            tmp.put("id",a);
            String b = String.valueOf(landlordRoomRecordService.getRoomRecordId(idnew)) ;
            tmp.put("room_record_id",b);
            String e = String.valueOf(landlordRoomRecordService.getScore(idnew)) ;
            tmp.put("score",e);
            String c = landlordRoomRecordService.getComment(idnew) ;
            tmp.put("comment",c);
            String d = landlordRoomRecordService.getPhoto(idnew) ;
            tmp.put("photo",d);
            s.add(tmp);
        }
        res.put("data",s);
        System.out.println(res);
        return res.toString();
    }
}
