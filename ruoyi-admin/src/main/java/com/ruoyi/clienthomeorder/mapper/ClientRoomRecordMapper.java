package com.ruoyi.clienthomeorder.mapper;

import java.math.BigDecimal;
import java.util.List;

import com.ruoyi.clienthomeorder.domain.ClientRoomRecord;

/**
 * 民宿订单Mapper接口
 * 
 * @author ruoyi
 * @date 2022-12-06
 */
public interface ClientRoomRecordMapper 
{
    /**
     * 查询民宿订单
     * 
     * @param id 民宿订单主键
     * @return 民宿订单
     */
    public ClientRoomRecord selectClientRoomRecordById(Long id);

    public ClientRoomRecord  selectClientRoomCommentRecordById(Long id);

    /**
     * 查询民宿订单列表
     * 
     * @param clientRoomRecord 民宿订单
     * @return 民宿订单集合
     */
    public List<ClientRoomRecord> selectClientRoomRecordList(ClientRoomRecord clientRoomRecord);
    public List<ClientRoomRecord> selectClientRoomRecordList2(ClientRoomRecord clientRoomRecord);
    public List<String> selectDataNameList(ClientRoomRecord clientRoomRecord);
    public Long getSellNumber(String name);

    public List<Long> selectDataIdList(Long id);
    public Long getRoomRecordId(Long id);
    public BigDecimal getScore(Long id);
    public String getComment(Long id);
    public String getPhoto(Long id);
    /**
     * 新增民宿订单
     * 
     * @param clientRoomRecord 民宿订单
     * @return 结果
     */
    public int insertClientRoomRecord(ClientRoomRecord clientRoomRecord);

    /**
     * 新增民宿评论
     *
     * @param clientRoomRecord 民宿订单
     * @return 结果
     */
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
     * 删除民宿订单
     * 
     * @param id 民宿订单主键
     * @return 结果
     */
    public int deleteClientRoomRecordById(Long id);

    /**
     * 批量删除民宿订单
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteClientRoomRecordByIds(String[] ids);

}





