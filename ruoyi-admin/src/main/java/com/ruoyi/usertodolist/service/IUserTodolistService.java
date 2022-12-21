package com.ruoyi.usertodolist.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ruoyi.usertodolist.domain.UserTodolist;

/**
 * 我的待办Service接口
 * 
 * @author yyt
 * @date 2022-12-08
 */
public interface IUserTodolistService 
{
    /**
     * 查询我的待办
     * 
     * @param id 我的待办主键
     * @return 我的待办
     */
    public UserTodolist selectUserTodolistById(Long id);

    /**
     * 查询我的待办列表
     * 
     * @param userTodolist 我的待办
     * @return 我的待办集合
     */
    public List<UserTodolist> selectUserTodolistList(UserTodolist userTodolist);

    /**
     * 新增我的待办
     * 
     * @param userTodolist 我的待办
     * @return 结果
     */
    public int insertUserTodolist(UserTodolist userTodolist);

    /**
     * 修改我的待办
     * 
     * @param userTodolist 我的待办
     * @return 结果
     */
    public int updateUserTodolist(UserTodolist userTodolist);

    /**
     * 批量删除我的待办
     * 
     * @param ids 需要删除的我的待办主键集合
     * @return 结果
     */
    public int deleteUserTodolistByIds(String ids);

    /**
     * 删除我的待办信息
     * 
     * @param id 我的待办主键
     * @return 结果
     */
    public int deleteUserTodolistById(Long id);

    public ArrayList<Map<String, String>> getMonthlyToDoListRecordIncrement();
}
