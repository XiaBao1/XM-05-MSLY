package com.ruoyi.client_landlord_feedback.mapper;

import java.util.List;
import com.ruoyi.client_landlord_feedback.domain.ClientLandlordFeedback;

/**
 * 我要反馈Mapper接口
 * 
 * @author yyt
 * @date 2022-12-10
 */
public interface ClientLandlordFeedbackMapper 
{
    /**
     * 查询我要反馈
     * 
     * @param id 我要反馈主键
     * @return 我要反馈
     */
    public ClientLandlordFeedback selectClientLandlordFeedbackById(Long id);

    /**
     * 查询我要反馈列表
     * 
     * @param clientLandlordFeedback 我要反馈
     * @return 我要反馈集合
     */
    public List<ClientLandlordFeedback> selectClientLandlordFeedbackList(ClientLandlordFeedback clientLandlordFeedback);

    /**
     * 新增我要反馈
     * 
     * @param clientLandlordFeedback 我要反馈
     * @return 结果
     */
    public int insertClientLandlordFeedback(ClientLandlordFeedback clientLandlordFeedback);

    public int insertClientLandlordFeedback2(ClientLandlordFeedback clientLandlordFeedback);

    /**
     * 修改我要反馈
     * 
     * @param clientLandlordFeedback 我要反馈
     * @return 结果
     */
    public int updateClientLandlordFeedback(ClientLandlordFeedback clientLandlordFeedback);

    /**
     * 删除我要反馈
     * 
     * @param id 我要反馈主键
     * @return 结果
     */
    public int deleteClientLandlordFeedbackById(Long id);
    public int deleteClientLandlordFeedbackById2(Long id);

    /**
     * 批量删除我要反馈
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteClientLandlordFeedbackByIds(String[] ids);
    public int deleteClientLandlordFeedbackByIds2(String[] ids);
}
