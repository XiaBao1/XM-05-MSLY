package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.HouseRoomMapper;
import com.ruoyi.system.domain.HouseRoom;
import com.ruoyi.system.service.IHouseRoomService;
import com.ruoyi.common.core.text.Convert;

/**
 * 房子管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-02
 */
@Service
public class HouseRoomServiceImpl implements IHouseRoomService 
{
    @Autowired
    private HouseRoomMapper houseRoomMapper;

    /**
     * 查询房子管理
     * 
     * @param id 房子管理主键
     * @return 房子管理
     */
    @Override
    public HouseRoom selectHouseRoomById(Long id)
    {
        return houseRoomMapper.selectHouseRoomById(id);
    }

    /**
     * 查询房子管理列表
     * 
     * @param houseRoom 房子管理
     * @return 房子管理
     */
    @Override
    public List<HouseRoom> selectHouseRoomList(HouseRoom houseRoom)
    {
        return houseRoomMapper.selectHouseRoomList(houseRoom);
    }

    /**
     * 新增房子管理
     * 
     * @param houseRoom 房子管理
     * @return 结果
     */
    @Override
    public int insertHouseRoom(HouseRoom houseRoom)
    {
        return houseRoomMapper.insertHouseRoom(houseRoom);
    }

    /**
     * 修改房子管理
     * 
     * @param houseRoom 房子管理
     * @return 结果
     */
    @Override
    public int updateHouseRoom(HouseRoom houseRoom)
    {
        return houseRoomMapper.updateHouseRoom(houseRoom);
    }

    /**
     * 批量删除房子管理
     * 
     * @param ids 需要删除的房子管理主键
     * @return 结果
     */
    @Override
    public int deleteHouseRoomByIds(String ids)
    {
        return houseRoomMapper.deleteHouseRoomByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除房子管理信息
     * 
     * @param id 房子管理主键
     * @return 结果
     */
    @Override
    public int deleteHouseRoomById(Long id)
    {
        return houseRoomMapper.deleteHouseRoomById(id);
    }
}
