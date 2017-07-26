package mis;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

public class SysTest {
    
    private static Scanner input=new Scanner(System.in);
    private static Employee emp=new Employee();
    private static EmployeeDao empDao=new EmployeeDaoJDBCImpl();
    private static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    
    private static void addEmployee(){
        System.out.println("请输入名称 -只能是英文名称");
        String ename=input.next();
        emp.setEname(ename);
        System.out.println("请输入部门编号 -只能是数字！！！");
        int deptId=input.nextInt();
        emp.setDepartmentNum(deptId);
        System.out.println("请输入日期   -格式为 1999-02-01");
        String hireDate=input.next();
        try {
            Date hdate=sdf.parse(hireDate);
            emp.setEmpDate(hdate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println("请输入正确的11位手机号码");
        String tele=input.next();
        emp.setTeNumber(tele);
        System.out.println("请输入职位名称 -只能是英文");
        String jobName=input.next();
        emp.setJobTittle(jobName);
        empDao.addEmployee(emp);
        System.out.println("添加成功!!!");
        begin();
    }
    
    private static void updateEmp(){
        System.out.print("请输入你要修改人员的Id ： ");
        int eid=input.nextInt();
        int mId=empDao.countEmpById(eid);
        if(mId == 0) {
            System.out.println("记录不存在!!!");
        } else {
            System.out.println("请输入人员编号 -只能是数字！！！");
            int empIdId=input.nextInt();
            emp.setPayRoll(empIdId);
            System.out.println("请输入名称 -只能是英文名称");
            String ename=input.next();
            emp.setEname(ename);
            System.out.println("请输入部门编号 -只能是数字！！！");
            int deptId=input.nextInt();
            emp.setDepartmentNum(deptId);
            System.out.println("请输入日期   -格式为 1999-02-01");
            String hireDate=input.next();
            try {
                Date hdate=sdf.parse(hireDate);
                emp.setEmpDate(hdate);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            System.out.println("请输入正确的11位手机号码");
            String tele=input.next();
            emp.setTeNumber(tele);
            System.out.println("请输入职位名称 -只能是英文");
            String jobName=input.next();
            emp.setJobTittle(jobName);
            empDao.updateEmployee(emp);
            System.out.println("修改"+eid+"成功!!!");
            begin();
        }
    }
    
    private static void deleteEmp(){
        System.out.print("请输入你要删除人员的Id ： ");
        int eid=input.nextInt();
        int mId=empDao.countEmpById(eid);
        if(mId == 0) {
            System.out.println("id不存在!!!");
        } else {
            empDao.deleteEmployee(eid);
            System.out.println("删除  "+eid+" 成功!!!");
            begin();
        }
    }
    
    private static void findEmp(){
        List<Employee> empList=empDao.loadAll();
        if(empList.size()>0) {
            for(Employee emp1 : empList) {
                System.out.println("编号 :"+emp1.getPayRoll()+" 名称  : "+emp1.getEname()+" 部门编号: "
                +emp1.getDepartmentNum()+" 日期 :"+emp1.getEmpDate()+" 手机号码 :"
                +emp1.getTeNumber()+" 职位名称: "+emp1.getJobTittle());
            }
        }
        begin();
    }
    
    private static void findEmpById(){
        System.out.print("请输入你要查询人员的Id ： ");
        int pid=input.nextInt();
        int mId=empDao.countEmpById(pid);
        if(mId == 0) {
            System.out.println("记录不存在!!!");
        } else {
            emp=empDao.findEmpById(pid);
            if(emp != null) {
                System.out.println("编号 :"+emp.getPayRoll()+" 名称  : "+emp.getEname()+" 部门编号: "
                        +emp.getDepartmentNum()+" 日期 :"+emp.getEmpDate()+" 手机号码 :"
                        +emp.getTeNumber()+" 职位名称: "+emp.getJobTittle());
            }
            begin();
        }
    }
    
    //开始程序
    private static void begin()
    {
        System.out.println("\t\t\t请选择以下的 数字");
        System.out.println("\t\t\t人员");
        System.out.println("\t\t\t0.增加");
        System.out.println("\t\t\t1.查");
        System.out.println("\t\t\t2.修");
        System.out.println("\t\t\t3.删");
        System.out.println("\t\t\t4.查看所有的人员");
        System.out.print("请选择：");
        int count=input.nextInt();
        switch(count){
        case 0:addEmployee();
        break;
        case 1:findEmpById();
        break;
        case 2:updateEmp();
        break;
        case 3:deleteEmp();
        break;
        case 4:findEmp();
        break;
        default:
            System.out.println("退出程序！！！");
            break;
        }
    }

    public static void main(String[] args) {
        emp.setEname("qqqqq");
        emp.setDepartmentNum(123);
        String hireDate="1998-01-02";
        try {
            Date hdate=sdf.parse(hireDate);
            emp.setEmpDate(hdate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        emp.setTeNumber("13212121232");
        emp.setJobTittle("ccccccc");
        empDao.addEmployee(emp);
        begin();

    }

}
