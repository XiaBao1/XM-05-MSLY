package com.ruoyi.web.system.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.web.system.mapper.landlordMapper;
import com.ruoyi.web.system.domain.landlord;
import com.ruoyi.web.system.service.IlandlordService;
import com.ruoyi.common.core.text.Convert;

/**
 * 民宿管理Service业务层处理
 *
 * @author pch
 * @date 2022-12-12
 */
@Service
public class landlordServiceImpl implements IlandlordService
{
    @Autowired
    private landlordMapper landlordMapper;

    /**
     * 查询民宿管理
     *
     * @param id 民宿管理主键
     * @return 民宿管理
     */
    @Override
    public landlord selectlandlordById(Long id)
    {
        return landlordMapper.selectlandlordById(id);
    }

    /**
     * 查询民宿管理列表
     *
     * @param landlord 民宿管理
     * @return 民宿管理
     */
    @Override
    public List<landlord> selectlandlordList(landlord landlord)
    {
        return landlordMapper.selectlandlordList(landlord);
    }

    /**
     * 新增民宿管理
     *
     * @param landlord 民宿管理
     * @return 结果
     */
    @Override
    public int insertlandlord(landlord landlord)
    {
        return landlordMapper.insertlandlord(landlord);
    }

    /**
     * 修改民宿管理
     *
     * @param landlord 民宿管理
     * @return 结果
     */
    @Override
    public int updatelandlord(landlord landlord)
    {
        return landlordMapper.updatelandlord(landlord);
    }

    /**
     * 批量删除民宿管理
     *
     * @param ids 需要删除的民宿管理主键
     * @return 结果
     */
    @Override
    public int deletelandlordByIds(String ids)
    {
        return landlordMapper.deletelandlordByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除民宿管理信息
     *
     * @param id 民宿管理主键
     * @return 结果
     */
    @Override
    public int deletelandlordById(Long id)
    {
        return landlordMapper.deletelandlordById(id);
    }

    public String getImageUrlById(Long id){
        return landlordMapper.getImageUrlById(id);
    }

    public List<Integer> getAppointmentData(landlord landlord){
        List<Integer> ans=new ArrayList<>();
        Integer a=landlordMapper.getAppointNumber(landlord);
        ans.add(a);
        ans.add(landlordMapper.getAllAppointNumber(landlord)-a);
        return ans;
    }
}
