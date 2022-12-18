package com.ruoyi.admin_feedback.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.ruoyi.client_landlord_feedback.domain.ClientLandlordFeedback;
import com.ruoyi.weather.domain.Weather;
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
 * @date 2022-12-17
 */
@Service
public class AdminFeedbackServiceImpl implements IAdminFeedbackService 
{
    @Autowired
    private AdminFeedbackMapper adminFeedbackMapper;

    /**
     * 查询反馈处理
     * 
     * @param answerId 反馈处理主键
     * @return 反馈处理
     */
    @Override
    public AdminFeedback selectAdminFeedbackByAnswerId(Long answerId)
    {
        return adminFeedbackMapper.selectAdminFeedbackByAnswerId(answerId);
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
     * @param answerIds 需要删除的反馈处理主键
     * @return 结果
     */
    @Override
    public int deleteAdminFeedbackByAnswerIds(String answerIds)
    {
        return adminFeedbackMapper.deleteAdminFeedbackByAnswerIds(Convert.toStrArray(answerIds));
    }

    /**
     * 删除反馈处理信息
     * 
     * @param answerId 反馈处理主键
     * @return 结果
     */
    @Override
    public int deleteAdminFeedbackByAnswerId(Long answerId)
    {
        return adminFeedbackMapper.deleteAdminFeedbackByAnswerId(answerId);
    }

    /**
     * 统计
     *
     * @return 结果
     */
    @Override
    public List<Integer> getMonthIncrement() {
        int len = 12;
        List<Integer> list = new ArrayList<Integer>(len);
        for (int i = 0; i < len; i++) {
            list.add(0);
        }

        Calendar ca = Calendar.getInstance();
        Calendar ca2 = Calendar.getInstance();
        List<AdminFeedback> feedbackRecord= adminFeedbackMapper.selectAdminFeedbackList(new AdminFeedback());
        for (AdminFeedback user : feedbackRecord) {
            if ( !"".equals(user.getFeedbackContent()) ) {
                ca.setTime(user.getFeedbackTime());
                int idx = ca.get(Calendar.MONTH);
                int cur = list.get(idx);
                list.set(idx,1+cur);
            }
//                System.out.println("===========================user.getFeedbackTime()="+user.getFeedbackTime());
//                ca.setTime(user.getFeedbackTime());
//                int idx = ca.get(Calendar.MONTH);
//                System.out.println("=================================================================idx="+idx);
//                int cur = list.get(idx);
//                System.out.println("==================================================================cur="+cur);
//                list.set(idx, 1 + cur);
//                System.out.println("==================================================================list="+list);
//
//                System.out.println("===========================user.getAnswerTime()="+user.getAnswerTime());
//                if("".equals(user.getAnswerTime())){
//
//                }else{
//                    ca2.setTime(user.getAnswerTime());
//                    int idx2 = ca2.get(Calendar.MONTH)+12;
//                    System.out.println("=================================================================idx2="+idx2);
//                    int cur2 = list.get(idx2);
//                    System.out.println("==================================================================cur2="+cur2);
//                    list.set(idx2,1+cur2);
//                    System.out.println("==================================================================list="+list);
//                }
//
//            }
//            System.out.println("======================================\"\".equals(user.getAnswerId())"+"".equals(user.getAnswerId()));
        }
        System.out.println("=========================================================================="+list);
        return list;
    }
}
