package com.ruoyi.landlordspecialtyorder.controller;

import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.ruoyi.landlordspecialtyorder.domain.LandlordSpecialtyRecord;
import com.ruoyi.landlordspecialtyorder.service.ILandlordSpecialtyRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import javax.servlet.http.HttpServletRequest;

/**
 * 订单Controller
 *
 * @author ruoyi
 * @date 2022-12-08
 */
@Controller
@RequestMapping("/landlordspecialtyorder/specialtyorder")
public class LandlordSpecialtyRecordController extends BaseController
{
    private String prefix = "landlordspecialtyorder/specialtyorder";

    @Autowired
    private ILandlordSpecialtyRecordService landlordSpecialtyRecordService;

    @RequiresPermissions("landlordspecialtyorder:specialtyorder:view")
    @GetMapping()
    public String specialtyorder()
    {
        return prefix + "/specialtyorder";
    }

    /**
     * 查询订单列表
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(LandlordSpecialtyRecord landlordSpecialtyRecord)
    {
        startPage();
        List<LandlordSpecialtyRecord> list = landlordSpecialtyRecordService.selectLandlordSpecialtyRecordList(landlordSpecialtyRecord);
        return getDataTable(list);
    }

    /**
     * 导出订单列表
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:export")
    @Log(title = "订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(LandlordSpecialtyRecord landlordSpecialtyRecord)
    {
        List<LandlordSpecialtyRecord> list = landlordSpecialtyRecordService.selectLandlordSpecialtyRecordList(landlordSpecialtyRecord);
        ExcelUtil<LandlordSpecialtyRecord> util = new ExcelUtil<LandlordSpecialtyRecord>(LandlordSpecialtyRecord.class);
        return util.exportExcel(list, "订单数据");
    }

    /**
     * 新增订单
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存订单
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:add")
    @Log(title = "订单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(LandlordSpecialtyRecord landlordSpecialtyRecord)
    {
        LandlordSpecialtyRecord a =landlordSpecialtyRecordService.selectSpecialtyId(landlordSpecialtyRecord);
        Long value =a.specialtyId;
        System.out.println(value);
        landlordSpecialtyRecord.specialtyId=value;
        return toAjax(landlordSpecialtyRecordService.insertLandlordSpecialtyRecord(landlordSpecialtyRecord));
    }

    /**
     * 修改订单
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        LandlordSpecialtyRecord landlordSpecialtyRecord = landlordSpecialtyRecordService.selectLandlordSpecialtyRecordById(id);
        mmap.put("landlordSpecialtyRecord", landlordSpecialtyRecord);
        return prefix + "/edit";
    }

    /**
     * 修改保存订单
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:edit")
    @Log(title = "订单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(LandlordSpecialtyRecord landlordSpecialtyRecord)
    {
        System.out.println(landlordSpecialtyRecord);
        return toAjax(landlordSpecialtyRecordService.updateLandlordSpecialtyRecord(landlordSpecialtyRecord));
    }

    /**
     * 删除订单
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:remove")
    @Log(title = "订单", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(landlordSpecialtyRecordService.deleteLandlordSpecialtyRecordByIds(ids));
    }

    /**
     * 统计特产订单
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:eCharts")
    @GetMapping("/eCharts")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/eCharts";
    }

    @RequiresPermissions("landlordspecialtyorder:specialtyorder:eCharts")
    @Log(title = "特产订单统计", businessType = BusinessType.INSERT)
    @PostMapping("/eCharts")
    @ResponseBody
    public List<Integer> statisticsData()
    {
        List<Integer> list = landlordSpecialtyRecordService.getMonthlyLandlordSpecialtyRecordIncrement();
        return list;
    }

    /**
     * 查询评论
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:querycomment")
    @GetMapping("/querycomment/{id}")
    public String querycomment(@PathVariable("id") Long id, ModelMap mmap)
    {
        System.out.println(id);
        LandlordSpecialtyRecord landlordSpecialtyRecord = landlordSpecialtyRecordService.selectLandlordSpecialtyCommentRecordById(id);
        System.out.println(landlordSpecialtyRecord);
        if(landlordSpecialtyRecord==null){
            System.out.println("hello___________________________________");
            landlordSpecialtyRecord = landlordSpecialtyRecordService.selectLandlordSpecialtyCommentRecordById((long) 0);
            mmap.put("landlordSpecialtyRecord",landlordSpecialtyRecord);

            System.out.println(mmap);

        }
        else{
            mmap.put("landlordSpecialtyRecord", landlordSpecialtyRecord);
        }
        return prefix + "/querycomment";
    }

    /**
     * 保存评论
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:querycomment")
    @Log(title = "订单", businessType = BusinessType.UPDATE)
    @PostMapping("/querycomment")
    @ResponseBody
    public AjaxResult querycommentSave(LandlordSpecialtyRecord landlordSpecialtyRecord)
    {
        return toAjax(landlordSpecialtyRecordService.updateLandlordSpecialtyCommentRecord(landlordSpecialtyRecord));

    }

    /**
     * 查询所有评论
     * @return
     */
    @RequiresPermissions("landlordspecialtyorder:specialtyorder:queryallcomment")
    @GetMapping("/queryallcomment/{id}")
    public String queryallcommentPage(@PathVariable("id") Long id, ModelMap mmap) {
        System.out.println(id);
        mmap.put("id",id);
        return prefix+ "/queryallcomment";
    }

    @RequiresPermissions("landlordspecialtyorder:specialtyorder:queryallcomment")
    @Log(title = "全部评论", businessType = BusinessType.UPDATE)
    @PostMapping("/queryallcomment")
    @ResponseBody
    public String queryallcomment(HttpServletRequest request)
    {
        Long id= Long.valueOf(request.getParameter("id"));
        System.out.println("id is:"+id);
        List<Long> idlist =  landlordSpecialtyRecordService.getDataIdList(id);

        if(idlist.isEmpty()){
            System.out.println("idlist is null---------------------------");
            Long ids = Long.valueOf(0);
            idlist = landlordSpecialtyRecordService.getDataIdList(ids);
        }
        System.out.println(idlist);
        JSONObject res=new JSONObject();
        JSONArray s=new JSONArray();
        for(Long idnew:idlist){
            JSONObject tmp=new JSONObject();
            String a = String.valueOf(idnew);
            tmp.put("id",a);
            String b = String.valueOf(landlordSpecialtyRecordService.getRoomRecordId(idnew)) ;
            tmp.put("room_record_id",b);
            String e = String.valueOf(landlordSpecialtyRecordService.getScore2(idnew)) ;
            tmp.put("score",e);
            String c = landlordSpecialtyRecordService.getComment2(idnew) ;
            tmp.put("comment",c);
            String d = landlordSpecialtyRecordService.getPhoto2(idnew) ;
            tmp.put("photo",d);
            s.add(tmp);
        }
        res.put("data",s);
        System.out.println(res);
        return res.toString();
    }
}