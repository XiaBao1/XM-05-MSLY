package com.ruoyi.clienthomeorder.service;

import java.util.List;
import com.ruoyi.clienthomeorder.domain.ClientRoomRecord;

/**
 * 民宿订单Service接口
 * 
 * @author ruoyi
 * @date 2022-12-06
 */
public interface IClientRoomRecordService 
{
    /**
     * 查询民宿订单
     * 
     * @param id 民宿订单主键
     * @return 民宿订单
     */
    public ClientRoomRecord selectClientRoomRecordById(Long id);
    public ClientRoomRecord selectClientRoomCommentRecordById(Long id);


    /**
     * 查询民宿订单列表
     * 
     * @param clientRoomRecord 民宿订单
     * @return 民宿订单集合
     */
    public List<ClientRoomRecord> selectClientRoomRecordList(ClientRoomRecord clientRoomRecord);

    /**
     * 新增民宿订单
     * 
     * @param clientRoomRecord 民宿订单
     * @return 结果
     */
    public int insertClientRoomRecord(ClientRoomRecord clientRoomRecord);
    public int insertClientRoomCommentRecord(ClientRoomRecord clientRoomRecord);


    /**
     * 修改民宿订单
     * 
     * @param clientRoomRecord 民宿订单
     * @return 结果
     */
    public int updateClientRoomRecord(ClientRoomRecord clientRoomRecord);
    public int updateClientRoomCommentRecord(ClientRoomRecord clientRoomRecord);
    public int insertClientRoomCommentPhotoRecord(String path);

    /**
     * 批量删除民宿订单
     * 
     * @param ids 需要删除的民宿订单主键集合
     * @return 结果
     */
    public int deleteClientRoomRecordByIds(String ids);

    public List<Integer> getMonthlyClientRoomRecordIncrement();

    /**
     * 删除民宿订单信息
     * 
     * @param id 民宿订单主键
     * @return 结果
     */
    public int deleteClientRoomRecordById(Long id);
}
