package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BuyRoom;

/**
 * 房间订购Mapper接口
 * 
 * @author ruoyi
 * @date 2022-12-02
 */
public interface BuyRoomMapper 
{
    /**
     * 查询房间订购
     * 
     * @param id 房间订购主键
     * @return 房间订购
     */
    public BuyRoom selectBuyRoomById(Long id);

    /**
     * 查询房间订购列表
     * 
     * @param buyRoom 房间订购
     * @return 房间订购集合
     */
    public List<BuyRoom> selectBuyRoomList(BuyRoom buyRoom);

    /**
     * 新增房间订购
     * 
     * @param buyRoom 房间订购
     * @return 结果
     */
    public int insertBuyRoom(BuyRoom buyRoom);

    /**
     * 修改房间订购
     * 
     * @param buyRoom 房间订购
     * @return 结果
     */
    public int updateBuyRoom(BuyRoom buyRoom);

    /**
     * 删除房间订购
     * 
     * @param id 房间订购主键
     * @return 结果
     */
    public int deleteBuyRoomById(Long id);

    /**
     * 批量删除房间订购
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBuyRoomByIds(String[] ids);
}
