package com.ruoyi.admin_feedback.mapper;

import java.util.List;
import com.ruoyi.admin_feedback.domain.AdminFeedback;

/**
 * 反馈处理Mapper接口
 * 
 * @author yyt
 * @date 2022-12-17
 */
public interface AdminFeedbackMapper 
{
    /**
     * 查询反馈处理
     * 
     * @param answerId 反馈处理主键
     * @return 反馈处理
     */
    public AdminFeedback selectAdminFeedbackByAnswerId(Long answerId);

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
     * 删除反馈处理
     * 
     * @param answerId 反馈处理主键
     * @return 结果
     */
    public int deleteAdminFeedbackByAnswerId(Long answerId);
    public int deleteAdminFeedbackByAnswerId2(Long answerId);

    /**
     * 批量删除反馈处理
     * 
     * @param answerIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAdminFeedbackByAnswerIds(String[] answerIds);
    public int deleteAdminFeedbackByAnswerIds2(String[] answerIds);
}
