package com.ruoyi.web.system.mapper;

import java.util.List;
import com.ruoyi.web.system.domain.HouseRoom;

/**
 * 房子管理Mapper接口
 *
 * @author ruoyi
 * @date 2022-12-02
 */
public interface HouseRoomMapper
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
     * 删除房子管理
     *
     * @param id 房子管理主键
     * @return 结果
     */
    public int deleteHouseRoomById(Long id);

    /**
     * 批量删除房子管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHouseRoomByIds(String[] ids);

    public int getAppointNumber(HouseRoom houseRoom);

    public int getUnappointNumber(HouseRoom houseRoom);

    public String getHouseNameById(Long id);

    String getHouseIdByHouseName(HouseRoom houseRoom);
}
