package com.ruoyi.web.system.controller;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.json.JSONObject;
import com.ruoyi.framework.web.domain.server.Sys;
import com.ruoyi.web.system.domain.BuyRoom;
import com.ruoyi.web.system.mapper.HouseRoomMapper;
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

   //@RequiresPermissions("system:room:view")
    @GetMapping()
    public String room()
    {
        return prefix + "/room";
    }

    /**
     * 查询房子管理列表
     */
    //@RequiresPermissions("system:room:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(HouseRoom houseRoom)
    {
        startPage();

        if(houseRoom.getPricePerDayUp()!=null&&houseRoom.getPricePerDayDown()!=null&&(houseRoom.getPricePerDayUp()<houseRoom.getPricePerDayDown())){
            int down=houseRoom.getPricePerDayUp();
            houseRoom.setPricePerDayUp(houseRoom.getPricePerDayDown());
            houseRoom.setPricePerDayDown(down);
        }

        if(houseRoom.getHouseName()!=null&&(!houseRoom.getHouseName().equals(""))){
            List<String> idList=houseRoomService.getHouseIdByHouseName(houseRoom);
            List<HouseRoom> ans = new ArrayList<>();
            System.out.println(idList);
            for(String id:idList){
                houseRoom.setHouseId(Long.parseLong(id));
                List<HouseRoom> li=houseRoomService.selectHouseRoomList(houseRoom);;
                for(HouseRoom bb: li){
                    ans.add(bb);
                }
            }
            for(HouseRoom buyroom1: ans){
                buyroom1.houseName=houseRoomService.getHouseNameById(buyroom1.getHouseId());
            }
            return getDataTable(ans);
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
    //@RequiresPermissions("system:room:export")
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
    //@RequiresPermissions("system:room:add")
    @Log(title = "房子管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(HouseRoom houseRoom)
    {
        List<String> idList=houseRoomService.getHouseIdByExactHouseName(houseRoom);
        System.out.println(houseRoom.getHouseName()+"    %%%%%%%%%%");
        if(idList.size()!=1){
            AjaxResult res=new AjaxResult();
            res.put("msg","民宿名称有误");
            return res;
        }
        System.out.println("yyyyyyyyyyyyyyyyyhhhhhhhhhhhhhhhhhhhhh&&&&&&&&&&&&&7");
        for(String id:idList) {
            Long houseId=Long.parseLong(id);
            houseRoom.setHouseId(houseId);
        }
        return toAjax(houseRoomService.insertHouseRoom(houseRoom));
    }

    /**
     * 修改房子管理
     */
    //@RequiresPermissions("system:room:edit")
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
    //@RequiresPermissions("system:room:edit")
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
    //@RequiresPermissions("system:room:remove")
    @Log(title = "房子管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(houseRoomService.deleteHouseRoomByIds(ids));
    }

    //@RequiresPermissions("system:room:statistics")
    @GetMapping("/statistics")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/statistics";
    }

    //@RequiresPermissions("system:room:statistics")
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

    @PostMapping("/frontPageUp")
    @ResponseBody
    public String frontPageUp()
    {
        System.out.println("这里是后端");
        JSONObject res=new JSONObject();
        res.put("allUser",houseRoomService.getAllUser());
        res.put("allHouse",houseRoomService.getAllHouse());
        res.put("allBill",houseRoomService.getAllBill());
        res.put("allSpecialty",houseRoomService.getAllSpecialty());
        return res.toString();
    }

    @PostMapping("/frontPageGraph")
    @ResponseBody
    public String frontPageGraph()
    {
        System.out.println("这里是后端");
        HouseRoom houseRoom=new HouseRoom();
        JSONObject res=new JSONObject();
        res.put("done",houseRoomService.getDone(houseRoom.userId));
        res.put("undo",houseRoomService.getUndo(houseRoom.userId));
        res.put("say",houseRoomService.getSay(houseRoom.userId));
        res.put("unsay",houseRoomService.getUnSay(houseRoom.userId));
        res.put("todo1",houseRoomService.getToDoDone(houseRoom.userId));
        res.put("todo2",houseRoomService.getToDoUndo(houseRoom.userId));
        return res.toString();
    }

    @PostMapping("/frontPageMessage")
    @ResponseBody
    public String frontPageMessage()
    {
        System.out.println("这里是后端");
        HouseRoom houseRoom=new HouseRoom();
        JSONObject res=new JSONObject();
        JSONObject.JSONArray room=new JSONObject.JSONArray();
        List<Long> idList =houseRoomService.getIdFromRoomRecord();
        System.out.println("idlist:"+idList);
        for(Long id:idList){
            JSONObject li=new JSONObject();
            li.put("name",houseRoomService.getNameFromRoomRecordById(id));
            li.put("time",houseRoomService.getTimeFromRoomRecordById(id));
            li.put("landlord",houseRoomService.getLandlordFromRoomRecordById(id));
            li.put("roomNumber",houseRoomService.getRoomNumberFromRoomRecordById(id));
            room.add(li);
        }
        res.put("room",room);
        JSONObject.JSONArray specialty=new JSONObject.JSONArray();
        idList=houseRoomService.getIdFromSpecialtyRecord();
        for(Long id:idList){
            JSONObject li=new JSONObject();
            li.put("name",houseRoomService.getNameFromSpecialtyRecordById(id));
            li.put("time",houseRoomService.getTimeFromSpecialtyRecordById(id));
            li.put("landlord",houseRoomService.getLandlordFromSpecialtyRecordById(id));
            li.put("specialtyName",houseRoomService.getSpecialtyNameFromSpecialtyRecordById(id));
            li.put("number",houseRoomService.getNumberFromSpecialtyRecordById(id));
            specialty.add(li);
        }
        res.put("specialty",specialty);
        List<String> address=houseRoomService.getHouseAddress();
        String[] province= new String[]{"河北","山西","辽宁","吉林","黑龙江","江苏","浙江",
                "安徽","福建","江西","山东","河南","湖北","湖南","广东","海南","四川","贵州",
                "云南","陕西","甘肃","青海","台湾","内蒙古","广西","西藏","宁夏","新疆","北京",
                "天津","上海","重庆","香港","澳门","南海"};
        int cnt=0;
        JSONObject.JSONArray location=new JSONObject.JSONArray();
        for(int i=0;i<province.length;i++){
            cnt=0;
            for(String add:address){
                if(add.contains(province[i]))cnt++;
            }
            JSONObject li=new JSONObject();
            li.put("address",province[i]);
            li.put("number",cnt);
            location.add(li);
        }
        res.put("distribute",location);
        return res.toString();
    }
}
