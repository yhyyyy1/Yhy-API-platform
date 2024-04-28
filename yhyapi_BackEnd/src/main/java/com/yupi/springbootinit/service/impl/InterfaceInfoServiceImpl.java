package com.yupi.springbootinit.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import generator.domain.InterfaceInfo;
import com.yupi.springbootinit.model.entity.InterfaceInfoMapper;
import generator.service.InterfaceInfoService;
import org.springframework.stereotype.Service;

/**
* @author 14505
* @description 针对表【interface_info(接口信息)】的数据库操作Service实现
* @createDate 2024-04-28 11:15:47
*/
@Service
public class InterfaceInfoServiceImpl extends ServiceImpl<InterfaceInfoMapper, InterfaceInfo>
    implements InterfaceInfoService{

}




