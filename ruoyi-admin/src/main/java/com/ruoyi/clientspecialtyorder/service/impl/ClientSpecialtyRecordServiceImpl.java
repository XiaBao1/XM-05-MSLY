package com.ruoyi.clientspecialtyorder.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.ruoyi.clienthomeorder.domain.ClientRoomRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.clientspecialtyorder.mapper.ClientSpecialtyRecordMapper;
import com.ruoyi.clientspecialtyorder.domain.ClientSpecialtyRecord;
import com.ruoyi.clientspecialtyorder.service.IClientSpecialtyRecordService;
import com.ruoyi.common.core.text.Convert;

/**
 * 订单Service业务层处理
 *
 * @author ruoyi
 * @date 2022-12-08
 */
@Service
public class ClientSpecialtyRecordServiceImpl implements IClientSpecialtyRecordService
{
    @Autowired
    private ClientSpecialtyRecordMapper clientSpecialtyRecordMapper;

    /**
     * 查询订单
     *
     * @param id 订单主键
     * @return 订单
     */
    @Override
    public ClientSpecialtyRecord selectClientSpecialtyRecordById(Long id)
    {
        return clientSpecialtyRecordMapper.selectClientSpecialtyRecordById(id);
    }

    public ClientSpecialtyRecord selectClientSpecialtyCommentRecordById(Long id)
    {
        return clientSpecialtyRecordMapper.selectClientSpecialtyCommentRecordById(id);
    }
    /**
     * 查询订单列表
     *
     * @param clientSpecialtyRecord 订单
     * @return 订单
     */
    @Override
    public List<ClientSpecialtyRecord> selectClientSpecialtyRecordList(ClientSpecialtyRecord clientSpecialtyRecord)
    {
        return clientSpecialtyRecordMapper.selectClientSpecialtyRecordList(clientSpecialtyRecord);
    }

    //yyt
    @Override
    public List<ClientSpecialtyRecord> selectwxcommentlist(ClientSpecialtyRecord clientSpecialtyRecord){
        return clientSpecialtyRecordMapper.selectwxcommentlist(clientSpecialtyRecord);
    }

    /**
     * 新增订单
     *
     * @param clientSpecialtyRecord 订单
     * @return 结果
     */
    @Override
    public int insertClientSpecialtyRecord(ClientSpecialtyRecord clientSpecialtyRecord)
    {
        return clientSpecialtyRecordMapper.insertClientSpecialtyRecord(clientSpecialtyRecord);
    }


    public int insertClientSpecialtyCommentPhotoRecord(String path)
    {
        return clientSpecialtyRecordMapper.insertClientSpecialtyCommentPhotoRecord(path);
    }
    /**
     * 新增民宿评论
     *
     * @param clientSpecialtyRecord 民宿订单
     * @return 结果
     */


    /**
     * 修改订单
     *
     * @param clientSpecialtyRecord 订单
     * @return 结果
     */
    @Override
    public int updateClientSpecialtyRecord(ClientSpecialtyRecord clientSpecialtyRecord)
    {
        return clientSpecialtyRecordMapper.updateClientSpecialtyRecord(clientSpecialtyRecord);
    }


    @Override
    public int updateClientSpecialtyCommentRecord(ClientSpecialtyRecord clientSpecialtyRecord)
    {
        return clientSpecialtyRecordMapper.updateClientSpecialtyCommentRecord(clientSpecialtyRecord);
    }
    /**
     * 批量删除订单
     *
     * @param ids 需要删除的订单主键
     * @return 结果
     */
    @Override
    public int deleteClientSpecialtyRecordByIds(String ids)
    {
        return clientSpecialtyRecordMapper.deleteClientSpecialtyRecordByIds(Convert.toStrArray(ids));
    }

    @Override
    public List<Integer> getMonthlyClientSpecialtyRecordIncrement() {
        int len = 12;
        List<Integer> list = new ArrayList<Integer>(len);
        for (int i = 0; i < len; i++) {
            list.add(0);
        }

        Calendar ca = Calendar.getInstance();
        List<ClientSpecialtyRecord> clientSpecialtyRecord= clientSpecialtyRecordMapper.selectClientSpecialtyRecordList2(new ClientSpecialtyRecord());
        for (ClientSpecialtyRecord user : clientSpecialtyRecord) {

                ca.setTime(user.getOrderTime());
                int idx = ca.get(Calendar.MONTH);
                int cur = list.get(idx);
                list.set(idx, 1 + cur);

        }

        return list;
    }

    /**
     * 删除订单信息
     *
     * @param id 订单主键
     * @return 结果
     */
    @Override
    public int deleteClientSpecialtyRecordById(Long id)
    {
        return clientSpecialtyRecordMapper.deleteClientSpecialtyRecordById(id);
    }

    @Override
    public List<String> getDataNameList() {
        int len = 5;
        List<Integer> list = new ArrayList<Integer>(len);
        for (int i = 0; i < len; i++) {
            list.add(0);
        }
        List<String> datalist= clientSpecialtyRecordMapper.selectDataNameList(new ClientSpecialtyRecord());
        System.out.println(datalist);
        return datalist;
    }

    public Long getSellNumber(String name){
        return clientSpecialtyRecordMapper.getSellNumber(name);
    }
}
