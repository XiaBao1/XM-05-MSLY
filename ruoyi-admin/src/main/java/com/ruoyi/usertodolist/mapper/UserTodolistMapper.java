package com.ruoyi.usertodolist.mapper;

import java.util.List;
import com.ruoyi.usertodolist.domain.UserTodolist;

/**
 * 我的待办Mapper接口
 * 
 * @author yyt
 * @date 2022-12-08
 */
public interface UserTodolistMapper 
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
//    public static List<UserTodolist> selectUserTodolistList(UserTodolist userTodolist) {
//        return null;
//    }
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
     * 删除我的待办
     * 
     * @param id 我的待办主键
     * @return 结果
     */
    public int deleteUserTodolistById(Long id);

    /**
     * 批量删除我的待办
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUserTodolistByIds(String[] ids);
}
