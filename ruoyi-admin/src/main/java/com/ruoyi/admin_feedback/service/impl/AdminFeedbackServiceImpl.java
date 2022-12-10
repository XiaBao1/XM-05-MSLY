package com.ruoyi.admin_feedback.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.admin_feedback.mapper.AdminFeedbackMapper;
import com.ruoyi.admin_feedback.domain.AdminFeedback;
import com.ruoyi.admin_feedback.service.IAdminFeedbackService;
import com.ruoyi.common.core.text.Convert;

/**
 * 反馈处理Service业务层处理
 * 
 * @author yyt
 * @date 2022-12-10
 */
@Service
public class AdminFeedbackServiceImpl implements IAdminFeedbackService 
{
    @Autowired
    private AdminFeedbackMapper adminFeedbackMapper;

    /**
     * 查询反馈处理
     * 
     * @param id 反馈处理主键
     * @return 反馈处理
     */
    @Override
    public AdminFeedback selectAdminFeedbackById(Long id)
    {
        return adminFeedbackMapper.selectAdminFeedbackById(id);
    }

    /**
     * 查询反馈处理列表
     * 
     * @param adminFeedback 反馈处理
     * @return 反馈处理
     */
    @Override
    public List<AdminFeedback> selectAdminFeedbackList(AdminFeedback adminFeedback)
    {
        return adminFeedbackMapper.selectAdminFeedbackList(adminFeedback);
    }

    /**
     * 新增反馈处理
     * 
     * @param adminFeedback 反馈处理
     * @return 结果
     */
    @Override
    public int insertAdminFeedback(AdminFeedback adminFeedback)
    {
        return adminFeedbackMapper.insertAdminFeedback(adminFeedback);
    }

    /**
     * 修改反馈处理
     * 
     * @param adminFeedback 反馈处理
     * @return 结果
     */
    @Override
    public int updateAdminFeedback(AdminFeedback adminFeedback)
    {
        return adminFeedbackMapper.updateAdminFeedback(adminFeedback);
    }

    /**
     * 批量删除反馈处理
     * 
     * @param ids 需要删除的反馈处理主键
     * @return 结果
     */
    @Override
    public int deleteAdminFeedbackByIds(String ids)
    {
        return adminFeedbackMapper.deleteAdminFeedbackByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除反馈处理信息
     * 
     * @param id 反馈处理主键
     * @return 结果
     */
    @Override
    public int deleteAdminFeedbackById(Long id)
    {
        return adminFeedbackMapper.deleteAdminFeedbackById(id);
    }
}
