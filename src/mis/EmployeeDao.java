package mis;

import java.util.List;

public interface EmployeeDao{
    
    public Employee displayAll(Employee employee);
    /**
     * 查询所有记录
     * @return
     */
    public List<Employee> loadAll();
    
    /**
     * 根据名称模糊查询
     * @param empName
     * @return
     */
    public List<Employee> findEmpByName(String empName) ;
    /**
     * 根据id查询记录
     * @param empId
     * @return
     */
    public Employee findEmpById(int empId) ;
    /**
     * 添加记录
     * @param employee
     */
    public void addEmployee(Employee employee);
    /**
     * 修改记录
     * @param employee
     */
    public void updateEmployee(Employee employee);
    /**
     * 删除记录
     * @param empId
     */
    public void deleteEmployee(int empId);
    /**
     * 通过用户名查询记录存在
     * @param empName
     * @return
     */
    public int countEmpByName(String empName);
    /**
     * 根据编号查询记录
     * @param empName
     * @return
     */
    public int countEmpById(int empId);
    /**
     * 用户登录
     * @param aModel
     * @return
     */
    public String login(UserModel aModel);
    
    public Employee rankNP(Employee employee);
    
    public List<Employee> loadRankNP();
}