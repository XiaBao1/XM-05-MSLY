package com.ruoyi.usertodolist.service.impl;

import java.util.List;
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
 * @date 2022-12-03
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
}
