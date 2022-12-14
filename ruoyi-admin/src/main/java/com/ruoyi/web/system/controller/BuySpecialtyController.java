package com.ruoyi.web.system.controller;

import java.math.BigDecimal;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.ruoyi.common.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.web.system.domain.BuySpecialty;
import com.ruoyi.web.system.service.IBuySpecialtyService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import javax.servlet.http.HttpServletRequest;

/**
 * 特产订购Controller
 * 
 * @author pch
 * @date 2022-12-14
 */
@Controller
@RequestMapping("/system/buySpecialty")
public class BuySpecialtyController extends BaseController
{
    private String prefix = "system/buySpecialty";

    @Autowired
    private IBuySpecialtyService buySpecialtyService;

    @RequiresPermissions("system:buySpecialty:view")
    @GetMapping()
    public String buySpecialty()
    {
        return prefix + "/buySpecialty";
    }

    /**
     * 查询特产订购列表
     */
    @RequiresPermissions("system:buySpecialty:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BuySpecialty buySpecialty)
    {
        startPage();
        List<BuySpecialty> list = buySpecialtyService.selectBuySpecialtyList(buySpecialty);
        for(BuySpecialty b:list){
            b.setHouseName(buySpecialtyService.getHouseNameById(b.getHouseId()));
        }
        return getDataTable(list);
    }

    /**
     * 导出特产订购列表
     */
    @RequiresPermissions("system:buySpecialty:export")
    @Log(title = "特产订购", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BuySpecialty buySpecialty)
    {
        List<BuySpecialty> list = buySpecialtyService.selectBuySpecialtyList(buySpecialty);
        ExcelUtil<BuySpecialty> util = new ExcelUtil<BuySpecialty>(BuySpecialty.class);
        return util.exportExcel(list, "特产订购数据");
    }

    /**
     * 新增特产订购
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存特产订购
     */
    @RequiresPermissions("system:buySpecialty:add")
    @Log(title = "特产订购", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BuySpecialty buySpecialty)
    {
        return toAjax(buySpecialtyService.insertBuySpecialty(buySpecialty));
    }

    /**
     * 修改特产订购
     */
    @RequiresPermissions("system:buySpecialty:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        BuySpecialty buySpecialty = buySpecialtyService.selectBuySpecialtyById(id);
        mmap.put("buySpecialty", buySpecialty);
        return prefix + "/edit";
    }

    /**
     * 修改保存特产订购
     */
    @RequiresPermissions("system:buySpecialty:edit")
    @Log(title = "特产订购", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BuySpecialty buySpecialty)
    {
        return toAjax(buySpecialtyService.updateBuySpecialty(buySpecialty));
    }

    /**
     * 删除特产订购
     */
    @RequiresPermissions("system:buySpecialty:remove")
    @Log(title = "特产订购", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(buySpecialtyService.deleteBuySpecialtyByIds(ids));
    }


    @RequiresPermissions("system:buySpecialty:buy")
    @GetMapping("/buy/{id}")
    public String buypage(@PathVariable("id") Long id,ModelMap mmap)
    {
        //userService.checkUserAllowed(userService.selectUserById(userId));
        //mmap.put("user", userService.selectUserById(userId));
        String suf="&id="+id.toString();
        System.out.println("buypage controller");
        return prefix + "/buy";
    }

    @RequiresPermissions("system:buySpecialty:statistics")
    @GetMapping("/statistics")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/statistics";
    }

    @RequiresPermissions("system:buySpecialty:statistics")
    @Log(title = "特产统计", businessType = BusinessType.INSERT)
    @PostMapping("/statistics")
    @ResponseBody
    public String statisticsData()
    {
        System.out.println("进入buySpecialty sta");
        JSONObject res=new JSONObject();
        JSONArray s=new JSONArray();
        List<String> nameList=buySpecialtyService.getName();
        for(String name : nameList){
            JSONObject tmp=new JSONObject();
            tmp.put("name",name);
            tmp.put("record",buySpecialtyService.getSellNumber(name));
            s.add(tmp);
        }
        res.put("house",s);
        return res.toString();
    }

    @PostMapping("/getSpecialtyInfo")
    @ResponseBody
    public String getSpecialtyInfo(HttpServletRequest request){
        String idd=request.getParameter("id");
        System.out.println("id:"+idd);
        Long id=Long.parseLong(idd);
        //specialtyName,houseId,description,price,inventory,phone,mailbox,houseName,imageUrl;
        System.out.println("id:"+id);
        JSONObject res=new JSONObject();
        BuySpecialty buySpecialty=buySpecialtyService.selectBuySpecialtyById(id);
        res.put("specialtyName",buySpecialty.getSpecialtyName());
        res.put("houseId",buySpecialty.getHouseId());
        res.put("description",buySpecialty.getDescription());
        res.put("price",buySpecialty.getPrice());
        res.put("inventory",buySpecialty.getInventory());
        res.put("imageUrl",buySpecialty.getImageUrl());
        res.put("houseName",buySpecialtyService.getHouseNameById(buySpecialty.getHouseId()));
        res.put("phone",buySpecialtyService.getPhoneById(buySpecialty.getHouseId()));
        res.put("mailbox",buySpecialtyService.getMailboxById(buySpecialty.getHouseId()));
        return res.toString();
    }

    @PostMapping("/getComment")
    @ResponseBody
    public String getComment(HttpServletRequest request){
        String id=request.getParameter("id");
        System.out.println("运行到getComment-----------specialty-------------controller,id="+id);
        JSONObject res=new JSONObject();
        Long idd=Long.parseLong(id);
        List<Long> recordId;
        List<Double> score;
        recordId=buySpecialtyService.getRecordId(idd);
        score=buySpecialtyService.getScore(idd);
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
            li.put("name",buySpecialtyService.getUserName(i));
            li.put("comment",buySpecialtyService.getUserComment(i));
            s.add(li);
            System.out.println("第"+i+"条评论："+li);
        }
        System.out.println("准备加入res");
        res.put("allComment",s);
        System.out.println("s已经加入res");
        res.put("result_code",0);
        return res.toString();
    }
}
