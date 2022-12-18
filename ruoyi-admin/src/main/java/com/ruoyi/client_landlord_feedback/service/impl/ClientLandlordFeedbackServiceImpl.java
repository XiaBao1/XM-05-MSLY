package com.ruoyi.client_landlord_feedback.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.ruoyi.landlordhomeorder.domain.LandlordRoomRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.client_landlord_feedback.mapper.ClientLandlordFeedbackMapper;
import com.ruoyi.client_landlord_feedback.domain.ClientLandlordFeedback;
import com.ruoyi.client_landlord_feedback.service.IClientLandlordFeedbackService;
import com.ruoyi.common.core.text.Convert;

/**
 * 我要反馈Service业务层处理
 * 
 * @author yyt
 * @date 2022-12-10
 */
@Service
public class ClientLandlordFeedbackServiceImpl implements IClientLandlordFeedbackService 
{
    @Autowired
    private ClientLandlordFeedbackMapper clientLandlordFeedbackMapper;

    /**
     * 查询我要反馈
     * 
     * @param id 我要反馈主键
     * @return 我要反馈
     */
    @Override
    public ClientLandlordFeedback selectClientLandlordFeedbackById(Long id)
    {
        return clientLandlordFeedbackMapper.selectClientLandlordFeedbackById(id);
    }

    /**
     * 查询我要反馈列表
     * 
     * @param clientLandlordFeedback 我要反馈
     * @return 我要反馈
     */
    @Override
    public List<ClientLandlordFeedback> selectClientLandlordFeedbackList(ClientLandlordFeedback clientLandlordFeedback)
    {
        return clientLandlordFeedbackMapper.selectClientLandlordFeedbackList(clientLandlordFeedback);
    }

    /**
     * 新增我要反馈
     * 
     * @param clientLandlordFeedback 我要反馈
     * @return 结果
     */
    @Override
    public int insertClientLandlordFeedback(ClientLandlordFeedback clientLandlordFeedback)
    {
        clientLandlordFeedbackMapper.insertClientLandlordFeedback(clientLandlordFeedback);
        return clientLandlordFeedbackMapper.insertClientLandlordFeedback2(clientLandlordFeedback);
    }

    /**
     * 修改我要反馈
     * 
     * @param clientLandlordFeedback 我要反馈
     * @return 结果
     */
    @Override
    public int updateClientLandlordFeedback(ClientLandlordFeedback clientLandlordFeedback)
    {
        return clientLandlordFeedbackMapper.updateClientLandlordFeedback(clientLandlordFeedback);
    }

    /**
     * 批量删除我要反馈
     * 
     * @param ids 需要删除的我要反馈主键
     * @return 结果
     */
    @Override
    public int deleteClientLandlordFeedbackByIds(String ids)
    {
        clientLandlordFeedbackMapper.deleteClientLandlordFeedbackByIds(Convert.toStrArray(ids));
        return clientLandlordFeedbackMapper.deleteClientLandlordFeedbackByIds2(Convert.toStrArray(ids));
    }

    /**
     * 删除我要反馈信息
     * 
     * @param id 我要反馈主键
     * @return 结果
     */
    @Override
    public int deleteClientLandlordFeedbackById(Long id)
    {
        clientLandlordFeedbackMapper.deleteClientLandlordFeedbackById(id);
        return clientLandlordFeedbackMapper.deleteClientLandlordFeedbackById2(id);
    }

    @Override
    public List<Integer> getMonthlyFeedbackRecordIncrement() {
        int len = 12;
        List<Integer> list = new ArrayList<Integer>(len);
        for (int i = 0; i < len; i++) {
            list.add(0);
        }

        Calendar ca = Calendar.getInstance();
        List<ClientLandlordFeedback> feedbackRecord= clientLandlordFeedbackMapper.selectClientLandlordFeedbackList(new ClientLandlordFeedback());
        for (ClientLandlordFeedback user : feedbackRecord) {
            if ( !"".equals(user.getId()) ) {
                ca.setTime(user.getFeedbackTime());
                int idx = ca.get(Calendar.MONTH);
                int cur = list.get(idx);
                list.set(idx, 1 + cur);
            }
        }

        return list;
    }

}
