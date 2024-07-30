package cn.itcast.service;

import cn.itcast.domain.PageBean;
import cn.itcast.domain.Student;
import java.util.List;
import java.util.Map;

/**
 * 用户管理的业务接口
 */
public interface StudentService {
    /**
     * 查询所有用户信息
     * @return
     */
    public List<Student> findAll();

    /**
     * 登录方法
     * @param student
     * @return
     */
   // Student login(Student student);

    /**
     * 保存User
     * @param student
     */
    void addUser(Student student);

    /**
     * 根据id删除User
     * @param id
     */
    void deleteUser(String id);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    Student findUserById(String id);

    /**
     * 修改用户信息
     * @param student
     */
    void updateUser(Student student);

    /**
     * 批量删除用户
     * @param ids
     */
    void delSelectedUser(String[] ids);

    /**
     * 分页条件查询
     * @param currentPage
     * @param rows
     * @param condition
     * @return
     */
    PageBean<Student> findUserByPage(String currentPage, String rows, Map<String, String[]> condition);
}
