package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BuyRoomMapper;
import com.ruoyi.system.domain.BuyRoom;
import com.ruoyi.system.service.IBuyRoomService;
import com.ruoyi.common.core.text.Convert;

/**
 * 房间订购Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-02
 */
@Service
public class BuyRoomServiceImpl implements IBuyRoomService 
{
    @Autowired
    private BuyRoomMapper buyRoomMapper;

    /**
     * 查询房间订购
     * 
     * @param id 房间订购主键
     * @return 房间订购
     */
    @Override
    public BuyRoom selectBuyRoomById(Long id)
    {
        return buyRoomMapper.selectBuyRoomById(id);
    }

    /**
     * 查询房间订购列表
     * 
     * @param buyRoom 房间订购
     * @return 房间订购
     */
    @Override
    public List<BuyRoom> selectBuyRoomList(BuyRoom buyRoom)
    {
        return buyRoomMapper.selectBuyRoomList(buyRoom);
    }

    /**
     * 新增房间订购
     * 
     * @param buyRoom 房间订购
     * @return 结果
     */
    @Override
    public int insertBuyRoom(BuyRoom buyRoom)
    {
        return buyRoomMapper.insertBuyRoom(buyRoom);
    }

    /**
     * 修改房间订购
     * 
     * @param buyRoom 房间订购
     * @return 结果
     */
    @Override
    public int updateBuyRoom(BuyRoom buyRoom)
    {
        return buyRoomMapper.updateBuyRoom(buyRoom);
    }

    /**
     * 批量删除房间订购
     * 
     * @param ids 需要删除的房间订购主键
     * @return 结果
     */
    @Override
    public int deleteBuyRoomByIds(String ids)
    {
        return buyRoomMapper.deleteBuyRoomByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除房间订购信息
     * 
     * @param id 房间订购主键
     * @return 结果
     */
    @Override
    public int deleteBuyRoomById(Long id)
    {
        return buyRoomMapper.deleteBuyRoomById(id);
    }
}
