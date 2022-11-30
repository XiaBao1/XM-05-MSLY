package com.ruoyi.yk.service;

import java.util.List;
import com.ruoyi.yk.domain.ElseUsers;

/**
 * 用户管理Service接口
 * 
 * @author ruoyi
 * @date 2022-11-30
 */
public interface IElseUsersService 
{
    /**
     * 查询用户管理
     * 
     * @param userNumber 用户管理主键
     * @return 用户管理
     */
    public ElseUsers selectElseUsersByUserNumber(String userNumber);

    /**
     * 查询用户管理列表
     * 
     * @param elseUsers 用户管理
     * @return 用户管理集合
     */
    public List<ElseUsers> selectElseUsersList(ElseUsers elseUsers);

    /**
     * 新增用户管理
     * 
     * @param elseUsers 用户管理
     * @return 结果
     */
    public int insertElseUsers(ElseUsers elseUsers);

    /**
     * 修改用户管理
     * 
     * @param elseUsers 用户管理
     * @return 结果
     */
    public int updateElseUsers(ElseUsers elseUsers);

    /**
     * 批量删除用户管理
     * 
     * @param userNumbers 需要删除的用户管理主键集合
     * @return 结果
     */
    public int deleteElseUsersByUserNumbers(String userNumbers);

    /**
     * 删除用户管理信息
     * 
     * @param userNumber 用户管理主键
     * @return 结果
     */
    public int deleteElseUsersByUserNumber(String userNumber);
}
