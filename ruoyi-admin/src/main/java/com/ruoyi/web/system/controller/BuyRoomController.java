package com.ruoyi.system.controller;

import java.sql.*;
import java.util.List;

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
import com.ruoyi.system.domain.BuyRoom;
import com.ruoyi.system.service.IBuyRoomService;
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



    @PostMapping("/ff")
    @ResponseBody
    public String ff(HttpServletRequest request) throws SQLException {
        String sj="";
        sj="hhhhhhhhhhhhhhhh";
        System.out.println("fff");
        String houseId=request.getParameter("houseId");
        String roomNumber=request.getParameter("roomNumber");
        String price=request.getParameter("price");
        System.out.println(houseId+"%%%%");
        System.out.println(roomNumber+"%%%");
        System.out.println(price+"%%%%%%%%");
        houseId="4";
        roomNumber="204";
        price="100";
        String roomId="";

        JSONObject res=new JSONObject();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            //Class.forName("dbDrive");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            res.put("result_code", 1);
            return res.toString();
        }
        System.out.println("JDBC done");

       // try {
            String url="jdbc:mysql://www.ylxteach.net:3366/xm05_2022?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8";
            String username="Administrator";
            String password="XWClassroom20202023";
           Connection conn=DriverManager.getConnection(url,username,password);
           conn.close();
            //Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbproject?user=DataUser&password=301217&useUnicode=true&characterEncoding=UTF-8");
            //Connection conn = DriverManager.getConnection(" jdbc:mysql://www.ylxteach.net:3366/xm05_2022?user=Administrator&password=XWClassroom20202023&useUnicode=true&characterEncoding=utf8");
//            System.out.println("statement complete");
//            Statement statement = conn.createStatement();
//            System.out.println("sql connected");
//            String sql = "select * from house_room where house_id = "+houseId+" and room_number = " + roomNumber;
//            System.out.println("command:" + sql);
//            ResultSet rs=statement.executeQuery(sql);
//            System.out.println("66666666666");
//
//            while(rs.next()){
//                int s=Integer.parseInt(rs.getString("is_free"));
//                roomId=rs.getString("id");
//                System.out.println("s:"+s);
//                if(s==0){
//                    res.put("result_code",1);
//                    res.put("result_msg","yghdknfbm");
//                    System.out.println("return here");
//                    String ans=res.toString();
//                    System.out.println(ans);
//                    //return "jjjjjjj";
//                }
//            }
//
//            sql="insert into client_room_record (client_number,room_id,price,is_paid,is_done) values (5,"+roomId+","+price+",1,0)";
//            statement.executeUpdate(sql);
//            System.out.println("command:" + sql);
//
//            sql="update house_room set is_free=0 where id = "+roomId;
//            statement.executeUpdate(sql);
//            System.out.println("command:" + sql);
//
//            conn.close();


        //}
//        catch (SQLException e) {
//            e.printStackTrace();
//            res.put("result_code", 1);
//            return res.toString();
//        }
        res.put("result_code", 0);
        res.put("result_msg","预订成功");
        System.out.println("wzzlzlzlz");
        return res.toString();
    }
}
