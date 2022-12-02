package com.ruoyi.yk.controller;


import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;

import com.ruoyi.framework.web.domain.server.Sys;
import com.ruoyi.yk.domain.HouseSpecialty;
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

    private String prefix = "yk/top_speciality";


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
        System.out.println("call list");

        startPage();

        List list = new ArrayList();
        Connection connection = null;
        PreparedStatement pstmt = null;
        String sql = "SELECT HS.id, HS.specialty_name, HS.price, count(*) as sale, HS.description, LH.house_name "
                + "FROM house_specialty as HS join client_specialty_record as CSR on HS.id = CSR.specialty_id "
                + "join landlord_house as LH on LH.id = HS.house_id "
                + "GROUP BY HS.id "
                + "ORDER BY  sale DESC;";
        System.out.println(sql);
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
        return getDataTable(list);
    }
}
