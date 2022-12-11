package com.ruoyi.usertodolist.service.impl;

import java.util.*;

import com.ruoyi.common.core.domain.entity.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.usertodolist.mapper.UserTodolistMapper;
import com.ruoyi.usertodolist.domain.UserTodolist;
import com.ruoyi.usertodolist.service.IUserTodolistService;
import com.ruoyi.common.core.text.Convert;

/**
 * 我的待办Service业务层处理
 * 
 * @author yyt
 * @date 2022-12-08
 */
@Service
public class UserTodolistServiceImpl implements IUserTodolistService 
{
    @Autowired
    private UserTodolistMapper userTodolistMapper;

    /**
     * 查询我的待办
     * 
     * @param id 我的待办主键
     * @return 我的待办
     */
    @Override
    public UserTodolist selectUserTodolistById(Long id)
    {
        return userTodolistMapper.selectUserTodolistById(id);
    }

    /**
     * 查询我的待办列表
     * 
     * @param userTodolist 我的待办
     * @return 我的待办
     */

//    public List<UserTodolist> selectUserTodolistList(UserTodolist userTodolist)
//    {
//        return UserTodolistMapper.selectUserTodolistList(userTodolist);
//    }
    @Override
    public List<UserTodolist> selectUserTodolistList(UserTodolist userTodolist)
    {
        return userTodolistMapper.selectUserTodolistList(userTodolist);
    }
    /**
     * 新增我的待办
     * 
     * @param userTodolist 我的待办
     * @return 结果
     */
    @Override
    public int insertUserTodolist(UserTodolist userTodolist)
    {
        return userTodolistMapper.insertUserTodolist(userTodolist);
    }

    /**
     * 修改我的待办
     * 
     * @param userTodolist 我的待办
     * @return 结果
     */
    @Override
    public int updateUserTodolist(UserTodolist userTodolist)
    {
        return userTodolistMapper.updateUserTodolist(userTodolist);
    }

    /**
     * 批量删除我的待办
     * 
     * @param ids 需要删除的我的待办主键
     * @return 结果
     */
    @Override
    public int deleteUserTodolistByIds(String ids)
    {
        return userTodolistMapper.deleteUserTodolistByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除我的待办信息
     * 
     * @param id 我的待办主键
     * @return 结果
     */
    @Override
    public int deleteUserTodolistById(Long id)
    {
        return userTodolistMapper.deleteUserTodolistById(id);
    }

    //统计
    @Override
    public ArrayList<Map<String, String>> getMonthlyToDoListRecordIncrement() {
        ArrayList<Map<String,String>> list = new ArrayList<>();
        Integer count_0 = 0;
        Integer count_1 = 0;
        String serviceName_0 = "待完成";
        String serviceName_1 = "已完成";

        List<UserTodolist> todoes = userTodolistMapper.selectUserTodolistList(new UserTodolist());
        for (UserTodolist user : todoes) {
            if ( "0".equals(user.getStatus()) ) {
                count_0 = count_0 + 1;
            }else{
                count_1 = count_1 + 1;
            }
        }
        HashMap<String, String> map = new HashMap<>();
        map.put("name","待完成");
        map.put("value",count_0.toString());
        list.add(map);
        HashMap<String, String> map1 = new HashMap<>();
        map1.put("name","已完成");
        map1.put("value",count_1.toString());
        list.add(map1);

        return list;
    }
}
