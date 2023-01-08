package com.ruoyi.yk.controller;


import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.framework.shiro.service.SysPasswordService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/wx/user")
public class WxProfileController extends BaseController {


    @Autowired
    private ISysUserService userService;

    @Autowired
    private SysPasswordService passwordService;

    @PostMapping("profile")
    @ResponseBody
    public AjaxResult profile()
    {
        SysUser user = getSysUser();

        return success(user);
    }
}
