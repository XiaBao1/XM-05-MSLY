package com.ruoyi.web.system.controller;

import java.math.BigDecimal;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import com.alibaba.fastjson.JSONArray;
import com.ruoyi.common.json.JSONObject;
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
import com.ruoyi.web.system.domain.BuyRoom;
import com.ruoyi.web.system.service.IBuyRoomService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import springfox.documentation.spring.web.json.Json;


import javax.servlet.http.HttpServletRequest;

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
        for(BuyRoom buyroom1: list){
            buyroom1.houseName=buyRoomService.getHouseNameById(buyroom1.getHouseId());
        }
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



//    @RequiresPermissions("system:buyroom:buy")
//    @GetMapping("/buy/{id}")
//    public String buypage(@PathVariable("id") Long id, ModelMap mmap)
//    {
//        //userService.checkUserAllowed(userService.selectUserById(userId));
//        //mmap.put("user", userService.selectUserById(userId));
//        return prefix + "/buy";
//    }


    @RequiresPermissions("system:buyroom:buy")
    @GetMapping("/buy/{id}")
    public String buypage(@PathVariable("id") Long id,ModelMap mmap)
    {
        //userService.checkUserAllowed(userService.selectUserById(userId));
        //mmap.put("user", userService.selectUserById(userId));
        String suf="&id="+id.toString();
        System.out.println("buypage controller");
        return prefix + "/buy";
    }

    @RequiresPermissions("system:buyroom:infopage")
    @GetMapping("/infopage/{id}")
    public String infoPage(@PathVariable("id") Long id,ModelMap mmap)
    {
        //userService.checkUserAllowed(userService.selectUserById(userId));
        //mmap.put("user", userService.selectUserById(userId));
        String suf="&id="+id.toString();
        System.out.println("infopage controller");
        return prefix + "/infopage";
    }


    //@RequiresPermissions("system:buyroom:getRoomInfo")
    @PostMapping("/getRoomInfo")
    @ResponseBody
    public String getRoomNumber(HttpServletRequest request)
    {
        String id=request.getParameter("id");
        System.out.println("运行到controller,id="+id);
        Long idd=Long.parseLong(id);
        BuyRoom bb=buyRoomService.selectBuyRoomById(idd);
        JSONObject res=new JSONObject();
        res.put("roomNumber",bb.getRoomNumber());
        res.put("pricePerDay",bb.getPricePerDay());
        res.put("houseId",bb.getHouseId());
        res.put("standard",bb.getStandard());
        res.put("isFree",bb.getIsFree());
        res.put("houseName",buyRoomService.getHouseNameById(bb.getHouseId()));
        res.put("imageUrl",buyRoomService.getImageUrlById(bb.getHouseId()));
        Long hostNumber=buyRoomService.getHostNumber(bb.getHouseId());
        System.out.println("hostNumber="+hostNumber);
        res.put("phoneNumber",buyRoomService.getPhoneNumber(hostNumber));
        res.put("mailBox",buyRoomService.getMailBox(hostNumber));
        return res.toString();
        //return buyRoomService.selectBuyRoomById(idd);
    }

    @PostMapping("/pay")
    @ResponseBody
    public String pay(HttpServletRequest request){
        String id=request.getParameter("id");
        System.out.println("运行到pay-----------controller,id="+id);
        Long idd=Long.parseLong(id);
        JSONObject res=new JSONObject();
        System.out.println("接下来检查输入格式");
        int year=Integer.parseInt(request.getParameter("year"));
        if(request.getParameter("month").isEmpty()){
            res.put("result_code",1);
            res.put("result_msg","入住月份不能为空");
            return res.toString();
        }
        int month=Integer.parseInt(request.getParameter("month"));
        if(request.getParameter("day").isEmpty()){
            res.put("result_code",1);
            res.put("result_msg","入住日期不能为空");
            return res.toString();
        }
        int day=Integer.parseInt(request.getParameter("day"));
        if(request.getParameter("hour").isEmpty()){
            res.put("result_code",1);
            res.put("result_msg","入住时刻不能为空");
            return res.toString();
        }
        int hour=Integer.parseInt(request.getParameter("hour"));
        if(request.getParameter("last").isEmpty()){
            res.put("result_code",1);
            res.put("result_msg","入住时长不能为空");
            return res.toString();
        }
        int last=Integer.parseInt(request.getParameter("last"));
        if(request.getParameter("pwd").isEmpty()||request.getParameter("pwd").length()!=6){
            res.put("result_code",1);
            res.put("result_msg","密码错误");
            return res.toString();
        }
        int pwd=Integer.parseInt(request.getParameter("pwd"));

        //判断时间
        Date cur = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
        System.out.println(dateFormat.format(cur));
        int curYear=cur.getYear();
        int curMonth=cur.getMonth();
        int curDay=cur.getDay();

        if(curYear>year){
            res.put("result_code",1);
            res.put("result_msg","请填写正确（未来）的日期");
            return res.toString();
        }
        else if(curYear==year&&curMonth>month){
            res.put("result_code",1);
            res.put("result_msg","请填写正确（未来）的日期");
            return res.toString();
        }
        else if(curYear==year&&curMonth==month&&curDay>=day){
            res.put("result_code",1);
            res.put("result_msg","请填写正确（未来）的日期");
            return res.toString();
        }
        int[] lon=new int[]{1,31,28,31,30,31,30,31,31,30,31,30,31};
        if(lon[month]<day){
            res.put("result_code",1);
            res.put("result_msg","请填写正确（未来）的日期");
            return res.toString();
        }

        //计算时间
        int toYear=year,toMonth=month,toDay=day;
        for(int i=0;i<last;i++){
            if(toDay<lon[toMonth])toDay++;
            else{
                toDay=1;
                if(toMonth<12) toMonth++;
                else{
                    toYear=2024;
                    toMonth=1;
                }
            }
        }

        //比较余额
        BuyRoom bb=new BuyRoom();
        Long money=buyRoomService.getMoney(bb.userId);
        Long cost=buyRoomService.getPriceById(idd);
        money=money-cost*last;
        if(money<0){
            res.put("result_code",1);
            res.put("result_msg","余额不足");
            return res.toString();
        }

        //数据库操作 先判断当前isfree
        int fl=buyRoomService.getIsFreeById(idd);
        if(fl==0){
            res.put("result_code",1);
            res.put("result_msg","此房间已被预约");
            return res.toString();
        }
        System.out.println("开始操作数据库");
        buyRoomService.setIsFreeById(idd);
        buyRoomService.updateMoney(money);
        bb.setId(idd);
        bb.setPricePerDay(cost);
        String timein=String.valueOf(year)+"-"+month+"-"+day+" "+hour+":00:00";
        String timeout=String.valueOf(toYear)+"-"+toMonth+"-"+toDay+" "+hour+":00:00";
        bb.setStandard(timein);//借用
        bb.setRoomNumber(timeout);//借用
        Date date=new Date();
        SimpleDateFormat dateFormat1= new SimpleDateFormat("yyyy-MM-dd HH:MM:SS");
        System.out.println(dateFormat.format(date));
        String buy_time=dateFormat.format(date);
        // String buy_time=date.getYear()+"-"+date.getMonth()+"-"+date.getDay()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
        System.out.println(buy_time+"   &&&&&&&&&&&");
        bb.setBuyTime(buy_time);
        buyRoomService.insertRecord(bb);


        //buyRoomService.pay(idd);
        res.put("result_code",0);
        res.put("result_msg","预定成功");
        return res.toString();
    }

    @PostMapping("/getComment")
    @ResponseBody
    public String getComment(HttpServletRequest request){
        String id=request.getParameter("id");
        System.out.println("运行到getComment-----------controller,id="+id);
        JSONObject res=new JSONObject();
        Long idd=Long.parseLong(id);
        List<Long> recordId;
        List<Double> score;
        recordId=buyRoomService.getRecordId(idd);
        score=buyRoomService.getScore(idd);
        if(score.isEmpty()){
            res.put("score",-1);
        }
        else{
            Double sum=new Double(0);
            Double num=new Double(0);
            for(Double i:score){
                sum=sum+i;
                num=num+1;
            }
            Double ave=sum/num;
            double AVE=ave.doubleValue();
            BigDecimal two=new BigDecimal(AVE);
            AVE=two.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
            res.put("score",AVE);
        }
        res.put("scoreNumber",score.size());
        System.out.println("reordId:"+recordId);

        JSONArray s=new JSONArray();

        for(Long i:recordId){
            JSONObject li=new JSONObject();
            li.put("name",buyRoomService.getUserName(i));
            li.put("comment",buyRoomService.getUserComment(i));
            s.add(li);
            System.out.println("第"+i+"条评论："+li);
        }
        System.out.println("准备加入res");
        res.put("allComment",s);
        System.out.println("s已经加入res");
        res.put("result_code",0);
        return res.toString();
    }

    @RequiresPermissions("system:buyroom:statistics")
    @GetMapping("/statistics")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/statistics";
    }

    @RequiresPermissions("system:buyroom:statistics")
    @Log(title = "民宿订购统计", businessType = BusinessType.INSERT)
    @PostMapping("/statistics")
    @ResponseBody
    public String statisticsData()
    {
        System.out.println("进入buyroom sta");
        JSONObject res=new JSONObject();
        JSONArray s=new JSONArray();
        List<String> nameList=buyRoomService.getName();
        for(String name : nameList){
            JSONObject tmp=new JSONObject();
            tmp.put("name",name);
            tmp.put("record",buyRoomService.getSellNumber(name));
            s.add(tmp);
        }
        res.put("house",s);
        return res.toString();
    }

}
