package com.ruoyi.clientspecialtyorder.mapper;

import java.util.List;

import com.ruoyi.clientspecialtyorder.domain.ClientSpecialtyRecord;

/**
 * 订单Mapper接口
 *
 * @author ruoyi
 * @date 2022-12-08
 */
public interface ClientSpecialtyRecordMapper
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
     * 删除订单
     *
     * @param id 订单主键
     * @return 结果
     */
    public int deleteClientSpecialtyRecordById(Long id);

    /**
     * 批量删除订单
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteClientSpecialtyRecordByIds(String[] ids);


}
