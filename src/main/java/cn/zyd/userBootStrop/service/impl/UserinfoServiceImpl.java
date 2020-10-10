package cn.zyd.userBootStrop.service.impl;

import cn.zyd.userBootStrop.dao.UserDao;
import cn.zyd.userBootStrop.entity.Userinfo;
import cn.zyd.userBootStrop.service.UserinfoService;

import java.util.List;
import java.util.Map;

public class UserinfoServiceImpl implements UserinfoService {

    private UserDao userDao=new UserDao();

    //显示
    @Override
    public List<Userinfo> findAll() {
        return userDao.findAll();
    }

    //模糊查询
    @Override
    public List<Userinfo> queryByUser(Userinfo userinfo) {
        return userDao.queryByUserId(userinfo);
    }

    //添加
    @Override
    public Integer insert(Userinfo userinfo) {
        return userDao.insert(userinfo);
    }

    //修改
    @Override
    public Integer update(Userinfo userinfo) {
        return userDao.updateUser(userinfo);
    }

    //删除
    @Override
    public Integer delete(Integer uid) {
        return userDao.delete(uid);
    }

    //分页显示
    @Override
    public Map<String, Object> queryByList(Userinfo user, Integer offset, Integer pagesize) {
        return userDao.queryByList(user,offset,pagesize);
    }
}
