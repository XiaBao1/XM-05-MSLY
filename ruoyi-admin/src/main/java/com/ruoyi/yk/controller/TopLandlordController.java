package com.ruoyi.yk.controller;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.yk.domain.TopHouseSpecialty;
import com.ruoyi.yk.domain.TopLandlordHouse;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/yk/top_landlord")
public class TopLandlordController extends BaseController {
    private final String dbUser = "Administrator";
    private final String dbPassword = "XWClassroom20202023";
    private final String dbUrl = "jdbc:mysql://www.ylxteach.net:3366/xm05_2022";


    private final String prefix = "yk/top_landlord";

    @RequiresPermissions("yk:top_landlord:view")
    @GetMapping()
    public String top_speciality()
    {
        return prefix + "/top_landlord";
    }


    @RequiresPermissions("yk:top_landlord:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list() {
        startPage();
        List<TopLandlordHouse> list = getTopLandlordList();
        return getDataTable(list);
    }

    @Log(title = "热门民宿", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:top_landlord:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysUser user)
    {
        List<TopLandlordHouse> list = getTopLandlordList();
        ExcelUtil<TopLandlordHouse> util = new ExcelUtil<TopLandlordHouse>(TopLandlordHouse.class);
        return util.exportExcel(list, "热门民宿");
    }


    @RequiresPermissions("yk:top_landlord:statistics")
    @GetMapping("/statistics")
    public String statistics(ModelMap mmap)
    {
        return prefix + "/statistics";
    }

    @RequiresPermissions("yk:top_landlord:statistics")
    @Log(title = "民宿统计", businessType = BusinessType.OTHER)
    @PostMapping("/statistics")
    @ResponseBody
    public JSONObject statisticsData()
    {
        List<TopLandlordHouse> topSpecialityList = getTopLandlordList();
        JSONArray saleArray = new JSONArray();
        JSONArray nameArray = new JSONArray();
        JSONObject json = new JSONObject();

        for (TopLandlordHouse item : topSpecialityList) {
            saleArray.add(item.getSale());
            nameArray.add(item.getHouseName());
        }

        json.put("sale", saleArray);
        json.put("name", nameArray);

        return json;
    }

    private List<TopLandlordHouse> getTopLandlordList() {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        String orderBy = pageDomain.getOrderBy();

        List<TopLandlordHouse> list = new ArrayList<TopLandlordHouse>();
        Connection connection = null;
        PreparedStatement pstmt = null;
        String sql = "select LH.*, count(CRR.id) as sale " +
                "from landlord_house LH " +
                "   left JOIN house_room HR on LH.id = HR.house_id " +
                "   left JOIN client_room_record CRR on HR.id = CRR.room_id " +
                "GROUP BY LH.id ";
        if (orderBy != null && ! orderBy.isEmpty()) {
            sql += "order by " + orderBy;
        }
        // System.out.println(sql);
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            pstmt = connection.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TopLandlordHouse item = new TopLandlordHouse();
                item.setId(rs.getLong("id"));
                item.setAddress(rs.getString("address"));
                item.setHouseName(rs.getString("house_name"));
                item.setHostNumber(rs.getLong("host_number"));
                item.setScore(rs.getLong("score"));
                item.setSale(rs.getLong("sale"));
                item.setImageUrl(rs.getString("image_url"));

                list.add(item);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                pstmt.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // System.out.println("return list size: " + list.size());

        return list;
    }

}
