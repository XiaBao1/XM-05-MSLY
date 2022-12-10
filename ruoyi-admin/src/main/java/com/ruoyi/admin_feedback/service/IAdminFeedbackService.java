package com.ruoyi.admin_feedback.service;

import java.util.List;
import com.ruoyi.admin_feedback.domain.AdminFeedback;

/**
 * 反馈处理Service接口
 * 
 * @author yyt
 * @date 2022-12-10
 */
public interface IAdminFeedbackService 
{
    /**
     * 查询反馈处理
     * 
     * @param id 反馈处理主键
     * @return 反馈处理
     */
    public AdminFeedback selectAdminFeedbackById(Long id);

    /**
     * 查询反馈处理列表
     * 
     * @param adminFeedback 反馈处理
     * @return 反馈处理集合
     */
    public List<AdminFeedback> selectAdminFeedbackList(AdminFeedback adminFeedback);

    /**
     * 新增反馈处理
     * 
     * @param adminFeedback 反馈处理
     * @return 结果
     */
    public int insertAdminFeedback(AdminFeedback adminFeedback);

    /**
     * 修改反馈处理
     * 
     * @param adminFeedback 反馈处理
     * @return 结果
     */
    public int updateAdminFeedback(AdminFeedback adminFeedback);

    /**
     * 批量删除反馈处理
     * 
     * @param ids 需要删除的反馈处理主键集合
     * @return 结果
     */
    public int deleteAdminFeedbackByIds(String ids);

    /**
     * 删除反馈处理信息
     * 
     * @param id 反馈处理主键
     * @return 结果
     */
    public int deleteAdminFeedbackById(Long id);
}
