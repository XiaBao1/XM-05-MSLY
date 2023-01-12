package com.ruoyi.clientspecialtyorder.service;

import java.util.List;

import com.ruoyi.clienthomeorder.domain.ClientRoomRecord;
import com.ruoyi.clientspecialtyorder.domain.ClientSpecialtyRecord;

/**
 * 订单Service接口
 *
 * @author ruoyi
 * @date 2022-12-08
 */
public interface IClientSpecialtyRecordService
{
    /**
     * 查询订单
     *
     * @param id 订单主键
     * @return 订单
     */
    public ClientSpecialtyRecord selectClientSpecialtyRecordById(Long id);
    public ClientSpecialtyRecord selectClientSpecialtyCommentRecordById(Long id);

    /**
     * 查询订单列表
     *
     * @param clientSpecialtyRecord 订单
     * @return 订单集合
     */
    public List<ClientSpecialtyRecord> selectClientSpecialtyRecordList(ClientSpecialtyRecord clientSpecialtyRecord);

    //yyt微信查看评论
    public List<ClientSpecialtyRecord> selectwxcommentlist(ClientSpecialtyRecord clientSpecialtyRecord);

    /**
     * 新增订单
     *
     * @param clientSpecialtyRecord 订单
     * @return 结果
     */
    public int insertClientSpecialtyRecord(ClientSpecialtyRecord clientSpecialtyRecord);
    public int insertClientSpecialtyCommentPhotoRecord(String path);




    /**
     * 修改订单
     *
     * @param clientSpecialtyRecord 订单
     * @return 结果
     */
    public int updateClientSpecialtyRecord(ClientSpecialtyRecord clientSpecialtyRecord);
    public int updateClientSpecialtyCommentRecord(ClientSpecialtyRecord clientSpecialtyRecord);


    /**
     * 批量删除订单
     *
     * @param ids 需要删除的订单主键集合
     * @return 结果
     */
    public int deleteClientSpecialtyRecordByIds(String ids);

    public List<Integer> getMonthlyClientSpecialtyRecordIncrement();

    /**
     * 删除订单信息
     *
     * @param id 订单主键
     * @return 结果
     */
    public int deleteClientSpecialtyRecordById(Long id);

    public List<String> getDataNameList();

    public Long getSellNumber(String name);

}
