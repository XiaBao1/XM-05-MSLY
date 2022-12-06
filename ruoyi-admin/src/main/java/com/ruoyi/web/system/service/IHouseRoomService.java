package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.HouseRoom;

/**
 * 房子管理Service接口
 * 
 * @author ruoyi
 * @date 2022-12-02
 */
public interface IHouseRoomService 
{
    /**
     * 查询房子管理
     * 
     * @param id 房子管理主键
     * @return 房子管理
     */
    public HouseRoom selectHouseRoomById(Long id);

    /**
     * 查询房子管理列表
     * 
     * @param houseRoom 房子管理
     * @return 房子管理集合
     */
    public List<HouseRoom> selectHouseRoomList(HouseRoom houseRoom);

    /**
     * 新增房子管理
     * 
     * @param houseRoom 房子管理
     * @return 结果
     */
    public int insertHouseRoom(HouseRoom houseRoom);

    /**
     * 修改房子管理
     * 
     * @param houseRoom 房子管理
     * @return 结果
     */
    public int updateHouseRoom(HouseRoom houseRoom);

    /**
     * 批量删除房子管理
     * 
     * @param ids 需要删除的房子管理主键集合
     * @return 结果
     */
    public int deleteHouseRoomByIds(String ids);

    /**
     * 删除房子管理信息
     * 
     * @param id 房子管理主键
     * @return 结果
     */
    public int deleteHouseRoomById(Long id);
}
