package com.ruoyi.clienthomeorder.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.clienthomeorder.mapper.ClientRoomRecordMapper;
import com.ruoyi.clienthomeorder.domain.ClientRoomRecord;
import com.ruoyi.clienthomeorder.service.IClientRoomRecordService;
import com.ruoyi.common.core.text.Convert;

/**
 * 民宿订单Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-06
 */
@Service
public class ClientRoomRecordServiceImpl implements IClientRoomRecordService 
{
    @Autowired
    private ClientRoomRecordMapper clientRoomRecordMapper;

    /**
     * 查询民宿订单
     * 
     * @param id 民宿订单主键
     * @return 民宿订单
     */
    @Override
    public ClientRoomRecord selectClientRoomRecordById(Long id)
    {
        return clientRoomRecordMapper.selectClientRoomRecordById(id);
    }

    @Override
    public ClientRoomRecord selectClientRoomCommentRecordById(Long id)
    {
        return clientRoomRecordMapper.selectClientRoomCommentRecordById(id);
    }
    /**
     * 查询民宿订单列表
     * 
     * @param clientRoomRecord 民宿订单
     * @return 民宿订单
     */
    @Override
    public List<ClientRoomRecord> selectClientRoomRecordList(ClientRoomRecord clientRoomRecord)
    {
        return clientRoomRecordMapper.selectClientRoomRecordList(clientRoomRecord);
    }


    /**
     * 新增民宿订单
     * 
     * @param clientRoomRecord 民宿订单
     * @return 结果
     */
    @Override
    public int insertClientRoomRecord(ClientRoomRecord clientRoomRecord)
    {
        return clientRoomRecordMapper.insertClientRoomRecord(clientRoomRecord);
    }

    @Override
    public int insertClientRoomCommentRecord(ClientRoomRecord clientRoomRecord)
    {
        return clientRoomRecordMapper.insertClientRoomCommentRecord(clientRoomRecord);
    }


    /**
     * 修改民宿订单
     * 
     * @param clientRoomRecord 民宿订单
     * @return 结果
     */
    @Override
    public int updateClientRoomRecord(ClientRoomRecord clientRoomRecord)
    {
        return clientRoomRecordMapper.updateClientRoomRecord(clientRoomRecord);
    }
    public int updateClientRoomCommentRecord(ClientRoomRecord clientRoomRecord)
    {
        return clientRoomRecordMapper.updateClientRoomCommentRecord(clientRoomRecord);
    }
    public int insertClientRoomCommentPhotoRecord(String path)
    {
        return clientRoomRecordMapper.insertClientRoomCommentPhotoRecord(path);
    }
    /**
     * 批量删除民宿订单
     * 
     * @param ids 需要删除的民宿订单主键
     * @return 结果
     */
    @Override
    public int deleteClientRoomRecordByIds(String ids)
    {
        return clientRoomRecordMapper.deleteClientRoomRecordByIds(Convert.toStrArray(ids));
    }

    @Override
    public List<Integer> getMonthlyClientRoomRecordIncrement() {
        int len = 12;
        List<Integer> list = new ArrayList<Integer>(len);
        for (int i = 0; i < len; i++) {
            list.add(0);
        }

        Calendar ca = Calendar.getInstance();
        List<ClientRoomRecord> clientRoomRecord= clientRoomRecordMapper.selectClientRoomRecordList(new ClientRoomRecord());
        for (ClientRoomRecord user : clientRoomRecord) {
            if ( !"1".equals(user.getIsDone()) ) {
                ca.setTime(user.getCheckInDate());
                int idx = ca.get(Calendar.MONTH);
                int cur = list.get(idx);
                list.set(idx, 1 + cur);
            }
        }

        return list;
    }

    /**
     * 删除民宿订单信息
     * 
     * @param id 民宿订单主键
     * @return 结果
     */
    @Override
    public int deleteClientRoomRecordById(Long id)
    {
        return clientRoomRecordMapper.deleteClientRoomRecordById(id);
    }
}
