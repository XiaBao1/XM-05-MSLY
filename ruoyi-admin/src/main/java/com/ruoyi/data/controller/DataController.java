package com.ruoyi.data.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.data.domain.Data;
import com.ruoyi.data.service.IDataService;
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
 * 驾驶舱Controller
 *
 * @author ruoyi
 * @date 2022-12-06
 */
@Controller
@RequestMapping("/data/data")
public class DataController extends BaseController{
    private String prefix = "data";



    @RequiresPermissions("data:data:view")
    @GetMapping()
    public String dataview()
    {
        return prefix + "/data";
    }

}