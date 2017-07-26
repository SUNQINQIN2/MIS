package mis;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDaoJDBCImpl extends BaseDao implements EmployeeDao {
	 String DISPLAY_ALL = "select * from T_PERSON order by employee_id desc";
	
	public Employee displayAll(Employee employee) {
		ResultSet rs=this.getResult(DISPLAY_ALL, null);
		Employee emp = null;
		if(rs == null ){
			System.out.println("错误！");
		}else{
		    try {
		        while(rs.next()) {
		            emp=new Employee();
		            emp.setPayRoll(rs.getInt("EMPLOYEE_ID"));
		            emp.setTeNumber(rs.getString("TELEPHONE"));
		            emp.setEname(rs.getString("EMPLOYEE_NAME"));
		            emp.setDepartmentNum(rs.getInt("DEPT_ID"));
		            emp.setJobTittle(rs.getString("EMPLOYEE_JOB"));
		            emp.setEmpDate(rs.getDate("HIRE_DATE"));
		        }
            } catch (Exception e) {
                e.printStackTrace();
            }
		}
		return emp;
	}	
	public List<Employee> loadAll() {
	    String sql="select * from T_PERSON order by employee_id asc";
	    List<Employee> empList=new ArrayList<Employee>();
	    ResultSet aset=this.getRs(sql, null);
	    try {
	        if(aset == null){
	            System.out.println("语句查询失败！");
	        }else{
				while(aset.next()){
					Employee emp = new Employee();
					emp.setPayRoll(Integer.parseInt(aset.getString("EMPLOYEE_ID").toString()));
					emp.setTeNumber(aset.getString("TELEPHONE"));
					emp.setEname(aset.getString("EMPLOYEE_NAME"));
					emp.setDepartmentNum(Integer.parseInt(aset.getString("DEPT_ID")));
					emp.setJobTittle(aset.getString("EMPLOYEE_JOB"));
					emp.setEmpDate(aset.getDate("HIRE_DATE"));
				    empList.add(emp);
				}
	        }
	    }
			 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return empList.size()>0?empList:null;
	    
		
	}
public Employee rankNP(Employee employee) {
	String sql="select EMPLOYEE_NAME,TELEPHONE from T_PERSON order by EMPLOYEE_NAME asc";
    ResultSet rs=this.getResult(sql, null);
	Employee emp = null;
	try {
        if(rs==null || rs.getRow() == 0){
        	System.out.println("语句查询失败！");
        }else{
            try {
                while (rs.next()) {
                    emp=new Employee();
                    emp.setPayRoll(rs.getInt("EMPLOYEE_ID"));
                    emp.setTeNumber(rs.getString("TELEPHONE"));
                    emp.setEname(rs.getString("EMPLOYEE_NAME"));
                    emp.setDepartmentNum(rs.getInt("DEPT_ID"));
                    emp.setJobTittle(rs.getString("EMPLOYEE_JOB"));
                    emp.setEmpDate(rs.getDate("HIRE_DATE"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
	return emp;
}
@Override
public List<Employee> loadRankNP() {
	BaseDao utils = new BaseDao();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet aset = null;
	List<Employee> empList = new ArrayList<Employee>();	
	try {
		conn = utils.getConn();	
		pstmt = conn.prepareStatement("select EMPLOYEE_NAME,TELEPHONE from T_PERSON order by EMPLOYEE_NAME asc");			
		aset = pstmt.executeQuery();
		while(aset.next()){
			Employee emp = new Employee();
			emp.setEname(aset.getString("EMPLOYEE_NAME"));
			emp.setTeNumber(aset.getString("TELEPHONE"));
		    empList.add(emp);		
		}
					
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		
	}
	return empList.size()>0?empList:null;
}
@Override
public List<Employee> findEmpByName(String empName) {
	BaseDao utils = new BaseDao();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet aset = null;
	List<Employee> empList = new ArrayList<Employee>();	
	String ename=empName;
	try {
		conn = utils.getConn();	
		if( ename != null ) {
			pstmt = conn.prepareStatement("select * from T_PERSON where EMPLOYEE_NAME LIKE ? ");
			pstmt.setString(1, "%"+ename+"%");
			aset = pstmt.executeQuery();
			if(aset==null)return null;
			while(aset.next()){
				Employee emp = new Employee();
				emp.setPayRoll(Integer.parseInt(aset.getString("EMPLOYEE_ID").toString()));
				emp.setTeNumber(aset.getString("TELEPHONE"));
				emp.setEname(aset.getString("EMPLOYEE_NAME"));
				emp.setDepartmentNum(Integer.parseInt(aset.getString("DEPT_ID")));
				emp.setJobTittle(aset.getString("EMPLOYEE_JOB"));
				emp.setEmpDate(aset.getDate("HIRE_DATE"));
				empList.add(emp);			
			}
		}				
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();	
	}
	if(empList.size() > 0 ) {
		return empList;
	} else { 
		return null;
	}
	//return empList.size()>0?empList:null;
}

public Employee findEmpById(int empId) {
	String sql="select * from T_PERSON where EMPLOYEE_ID=?";
	Object[] param={empId};
	ResultSet rs=this.getRs(sql, param);
	Employee emp = null;
	try {
        if(rs == null){
            System.out.println("语句查询失败！");
        }else{
            try {
                while (rs.next()) {
                    emp=new Employee();
                    emp.setPayRoll(rs.getInt("EMPLOYEE_ID"));
                    emp.setTeNumber(rs.getString("TELEPHONE"));
                    emp.setEname(rs.getString("EMPLOYEE_NAME"));
                    emp.setDepartmentNum(rs.getInt("DEPT_ID"));
                    emp.setJobTittle(rs.getString("EMPLOYEE_JOB"));
                    emp.setEmpDate(rs.getDate("HIRE_DATE"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
	return emp;
}
@Override
public void addEmployee(Employee employee) {
	try {
		if( employee != null ) {
			String sql="insert into T_PERSON (EMPLOYEE_NAME, EMPLOYEE_JOB, HIRE_DATE, TELEPHONE, DEPT_ID) values (?,?,?,?,?)";
			Object[] param={employee.getEname(),employee.getJobTittle(),employee.getEmpDate(),employee.getTeNumber(),employee.getDepartmentNum()};
			this.exeSql(sql, param);
		}
	}catch(Exception e){
		e.printStackTrace();
	}		
	
}
public void deleteEmployee(int empId) {
	try {
		if( empId != 0 ) {
		    String sql="delete FROM T_PERSON where EMPLOYEE_ID=?";
		    Object[] param={empId};
		    this.exeSql(sql, param);
			}
	}catch(Exception e) {
		e.printStackTrace();	
	}
}
@Override
public String login(UserModel userModel) {
	BaseDao utils = new BaseDao();
	Connection conn = null;
	PreparedStatement pstmt= null;
	ResultSet aset = null;
	try {
		conn = utils.getConn();	
		if(userModel.getUserName() != null) {
			pstmt = conn.prepareStatement("SELECT user_name FROM t_user WHERE user_name = ? AND user_password= ? ");
			pstmt.setString(1, userModel.getUserName());
			pstmt.setString(2, userModel.getPassword());
			aset = pstmt.executeQuery();
			if(aset != null && aset.next() ) {
			    return "3";
			} else {
			    return "2";
			}
			} else {
			    return "1";
			}	
	}catch(Exception e) {
		e.printStackTrace();	
	}
	return null;
}
@Override
public void updateEmployee(Employee employee) {
    try {
        if( employee != null ) {
            String sql="update T_PERSON set EMPLOYEE_NAME = ?, EMPLOYEE_JOB = ?,HIRE_DATE = ?,TELEPHONE = ?, DEPT_ID = ? where EMPLOYEE_ID = ?";
            Object[] param={employee.getEname(),employee.getJobTittle(),employee.getEmpDate(),employee.getTeNumber(),employee.getDepartmentNum(),employee.getPayRoll()};
            this.exeSql(sql, param);
        }
    }catch(Exception e){
        e.printStackTrace();
    }
}
@Override
public int countEmpByName(String empName) {
    int empid=0;
    try {
        if( empName != null ) {
            String sql="SELECT COUNT(*) FROM T_PERSON WHERE EMPLOYEE_NAME=?";
            Object[] param={empName};
            empid=this.getRowCount(sql, param);
        }
    }catch(Exception e){
        e.printStackTrace();
    }
    return empid;
}
@Override
public int countEmpById(int empId) {
    int emp=0;
    try {
        if( empId != 0 ) {
            String sql="SELECT COUNT(*) FROM T_PERSON WHERE EMPLOYEE_ID=?";
            Object[] param={empId};
            emp=this.getRowCount(sql, param);
        }
    }catch(Exception e){
        e.printStackTrace();
    }
    return emp;
}

}


	
	


