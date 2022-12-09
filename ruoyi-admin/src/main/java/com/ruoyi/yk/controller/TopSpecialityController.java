package com.ruoyi.yk.controller;


import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;

import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.domain.server.Sys;
import com.ruoyi.yk.domain.HouseSpecialty;
import com.ruoyi.yk.domain.LandlordHouse;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;
import java.sql.*;


@Controller
@RequestMapping("/yk/top_speciality")
public class TopSpecialityController extends BaseController {

    private final String dbUser = "Administrator";
    private final String dbPassword = "XWClassroom20202023";
    private final String dbUrl = "jdbc:mysql://www.ylxteach.net:3366/xm05_2022";

    private final String prefix = "yk/top_speciality";


    @RequiresPermissions("yk:top_speciality:view")
    @GetMapping()
    public String top_speciality()
    {
        return prefix + "/top_speciality";
    }



    @RequiresPermissions("yk:top_speciality:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list() {
        startPage();
        List list = getTopSpecialityList();
        return getDataTable(list);
    }

    @Log(title = "热门特产", businessType = BusinessType.EXPORT)
    @RequiresPermissions("yk:top_speciality:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export()
    {
        List<HouseSpecialty> list = getTopSpecialityList();
        ExcelUtil<HouseSpecialty> util = new ExcelUtil<HouseSpecialty>(HouseSpecialty.class);
        return util.exportExcel(list, "热门特产");
    }

    private List getTopSpecialityList() {
        List list = new ArrayList();
        Connection connection = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT HS.id, HS.specialty_name, HS.price, count(CSR.specialty_id ) as sale, HS.description, HS.inventory, HS.house_id "
                + "FROM house_specialty as HS left join client_specialty_record as CSR on HS.id = CSR.specialty_id "
                + "join landlord_house as LH on LH.id = HS.house_id "
                + "GROUP BY HS.id "
                + "ORDER BY  sale DESC;";
        // System.out.println(sql);
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            pstmt = connection.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                HouseSpecialty item = new HouseSpecialty();
                item.setId(rs.getLong("id"));
                item.setSale(rs.getLong("sale"));
                item.setPrice(rs.getDouble("price"));
                item.setSpecialtyName(rs.getString("specialty_name"));
                item.setDescription(rs.getString("description"));
                item.setInventory(rs.getInt("inventory"));
                item.setHouseId(rs.getLong("house_id"));

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
        System.out.println("return list size: " + list.size());
        return list;
    }
}
