package com.ruoyi.yk.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yk.mapper.ElseUsersMapper;
import com.ruoyi.yk.domain.ElseUsers;
import com.ruoyi.yk.service.IElseUsersService;
import com.ruoyi.common.core.text.Convert;

/**
 * 用户管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-11-30
 */
@Service
public class ElseUsersServiceImpl implements IElseUsersService 
{
    @Autowired
    private ElseUsersMapper elseUsersMapper;

    /**
     * 查询用户管理
     * 
     * @param userNumber 用户管理主键
     * @return 用户管理
     */
    @Override
    public ElseUsers selectElseUsersByUserNumber(String userNumber)
    {
        return elseUsersMapper.selectElseUsersByUserNumber(userNumber);
    }

    /**
     * 查询用户管理列表
     * 
     * @param elseUsers 用户管理
     * @return 用户管理
     */
    @Override
    public List<ElseUsers> selectElseUsersList(ElseUsers elseUsers)
    {
        return elseUsersMapper.selectElseUsersList(elseUsers);
    }

    /**
     * 新增用户管理
     * 
     * @param elseUsers 用户管理
     * @return 结果
     */
    @Override
    public int insertElseUsers(ElseUsers elseUsers)
    {
        return elseUsersMapper.insertElseUsers(elseUsers);
    }

    /**
     * 修改用户管理
     * 
     * @param elseUsers 用户管理
     * @return 结果
     */
    @Override
    public int updateElseUsers(ElseUsers elseUsers)
    {
        return elseUsersMapper.updateElseUsers(elseUsers);
    }

    /**
     * 批量删除用户管理
     * 
     * @param userNumbers 需要删除的用户管理主键
     * @return 结果
     */
    @Override
    public int deleteElseUsersByUserNumbers(String userNumbers)
    {
        return elseUsersMapper.deleteElseUsersByUserNumbers(Convert.toStrArray(userNumbers));
    }

    /**
     * 删除用户管理信息
     * 
     * @param userNumber 用户管理主键
     * @return 结果
     */
    @Override
    public int deleteElseUsersByUserNumber(String userNumber)
    {
        return elseUsersMapper.deleteElseUsersByUserNumber(userNumber);
    }
}
