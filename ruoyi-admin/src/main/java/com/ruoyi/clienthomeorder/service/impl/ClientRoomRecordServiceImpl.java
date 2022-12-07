package com.ruoyi.clienthomeorder.service.impl;

import java.util.List;
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
